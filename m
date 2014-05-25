From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:13:00 -0300
Subject: [Buildroot] [WIP PATCH 5/5] package infra: add -static to C/CXXFLAGS
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401055980-28742-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Generic infra packages might not use LDFLAGS at all so add -static for
static builds to CFLAGS and CXXFLAGS too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index ec1f22b..ec8fb1b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -373,6 +373,8 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+TARGET_CFLAGS += -static
+TARGET_CXXFLAGS += -static
 TARGET_LDFLAGS += -static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
-- 
1.8.5.5

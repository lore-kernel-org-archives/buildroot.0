From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:12:59 -0300
Subject: [Buildroot] [WIP PATCH 4/5] package infra: revert 0a4bd19f
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401055980-28742-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Revert commit 0a4bd19f4a136930c611027942ce43124a81c5cb
Using --static is not documented and actually breaks static linking
according to my tests.
Fixes:
http://autobuild.buildroot.net/results/327/327c18db4e5d0ddc2c72a4684e103c19a1405e50/
...for external toolchains

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2fc3aa7..ec1f22b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -373,7 +373,7 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
-TARGET_LDFLAGS += --static
+TARGET_LDFLAGS += -static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
-- 
1.8.5.5

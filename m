From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Wed, 21 Mar 2012 15:10:42 +0000
Subject: [Buildroot] [PATCH] Add -static to LDFLAGS when prefering static
	binaries
Message-ID: <1332342642-7717-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
Tested fbv and strace using sh-uclinux-gcc (Sourcery G++ Lite 2011.03-36)
Without this flag, the binaries were still linked to libc.so.

 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc8d038..3690a38 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -294,6 +294,7 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+TARGET_LDFLAGS+=-static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
-- 
1.7.0.4

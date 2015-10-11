From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 11 Oct 2015 19:17:27 +0200
Subject: [Buildroot] [PATCH] sparc64: fix toolchain building when C++ is
	enabled
Message-ID: <20151011171727.GA14946@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libsanitizer for sparc64, too. Same problem as for
sparc, see https://bugs.busybox.net/show_bug.cgi?id=7951

Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/gcc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 4def65c..1b30e6d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -142,7 +142,7 @@ endif
 
 # libsanitizer is broken for SPARC
 # https://bugs.busybox.net/show_bug.cgi?id=7951
-ifeq ($(BR2_sparc),y)
+ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
-- 
1.7.10.4

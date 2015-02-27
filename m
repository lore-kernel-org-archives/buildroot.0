From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:46 +0100
Subject: [Buildroot] [PATCH v2 1/7] directfb: bump version to 1.7.7 and add
	hash
Message-ID: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0003-remove-redefinition-of-__typeof__.patch (the only upstream
committed patch).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - merged add hash patch (as suggested by Peter Korsgaard)
---
 .../0003-remove-redefinition-of-__typeof__.patch   | 28 ----------------------
 ...region-lock.patch => 0003-setregion-lock.patch} |  0
 ...-use-gcc-link.patch => 0004-use-gcc-link.patch} |  0
 package/directfb/directfb.hash                     |  3 +++
 package/directfb/directfb.mk                       |  4 ++--
 5 files changed, 5 insertions(+), 30 deletions(-)
 delete mode 100644 package/directfb/0003-remove-redefinition-of-__typeof__.patch
 rename package/directfb/{0004-setregion-lock.patch => 0003-setregion-lock.patch} (100%)
 rename package/directfb/{0005-use-gcc-link.patch => 0004-use-gcc-link.patch} (100%)
 create mode 100644 package/directfb/directfb.hash

diff --git a/package/directfb/0003-remove-redefinition-of-__typeof__.patch b/package/directfb/0003-remove-redefinition-of-__typeof__.patch
deleted file mode 100644
index e3861af..0000000
--- a/package/directfb/0003-remove-redefinition-of-__typeof__.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Remove definition to fix qt5 build.
-
-Fetch from: http://git.directfb.org/?p=core/DirectFB.git;a=patch;h=203f78a4193a8ff110dec3c860e0928af1a0a72f
-
-From 203f78a4193a8ff110dec3c860e0928af1a0a72f Mon Sep 17 00:00:00 2001
-From: Denis Oliver Kropp <dok@directfb.org>
-Date: Wed, 31 Jul 2013 21:56:05 +0200
-Subject: [PATCH] libdirect: Remove redefinition of __typeof__!!!
-
----
- lib/direct/os/linux/glibc/types.h |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/lib/direct/os/linux/glibc/types.h b/lib/direct/os/linux/glibc/types.h
-index 08e94b2..80cb350 100644
---- a/lib/direct/os/linux/glibc/types.h
-+++ b/lib/direct/os/linux/glibc/types.h
-@@ -81,7 +81,6 @@ typedef int64_t s64;
- #define __dfb_no_instrument_function__  __attribute__((no_instrument_function))
- #define __constructor__                 __attribute__((constructor))
- #define __destructor__                  __attribute__((destructor))
--#define __typeof__(x)                   __typeof__(x)
- 
- #ifndef __func__
- #define __func__                        __FUNCTION__
--- 
-1.7.9.5
-
diff --git a/package/directfb/0004-setregion-lock.patch b/package/directfb/0003-setregion-lock.patch
similarity index 100%
rename from package/directfb/0004-setregion-lock.patch
rename to package/directfb/0003-setregion-lock.patch
diff --git a/package/directfb/0005-use-gcc-link.patch b/package/directfb/0004-use-gcc-link.patch
similarity index 100%
rename from package/directfb/0005-use-gcc-link.patch
rename to package/directfb/0004-use-gcc-link.patch
diff --git a/package/directfb/directfb.hash b/package/directfb/directfb.hash
new file mode 100644
index 0000000..346b86e
--- /dev/null
+++ b/package/directfb/directfb.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3  DirectFB-1.7.7.tar.gz
+
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e3dc506..b41e5c6 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DIRECTFB_VERSION_MAJOR = 1.6
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
+DIRECTFB_VERSION_MAJOR = 1.7
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
-- 
2.1.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 20:27:53 +0100
Subject: [Buildroot] [git commit] flac: bump to version 1.3.1
Message-ID: <20141201104839.1000C7FB2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9739d823db6c23f35377dccfb672493b805cddab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches upstream and add hash file.

[Thomas: remove AUTORECONF = YES, since we no longer have any
patches touching configure.ac/Makefile.am]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flac/flac-01-fix-altivec-logic.patch |   32 --------------------------
 package/flac/flac.hash                       |    2 +
 package/flac/flac.mk                         |    3 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/flac/flac-01-fix-altivec-logic.patch b/package/flac/flac-01-fix-altivec-logic.patch
deleted file mode 100644
index a1ac8a1..0000000
--- a/package/flac/flac-01-fix-altivec-logic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d65ede3e874c79348efc85cf3a185c170046c4c8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Dec 2013 13:31:28 -0300
-Subject: [PATCH] Fix Makefile.am altivec logic
-
-Besides SPE (FSL e500v? cores) there are other powerpc processors
-that don't support altivec instructions so only enable them when it's
-100% sure that the target has it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
----
- src/libFLAC/Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
-index 247e33c..258de40 100644
---- a/src/libFLAC/Makefile.am
-+++ b/src/libFLAC/Makefile.am
-@@ -47,8 +47,7 @@ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- CPUCFLAGS =
--if FLaC__CPU_PPC_SPE
--else
-+if FLaC__USE_ALTIVEC
- CPUCFLAGS += -maltivec -mabi=altivec
- endif
- #@@@ PPC optimizations temporarily disabled
--- 
-1.8.3.2
-
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
new file mode 100644
index 0000000..6a0da11
--- /dev/null
+++ b/package/flac/flac.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
+sha256	4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c	flac-1.3.1.tar.xz
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index daedd47..b819064 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.0
+FLAC_VERSION = 1.3.1
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
-FLAC_AUTORECONF = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPLv2+ (tools), LGPLv2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL

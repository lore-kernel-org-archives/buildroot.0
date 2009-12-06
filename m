From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 18:41:15 +0100
Subject: [Buildroot] [git commit master] Add pkgversion to gcc >= 4.3
Message-ID: <20091206174306.2B5D777787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=09c181f2891276c458de327d241151bab38bde0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #765.

[Peter: change to check for !4.2.x instead]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    1 +
 toolchain/gcc/gcc-uclibc-4.x.mk |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index aed2298..c0a6485 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,7 @@
 	#753: Bump lighttpd package to 1.4.25
 	#761: Add binutils 2.20 to toolchain options
 	#763: [SECURITY] Update pcre to 7.9
+	#765: Add buildroot branding to gcc
 
 2009.11, Released December 1st, 2009:
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 241bfb3..d5a889f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -65,6 +65,13 @@ ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
 GCC_NO_MPFR:=y
 endif
 
+# Branding works on >= 4.3
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2)
+BUILDROOT_VERSION_STRING=$(call qstrip,$(BR2_VERSION))
+EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BUILDROOT_VERSION_STRING)" \
+	--with-bugurl="http://bugs.buildroot.net/"
+endif
+
 GCC_TARGET_PREREQ=
 GCC_STAGING_PREREQ=
 
-- 
1.6.3.3

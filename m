From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:55 +0100
Subject: [Buildroot] [PATCH 15/15] elfutils: make available on uClibc
	toolchains
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3e9f9e1a1d4de1c948dcf64dffd1a9e6e653d7bd.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We finally have all the pieces needed to allow the build of elfutils
on uClibc. Only the libraries can be built, the programs remain
available only for glibc/eglibc toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 78d02a5..b107a97 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,13 +1,5 @@
-comment "elfutils requires a glibc toolchain"
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		     BR2_TOOLCHAIN_CTNG_glibc     || \
-		     BR2_TOOLCHAIN_CTNG_eglibc)
-
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		   BR2_TOOLCHAIN_CTNG_glibc     || \
-		   BR2_TOOLCHAIN_CTNG_eglibc
 	select BR2_PACKAGE_ARGP_STANDALONE if \
 	       BR2_TOOLCHAIN_BUILDROOT   || \
 	       BR2_TOOLCHAIN_CTNG_uClibc || \
@@ -27,6 +19,9 @@ if BR2_PACKAGE_ELFUTILS
 
 config BR2_PACKAGE_ELFUTILS_PROGS
 	bool "Install programs"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		   BR2_TOOLCHAIN_CTNG_glibc     || \
+		   BR2_TOOLCHAIN_CTNG_eglibc
 	help
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
-- 
1.7.9.5

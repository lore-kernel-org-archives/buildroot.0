From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:47:24 +0100
Subject: [Buildroot] [git commit] elfutils: make available on uClibc
	toolchains
Message-ID: <20130107212533.AE5979A27C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41f7e9b68af564fe4b5a70c17b391a4bf1dcf3f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We finally have all the pieces needed to allow the build of elfutils
on uClibc. Only the libraries can be built, the programs remain
available only for glibc/eglibc toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/Config.in |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

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

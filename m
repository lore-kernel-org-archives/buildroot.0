From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:35:29 +0100
Subject: [Buildroot] [git commit] libssh2: disable on broken nios2 toolchains
Message-ID: <20151111143556.C8FEA81EB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdf55a12658dc9ff5496f4bf0cc980a662008cd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/bcf/bcfd8287a8d3dec2d66aa8191910f4dab0d7be36/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh2/Config.in  |    3 +++
 package/php-ssh2/Config.in |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 017fd40..3416240 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	# Triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
index b457900..bc31e1d 100644
--- a/package/php-ssh2/Config.in
+++ b/package/php-ssh2/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_PHP_SSH2
 	bool "php-ssh2"
 	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_LIBSSH2
+	# Triggers the _gp link issue (libssh2)
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  PHP bindings for the libssh2 library.
 

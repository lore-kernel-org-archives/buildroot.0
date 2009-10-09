From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 15:38:41 +0200
Subject: [Buildroot] [git commit master] Update php package to 5.2.11
Message-ID: <20091009133900.853CA777A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=829d4ff63cae158d5a454458a3f35204628e5051
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security Enhancements and Fixes in PHP 5.2.11:

   * Fixed certificate validation inside php_openssl_apply_verification_policy
   * Fixed sanity check for the color index in imagecolortransparent()
   * Added missing sanity checks around exif processing
   * Fixed bug #44683 (popen crashes when an invalid mode is passed)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    5 +++--
 package/php/php.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 13fa44b..d12e3a8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
-	lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl, python,
-	quagga, radvd, rsync, samba, shared-mime-info, speech-tools,
+	lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl, php,
+	python, quagga, radvd, rsync, samba, shared-mime-info, speech-tools,
 	squashfs, syslinux, u-boot, util-linux, valgrind, vsftpd, wipe,
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
@@ -27,6 +27,7 @@
 	#615: python: Don't delete .py files unless asked
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 	#619: netkittelnet requires netkitbase to install, but there's no dependency
+	#653: [SECURITY] Update php package to version 5.2.11
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 1f4c7d1..2668774 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.10
+PHP_VERSION = 5.2.11
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.6.3.3

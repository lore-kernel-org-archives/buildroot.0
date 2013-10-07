From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 22:16:51 +0200
Subject: [Buildroot] [git commit] minidlna: security bump to version 1.0.26
Message-ID: <20131007201928.0C60F9B979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97c386e4586201dbd976925f021ff877620462fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2738, CVE-2013-2739 and CVE-2013-2745.
Also needs threads, which fixes:
http://autobuild.buildroot.net/results/d91/d91b64c93097580e1da53b6ccfb4b492f382a5f3

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/Config.in   |    5 +++--
 package/minidlna/minidlna.mk |    3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index c73c001..2b684ba 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MINIDLNA
 	depends on BR2_LARGEFILE # ffmpeg
 	depends on BR2_INET_IPV6 # ffmpeg
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_LIBVORBIS # selects libogg
@@ -17,5 +18,5 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+comment "minidlna requires a toolchain with LARGEFILE, IPV6 and thread support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 077e257..4df6ff0 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.0.25
+MINIDLNA_VERSION = 1.0.26
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
-MINIDLNA_SOURCE = minidlna_$(MINIDLNA_VERSION)_src.tar.gz
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = LICENCE LICENCE.miniupnpd
 

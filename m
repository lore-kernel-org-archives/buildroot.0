From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:46:32 +0200
Subject: [Buildroot] [git commit] mpv: bump to version 0.18.0
Message-ID: <20160626194641.6441780238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2eb1903431300926578e0876c411d30e2f5955ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gpl3 option removed so drop it otherwise it results in build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpv/Config.in | 6 ++++--
 package/mpv/mpv.hash  | 2 +-
 package/mpv/mpv.mk    | 3 +--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 1cef6c5..25288a4 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -14,6 +15,7 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ threads"
+comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index da51f3a..8d9c9d1 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e	v0.17.0.tar.gz
+sha256	b656638d4f6bce2621baaacb60d8be384aa492fcd86dfd43996aaa2c16fee02b	v0.18.0.tar.gz
 sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cd8c31b..7ecac9e 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.17.0
+MPV_VERSION = 0.18.0
 MPV_WAF_VERSION = 1.8.12
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
@@ -23,7 +23,6 @@ MPV_CONF_OPTS = \
 	--disable-cdda \
 	--disable-cocoa \
 	--disable-coreaudio \
-	--disable-gpl3 \
 	--disable-libguess \
 	--disable-libv4l2 \
 	--disable-opensles \

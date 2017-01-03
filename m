From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 23:51:11 +0100
Subject: [Buildroot] [git commit] mpv: bump to version 0.23.0
Message-ID: <20170103225412.AABFE7FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e143b0c73e62fa946c3b4417919fc98e352a8fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

enca and libguess options have been dropped so adjust accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.hash |  2 +-
 package/mpv/mpv.mk   | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index be6b559..0e7aab7 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c0f9ac8f0e37a391d19007b333ef8787c2f45d75a0d4401c0098cde52c5082f6	v0.22.0.tar.gz
+sha256	8aeefe5970587dfc454d2b89726b603f156bd7a9ae427654eef0d60c68d94998	v0.23.0.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d719075..5b83b6d 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.22.0
+MPV_VERSION = 0.23.0
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
@@ -23,7 +23,6 @@ MPV_CONF_OPTS = \
 	--disable-cdda \
 	--disable-cocoa \
 	--disable-coreaudio \
-	--disable-libguess \
 	--disable-libv4l2 \
 	--disable-opensles \
 	--disable-rpi \
@@ -123,14 +122,6 @@ else
 MPV_CONF_OPTS += --disable-drm
 endif
 
-# libenca support
-ifeq ($(BR2_PACKAGE_LIBENCA),y)
-MPV_CONF_OPTS += --enable-enca
-MPV_DEPENDENCIES += libenca
-else
-MPV_CONF_OPTS += --disable-enca
-endif
-
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUAJIT),y)

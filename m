From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2016 18:20:52 -0300
Subject: [Buildroot] [PATCH 2/2] libinput: bump to version 1.2.4
In-Reply-To: <1461273652-8935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461273652-8935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461273652-8935-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forcibly disable wacom support since we haven't got a libwacom package
yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ea4c8e7..43fcf5d 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2016-January/026701.html
-sha256	5e08c45dbb8bf32490cc6cd626da098564d646d161a07cba2e3adbd9745c0622	libinput-1.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-April/028215.html
+sha256	aee3650ad2a864ab9a10e7e63df543cc2b475f6bf3974751037a2df325dabbb1	libinput-1.2.4.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2954760..d994d29 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.1.5
+LIBINPUT_VERSION = 1.2.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -12,7 +12,7 @@ LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
-LIBINPUT_CONF_OPTS = --disable-tests
+LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += --enable-event-gui
-- 
2.7.3

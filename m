From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 13:26:26 +0100
Subject: [Buildroot] [PATCH 2/3] package/tvheadend: add support for
	host-python3
In-Reply-To: <1416140787-18038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416140787-18038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416140787-18038-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream:
https://github.com/tvheadend/tvheadend/commit/5a07ff166a84c65f08d326c69c818f6eef315e68

Tested with these defconfigs:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_TVHEADEND=y

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_TVHEADEND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0b564f6..b0038c8 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -8,7 +8,7 @@ TVHEADEND_VERSION = fcd16fa0d835d7fd4f57c350ed8b76350440c68c
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-TVHEADEND_DEPENDENCIES = host-pkgconf host-python openssl
+TVHEADEND_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) openssl
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
@@ -42,7 +42,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --prefix=/usr				\
 	 --arch="$(ARCH)"			\
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python2"	\
+	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
 	 --enable-bundle			\
 	 --disable-libffmpeg_static		\
-- 
1.7.10.4

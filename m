From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 22:50:54 +0100
Subject: [Buildroot] [git commit branch/next] package/tvheadend: add support
	for host-python3
Message-ID: <20141118215813.3AC7CB491A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0abee37c85b288796dcf7537b6d227833b08f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Jul 2014 23:40:46 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/eudev: Bump version to 1.9
Message-ID: <1405633246-17081-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch EUDEV_SITE to official upstream:
  http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-fs/eudev/eudev-1.9-r1.ebuild?view=markup
  Github does not carry this current eudev version.

- Remove EUDEV_AUTORECONF = yes, tarball contains ./configure

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
v2: Removed EUDEV_AUTORECONF (Thomas)

 package/eudev/eudev.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 5f1525c..c6d020f 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-EUDEV_VERSION = v1.7
-EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
+EUDEV_VERSION = 1.9
+EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
+EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
-EUDEV_AUTORECONF = YES
 
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
-- 
1.7.10.4

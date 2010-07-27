From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] atk: bump to 1.30
Message-ID: <20100727210245.C1919835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e10c45be3d70953df2e6c63b3f0226d3ba705d8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/atk/atk.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index e357f49..6f3a3b6 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -3,11 +3,13 @@
 # atk
 #
 #############################################################
-ATK_VERSION = 1.22.0
+ATK_VERSION_MAJOR = 1.30
+ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/1.22/
+ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_TARGET = YES
+ATK_LIBTOOL_PATCH = NO
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
-- 
1.7.1

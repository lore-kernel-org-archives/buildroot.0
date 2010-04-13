From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:11 +0200
Subject: [Buildroot] [PATCH 38/41] atk: bump to 1.30
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-39-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

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
1.7.0.4

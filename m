From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 12:01:32 -0300
Subject: [Buildroot] [PATCH 3/7] gvfs: bump to version 1.30.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474383696-4045-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable admin since it requires polkit-gobject + libcap.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 440671f..9c53487 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.3.sha256sum
-sha256	458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17	gvfs-1.28.3.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.0.sha256sum
+sha256	2285d387213eef528f09df4b113d9d2e54ce7108c50587355d07f2a885840da4	gvfs-1.30.0.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index e2947fd..50a2fa2 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.28
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
+GVFS_VERSION_MAJOR = 1.30
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).0
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
@@ -20,6 +20,7 @@ GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-con
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
 	--disable-afc \
+	--disable-admin \
 	--disable-bash-completion \
 	--disable-cdda \
 	--disable-gconf \
-- 
2.7.3

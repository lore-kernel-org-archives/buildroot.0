From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:12:59 -0300
Subject: [Buildroot] [PATCH 10/13] sshfs: select openssh instead of depending
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select openssh in Config.in rather than depend on it.
Otherwise the option is missing without an obvious reason.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/Config.in |    2 +-
 package/sshfs/sshfs.mk  |   10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 61d9bf3..1d9f759 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_OPENSSH
+	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	help
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 09f1e93..816f77a 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,13 +4,9 @@
 #
 #############################################################
 
-SSHFS_VERSION:=2.2
-SSHFS_SOURCE:=sshfs-fuse-$(SSHFS_VERSION).tar.gz
-SSHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
-SSHFS_AUTORECONF:=NO
-SSHFS_INSTALL_STAGING:=NO
-SSHFS_INSTALL_TARGET:=YES
-
+SSHFS_VERSION = 2.2
+SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
+SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,sshfs))
-- 
1.7.2.2

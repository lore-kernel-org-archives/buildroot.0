From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Oct 2009 22:42:44 +0200
Subject: [Buildroot] [git commit master] gvfs: explicitly specify samba
	include and library paths
Message-ID: <20091020204321.1DE8A7779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d5d638a892949cd4033d2284a5777e0cb34591b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gvfs configure script has --with-samba-includes and
--with-samba-libs options. Use these to point it to the
libsmbclient files in the staging dir.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 94a5eb7..7d71f34 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -63,6 +63,8 @@ ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
 GVFS_DEPENDENCIES += samba
 GVFS_CONF_OPT += \
 	--enable-samba \
+	--with-samba-includes=$(STAGING_DIR)/usr/include \
+	--with-samba-libs=$(STAGING_DIR)/usr/lib \
 	ac_cv_lib_smbclient_smbc_option_get=yes
 else
 GVFS_CONF_OPT += --disable-samba
-- 
1.6.3.3

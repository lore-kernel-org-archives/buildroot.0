From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 18 Oct 2009 23:56:22 +0200
Subject: [Buildroot] [PATCH 3/3] gvfs: explicitly specify samba include and
	library paths
In-Reply-To: <1255902982-8731-2-git-send-email-s.neumann@raumfeld.com>
References: <1255902982-8731-1-git-send-email-s.neumann@raumfeld.com>
	<1255902982-8731-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1255902982-8731-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gvfs configure script has --with-samba-includes and
--with-samba-libs options. Use these to point it to the
libsmbclient files in the staging dir.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
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
1.6.5

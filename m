From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:31:29 +0200
Subject: [Buildroot] [git commit] gvfs: switch smb support to samba4
Message-ID: <20150403123150.31BB881910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18582060a61e75573f92d87366b2e3fcca7a3be0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba3 is deprecated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d3f5a4f..4242e80 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -58,11 +58,11 @@ else
 GVFS_CONF_OPTS += --disable-http
 endif
 
-ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
-GVFS_DEPENDENCIES += samba
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+GVFS_DEPENDENCIES += samba4
 GVFS_CONF_OPTS += \
 	--enable-samba \
-	--with-samba-includes=$(STAGING_DIR)/usr/include \
+	--with-samba-includes=$(STAGING_DIR)/usr/include/samba-4.0 \
 	--with-samba-libs=$(STAGING_DIR)/usr/lib \
 	ac_cv_lib_smbclient_smbc_option_get=yes
 else

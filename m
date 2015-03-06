From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 09:50:32 -0300
Subject: [Buildroot] [PATCH 4/6] gvfs: switch smb support to samba4
In-Reply-To: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425646234-22041-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

samba3 is deprecated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gvfs/gvfs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.0.5

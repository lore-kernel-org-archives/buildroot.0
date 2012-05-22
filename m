From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 May 2012 09:39:34 +0200
Subject: [Buildroot] [git commit] ntfs-3g: fix build with encryption support
Message-ID: <20120522074013.15B3D96D7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=602de0675ef334de9f77a670561f2b1887550305
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/4baa45ca1f4804be1a76a69bb8158c6a91d96d6b/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/ntfs-3g.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 8e616cb..748fe1d 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -21,6 +21,7 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 endif
 
 ifeq ($(BR2_PACKAGE_NTFS_3G_ENCRYPTED),y)
+	NTFS_3G_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 	NTFS_3G_CONF_OPT += --enable-crypto
 	NTFS_3G_DEPENDENCIES += gnutls
 endif

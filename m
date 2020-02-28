From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 23:29:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntfs-3g: annotate _IGNORE_CVES for
 the included security patch
Message-ID: <20200228222927.1983199-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntfs-3g/ntfs-3g.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 5f23eae9c9..cbb356195c 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -13,6 +13,9 @@ NTFS_3G_DEPENDENCIES = host-pkgconf
 NTFS_3G_LICENSE = GPL-2.0+, LGPL-2.0+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
+# 0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
+NTFS_3G_IGNORE_CVES += CVE-2019-9755
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 NTFS_3G_CONF_OPTS += --with-fuse=external
 NTFS_3G_DEPENDENCIES += libfuse
-- 
2.25.0

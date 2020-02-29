From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 08:35:40 +0100
Subject: [Buildroot] [git commit] package/ntfs-3g: annotate _IGNORE_CVES for
 the included security patch
Message-ID: <20200229072735.5575A8E4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8619025300899f7d5cfcd658352c2f70794201d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

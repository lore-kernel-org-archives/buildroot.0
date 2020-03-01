From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 20:27:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/rsync: annotate CVE-2017-16548
Message-ID: <20200301192727.209357-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-165484 is misclassified (by our CVE tracker) as affecting
version 3.1.3, while in fact it affects 3.1.2 and 3.1.3-development

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 52875e428a..95d19a7f4c 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -13,6 +13,10 @@ RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no
 
+# CVE-2017-165484 is misclassified (by our CVE tracker) as affecting version 3.1.3,
+# while in fact it affects 3.1.2 and 3.1.3-development
+RSYNC_IGNORE_CVES += CVE-2017-16548
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
-- 
2.25.0

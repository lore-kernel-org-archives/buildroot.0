From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 21:14:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/links: annotate CVE-2008-3319
Message-ID: <20200301201408.212316-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2008-3319 is misclassified (by our CVE tracker) as affecting links,
while in fact it affects Maian Links (https://www.maianlinks.com).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/links/links.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 228a8ed0ee..cc95ec2867 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -11,6 +11,10 @@ LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
 
+# CVE-2008-3319 is misclassified (by our CVE tracker) as affecting links, while
+# in fact it affects Maian Links (https://www.maianlinks.com).
+LINKS_IGNORE_CVES += CVE-2008-3319
+
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
 LINKS_DEPENDENCIES += libpng
-- 
2.25.0

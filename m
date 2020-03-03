From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Mar 2020 20:46:59 +0100
Subject: [Buildroot] [PATCH 1/5] package/patch: annote CVE-2018-6951
Message-ID: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/patch/patch.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index d581682c70..ca54beab6d 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -10,6 +10,9 @@ PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
 
+# 0001-Fix-segfault-with-mangled-rename-patch.patch
+PATCH_IGNORE_CVES += CVE-2018-6951
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
-- 
2.25.0

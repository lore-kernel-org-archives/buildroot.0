From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 20:54:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/argus: annotate CVE-2011-3332
Message-ID: <20200301195437.210968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2011-3332 is misclassified (by our CVE tracker) as affecting argus,
while in fact it affects Iceni Argus (https://www.iceni.com/legacy.htm).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/argus/argus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 0441df49ea..e4757c20cb 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -12,6 +12,10 @@ ARGUS_CONF_ENV = arg_cv_sys_errlist=yes
 ARGUS_LICENSE = GPL-2.0+
 ARGUS_LICENSE_FILES = README
 
+# CVE-2011-3332 is misclassified (by our CVE tracker) as affecting argus, while
+# in fact it affects Iceni Argus (https://www.iceni.com/legacy.htm).
+ARGUS_IGNORE_CVES += CVE-2011-3332
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 ARGUS_DEPENDENCIES += libtirpc host-pkgconf
 ARGUS_CONF_ENV += \
-- 
2.25.0

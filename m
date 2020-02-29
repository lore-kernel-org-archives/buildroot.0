From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 21:45:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/emlog: annotate CVE-2019-16868 and
 CVE-2019-17073
Message-ID: <20200229204548.3463349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker)
as affecting emlog, while in fact it affects http://www.emlog.net.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/emlog/emlog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index 8759f82c7c..7d63916ab2 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -9,6 +9,10 @@ EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
 
+# CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker) as
+# affecting emlog, while in fact it affects http://www.emlog.net.
+EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073
+
 define EMLOG_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) nbcat
 endef
-- 
2.25.0

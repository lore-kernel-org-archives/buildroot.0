From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 21:09:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/netcat: annotate CVEs
Message-ID: <20200301200956.211977-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2008-5727, CVE-2008-5728, CVE-2008-5729, CVE-2008-5730 and
CVE-2008-5742 are misclassified (by our CVE tracker) as affecting
netcat, while in fact they affect AIST NetCat.

CVE-2015-2214 is misclassified (by our CVE tracker) as affecting netcat,
while in fact it affects NetCat CMS.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netcat/netcat.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index eb7ddcac27..77d29ce788 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -9,4 +9,14 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 
+# CVE-2008-5727, CVE-2008-5728, CVE-2008-5729, CVE-2008-5730 and CVE-2008-5742
+# are misclassified (by our CVE tracker) as affecting netcat, while in fact
+# they affect AIST NetCat.
+NETCAT_IGNORE_CVES += \
+	CVE-2008-5727 CVE-2008-5728 CVE-2008-5729 CVE-2008-5730 CVE-2008-5742
+
+# CVE-2015-2214 is misclassified (by our CVE tracker) as affecting netcat, while
+# in fact it affects NetCat CMS.
+NETCAT_IGNORE_CVES += CVE-2015-2214
+
 $(eval $(autotools-package))
-- 
2.25.0

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 20:46:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/ed: annotate CVE-2015-2987
Message-ID: <20200301194637.210308-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2015-2987 is misclassified (by our CVE tracker) as affecting ed,
while in fact it affects Type74 ED (http://type74.org/edman5-1.php).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ed/ed.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 6ef8f951cf..271297f60a 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -10,6 +10,10 @@ ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
 ED_LICENSE_FILES = COPYING
 
+# CVE-2015-2987 is misclassified (by our CVE tracker) as affecting ed, while in
+# fact it affects Type74 ED (http://type74.org/edman5-1.php).
+ED_IGNORE_CVES += CVE-2015-2987
+
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) ./configure \
-- 
2.25.0

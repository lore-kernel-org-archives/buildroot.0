From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 10:34:50 +0100
Subject: [Buildroot] [git commit] package/emlog: annotate CVE-2019-16868 and
 CVE-2019-17073
Message-ID: <20200301092243.52DC08F049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32d9a95d9460f78e9f33349937f426c3ae11662f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker)
as affecting emlog, while in fact it affects http://www.emlog.net.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

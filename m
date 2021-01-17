From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:52:07 +0100
Subject: [Buildroot] [PATCH 4/5] package/unzip: add UNZIP_IGNORE_CVES entries
In-Reply-To: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117175208.366428-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unzip/unzip.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5efe5bcd09..9eff5e0639 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -31,4 +31,31 @@ UNZIP_PATCH = \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/25-cve-2019-13232-fix-bug-in-uzbunzip2.patch \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/26-cve-2019-13232-fix-bug-in-uzinflate.patch
 
+# 07-increase-size-of-cfactorstr.patch
+UNZIP_IGNORE_CVES += CVE-2018-18384
+# 09-cve-2014-8139-crc-overflow.patch
+UNZIP_IGNORE_CVES += CVE-2014-8139
+# 10-cve-2014-8140-test-compr-eb.patch
+UNZIP_IGNORE_CVES += CVE-2014-8140
+# 11-cve-2014-8141-getzip64data.patch
+UNZIP_IGNORE_CVES += CVE-2014-8141
+# 12-cve-2014-9636-test-compr-eb.patch
+UNZIP_IGNORE_CVES += CVE-2014-9636
+# 14-cve-2015-7696.patch
+UNZIP_IGNORE_CVES += CVE-2015-7696
+# 15-cve-2015-7697.patch
+UNZIP_IGNORE_CVES += CVE-2015-7697
+# 18-cve-2014-9913-unzip-buffer-overflow
+UNZIP_IGNORE_CVES += CVE-2014-9913
+# 19-cve-2016-9844-zipinfo-buffer-overflow.patch
+UNZIP_IGNORE_CVES += CVE-2016-9844
+# 20-cve-2018-1000035-unzip-buffer-overflow.patch
+UNZIP_IGNORE_CVES += CVE-2018-1000035
+# 22-cve-2019-13232-fix-bug-in-undefer-input.patch
+# 23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
+# 24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+# 25-cve-2019-13232-fix-bug-in-uzbunzip2.patch
+# 26-cve-2019-13232-fix-bug-in-uzinflate.patch
+UNZIP_IGNORE_CVES += CVE-2019-13232
+
 $(eval $(cmake-package))
-- 
2.29.2

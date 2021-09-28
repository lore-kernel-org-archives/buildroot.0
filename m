Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ACBC433FE
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492BE61374
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 492BE61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F4A82A4E;
	Tue, 28 Sep 2021 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYKjc8Uh4D2u; Tue, 28 Sep 2021 20:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2256E82D07;
	Tue, 28 Sep 2021 20:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3C1F1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A33E560B88
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d46gREbnf1RV for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:51:04 +0000 (UTC)
X-Greylist: delayed 00:15:04 by SQLgrey-1.8.0
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D763A60610
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:51:03 +0000 (UTC)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by
 mail.gallagher.co.nz (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B61537cab0001>; Wed, 29 Sep 2021 09:35:55 +1300
Received: from GNZ-PC2807.gallagher.local ([10.70.3.151])
 by gglnzdom1.gallagher.local with ESMTP id 2021092909355498-1081419 ;
 Wed, 29 Sep 2021 09:35:54 +1300 
From: Ankur Tyagi <ankur.tyagi@gallagher.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 09:35:47 +1300
Message-Id: <20210928203547.863-1-ankur.tyagi@gallagher.com>
MIME-Version: 1.0
X-TNEFEvaluated: 1
X-SEG-SpamProfiler-Analysis: v=2.3 cv=A8gSwJeG c=1 sm=1 tr=0
 a=qhWWnufYDz1ULA0Yxl8pUQ==:117 a=7QKq2e-ADPsA:10 a=uwzVE2XeAAAA:8
 a=eNcD7ojaAAAA:8 a=PYnjg3YJAAAA:8 a=sMBj6sIwAAAA:8 a=f6QBxa9Lp2kQ18J3EFkA:9
 a=56Ks2SYG_ayP3Q2IVBAz:22 a=rRYMMicksRHQPzyJ67jW:22 a=96-UuAdfYG6OSYlHWuPe:22
 a=tjUNV7USy4TualkcfLLZ:22
X-SEG-SpamProfiler-Score: 0
Subject: [Buildroot] [PATCH 1/1] core: add option to override CPE and NVD
 base url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ankur Tyagi <ankur.tyagi@gallagher.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It may be desirable to integrate "pkg-stats" as part of build pipeline
and usually build machines don't have internet access.
In those scenarios, private network can be used to fetch CPE dictionary
and NVD data (which are a pre-downloaded artifact).

This commit introduces config options BR2_CPEDB_BASE_URL and
BR2_NVD_BASE_URL which can point to those internal/private network url.
By default, they refer to NIST official url.

It also adds CPE and NVD base url arguments to pkg-stats which
are then passed to CVE and CPE class methods to fetch CPE dictionary
and NVD data.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 Config.in                 | 14 ++++++++++++++
 Makefile                  |  4 +++-
 support/scripts/cpedb.py  | 12 +++++++-----
 support/scripts/cve.py    | 11 +++++------
 support/scripts/pkg-stats | 16 ++++++++++------
 5 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/Config.in b/Config.in
index 3db2c8dcab..a4224fce38 100644
--- a/Config.in
+++ b/Config.in
@@ -290,6 +290,20 @@ config BR2_CPAN_MIRROR
 	  The list of mirrors is available at:
 	  http://search.cpan.org/mirror
 
+config BR2_CPEDB_BASE_URL
+	string "CPE database download site base url"
+	default "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary"
+	help
+	  The following allows you to select your preferred
+	  mirror. By default, NIST official URL is used
+
+config BR2_NVD_BASE_URL
+	string "NVD download site base url"
+	default "https://nvd.nist.gov/feeds/json/cve"
+	help
+	  The following allows you to select your preferred
+	  mirror. By default, NIST official URL is used
+
 endif
 
 endmenu
diff --git a/Makefile b/Makefile
index c960b53a6d..acb2c76aea 100644
--- a/Makefile
+++ b/Makefile
@@ -930,7 +930,9 @@ pkg-stats:
 	$(TOPDIR)/support/scripts/pkg-stats -c \
 		--json $(O)/pkg-stats.json \
 		--html $(O)/pkg-stats.html \
-		--nvd-path $(DL_DIR)/buildroot-nvd
+		--nvd-path $(DL_DIR)/buildroot-nvd \
+		--cpedb-base-url $(BR2_CPEDB_BASE_URL) \
+		--nvd-base-url $(BR2_NVD_BASE_URL)
 
 .PHONY: missing-cpe
 missing-cpe:
diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
index f4daf56124..36846621c3 100644
--- a/support/scripts/cpedb.py
+++ b/support/scripts/cpedb.py
@@ -10,7 +10,7 @@ from xml.dom import minidom
 
 VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
 
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
+CPE_DICTIONARY = "official-cpe-dictionary_v2.3.xml.gz"
 
 ns = {
     '': 'http://cpe.mitre.org/dictionary/2.0',
@@ -88,20 +88,22 @@ class CPE:
 
 
 class CPEDB:
-    def __init__(self, nvd_path):
+    def __init__(self, nvd_path, cpedb_base_url):
         self.all_cpes = dict()
         self.all_cpes_no_version = dict()
         self.nvd_path = nvd_path
+        self.cpedb_base_url = cpedb_base_url
 
     def get_xml_dict(self):
         print("CPE: Setting up NIST dictionary")
         if not os.path.exists(os.path.join(self.nvd_path, "cpe")):
             os.makedirs(os.path.join(self.nvd_path, "cpe"))
 
-        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(CPEDB_URL))
+        url = "%s/%s" % (self.cpedb_base_url, CPE_DICTIONARY)
+        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(url))
         if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-            print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-            cpe_dict = requests.get(CPEDB_URL)
+            print("CPE: Fetching xml manifest from [" + url + "]")
+            cpe_dict = requests.get(url)
             open(cpe_dict_local, "wb").write(cpe_dict.content)
 
         print("CPE: Unzipping xml manifest...")
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 13c29fabe0..0ff5fbe823 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -42,7 +42,6 @@ sys.path.append('utils/')
 
 NVD_START_YEAR = 2002
 NVD_JSON_VERSION = "1.1"
-NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
 
 ops = {
     '>=': operator.ge,
@@ -82,7 +81,7 @@ class CVE:
         self.nvd_cve = nvd_cve
 
     @staticmethod
-    def download_nvd_year(nvd_path, year):
+    def download_nvd_year(nvd_path, nvd_base_url, year):
         metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
         path_metaf = os.path.join(nvd_path, metaf)
         jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
@@ -94,7 +93,7 @@ class CVE:
             return path_jsonf_gz
 
         # If not, we download the meta file
-        url = "%s/%s" % (NVD_BASE_URL, metaf)
+        url = "%s/%s/%s" % (nvd_base_url, NVD_JSON_VERSION, metaf)
         print("Getting %s" % url)
         page_meta = requests.get(url)
         page_meta.raise_for_status()
@@ -110,7 +109,7 @@ class CVE:
                 return path_jsonf_gz
 
         # Grab the compressed JSON NVD, and write files to disk
-        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
+        url = "%s/%s/%s" % (nvd_base_url, NVD_JSON_VERSION, jsonf_gz)
         print("Getting %s" % url)
         page_json = requests.get(url)
         page_json.raise_for_status()
@@ -119,14 +118,14 @@ class CVE:
         return path_jsonf_gz
 
     @classmethod
-    def read_nvd_dir(cls, nvd_dir):
+    def read_nvd_dir(cls, nvd_dir, nvd_base_url):
         """
         Iterate over all the CVEs contained in NIST Vulnerability Database
         feeds since NVD_START_YEAR. If the files are missing or outdated in
         nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
         """
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
-            filename = CVE.download_nvd_year(nvd_dir, year)
+            filename = CVE.download_nvd_year(nvd_dir, nvd_base_url, year)
             try:
                 content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
             except:  # noqa: E722
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d13167..5192d36857 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -583,7 +583,7 @@ def check_package_cve_affects(cve, cpe_product_pkgs):
                 pkg.cves.append(cve.identifier)
 
 
-def check_package_cves(nvd_path, packages):
+def check_package_cves(nvd_path, nvd_base_url, packages):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
 
@@ -601,7 +601,7 @@ def check_package_cves(nvd_path, packages):
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
 
-    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
+    for cve in cvecheck.CVE.read_nvd_dir(nvd_path, nvd_base_url):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
     for pkg in packages:
@@ -612,8 +612,8 @@ def check_package_cves(nvd_path, packages):
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
 
-def check_package_cpes(nvd_path, packages):
-    cpedb = CPEDB(nvd_path)
+def check_package_cpes(nvd_path, cpedb_base_url, packages):
+    cpedb = CPEDB(nvd_path, cpedb_base_url)
     cpedb.get_xml_dict()
     for p in packages:
         if not p.cpeid:
@@ -1101,6 +1101,10 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
+    parser.add_argument('--cpedb-base-url', dest='cpedb_base_url',
+                          help='CPE database wensite base url')
+    parser.add_argument('--nvd-base-url', dest='nvd_base_url',
+                          help='NVD website base url')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -1155,8 +1159,8 @@ def __main__():
     loop.run_until_complete(check_package_latest_version(packages))
     if args.nvd_path:
         print("Checking packages CVEs")
-        check_package_cves(args.nvd_path, packages)
-        check_package_cpes(args.nvd_path, packages)
+        check_package_cves(args.nvd_path, args.nvd_base_url, packages)
+        check_package_cpes(args.nvd_path, args.cpedb_base_url, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.25.1

###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

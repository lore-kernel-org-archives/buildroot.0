Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A130DC41513
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D6D60071;
	Mon, 31 Jul 2023 20:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D6D60071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfD12bHZgIi0; Mon, 31 Jul 2023 20:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FF96072A;
	Mon, 31 Jul 2023 20:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FF96072A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78A841BF2B4
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93868404FF
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93868404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sX8uFLP3W1T for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:14:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE848409F8
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE848409F8
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.221.49]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfYPY-1pthRV2rFo-00fxrk for <buildroot@buildroot.org>; Mon, 31 Jul 2023
 22:14:45 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 22:14:20 +0200
Message-ID: <20230731201422.13543-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:mseG1dsjEaIKd3CHDmJh10G/2hMg8dC4B87ezP/2/5FByzeY2UH
 PYuQCYQLuLbsaxPpA4QemqSI93DHqdMS7Gv7KHASuToAnJntBmjOtzmJDihxYdJNKnTiwnE
 MKdNMo+196K9ydHKMbheq+P+AhVDbAgEia1X3xZfIi3wiliCIhrzl/NtuA8Yvm/CnX3KsKm
 6rLMGpGaMUGiS8czZlSLg==
UI-OutboundReport: notjunk:1;M01:P0:HpXsL4jjO6o=;Kbm/tJmOdd+vh4V7lNaA/bAGmLy
 BNrnBGUQEYvgtnQaD4SsTxE2gfUnZ41i4NC3FtXP1ZuwSQygM0wIurgWH+ZNun7ZTsgGUsASX
 +9YD/D69zt5T6QeTLCZbGIvpNont0nUYUaaE72Z6AeVi5kW0dHrOvId8qLGcLtDdH5mLM47Se
 2AUIZt4Nj9Axzx1zrxvYk6TNXWBtJFavNDD49AfvefWUweS0hqqYKIhFG+UWjBnWa7i3bAE5Q
 fUe+7GSdU7UhMhYf2dUsKsthFipBymd91sfhuVDpH4E3HP7KxT6rvyYyk0d99wMBt2pnqdA/W
 gPq6L1+RAYhZ1oKNcKmCRtHHwkhKwbLKhPqiZJKAt1xfWYNXBAurhUUxp+c3/dfb+ID5LN2Ts
 XXHUENAacNyGcy10Cwb25rslXyJL+xK+6pcDH5poz/D2aqdwfTuKVDJ01B7nn6SDbv/quMPO9
 XSv3y66Q3T9y5f9GRDa4opGnRv41MxkTKhx8tmoo/55Dbn5FEmf0a6AE663kPZwA3YbUHWDyI
 klrBgA7MtIXVE+1b9tb8FEp0z8AXuwlgsYI17pak2sH+4uRPTcCUUIcwMuGRJgoDoxHh+snpS
 5zS/1THt7CBLQIOdbGw7+/oomGa9xkTdg+V0ZZApVnLOSiJxvoO8gObJc4rACDtEPWXMzoKKN
 FWN7+D+VYcNHkOTlPrjtUhECvHg79vyP0OZ0gX27s5VeskZ4RKFBIvDc2CG3HYict0UXs9LDC
 QDVZtACIdHJzXvbzunKYCfa5da1mBoCYp+qd1z/78EF6dZJy+gUbhaIYqREFc8D5/dYDHdNIw
 SCz9YpAsg6sN9S0IviA0B6CxAJ4vzDCl7HlWPxzJYbGmn58J+vXBgwQSHEp8cC4gPt+O2vchf
 Dv5wh4C0KvwFKz56d1Q2vOHlTcNc5cMswqeldoNraoJ3gRTbB2YRYr5GbKySHVUe33MQnQpsU
 UUyI3VQh6rygi2JGm/ol3TsApQk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690834485; x=1691439285; i=dalang@gmx.at;
 bh=brfzB63Jx5fJcoeA63HR2gZZvvlr6z+dV9l2Y4kLOZg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=gm6zCrJBj/pU7E4vgHAd/WeAaCIHwjUIAN8T0gx/FARz2FpvvZD6UIrX9VaSAo0D3+FWpWu
 jEf0Csf4G1dFSCnB10/JsXlEa4SggQ8l95nUSkx+xjhIELwvusFznK7vbhD+XKf15jOZhR7/w
 U+0TK2WvJV6MaP1srcfcPVXFcfA8G+eCxpvyc0t8xPNWfybe/pDYTAZ/N2kvCSS7mAWMhlHX4
 VWkdsdxoysjg9Pf9Y9VKuhmNGlXzdSfLeTlc8o9rWVlWbNa5LoATY4WxYpOf5QANK0ACrEhc0
 NsV/GYy78lzalFjkwjmFdlFtorJRsA5bt1DZ+BUawuab+sF5x9Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=gm6zCrJB
Subject: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The currently used feed is deprecated and will be retired by NVD in
September 2023 [0].
The new API returns up to 2000 CVEs every 5 seconds (without API key) [1].
Instead of request individual years as with the feed, one can specify
two timestamps are range. Any CVE changed in this time is returned.
Therefore every single CVE is stored in a seperate JSON file.
All fields returned by the API are saved for future use.
This results in over 200000 files grouped by year with ~800MiB total.

[0]: https://nvd.nist.gov/General/News/change-timeline
[1]: https://nvd.nist.gov/developers/start-here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/cve.py | 208 +++++++++++++++++++++++++----------------
 1 file changed, 129 insertions(+), 79 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7cd6fce4d8..df87e9b4d0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -17,32 +17,21 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-import datetime
+from datetime import datetime, timezone
 import os
 import requests  # URL checking
 import distutils.version
 import time
-import gzip
 import sys
 import operator
-
-try:
-    import ijson
-    # backend is a module in < 2.5, a string in >= 2.5
-    if 'python' in getattr(ijson.backend, '__name__', ijson.backend):
-        try:
-            import ijson.backends.yajl2_cffi as ijson
-        except ImportError:
-            sys.stderr.write('Warning: Using slow ijson python backend\n')
-except ImportError:
-    sys.stderr.write("You need ijson to parse NVD for CVE check\n")
-    exit(1)
+import json
 
 sys.path.append('utils/')
 
-NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.1"
-NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+NVD_START_YEAR = 1999
+NVD_JSON_VERSION = "2.0"
+NVD_BASE_URL = "https://services.nvd.nist.gov/rest/json/cves/" + NVD_JSON_VERSION
+NVD_META_FILE = "nvdcve-%s-meta.json" % (NVD_JSON_VERSION)
 
 ops = {
     '>=': operator.ge,
@@ -82,69 +71,126 @@ class CVE:
         self.nvd_cve = nvd_cve
 
     @staticmethod
-    def download_nvd_year(nvd_path, year):
-        metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
-        path_metaf = os.path.join(nvd_path, metaf)
-        jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
-        path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
-
-        # If the database file is less than a day old, we assume the NVD data
-        # locally available is recent enough.
-        if os.path.exists(path_jsonf_gz) and os.stat(path_jsonf_gz).st_mtime >= time.time() - 86400:
-            return path_jsonf_gz
-
-        # If not, we download the meta file
-        url = "%s/%s" % (NVD_BASE_URL, metaf)
-        print("Getting %s" % url)
-        page_meta = requests.get(url)
-        page_meta.raise_for_status()
-
-        # If the meta file already existed, we compare the existing
-        # one with the data newly downloaded. If they are different,
-        # we need to re-download the database.
-        # If the database does not exist locally, we need to redownload it in
-        # any case.
-        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
-            meta_known = open(path_metaf, "r").read()
-            if page_meta.text == meta_known:
-                return path_jsonf_gz
-
-        # Grab the compressed JSON NVD, and write files to disk
-        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
-        print("Getting %s" % url)
-        page_json = requests.get(url)
-        page_json.raise_for_status()
-        open(path_jsonf_gz, "wb").write(page_json.content)
-        open(path_metaf, "w").write(page_meta.text)
-        return path_jsonf_gz
+    def write_cve(nvd_dir, vulnerability):
+        """
+        Write the given CVE to a json file in nvd_dir with the
+        CVE as filename. Replace if file exists.
+        CVE-2020-0001 is saved in nvd_dir/2020/CVE-2020-0001.json.
+        """
+        if vulnerability['cve']['vulnStatus'] == 'Rejected':
+            return
+
+        cve_id = vulnerability['cve']['id']
+        year = cve_id.split('-')[1]
+        folder = os.path.join(nvd_dir, year)
+        if not os.path.exists(folder):
+            os.makedirs(folder)
+
+        filename = "%s.json" % (cve_id)
+        path = os.path.join(folder, filename)
+        with open(path, 'w') as f:
+            json.dump(vulnerability['cve'], f)
+
+    @staticmethod
+    def fetch_updates(last_update, nvd_dir):
+        """
+        Fetch all CVEs from NVD. If last_update is set,
+        run a delta update. When done write the meta json file.
+        """
+        args = {}
+        start_index = 0
+        total_results = 0
+        results_per_page = 0
+        timestamp = 0
+
+        print("Downloading new CVEs")
+
+        if last_update != 0:
+            args['lastModStartDate'] = last_update
+            args['lastModEndDate'] = datetime.now().isoformat()
+
+        while True:
+            args['startIndex'] = start_index
+
+            # Even with the general sleep the API returns 503 or an empty
+            # response every now and again.
+            for attempt in range(5):
+                try:
+                    page = requests.get(NVD_BASE_URL, params=args)
+                    page.raise_for_status()
+                    content = page.json()
+                except Exception:
+                    time.sleep(6)
+                else:
+                    break
+
+            results_per_page = content['resultsPerPage']
+            total_results = content['totalResults']
+            start_index = content['startIndex']
+            timestamp = content['timestamp']
+
+            for vulnerability in content['vulnerabilities']:
+                CVE.write_cve(nvd_dir, vulnerability)
+
+            start_index += results_per_page
+            print("[%06d/%06d]" % (start_index, total_results))
+
+            if start_index >= total_results:
+                break
+
+            # recommended by NVD to not hit rate limit
+            time.sleep(6)
+
+        meta = {'version': NVD_JSON_VERSION, 'timestamp': timestamp}
+        meta_file = os.path.join(nvd_dir, NVD_META_FILE)
+        with open(meta_file, 'w') as f:
+            json.dump(meta, f)
+
+    @staticmethod
+    def check_updates(nvd_dir):
+        """
+        Check if NVD_META_FILE exists and determine the last
+        update. Skip updating if last request was less than 24
+        hours ago.
+        """
+        last_update = 0
+
+        meta_file = os.path.join(nvd_dir, NVD_META_FILE)
+        if os.path.exists(meta_file):
+            with open(meta_file, 'r') as f:
+                meta = json.load(f)
+                if meta['version'] == NVD_JSON_VERSION:
+                    last_update = meta['timestamp']
+                    last_update_date = datetime.fromisoformat(last_update).replace(tzinfo=timezone.utc)
+                    today = datetime.now(tz=timezone.utc)
+                    delta = today - last_update_date
+                    # NVD is only updated once a day
+                    if delta.total_seconds() < 86400:
+                        return
+
+        CVE.fetch_updates(last_update, nvd_dir)
 
     @classmethod
     def read_nvd_dir(cls, nvd_dir):
         """
-        Iterate over all the CVEs contained in NIST Vulnerability Database
-        feeds since NVD_START_YEAR. If the files are missing or outdated in
-        nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
+        Check if NIST Vulnerability Database needs to be updated.
+        Afterwards load all JSON files containing CVEs since
+        NVD_START_YEAR.
         """
-        for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
-            filename = CVE.download_nvd_year(nvd_dir, year)
-            try:
-                content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
-            except:  # noqa: E722
-                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
-                raise
-            for cve in content:
-                yield cls(cve)
-
-    def each_product(self):
-        """Iterate over each product section of this cve"""
-        for vendor in self.nvd_cve['cve']['affects']['vendor']['vendor_data']:
-            for product in vendor['product']['product_data']:
-                yield product
+        CVE.check_updates(nvd_dir)
+
+        for year in range(NVD_START_YEAR, datetime.now().year + 1):
+            year_folder = os.path.join(nvd_dir, str(year))
+            # sort files by CVE number within a year
+            for cve_file in sorted(os.listdir(year_folder), key=lambda f: int(f.split('.')[0].split('-')[-1])):
+                path = os.path.join(year_folder, cve_file)
+                with open(path, 'r') as f:
+                    yield cls(json.load(f))
 
     def parse_node(self, node):
         """
         Parse the node inside the configurations section to extract the
-        cpe information usefull to know if a product is affected by
+        cpe information useful to know if a product is affected by
         the CVE. Actually only the product name and the version
         descriptor are needed, but we also provide the vendor name.
         """
@@ -155,11 +201,11 @@ class CVE:
             for parsed_node in self.parse_node(child):
                 yield parsed_node
 
-        for cpe in node.get('cpe_match', ()):
+        for cpe in node.get('cpeMatch', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['cpe23Uri'])
-            version = cpe_version(cpe['cpe23Uri'])
+            product = cpe_product(cpe['criteria'])
+            version = cpe_version(cpe['criteria'])
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -191,7 +237,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'id': cpe['cpe23Uri'],
+                'id': cpe['criteria'],
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -199,14 +245,18 @@ class CVE:
             }
 
     def each_cpe(self):
-        for node in self.nvd_cve['configurations']['nodes']:
-            for cpe in self.parse_node(node):
-                yield cpe
+        if 'configurations' not in self.nvd_cve:
+            return []
+
+        for config in self.nvd_cve['configurations']:
+            for node in config['nodes']:
+                for cpe in self.parse_node(node):
+                    yield cpe
 
     @property
     def identifier(self):
         """The CVE unique identifier"""
-        return self.nvd_cve['cve']['CVE_data_meta']['ID']
+        return self.nvd_cve['id']
 
     @property
     def affected_products(self):
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

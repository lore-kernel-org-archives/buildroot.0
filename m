Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88590C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3870C41570;
	Sat, 12 Aug 2023 19:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3870C41570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96y0pzo56OMV; Sat, 12 Aug 2023 19:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6FF415E7;
	Sat, 12 Aug 2023 19:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B6FF415E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD65C1BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A6760E2E
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A6760E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_-i6AtlW7uM for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:42 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C8A860DF6
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8A860DF6
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N6sn1-1piaH33Fmx-018Mco; Sat, 12 Aug 2023 21:29:34 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:34 +0200
Message-ID: <20230812192842.135682-6-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DvlBgdTxHMaRLUHNzpm8KXbLFA462+wFYA4MaL8VcQTsc6qfUQ9
 hSk0MA3j56s3G/dNAy9HWyE1ZdK3KZF6W+OGJZ2oiCcQEGPjHqaHFaTqIa52DvFMPtnEbzU
 84C00OpJkjQ6hgKh8enVLb3uuKGAG8L80eikpgdMaxJj1Ks9lX3egLhGw1fuvPlof+3i/+h
 YfYElz/UCLLaoEZp7ddOA==
UI-OutboundReport: notjunk:1;M01:P0:eqak3RvzjNA=;RDx0KtCwBjMBegg5rmnFf1S2s/U
 zjxVFIckq9TJpzoLJU7pUFKIOcHaJ5l5Db/NPacdvppxXA0CCy6bkFf+N+d0ZSQ03XIOFCMGS
 7VM924tqzzUmLORMnDkFG//aSzcsXbq5Bnkjddk46k2ZeyVKFdwy3BYyREO8MZ5cG7dNjDhtC
 Gke1qSkz853DzZOGupCMZNX6mjFEyv+bkFNAVDtIlA+/QTKX1ZyIbuPsP4F7rzhQr4AE0Z06I
 RHH2zPl5NE0eoFp0AlCMHJuExDire1JSXls20vlOCeMu3UFUV7S0nl9634tqen1LDeNplDh0K
 uoc+1agDKV4CKO5n272r2neO0/V307YbCIgLJnk2pnZgBkbz7OziORSYAypa3JLc94FSwdASp
 2fUq6P9B4tBHz5zSMf3JtFgqIPn38rU6XcG1FL7Tk6Del28GCCd1pe/XWGMSYGqnjDG4y3tfS
 oNa1KqEbld4BZ0gYNPvHJiteeMyZ3Iay1JDNaBvA09jP6xVuiJHTm0IsVOGFHusvpV89r3x05
 n7AZUP7DQxYeJ3pMJxV9BR9tI706EuErpxHBH9IPUTaLeymReJeNA2gEi4+YwaGknthSfjUZ1
 VscfiLvAJD1bM4PRmrYxwAJzg47ilfvHb7HsP+U91n6Mazm+uUCzYL4gbMiCSTv/Rfy9IasJf
 U36mwoPopH7XlzUJrhsliIbT5MO+BWv1Kfn3WmJYWdGERZ4C48CeTB1mIDK2led0AmReevDoH
 fA2iAnio8+nliRZCxjC0GwILhK/LneEgXZJo5lWaLWiV/3CzTIgHoAiLuMWnQ1YDaMr2vNNG2
 igCpms/pWtnbjPNfbW3ufbfTs2LiqLY4l7TlAndcYixQGWEZRZ3idxOIjiYU+IP5Gl7Xrm8QT
 XJJkieulMrdARycUjj17THINHRZGd2C9nV919rRUQdyAQ3VnAiaDaEFFuwLy7ZxOG7/ZNXoKj
 Fpuzky/8t8ZMXvZOJyw853z0wmg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868575; x=1692473375; i=dalang@gmx.at;
 bh=Y/tkjzWvCPpGU69004Z/ksBE62Thu6g2NGQLJ+kwIes=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Bt4p+iIl6g9D28jUOajgJkZymHcYeDf6pnGSbx7D7Z4sJjh9DNNxBuS/QUEFx7zlZpIKrb7
 3BJ8igGJEhe7sSpYyAQPJNf3NIt4A+Q7D255xh+5h3OU13Y4eAGadBZXDEolawY1H+Fzam43P
 eOphyB519Yk6i8fHJP2LlH/duVJHvx8hVTIX84C9Flm5Wb+ns76AxFLWq/eGqQcFdonHus2wY
 OK1B54IbXSTOHspCvrn6q8jL2xNsnS/EWN/HsKBe0piyOhFVuYvaIq+ASGU9rvQjOl7WrDucm
 nHQbZvAGxc51OcSBZXsiauwNzd7txBYv/xax8pMKEiPaWnf81K2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Bt4p+iIl
Subject: [Buildroot] [PATCH v3 6/8] support/scripts/cve.py: switch to NVD
 API v2
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The currently used feed will be retired in December 2023 [0].
As an alternative the new v2 API [1]. The new API allows downloading
sets of CVEs (2k at a time) that were modified after a given
UTC timestamp. Rate limiting of 5 requests in a sliding 30 seconds
window is used [2].

[0]: https://nvd.nist.gov/General/News/change-timeline
[1]: https://nvd.nist.gov/developers/vulnerabilities
[2]: https://nvd.nist.gov/developers/start-here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- switch to sqlite database for a more future proof storage
- CPE_ID class has been moved to a laster patch, therefore not used here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 DEVELOPERS                |   1 +
 support/scripts/cve.py    | 415 ++++++++++++++++++++------------------
 support/scripts/pkg-stats |  31 ++-
 3 files changed, 238 insertions(+), 209 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 81f809a4c0..cd4a58f2e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -668,6 +668,7 @@ F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
 F:	package/sam-ba/
+F:	support/scripts/cve.py
 F:	support/scripts/nvd_api_v2.py
 
 N:	Damien Lanson <damien@kal-host.com>
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7cd6fce4d8..4087df2ae3 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -17,40 +17,9 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-import datetime
-import os
-import requests  # URL checking
 import distutils.version
-import time
-import gzip
-import sys
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
-
-sys.path.append('utils/')
-
-NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.1"
-NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
-
-ops = {
-    '>=': operator.ge,
-    '>': operator.gt,
-    '<=': operator.le,
-    '<': operator.lt,
-    '=': operator.eq
-}
+from nvd_api_v2 import NVD_API
 
 
 # Check if two CPE IDs match each other
@@ -77,141 +46,32 @@ class CVE:
     CVE_DOESNT_AFFECT = 2
     CVE_UNKNOWN = 3
 
-    def __init__(self, nvd_cve):
-        """Initialize a CVE from its NVD JSON representation"""
-        self.nvd_cve = nvd_cve
-
-    @staticmethod
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
-
-    @classmethod
-    def read_nvd_dir(cls, nvd_dir):
-        """
-        Iterate over all the CVEs contained in NIST Vulnerability Database
-        feeds since NVD_START_YEAR. If the files are missing or outdated in
-        nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
-        """
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
-
-    def parse_node(self, node):
-        """
-        Parse the node inside the configurations section to extract the
-        cpe information usefull to know if a product is affected by
-        the CVE. Actually only the product name and the version
-        descriptor are needed, but we also provide the vendor name.
-        """
+    ops = {
+        '>=': operator.ge,
+        '>': operator.gt,
+        '<=': operator.le,
+        '<': operator.lt,
+        '=': operator.eq
+    }
 
-        # The node containing the cpe entries matching the CVE can also
-        # contain sub-nodes, so we need to manage it.
-        for child in node.get('children', ()):
-            for parsed_node in self.parse_node(child):
-                yield parsed_node
-
-        for cpe in node.get('cpe_match', ()):
-            if not cpe['vulnerable']:
-                return
-            product = cpe_product(cpe['cpe23Uri'])
-            version = cpe_version(cpe['cpe23Uri'])
-            # ignore when product is '-', which means N/A
-            if product == '-':
-                return
-            op_start = ''
-            op_end = ''
-            v_start = ''
-            v_end = ''
-
-            if version != '*' and version != '-':
-                # Version is defined, this is a '=' match
-                op_start = '='
-                v_start = version
-            else:
-                # Parse start version, end version and operators
-                if 'versionStartIncluding' in cpe:
-                    op_start = '>='
-                    v_start = cpe['versionStartIncluding']
-
-                if 'versionStartExcluding' in cpe:
-                    op_start = '>'
-                    v_start = cpe['versionStartExcluding']
-
-                if 'versionEndIncluding' in cpe:
-                    op_end = '<='
-                    v_end = cpe['versionEndIncluding']
-
-                if 'versionEndExcluding' in cpe:
-                    op_end = '<'
-                    v_end = cpe['versionEndExcluding']
-
-            yield {
-                'id': cpe['cpe23Uri'],
-                'v_start': v_start,
-                'op_start': op_start,
-                'v_end': v_end,
-                'op_end': op_end
-            }
-
-    def each_cpe(self):
-        for node in self.nvd_cve['configurations']['nodes']:
-            for cpe in self.parse_node(node):
-                yield cpe
+    def __init__(self, nvd_cve):
+        """Initialize a CVE from the database tuple representation"""
+        self.id = nvd_cve[0]
+        self.match_criteria = nvd_cve[2]
+        self.v_start = nvd_cve[3]
+        self.v_end = nvd_cve[4]
+        self.op_start = nvd_cve[5]
+        self.op_end = nvd_cve[6]
 
     @property
     def identifier(self):
         """The CVE unique identifier"""
-        return self.nvd_cve['cve']['CVE_data_meta']['ID']
+        return self.id
 
     @property
-    def affected_products(self):
-        """The set of CPE products referred by this CVE definition"""
-        return set(cpe_product(p['id']) for p in self.each_cpe())
+    def affected_product(self):
+        """Name of the affected product"""
+        return cpe_product(self.match_criteria)
 
     def affects(self, name, version, cve_ignore_list, cpeid=None):
         """
@@ -235,39 +95,208 @@ class CVE:
         else:
             pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
 
-        for cpe in self.each_cpe():
-            if not cpe_matches(cpe['id'], cpeid):
-                continue
-            if not cpe['v_start'] and not cpe['v_end']:
-                return self.CVE_AFFECTS
-            if not pkg_version:
+        if not cpe_matches(self.match_criteria, cpeid):
+            return self.CVE_DOESNT_AFFECT
+        if not self.v_start and not self.v_end:
+            return self.CVE_AFFECTS
+        if not pkg_version:
+            return self.CVE_DOESNT_AFFECT
+
+        if self.v_start:
+            try:
+                cve_affected_version = distutils.version.LooseVersion(self.v_start)
+                inrange = self.ops.get(self.op_start)(pkg_version, cve_affected_version)
+            except TypeError:
+                return self.CVE_UNKNOWN
+
+            # current package version is before v_start, so we're
+            # not affected by the CVE
+            if not inrange:
+                return self.CVE_DOESNT_AFFECT
+
+        if self.v_end:
+            try:
+                cve_affected_version = distutils.version.LooseVersion(self.v_end)
+                inrange = self.ops.get(self.op_end)(pkg_version, cve_affected_version)
+            except TypeError:
+                return self.CVE_UNKNOWN
+
+            # current package version is after v_end, so we're
+            # not affected by the CVE
+            if not inrange:
+                return self.CVE_DOESNT_AFFECT
+
+        # We're in the version range affected by this CVE
+        return self.CVE_AFFECTS
+
+
+class CVE_API(NVD_API):
+    """Download and manage CVEs in a sqlite database."""
+    def __init__(self, nvd_path):
+        """ Create a new API and database endpoint."""
+        NVD_API.__init__(self, nvd_path, 'CVEs', 'nvdcve')
+
+    def init_db(self):
+        """
+        Create all tables if the are missing.
+        """
+        cursor = self.connection.cursor()
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS cves (\
+            id TEXT UNIQUE, \
+            description TEXT, \
+            metric2 REAL, \
+            metric3 REAL, \
+            severity TEXT)')
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS cpe_matches (\
+            id TEXT UNIQUE, \
+            criteria TEXT, \
+            version_start TEXT, \
+            version_end TEXT, \
+            operator_start TEXT, \
+            operator_end TEXT)')
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS configurations (\
+            cve_id TEXT, \
+            cpe_match_id TEXT, \
+            FOREIGN KEY (cve_id) REFERENCES cve (id) ON DELETE CASCADE, \
+            FOREIGN KEY (cpe_match_id) REFERENCES cpe_match (id) ON DELETE CASCADE, \
+            UNIQUE (cve_id, cpe_match_id))')
+
+        cursor.close()
+
+    def extract_cve_data(self, cve):
+        """Map CVE API data to database fields."""
+        description = ''
+        for d in cve['descriptions']:
+            if d['lang'] == 'en':
+                description = d['value']
+        metric2 = 0.0
+        metric3 = 0.0
+        severity = 'UNKNOWN'
+        if 'cvssMetricV31' in cve['metrics']:
+            metric3 = cve['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
+            severity = cve['metrics']['cvssMetricV31'][0]['cvssData']['baseSeverity']
+        elif 'cvssMetricV30' in cve['metrics']:
+            metric3 = cve['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
+            severity = cve['metrics']['cvssMetricV30'][0]['cvssData']['baseSeverity']
+        elif 'cvssMetricV2' in cve['metrics']:
+            metric2 = cve['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
+            severity = cve['metrics']['cvssMetricV2'][0]['baseSeverity']
+
+        return [cve['id'], description, metric2, metric3, severity]
+
+    def extract_cpe_match_data(self, cpe_match):
+        """Map CPE match information to database fields."""
+        product = cpe_product(cpe_match['criteria'])
+        version = cpe_version(cpe_match['criteria'])
+        # ignore when product is '-', which means N/A
+        if product == '-':
+            return
+        op_start = ''
+        op_end = ''
+        v_start = ''
+        v_end = ''
+
+        if version != '*' and version != '-':
+            # Version is defined, this is a '=' match
+            op_start = '='
+            v_start = version
+        else:
+            # Parse start version, end version and operators
+            if 'versionStartIncluding' in cpe_match:
+                op_start = '>='
+                v_start = cpe_match['versionStartIncluding']
+
+            if 'versionStartExcluding' in cpe_match:
+                op_start = '>'
+                v_start = cpe_match['versionStartExcluding']
+
+            if 'versionEndIncluding' in cpe_match:
+                op_end = '<='
+                v_end = cpe_match['versionEndIncluding']
+
+            if 'versionEndExcluding' in cpe_match:
+                op_end = '<'
+                v_end = cpe_match['versionEndExcluding']
+
+        return [
+            cpe_match['matchCriteriaId'],
+            cpe_match['criteria'],
+            v_start,
+            v_end,
+            op_start,
+            op_end
+        ]
+
+    def save_to_db(self, start_index, total_results, content):
+        """
+        Save the response of a single API request to the database
+        and report the progress.
+        """
+        cve_ids_changed = list()
+        cve_ids_dropped = list()
+        cves = list()
+        cpe_matches = list()
+        configurations = list()
+
+        for vul in content['vulnerabilities']:
+            if vul['cve']['vulnStatus'] == 'Rejected':
+                cve_ids_dropped.append((vul['cve']['id'],))
                 continue
 
-            if cpe['v_start']:
-                try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
-                    inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
-                except TypeError:
-                    return self.CVE_UNKNOWN
-
-                # current package version is before v_start, so we're
-                # not affected by the CVE
-                if not inrange:
-                    continue
-
-            if cpe['v_end']:
-                try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
-                    inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
-                except TypeError:
-                    return self.CVE_UNKNOWN
-
-                # current package version is after v_end, so we're
-                # not affected by the CVE
-                if not inrange:
-                    continue
-
-            # We're in the version range affected by this CVE
-            return self.CVE_AFFECTS
+            cve_ids_changed.append((vul['cve']['id'],))
+            cves.append(self.extract_cve_data(vul['cve']))
+
+            for config in vul['cve'].get('configurations', ()):
+                for node in config['nodes']:
+                    for cpe_match in node['cpeMatch']:
+                        if not cpe_match['vulnerable']:
+                            continue
+                        match_data = self.extract_cpe_match_data(cpe_match)
+                        if not match_data:
+                            continue
+                        cpe_matches.append(match_data)
+                        configurations.append([vul['cve']['id'], match_data[0]])
+
+        cursor = self.connection.cursor()
+
+        # Drop all CVEs that are rejected, status might have changed
+        cursor.executemany('DELETE FROM cves WHERE id = ?', cve_ids_dropped)
+        # Delete configuration mapping for included CVEs, otherwise we can't detect
+        # upstream dropping configurations.
+        cursor.executemany('DELETE FROM configurations WHERE cve_id = ?', cve_ids_changed)
+        cursor.executemany('INSERT OR REPLACE INTO cves VALUES (?, ?, ?, ?, ?)', cves)
+        cursor.executemany('INSERT OR REPLACE INTO cpe_matches VALUES (?, ?, ?, ?, ?, ?)', cpe_matches)
+        cursor.executemany('INSERT OR REPLACE INTO configurations VALUES (?, ?)', configurations)
+
+        cursor.close()
 
-        return self.CVE_DOESNT_AFFECT
+        print("[%06d/%06d]" % (start_index, total_results))
+
+        return True
+
+    def load_all(self):
+        """
+        Load all entries from the database and use CVE class
+        to yield each result individually.
+        Each yielded object represents one configuration that
+        the included CVE is vulnerable for.
+        """
+        self.check_for_updates()
+
+        self.connection = self.open_db()
+        cursor = self.connection.cursor()
+        sql = 'SELECT c.id as cve_id, m.id, m.criteria, m.version_start, m.version_end, \
+            m.operator_start, m.operator_end \
+            FROM configurations \
+            INNER JOIN cves AS c ON c.id = configurations.cve_id \
+            INNER JOIN cpe_matches AS m ON m.id = configurations.cpe_match_id \
+            ORDER BY cve_id'
+
+        for row in cursor.execute(sql):
+            yield CVE(row)
+
+        cursor.close()
+        self.connection.close()
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3cb9da6a0b..7be4ad9853 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -32,6 +32,7 @@ import time
 import gzip
 import xml.etree.ElementTree
 import requests
+from cve import CVE_API, cpe_product
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
@@ -607,15 +608,17 @@ async def check_package_latest_version(packages):
 
 
 def check_package_cve_affects(cve, cpe_product_pkgs):
-    for product in cve.affected_products:
-        if product not in cpe_product_pkgs:
+    product = cve.affected_product
+    if product not in cpe_product_pkgs:
+        return
+    for pkg in cpe_product_pkgs[product]:
+        if cve.identifier in pkg.cves or cve.identifier in pkg.unsure_cves:
             continue
-        for pkg in cpe_product_pkgs[product]:
-            cve_status = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid)
-            if cve_status == cve.CVE_AFFECTS:
-                pkg.cves.append(cve.identifier)
-            elif cve_status == cve.CVE_UNKNOWN:
-                pkg.unsure_cves.append(cve.identifier)
+        cve_status = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid)
+        if cve_status == cve.CVE_AFFECTS:
+            pkg.cves.append(cve.identifier)
+        elif cve_status == cve.CVE_UNKNOWN:
+            pkg.unsure_cves.append(cve.identifier)
 
 
 def check_package_cves(nvd_path, packages):
@@ -631,12 +634,13 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            cpe_product = cvecheck.cpe_product(pkg.cpeid)
-            cpe_product_pkgs[cpe_product].append(pkg)
+            product = cpe_product(pkg.cpeid)
+            cpe_product_pkgs[product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
 
-    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
+    cve_api = CVE_API(nvd_path)
+    for cve in cve_api.load_all():
         check_package_cve_affects(cve, cpe_product_pkgs)
 
     for pkg in packages:
@@ -1285,13 +1289,8 @@ def parse_args():
 
 
 def __main__():
-    global cvecheck
-
     args = parse_args()
 
-    if args.nvd_path:
-        import cve as cvecheck
-
     show_info_js = None
     if args.packages:
         package_list = args.packages.split(",")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

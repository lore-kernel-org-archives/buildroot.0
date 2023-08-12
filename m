Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE76DC001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C21E41558;
	Sat, 12 Aug 2023 19:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C21E41558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbaKTB4tMwWX; Sat, 12 Aug 2023 19:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFB24157B;
	Sat, 12 Aug 2023 19:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFB24157B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43AC51BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C1BC60E51
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1BC60E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNMYBgOmqWOc for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 629F460E2E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629F460E2E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6ll8-1qR1tV4C0E-008Fd1; Sat, 12 Aug 2023 21:29:40 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:35 +0200
Message-ID: <20230812192842.135682-7-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9lVAKQshFUlJgq6AA/fjWlztthIrgXplDbTzFyKOf/5qtsgMfO2
 FvO+dkP2ABr3lOVbwa1Db6ZNUDpMBJ7x4ZFDcfRCx9dfseZS+LjenimSXz9qkq4jMqff1Wo
 CgDIahaKyOVHfeQEXUV/+45GkfY+ceOpgBYTuwkMS0PZf74Ck1/nrntA+GwmcsB108Su2ZK
 JLI+syYWCtP4IOXw+ARMA==
UI-OutboundReport: notjunk:1;M01:P0:r5WSN03VK90=;ZvgNoeTe9z3RalWQukDuZR5xmbH
 Cvv1kSlrcTW+VbJWOwMaqEv6IhlPdR1tuA6bxtgVPRUDSO8lXFawTcWX9EyUoSuL70pPd01i5
 KPCzsVBDCVzYr/YlM5qnvAqScTdM+VqttgqdRgEqh+HQDg9cTiD/1oSACmpr/1Y/h/8TFacRg
 Sj4w5kfaLlqHlQTS9CNBYo/FmdP+IbGeqSR9ts0glbCUntzvuq9kOZHcv9AABFM7x2vbC3iTJ
 GRkK8Ld67pBf93NBm7ww7KJJRhCwg4D8tYu/KrzoHe7mdBdRJ6uHvqV+c5kNKqf4eZrIfXk7X
 W4s2md102AM9GnuFy2cu93pjdvj5HgUWwo3Irw6gJ3xvqQpJX/srI6/x1c/dNDe7V3s5nIicD
 m+I6dQvlDPRhVjFtJJPspSGfqbXlhha2oSbUn8PBcQARnhWWnkReL/McVvnJfA6uH32su367y
 BOE/XefhTTEcnlSRYEzkpaKr3k7Oefe5Jpu6FnHr86EuqLMxfTVdcoMDvZ5/i4hZk+43KgDtU
 t0vPQsQcLSzTUP7RBw3fXHj4Qj5f8tychA1JnujqCIyiNVHwDA50zv3cvyjL5hTVDvLKVBy11
 cpQsuN+24EOJrmpXOBMWOlnBoIYMWi/Ef2rboppPGMAnAyrV81CMqWwjMrmGhPzzsKf2z52Pq
 WHN5Gay+ZerxOd+5fPcC6v3bKHNpsjunU4uClAN3UxCZwue9Mk0lXksMmF0jLNlckL7Q2zXvH
 2jip47zMKz24tqJ92pyfiHTaUjXoN0Swi4fRyDBD6Lmu86A9T3JqaoWqREXNv3W7vLJm0bV1d
 nBfOVnN5au7T4USUVuPkw3G4jjwQtA83t8vUuh9EUgla9DJ0ArhKJZGuhPzoV9xXzu3KQWKlK
 k43aAs7iLgImfqvx+I15bHlmt2BPS74aTFEEwVAUezXkNaATUr7jhHTUn5UF1BFb/mEOzyvpZ
 /6ZFzrvdBYycbql8WK5jKgdpok4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868580; x=1692473380; i=dalang@gmx.at;
 bh=2SHfFFzSePS24q14rlT78VweDaoClhpa3F7DvN2+G8M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A4DMNIUfFwrDDa48c8EtSoSxy4pE78JtRQeGrfncPgn7920YpfXo+x830mXXc59PQopHFpa
 nDqWRkrj5JCwALbpiuV9oL0eIyT4Ghiw5+G0R0mv0vi/RphkygW54ewk+WBZX7F75cqrtJs5M
 hA/Jj8pWCVdIDGGtCJNCsFgTDHzrl3ENnGgX+txuZ0In9HMCgyF8EgO53jARvEaKaX+cBLi94
 mBr/w5YIoKRV5gVyEVYhcek0ezUHV5W60pjLMSDOMdtynGDsbf7NCZ6skNfERdLTsx8kc0+mF
 AjUSNiVBgF6N1UiNE9f4IX28DpuaVcQRvbmt6BBDR8E3It1B9wig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=A4DMNIUf
Subject: [Buildroot] [PATCH v3 7/8] support/scripts/pkg-stats: switch CPEs
 to NVD API v2
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
sets of CPEs (10k at a time) that were modified after a given
UTC timestamp. Rate limiting of 5 requests in a sliding 30 seconds
window is used [2].

[0]: https://nvd.nist.gov/General/News/change-timeline
[1]: https://nvd.nist.gov/developers/products
[2]: https://nvd.nist.gov/developers/start-here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v2 -> v3:
- drop XML handling for gen-missing-cpe
- Move creation of CPE_ID class into this patch

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/cpe.py    | 92 +++++++++++++++++++++++++++++++++++++++
 support/scripts/cve.py    | 29 +++---------
 support/scripts/pkg-stats | 43 +++---------------
 3 files changed, 103 insertions(+), 61 deletions(-)
 create mode 100755 support/scripts/cpe.py

diff --git a/support/scripts/cpe.py b/support/scripts/cpe.py
new file mode 100755
index 0000000000..e452d8487b
--- /dev/null
+++ b/support/scripts/cpe.py
@@ -0,0 +1,92 @@
+#!/usr/bin/env python3
+
+from nvd_api_v2 import NVD_API
+
+
+class CPE_ID:
+    @staticmethod
+    def matches(cpe1, cpe2):
+        """Check if two CPE IDs match each other"""
+        cpe1_elems = cpe1.split(":")
+        cpe2_elems = cpe2.split(":")
+
+        remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
+                         zip(cpe1_elems, cpe2_elems))
+        return len(list(remains)) == 0
+
+    @staticmethod
+    def product(cpe):
+        return cpe.split(':')[4]
+
+    @staticmethod
+    def version(cpe):
+        return cpe.split(':')[5]
+
+    @staticmethod
+    def no_version(cpe):
+        return ":".join(cpe.split(":")[:5])
+
+
+class CPE_API(NVD_API):
+    def __init__(self, nvd_path):
+        NVD_API.__init__(self, nvd_path, 'CPEs', 'nvdcpe')
+        self.cpes = list()
+        self.cpes_without_version = dict()
+
+    def init_db(self):
+        cursor = self.connection.cursor()
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS products ( \
+            id TEXT UNIQUE, \
+            name TEXT)')
+
+        cursor.close()
+
+    def save_to_db(self, start_index, total_results, content):
+        cpe_ids_dropped = list()
+        products = list()
+
+        for product in content['products']:
+            if product['cpe']['deprecated']:
+                cpe_ids_dropped.append((product['cpe']['cpeNameId'],))
+                continue
+
+            cpe = product['cpe']
+
+            products.append([cpe['cpeNameId'], cpe['cpeName']])
+
+        cursor = self.connection.cursor()
+
+        # Drop all CPEs that are deprecated, status might have changed
+        cursor.executemany('DELETE FROM products WHERE id = ?', cpe_ids_dropped)
+        cursor.executemany('INSERT OR REPLACE INTO products VALUES (?, ?)', products)
+
+        print("[%07d/%07d]" % (start_index, total_results))
+
+        return True
+
+    def load_ids(self):
+        self.check_for_updates()
+
+        self.connection = self.open_db()
+        cursor = self.connection.cursor()
+
+        ids = list()
+        for row in cursor.execute('SELECT name FROM products'):
+            ids.append(row[0])
+
+        cursor.close()
+        self.connection.close()
+
+        self.cpes = ids
+        return ids
+
+    def generate_partials(self):
+        self.cpes_without_version = dict()
+        for cpe in self.cpes:
+            self.cpes_without_version[CPE_ID.no_version(cpe)] = cpe
+
+    def find_partial(self, cpe_id):
+        cpe_id_without_version = CPE_ID.no_version(cpe_id)
+        if cpe_id_without_version in self.cpes_without_version.keys():
+            return self.cpes_without_version[cpe_id_without_version]
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 4087df2ae3..7af5786c15 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -20,24 +20,7 @@
 import distutils.version
 import operator
 from nvd_api_v2 import NVD_API
-
-
-# Check if two CPE IDs match each other
-def cpe_matches(cpe1, cpe2):
-    cpe1_elems = cpe1.split(":")
-    cpe2_elems = cpe2.split(":")
-
-    remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
-                     zip(cpe1_elems, cpe2_elems))
-    return len(list(remains)) == 0
-
-
-def cpe_product(cpe):
-    return cpe.split(':')[4]
-
-
-def cpe_version(cpe):
-    return cpe.split(':')[5]
+from cpe import CPE_ID
 
 
 class CVE:
@@ -71,7 +54,7 @@ class CVE:
     @property
     def affected_product(self):
         """Name of the affected product"""
-        return cpe_product(self.match_criteria)
+        return CPE_ID.product(self.match_criteria)
 
     def affects(self, name, version, cve_ignore_list, cpeid=None):
         """
@@ -93,9 +76,9 @@ class CVE:
         # version, as they might be different due to
         # <pkg>_CPE_ID_VERSION
         else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
+            pkg_version = distutils.version.LooseVersion(CPE_ID.version(cpeid))
 
-        if not cpe_matches(self.match_criteria, cpeid):
+        if not CPE_ID.matches(self.match_criteria, cpeid):
             return self.CVE_DOESNT_AFFECT
         if not self.v_start and not self.v_end:
             return self.CVE_AFFECTS
@@ -189,8 +172,8 @@ class CVE_API(NVD_API):
 
     def extract_cpe_match_data(self, cpe_match):
         """Map CPE match information to database fields."""
-        product = cpe_product(cpe_match['criteria'])
-        version = cpe_version(cpe_match['criteria'])
+        product = CPE_ID.product(cpe_match['criteria'])
+        version = CPE_ID.version(cpe_match['criteria'])
         # ignore when product is '-', which means N/A
         if product == '-':
             return
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7be4ad9853..196cbb660e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -28,11 +28,8 @@ import re
 import subprocess
 import json
 import sys
-import time
-import gzip
-import xml.etree.ElementTree
-import requests
-from cve import CVE_API, cpe_product
+from cpe import CPE_API, CPE_ID
+from cve import CVE_API
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
@@ -41,7 +38,6 @@ from getdeveloperlib import parse_developers  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
 
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
@@ -634,7 +630,7 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            product = cpe_product(pkg.cpeid)
+            product = CPE_ID.product(pkg.cpeid)
             cpe_product_pkgs[product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
@@ -652,37 +648,8 @@ def check_package_cves(nvd_path, packages):
 
 
 def check_package_cpes(nvd_path, packages):
-    class CpeXmlParser:
-        cpes = []
-
-        def start(self, tag, attrib):
-            if tag == "{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item":
-                self.cpes.append(attrib['name'])
-
-        def close(self):
-            return self.cpes
-
-    print("CPE: Setting up NIST dictionary")
-    if not os.path.exists(os.path.join(nvd_path, "cpe")):
-        os.makedirs(os.path.join(nvd_path, "cpe"))
-
-    cpe_dict_local = os.path.join(nvd_path, "cpe", os.path.basename(CPEDB_URL))
-    if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-        print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-        cpe_dict = requests.get(CPEDB_URL)
-        open(cpe_dict_local, "wb").write(cpe_dict.content)
-
-    print("CPE: Unzipping xml manifest...")
-    nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
-
-    parser = xml.etree.ElementTree.XMLParser(target=CpeXmlParser())
-    while True:
-        c = nist_cpe_file.read(1024*1024)
-        if not c:
-            break
-        parser.feed(c)
-    cpes = parser.close()
-
+    cpe_api = CPE_API(nvd_path)
+    cpes = cpe_api.load_ids()
     for p in packages:
         if not p.cpeid:
             continue
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

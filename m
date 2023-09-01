Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23ABCA0FEC
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7978660615;
	Fri,  1 Sep 2023 19:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7978660615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Gsx6NJL4cvp; Fri,  1 Sep 2023 19:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CD7613F2;
	Fri,  1 Sep 2023 19:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CD7613F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31AA81BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF266072A
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF266072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXjhRoULs8b9 for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:28:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F33960644
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 19:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F33960644
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MJVDM-1qMon711om-00JuLT; Fri, 01 Sep 2023 21:28:21 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 21:27:13 +0200
Message-ID: <20230901192719.102415-5-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901192719.102415-1-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9iw/JpGRqRyITUOhoj6R9wGlSR63AjfFuEbIuWL7riVqiDhOgIA
 NEAwmHR4afHKZh7q2dgQGdFDYOztIkycMWd5eQYzPIu1DJwLmYA77bOtOZYMRFZWPfsAs2v
 DvBGdFB/6QaYiOFMahKOI4crMg6Fkh66YS0UKu9vy9GaLPcEz4dMAlJcbajji89ZdEtXk9z
 dgeLm+OroWTQPtCPFSZgg==
UI-OutboundReport: notjunk:1;M01:P0:1EsV1ch9R5U=;RbbOA1fzZ/8rmJPoOQiKWBapFkj
 IFmVz2bjN5Ib3VBGOU7fZLo8gwwhNcGY2sHhTojBVk1GfYUZGiMs5zIl2MkjCPOI8AMiqjH84
 x3A29lOiFBx9bKvYMMF+VB6LGwMMzHMyU0rFeyXiWu7qv9u5QyWyThpZXX9PW1zIRTM12IQ1i
 7OXmf3IMWZAYbRDBMPbJ0EnJ8BfMoffZ0agzcJ4z+tC2gzCa8oyMV/0b1cej72L71/AZn2H0x
 yWpKQFf6meNVhuANnCkS/pkR+IJkbwl2W3rb7vUfXWpfrGxeJKeWqRJD5Ugrxyo+867z8MMHq
 tGAzAElmpNep12J2rW0cq3KlfN7LQxqhaJLTZYlZsQFF6yqktKGq3U1xt0C72CmW1U5zQEv6H
 w9YhuQ0pUgiORyhGxv4vnXCXLgEqameWlUa4KtITrPmx2+OOSwpRxShupQ9qNQ0BIG6wyfKTz
 jll1Dd358BHWSkLGxjH2o+4ZSSgwoRLlpKDjWSCdGxVOEauTf4e7dZy+uKaqXHs9JDAgrEYim
 DE/FFJmZWBqa/DBvNnrCoyab5eE/VYW+i2HHTKMsgANomxXpiwc89k2ywa4LgTIfkQWhtvUuF
 t5O+zvyNT3z9xuudMSSN4ESATdETShdPlH1L25TykJDZLWAvS+JKgUGHVTFLVKkd1X/tZKscI
 pBaRgcexxUPCAXj/wt3yRGYnshWm1xoxWJ9b8tIjCXviHaoeBeKxi7InbbMiOcdRkMQ+pMFBC
 24yIeSOa0+uVz6T3Ks9gkyYZabCrk0j3rVMKCqmconsO/ObYjZTiGPPjDgJI96RQvjUWbfcMM
 6/22IyfalhfoPm8nmIhGWhDXzu1He5i8zzDr595KjrU4+tippwmRitfoEpDh2QfdHFVxkIVj8
 /5qha9mq07gzp0FZvm0In+TiCf/BcDvEmmShZCC3Hz/D/fCngsbA2uw/hWJJ/tGWv51XMpRip
 82SP3ibrVFnZeXydZu4t8426tRQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693596501; x=1694201301; i=dalang@gmx.at;
 bh=hCwSjw2Jjsikm092jItHoR6kIA8nQFxHjCJAUoeUNV4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XvvRBWi4xrgvI70EMzQ7e2OWLwicGCk3kaqITMNj8rXvbZwuMrnMTQzJKHCtOr3HuXpbVIx
 TgXh9kEVRzNN0c5MQtVqpPpXjmufVvu2xfad6i4NwWSIFcgrGb+QTcswk4jW6DEks6VRkVKEz
 Ei4nZY1pRQkmwPegfTr4ULxToNxObtWEh71omIYpX+UwjT/NK9gwULCdMcHBQlmxDOwnt+D3k
 +CcAG1GDssOh2gFJL8iAeqrPV2FHV3sI1H//VI4zpjQIrqoX7rf93ckbBwjZz/Jzp/qmyQB8s
 2k9qR6DDJSgiHpH9YmR4q8h2yNPY0qdoGLv9bTzhKCs7BP2Aq57w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=XvvRBWi4
Subject: [Buildroot] [PATCH v4 5/6] support/scripts/pkg-stats: switch CPEs
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
nvd_api_v2.py is used to store the data in a local sqlite database.
Only a subset of fields is stored to keep the database "smaller"
(still ~200MB).

[0]: https://nvd.nist.gov/General/News/change-timeline
[1]: https://nvd.nist.gov/developers/products
[2]: https://nvd.nist.gov/developers/start-here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v3 -> v4:
- progress output moved to nvd_api_v2
- self.connection was renamed to self.db_connection
v2 -> v3:
- drop XML handling for gen-missing-cpe
- Move creation of CPE_ID class into this patch

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/cpe.py    | 89 +++++++++++++++++++++++++++++++++++++++
 support/scripts/cve.py    | 29 +++----------
 support/scripts/pkg-stats | 42 +++---------------
 3 files changed, 100 insertions(+), 60 deletions(-)
 create mode 100755 support/scripts/cpe.py

diff --git a/support/scripts/cpe.py b/support/scripts/cpe.py
new file mode 100755
index 0000000000..671923ebff
--- /dev/null
+++ b/support/scripts/cpe.py
@@ -0,0 +1,89 @@
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
+        cursor = self.db_connection.cursor()
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS products ( \
+            id TEXT UNIQUE, \
+            name TEXT)')
+
+        cursor.close()
+
+    def save_to_db(self, content):
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
+        cursor = self.db_connection.cursor()
+
+        # Drop all CPEs that are deprecated, status might have changed
+        cursor.executemany('DELETE FROM products WHERE id = ?', cpe_ids_dropped)
+        cursor.executemany('INSERT OR REPLACE INTO products VALUES (?, ?)', products)
+
+        return True
+
+    def load_ids(self):
+        self.check_for_updates()
+
+        cursor = self.db_connection.cursor()
+
+        ids = list()
+        for row in cursor.execute('SELECT name FROM products'):
+            ids.append(row[0])
+
+        cursor.close()
+        self.db_connection.close()
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
index b09ac64c81..ce951d60f6 100755
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
index b1f02c15b8..3d6c53a353 100755
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
 
@@ -638,7 +635,7 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            product = cpe_product(pkg.cpeid)
+            product = CPE_ID.product(pkg.cpeid)
             cpe_product_pkgs[product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
@@ -656,37 +653,8 @@ def check_package_cves(nvd_path, packages):
 
 
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

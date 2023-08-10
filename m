Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30992C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD91A415A5;
	Thu, 10 Aug 2023 05:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD91A415A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5YctLF6d87g; Thu, 10 Aug 2023 05:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFFA541586;
	Thu, 10 Aug 2023 05:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFFA541586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3558B1BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A5EC4176F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A5EC4176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yy2vVzSWFbbB for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:50:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 160CD41775
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160CD41775
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MN5eX-1qBUMk2yI9-00IyiX; Thu, 10 Aug 2023 07:49:59 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:50 +0200
Message-ID: <20230810054856.100816-6-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810054856.100816-1-dalang@gmx.at>
References: <20230810054856.100816-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FTTSbbtgAUV/dkTAXq1fF7X0O0W9fXiJSmLyvFb29qMm7gnmwWG
 1tjxVKJccfJErguXgRFebsA1DaApkfVGiGzcqR3lxe8m7kazMO2H5omOzzDFEOgtRYer+Id
 TrEqgDkE5XHBVVGiF+6egr1e87KSpgecVZ+ppEXAQffgsz9Cu4GEN4uaxDHjZYd/oTN+z9p
 T8H2s0VzIzXjq8RjeyHSg==
UI-OutboundReport: notjunk:1;M01:P0:xMujm0M6r1o=;JdG7oVcZfttctQsZjclkrw8YL4S
 Z600rM8Xe5r4VLPKm8mDJUhSZJcZPZIukI0BR154L8RGaI/r5mdej9IdH4ACDrcjkdcNhN+hM
 aT1QQjO3LtGTm1QAEXjSXJrl/DGKobgzXj9HQsEnn0NH+YlQnq4vlJVp1UVzJmtYK1I8H0MBS
 0l9feOpbFKe4wmgNwMhfazcnjWmv3n/fFCeLxeXiLDvp51oFzJDJ8vIlydDFKpGnUdhkyGOUe
 8w+80pZyneC3S0WAC/tt5NB2te9Tpe764Tbyo4sXBP7dVO8VZccNePkXB2m5LqpZKcHYa+Vve
 9D54/HZ3UagVbPvvBBT0mYkGdYTVOdePsxwtXjBdRPZcpxnF14yXSK789OXxZZuZWVMRtCH1+
 ulupB9hDzyhhHTFZsx2M0OlAv0vupya8Xp6ZpIdVHlhw1mesMStuUP2sjPzZMcfcB+rl8VUEi
 OkKE7WQhLe9w+L6Zej5M3D82K+ICq6YsX/IPyWCsy3QkLbL0NyQj1wnP/RGUTsDyPWgMLVAAt
 FEbFAaEuzpZBuy+vowcPMtm7xchI3NpXcaU7PYBSdq3yAz4jtCEnX02uvDAATpNYAkf6jmkZF
 LkUc36hjdmYZQSu84eLoE0jPr4ABmGbi5NFmaUfhRx69IKCHPDTHCMfhWiHkg7+61E05Hkb46
 +yLrWqyTegW49bEoNoHKIIUG+1A/De4ibHsVxk3A9BwDijAXiljJveg/V+Pu6MZdiElEohE/j
 fymX6jZMfnhi46vLEm4FKgWFWXBlHBZ0LJ/zGmCqDMCA/YwuO/IeEU40Yfcisewmvug8VV8QV
 32N+HyBS6K/OeGY+kEVtRs/A8G9byZiLy0rNFNupUuTh0JOQl81kU7XAL0WGXu4hEud7GiH/s
 jpn7pddjCyt68ZHaRsmJqT6v/I+1o+rmk0snAp0N9m891PWvJVcjaATx+9F8KYLML/7RUI0/h
 l0a5YhO4KoC1k9UT03JvBZTdAHE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646600; x=1692251400; i=dalang@gmx.at;
 bh=ZwETMQkkaB9+Ak8C9cah3rzo2FTCAC+tOoNpNhQgG7k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pw9FL8YcQur7vs3QzXp5G5/J1u6r+fZUKh5z3PM9D9vreYJc6svRXt6g6MRGDGYYBb5C6I3
 v9rmvjoEfiaCi9O/YJyOzQLXcKMChpReBFxb0NBAqf/vVWERz86rrKYH7HLHLcUR9AmCil9K7
 OsVYv8OIytf86O2zOfseXGspHxACEoWxyUAGzTyjssx9b11pvQUWrcqIF/H4Dva1Ghq9BjbGT
 XrP9VErEa0qu0RHWT8VTK36CyaDfBsjVb2jaXUZo5yR7dA7fzJyidfFfjydYOdn6xnkG27tHI
 8p5a9n5IsI36OtWqpbC/Ni4p7gaKJj5qBxbQodLzawB7+rOhGAmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=pw9FL8Yc
Subject: [Buildroot] [PATCH v2 6/7] support/scripts/cpedb.py: switch to NVD
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
sets of CPEs (10k at a time) that were modified after a given
UTC timestamp. Rate limiting of 5 requests in a sliding 30 seconds
window is used [2].
Rename script to match the CVE naming.

[0]: https://nvd.nist.gov/General/News/change-timeline
[1]: https://nvd.nist.gov/developers/products
[2]: https://nvd.nist.gov/developers/start-here

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 DEVELOPERS                      |   1 +
 support/scripts/cpe.py          | 225 ++++++++++++++++++++++++++++++++
 support/scripts/cpedb.py        | 186 --------------------------
 support/scripts/cve.py          |   2 +-
 support/scripts/gen-missing-cpe |  27 ++--
 support/scripts/pkg-stats       |  39 +-----
 6 files changed, 244 insertions(+), 236 deletions(-)
 create mode 100755 support/scripts/cpe.py
 delete mode 100644 support/scripts/cpedb.py

diff --git a/DEVELOPERS b/DEVELOPERS
index cd4a58f2e6..ecdfeed062 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -668,6 +668,7 @@ F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
 F:	package/sam-ba/
+F:	support/scripts/cpe.py
 F:	support/scripts/cve.py
 F:	support/scripts/nvd_api_v2.py
 
diff --git a/support/scripts/cpe.py b/support/scripts/cpe.py
new file mode 100755
index 0000000000..ea793c9a56
--- /dev/null
+++ b/support/scripts/cpe.py
@@ -0,0 +1,225 @@
+#!/usr/bin/env python3
+
+import xml.etree.ElementTree as ET
+from xml.etree.ElementTree import Element, SubElement
+from xml.dom import minidom
+from nvd_api_v2 import NVD_API
+
+
+class CPE_ID:
+    @staticmethod
+    def matches(cpe1, cpe2):
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
+    def short_name(cpe):
+        return ":".join(cpe.split(":")[2:6])
+
+    @staticmethod
+    def version_update(cpe):
+        return ":".join(cpe.split(":")[5:6])
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
+        cursor.execute('CREATE TABLE IF NOT EXISTS product_titles ( \
+            product_id TEXT, \
+            title TEXT, \
+            language TEXT, \
+            FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE, \
+            UNIQUE(product_id, language))')
+
+        cursor.execute('CREATE TABLE IF NOT EXISTS product_references ( \
+            product_id TEXT, \
+            ref TEXT, \
+            type TEXT, \
+            FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE, \
+            UNIQUE(product_id, type))')
+
+        cursor.close()
+
+    def save_to_db(self, start_index, total_results, content):
+        cpe_ids_dropped = list()
+        products = list()
+        product_titles = list()
+        product_references = list()
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
+            for title in cpe.get('titles', ()):
+                product_titles.append([cpe['cpeNameId'], title['title'], title['lang']])
+
+            for ref in cpe.get('refs', ()):
+                if 'type' not in ref:
+                    continue
+                product_references.append([cpe['cpeNameId'], ref['ref'], ref['type']])
+
+        cursor = self.connection.cursor()
+
+        # Drop all CPEs that are deprecated, status might have changed
+        cursor.executemany('DELETE FROM products WHERE id = ?', cpe_ids_dropped)
+        cursor.executemany('INSERT OR REPLACE INTO products VALUES (?, ?)', products)
+        cursor.executemany('INSERT OR REPLACE INTO product_titles VALUES (?, ?, ?)', product_titles)
+        cursor.executemany('INSERT OR REPLACE INTO product_references VALUES (?, ?, ?)', product_references)
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
+    def get_details_for_cpe(self, cpe_id):
+        cursor = self.connection.execute('SELECT id, name FROM products WHERE name = ?', (cpe_id,))
+        result = cursor.fetchone()
+        cursor.close()
+
+        if result is None:
+            return None
+
+        return {
+            'id': result[0],
+            'name': result[1]
+        }
+
+    def get_titles_for_cpe_uuid(self, uuid):
+        titles = list()
+        cursor = self.connection.execute('SELECT title, language FROM product_titles WHERE product_id = ?', (uuid,))
+        result = cursor.fetchall()
+        cursor.close()
+
+        for row in result:
+            titles.append({'title': row[0], 'lang': row[1]})
+
+        return titles
+
+    def get_references_for_cpe_uuid(self, uuid):
+        references = list()
+        cursor = self.connection.execute('SELECT ref, type FROM product_references WHERE product_id = ?', (uuid,))
+        result = cursor.fetchall()
+        cursor.close()
+
+        for row in result:
+            references.append({'ref': row[0], 'type': row[1]})
+
+        return references
+
+    def generate_partials(self):
+        self.cpes_without_version = dict()
+        for cpe in self.cpes:
+            self.cpes_without_version[CPE_ID.no_version(cpe)] = cpe
+
+    def is_official(self, cpe_id):
+        return cpe_id in self.cpes
+
+    def find_partial(self, cpe_id):
+        cpe_id_without_version = CPE_ID.no_version(cpe_id)
+        if cpe_id_without_version in self.cpes_without_version.keys():
+            return self.cpes_without_version[cpe_id_without_version]
+
+    def gen_update_xml(self, new_cpe_id):
+        existing_cpe_id = self.find_partial(new_cpe_id)
+        if existing_cpe_id is None:
+            return ''
+        self.connection = self.open_db()
+        cpe = self.get_details_for_cpe(existing_cpe_id)
+        if cpe is None:
+            self.connection.close()
+            return ''
+
+        cpe_titles = self.get_titles_for_cpe_uuid(cpe['id'])
+        cpe_references = self.get_references_for_cpe_uuid(cpe['id'])
+        self.connection.close()
+
+        ET.register_namespace('', 'http://cpe.mitre.org/dictionary/2.0')
+        cpe_list = Element('cpe-list')
+        cpe_list.set('xmlns:cpe-23', "http://scap.nist.gov/schema/cpe-extension/2.3")
+        cpe_list.set('xmlns:ns6', "http://scap.nist.gov/schema/scap-core/0.1")
+        cpe_list.set('xmlns:scap-core', "http://scap.nist.gov/schema/scap-core/0.3")
+        cpe_list.set('xmlns:config', "http://scap.nist.gov/schema/configuration/0.1")
+        cpe_list.set('xmlns:xsi', "http://www.w3.org/2001/XMLSchema-instance")
+        cpe_list.set('xmlns:meta', "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2")
+        cpe_list.set('xsi:schemaLocation', " ".join(["http://scap.nist.gov/schema/cpe-extension/2.3",
+                                                     "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd",
+                                                     "http://cpe.mitre.org/dictionary/2.0",
+                                                     "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd",
+                                                     "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
+                                                     "https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd",
+                                                     "http://scap.nist.gov/schema/scap-core/0.3",
+                                                     "https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd",
+                                                     "http://scap.nist.gov/schema/configuration/0.1",
+                                                     "https://scap.nist.gov/schema/nvd/configuration_0.1.xsd",
+                                                     "http://scap.nist.gov/schema/scap-core/0.1",
+                                                     "https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"]))
+        item = SubElement(cpe_list, 'cpe-item')
+        cpe_short_name = CPE_ID.short_name(new_cpe_id)
+        cpe_old_ver = CPE_ID.version(cpe['name'])
+        cpe_new_ver = CPE_ID.version(new_cpe_id)
+
+        item.set('name', 'cpe:/' + cpe_short_name)
+        for title in cpe_titles:
+            title_xml = SubElement(item, 'title')
+            title_xml.set('xml:lang', title['lang'])
+            title_xml.text = title['title'].replace(cpe_old_ver, cpe_new_ver)
+        if cpe_references:
+            references = SubElement(item, 'references')
+            for reference in cpe_references:
+                ref_xml = SubElement(references, 'reference')
+                ref_xml.set('href', reference['ref'].replace(cpe_old_ver, cpe_new_ver))
+                ref_xml.text = reference['type'].upper()
+        cpe23item = SubElement(item, 'cpe-23:cpe23-item')
+        cpe23item.set('name', new_cpe_id)
+
+        # Generate the XML as a string
+        xmlstr = ET.tostring(cpe_list)
+
+        # And use minidom to pretty print the XML
+        return minidom.parseString(xmlstr).toprettyxml(encoding="utf-8").decode("utf-8")
diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
deleted file mode 100644
index 5760f253c3..0000000000
--- a/support/scripts/cpedb.py
+++ /dev/null
@@ -1,186 +0,0 @@
-#!/usr/bin/env python3
-
-import xml.etree.ElementTree as ET
-from xml.etree.ElementTree import Element, SubElement
-import gzip
-import os
-import requests
-import time
-from xml.dom import minidom
-
-VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
-
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
-
-ns = {
-    '': 'http://cpe.mitre.org/dictionary/2.0',
-    'cpe-23': 'http://scap.nist.gov/schema/cpe-extension/2.3',
-    'xml': 'http://www.w3.org/XML/1998/namespace'
-}
-
-
-class CPE_ID:
-    # Check if two CPE IDs match each other
-    @staticmethod
-    def matches(cpe1, cpe2):
-        cpe1_elems = cpe1.split(":")
-        cpe2_elems = cpe2.split(":")
-
-        remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
-                         zip(cpe1_elems, cpe2_elems))
-        return len(list(remains)) == 0
-
-    @staticmethod
-    def version(cpe):
-        return cpe.split(":")[5]
-
-    @staticmethod
-    def product(cpe):
-        return cpe.split(":")[4]
-
-    @staticmethod
-    def short_name(cpe):
-        return ":".join(cpe.split(":")[2:6])
-
-    @staticmethod
-    def version_update(cpe):
-        return ":".join(cpe.split(":")[5:6])
-
-    @staticmethod
-    def no_version(cpe):
-        return ":".join(cpe.split(":")[:5])
-
-
-class CPE:
-    def __init__(self, cpe_str, titles, refs):
-        self.cpe_str = cpe_str
-        self.titles = titles
-        self.references = refs
-        self.cpe_cur_ver = "".join(self.cpe_str.split(":")[5:6])
-
-    def update_xml_dict(self):
-        ET.register_namespace('', 'http://cpe.mitre.org/dictionary/2.0')
-        cpes = Element('cpe-list')
-        cpes.set('xmlns:cpe-23', "http://scap.nist.gov/schema/cpe-extension/2.3")
-        cpes.set('xmlns:ns6', "http://scap.nist.gov/schema/scap-core/0.1")
-        cpes.set('xmlns:scap-core', "http://scap.nist.gov/schema/scap-core/0.3")
-        cpes.set('xmlns:config', "http://scap.nist.gov/schema/configuration/0.1")
-        cpes.set('xmlns:xsi', "http://www.w3.org/2001/XMLSchema-instance")
-        cpes.set('xmlns:meta', "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2")
-        cpes.set('xsi:schemaLocation', " ".join(["http://scap.nist.gov/schema/cpe-extension/2.3",
-                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd",
-                                                 "http://cpe.mitre.org/dictionary/2.0",
-                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd",
-                                                 "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
-                                                 "https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd",
-                                                 "http://scap.nist.gov/schema/scap-core/0.3",
-                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd",
-                                                 "http://scap.nist.gov/schema/configuration/0.1",
-                                                 "https://scap.nist.gov/schema/nvd/configuration_0.1.xsd",
-                                                 "http://scap.nist.gov/schema/scap-core/0.1",
-                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"]))
-        item = SubElement(cpes, 'cpe-item')
-        cpe_short_name = CPE_ID.short_name(self.cpe_str)
-        cpe_new_ver = CPE_ID.version_update(self.cpe_str)
-
-        item.set('name', 'cpe:/' + cpe_short_name)
-        self.titles[0].text.replace(self.cpe_cur_ver, cpe_new_ver)
-        for title in self.titles:
-            item.append(title)
-        if self.references:
-            item.append(self.references)
-        cpe23item = SubElement(item, 'cpe-23:cpe23-item')
-        cpe23item.set('name', self.cpe_str)
-
-        # Generate the XML as a string
-        xmlstr = ET.tostring(cpes)
-
-        # And use minidom to pretty print the XML
-        return minidom.parseString(xmlstr).toprettyxml(encoding="utf-8").decode("utf-8")
-
-
-class CPEDB:
-    def __init__(self, nvd_path):
-        self.all_cpes = dict()
-        self.all_cpes_no_version = dict()
-        self.nvd_path = nvd_path
-
-    def get_xml_dict(self):
-        print("CPE: Setting up NIST dictionary")
-        if not os.path.exists(os.path.join(self.nvd_path, "cpe")):
-            os.makedirs(os.path.join(self.nvd_path, "cpe"))
-
-        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(CPEDB_URL))
-        if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-            print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-            cpe_dict = requests.get(CPEDB_URL)
-            open(cpe_dict_local, "wb").write(cpe_dict.content)
-
-        print("CPE: Unzipping xml manifest...")
-        nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
-        print("CPE: Converting xml manifest to dict...")
-        tree = ET.parse(nist_cpe_file)
-        all_cpedb = tree.getroot()
-        self.parse_dict(all_cpedb)
-
-    def parse_dict(self, all_cpedb):
-        # Cycle through the dict and build two dict to be used for custom
-        # lookups of partial and complete CPE objects
-        # The objects are then used to create new proposed XML updates if
-        # if is determined one is required
-        # Out of the different language titles, select English
-        for cpe in all_cpedb.findall(".//{http://cpe.mitre.org/dictionary/2.0}cpe-item"):
-            cpe_titles = []
-            for title in cpe.findall('.//{http://cpe.mitre.org/dictionary/2.0}title[@xml:lang="en-US"]', ns):
-                title.tail = None
-                cpe_titles.append(title)
-
-            # Some older CPE don't include references, if they do, make
-            # sure we handle the case of one ref needing to be packed
-            # in a list
-            cpe_ref = cpe.find(".//{http://cpe.mitre.org/dictionary/2.0}references")
-            if cpe_ref:
-                for ref in cpe_ref.findall(".//{http://cpe.mitre.org/dictionary/2.0}reference"):
-                    ref.tail = None
-                    ref.text = ref.text.upper()
-                    if ref.text not in VALID_REFS:
-                        ref.text = ref.text + "-- UPDATE this entry, here are some examples and just one word should be used -- " + ' '.join(VALID_REFS) # noqa E501
-                cpe_ref.tail = None
-                cpe_ref.text = None
-
-            cpe_str = cpe.find(".//{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item").get('name')
-            item = CPE(cpe_str, cpe_titles, cpe_ref)
-            cpe_str_no_version = CPE_ID.no_version(cpe_str)
-            # This dict must have a unique key for every CPE version
-            # which allows matching to the specific obj data of that
-            # NIST dict entry
-            self.all_cpes.update({cpe_str: item})
-            # This dict has one entry for every CPE (w/o version) to allow
-            # partial match (no valid version) check (the obj is saved and
-            # used as seed for suggested xml updates. By updating the same
-            # non-version'd entry, it assumes the last update here is the
-            # latest version in the NIST dict)
-            self.all_cpes_no_version.update({cpe_str_no_version: item})
-
-    def find_partial(self, cpe_str):
-        cpe_str_no_version = CPE_ID.no_version(cpe_str)
-        if cpe_str_no_version in self.all_cpes_no_version:
-            return cpe_str_no_version
-
-    def find_partial_obj(self, cpe_str):
-        cpe_str_no_version = CPE_ID.no_version(cpe_str)
-        if cpe_str_no_version in self.all_cpes_no_version:
-            return self.all_cpes_no_version[cpe_str_no_version]
-
-    def find_partial_latest_version(self, cpe_str_partial):
-        cpe_obj = self.find_partial_obj(cpe_str_partial)
-        return cpe_obj.cpe_cur_ver
-
-    def find(self, cpe_str):
-        if self.find_partial(cpe_str):
-            if cpe_str in self.all_cpes:
-                return cpe_str
-
-    def gen_update_xml(self, cpe_str):
-        cpe = self.find_partial_obj(cpe_str)
-        return cpe.update_xml_dict()
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 04b688c4a8..7af5786c15 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -20,7 +20,7 @@
 import distutils.version
 import operator
 from nvd_api_v2 import NVD_API
-from cpedb import CPE_ID
+from cpe import CPE_ID
 
 
 class CVE:
diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
index 84271bc23e..8f6d5c2bb0 100755
--- a/support/scripts/gen-missing-cpe
+++ b/support/scripts/gen-missing-cpe
@@ -5,23 +5,23 @@ import sys
 import json
 import subprocess
 import os
-from cpedb import CPEDB, CPE_ID
+from cpe import CPE_API, CPE_ID
 
 
-def gen_update_xml_reports(cpeids, cpedb, output):
+def gen_update_xml_reports(cpeids, cpe_api, output):
     cpe_need_update = []
 
     for cpe in cpeids:
-        result = cpedb.find(cpe)
-        if not result:
-            result = cpedb.find_partial(CPE_ID.no_version(cpe))
-            if result:
-                cpe_need_update.append(cpe)
-            else:
-                print("WARNING: no match found for '%s'" % cpe)
+        if cpe_api.is_official(cpe):
+            continue
+        result = cpe_api.find_partial(cpe)
+        if result:
+            cpe_need_update.append(cpe)
+        else:
+            print("WARNING: no match found for '%s'" % cpe)
 
     for cpe in cpe_need_update:
-        xml = cpedb.gen_update_xml(cpe)
+        xml = cpe_api.gen_update_xml(cpe)
         fname = CPE_ID.product(cpe) + '-' + CPE_ID.version(cpe) + '.xml'
         print("Generating %s" % fname)
         with open(os.path.join(output, fname), 'w+') as fp:
@@ -55,10 +55,11 @@ def __main__():
     if not os.path.isdir(args.output):
         print("ERROR: output directory %s does not exist" % args.output)
         sys.exit(1)
-    cpedb = CPEDB(args.nvd_path)
-    cpedb.get_xml_dict()
+    cpe_api = CPE_API(args.nvd_path)
+    cpe_api.load_ids()
+    cpe_api.generate_partials()
     cpeids = get_cpe_ids()
-    gen_update_xml_reports(cpeids, cpedb, args.output)
+    gen_update_xml_reports(cpeids, cpe_api, args.output)
 
 
 if __name__ == "__main__":
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 94ca5601fb..2b23681946 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -28,17 +28,13 @@ import re
 import subprocess
 import json
 import sys
-import time
-import gzip
-import xml.etree.ElementTree
-import requests
+from cpe import CPE_API, CPE_ID
 from cve import CVE_API
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-from cpedb import CPEDB_URL, CPE_ID  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
@@ -653,37 +649,8 @@ def check_package_cves(nvd_path, packages):
 
 
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

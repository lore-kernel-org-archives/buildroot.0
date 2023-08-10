Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3D3C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF84440B4D;
	Thu, 10 Aug 2023 05:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF84440B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMD7CWtDt3GC; Thu, 10 Aug 2023 05:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4C534154F;
	Thu, 10 Aug 2023 05:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C534154F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40741BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BADB41588
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BADB41588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IINTlMSBuDyG for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:49:55 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67704154F
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67704154F
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N33ET-1pnNuS1UQn-013M93; Thu, 10 Aug 2023 07:49:49 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:47 +0200
Message-ID: <20230810054856.100816-3-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810054856.100816-1-dalang@gmx.at>
References: <20230810054856.100816-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gx+6YC03PRfPqPKQ26QlaNcS6cXCR/w+CVAVC1jCWq9UcO+0BxP
 Ofwx7Mj2rvMTQQpxF/IWwHZmVcAlSrg2K2pq8B5HGIUk0ALxwlPZdj4vrg/ee3VvevTWizi
 PWUnxoHjFEFAIRZm4PLLXbZiwlLmkEB3U4c8mwhJxIMyemv4FUJXnREwlUqP4Wepmwr8k9+
 ZcnG6WDGwNfUAs/Dz9y2A==
UI-OutboundReport: notjunk:1;M01:P0:ZkRxgi+2oDU=;6F0zVCpvpDq2jEB8d9/aVgzgyn5
 Jo9Usp6rF7c6oTu1ptjyt4ryEVe0UxwUL9wO39ZHrnOdJFKgL0NSCQJWHS4nqvayzxQldKRkW
 9+b/VVr8ekDoiRNPN0q9LriMMqNLaEm9Ojk4kirjOz++HxO6vkprXvgQu/PDEfoKTX3Ixgb1U
 Iziy+LrCIwJFf8nBITLPlcqUq7cQgBt6/Uw5W9Nv5Uc2mFInNh9PLT4E1hbfZXWotAcytl/w3
 riLjvhz1t5ZLWWkAuINldGCh1OS+AJiaSZpoxE6AKm0hIdNGtBoc7KfL8cl4QGvFoYyYZ+U2x
 LqUR9SS64ZZTt/FFAEFGFK0OLRUa+oAGZ1k8fURDMp0VhYEIAZH16eZmxLcPROswxwhSHxHiC
 Mka5rkkjFhqAkCYIglJIJhYWash4S/X83kvaLfCXhqgUH3GkfRmrWwYjlQyUZfGahhWarNPR3
 9qKLUf5guJHoKKdNoReBeJMi/dL/88A3T34IyKRdPcG5EI2Hp2ttunWiReEpF7Gz4slgMfDWm
 OCJsnBwUo+gGTx6pSH7wKR+WubbMhGZEv6X+U20Z4BFFiuNKH6NqDO0oiMu9J2cHFIlMWKPGh
 LNbdYO09LmgS20Aio9cTGNqH5+ltaxVoz/XObFabgUocAcXP0Ub9zJNSkZIM5oqpjRiSJ0w8o
 oCqySF9EnnlxJAWI6Cme6yJOLViLXvEIVz7mPTackmHcTJrMWm7j+CJp/1KF9fBCEjk2IAhmt
 C1zJY7KY8GkwzyvgJm/UuMv/nNHJ1ItI09r3uc5yq/d2s5iWJYfeEfnJNmXRHV9K6ts+7wPZY
 vsyNUCRyW3JpUtbRc45ajNvWqLnZt+QKXLX61eL1Ty3+NgCGoOqipHKZyQFFEIP2ulZnBIGbJ
 xnQMeY0GyCMCoqscoFoCVgPKiRBPHf6I+4I09A53KFvW6DXJZOrG9ZmSURbI+uskgotrEpYSt
 8iQRj7chgO604PoNEwNJtE7d/mg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646589; x=1692251389; i=dalang@gmx.at;
 bh=NopHcbnlWZ0selBp9y4wTcD6/V3NdjGFFHA6dIDmuos=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=l4lTLNwO3ccb7Tbe8naofqDxwpqZgoEWfgKSZ3sNnabn7/1tEsU6LNxkWBS3DvUmaLJ8Bqt
 VBWhk7W6BvDKhVQodWQGcoiFQYgevuLBquWjRFm5qWF3ypHCCM7UK9vGN48a6TS/co4lp2exH
 Put01xc5y3sm3OobpirkCg0kkwGC5hgyV6oEFlw1aYKmClsA4Po1SEf5Du8KWG4+uZOKad4OB
 lS6uJbLwS8UCHClL06PtxtqhWVKc1g3zHAtFyjSKCuwflrSN/6WCLCbTPemU/YoHRm8Luyv+b
 gCXqOMGwqn8GPotmEVcUQmBR3R+hBosGj3tTSHHDbWmZucGF/N5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=l4lTLNwO
Subject: [Buildroot] [PATCH v2 3/7] support/scripts/{cpedb,
 cve}.py: rework CPE ID handling
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

Both files define helpers to extract various elements from a given CPE
ID. Combine these helpers into a new class with only static methods.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/cpedb.py        | 62 ++++++++++++++++++++-------------
 support/scripts/cve.py          | 29 ++++-----------
 support/scripts/gen-missing-cpe |  6 ++--
 support/scripts/pkg-stats       |  4 +--
 4 files changed, 48 insertions(+), 53 deletions(-)

diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
index f4daf56124..5760f253c3 100644
--- a/support/scripts/cpedb.py
+++ b/support/scripts/cpedb.py
@@ -19,6 +19,38 @@ ns = {
 }
 
 
+class CPE_ID:
+    # Check if two CPE IDs match each other
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
+    def version(cpe):
+        return cpe.split(":")[5]
+
+    @staticmethod
+    def product(cpe):
+        return cpe.split(":")[4]
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
 class CPE:
     def __init__(self, cpe_str, titles, refs):
         self.cpe_str = cpe_str
@@ -48,8 +80,8 @@ class CPE:
                                                  "http://scap.nist.gov/schema/scap-core/0.1",
                                                  "https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"]))
         item = SubElement(cpes, 'cpe-item')
-        cpe_short_name = CPE.short_name(self.cpe_str)
-        cpe_new_ver = CPE.version_update(self.cpe_str)
+        cpe_short_name = CPE_ID.short_name(self.cpe_str)
+        cpe_new_ver = CPE_ID.version_update(self.cpe_str)
 
         item.set('name', 'cpe:/' + cpe_short_name)
         self.titles[0].text.replace(self.cpe_cur_ver, cpe_new_ver)
@@ -66,26 +98,6 @@ class CPE:
         # And use minidom to pretty print the XML
         return minidom.parseString(xmlstr).toprettyxml(encoding="utf-8").decode("utf-8")
 
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
 
 class CPEDB:
     def __init__(self, nvd_path):
@@ -138,7 +150,7 @@ class CPEDB:
 
             cpe_str = cpe.find(".//{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item").get('name')
             item = CPE(cpe_str, cpe_titles, cpe_ref)
-            cpe_str_no_version = CPE.no_version(cpe_str)
+            cpe_str_no_version = CPE_ID.no_version(cpe_str)
             # This dict must have a unique key for every CPE version
             # which allows matching to the specific obj data of that
             # NIST dict entry
@@ -151,12 +163,12 @@ class CPEDB:
             self.all_cpes_no_version.update({cpe_str_no_version: item})
 
     def find_partial(self, cpe_str):
-        cpe_str_no_version = CPE.no_version(cpe_str)
+        cpe_str_no_version = CPE_ID.no_version(cpe_str)
         if cpe_str_no_version in self.all_cpes_no_version:
             return cpe_str_no_version
 
     def find_partial_obj(self, cpe_str):
-        cpe_str_no_version = CPE.no_version(cpe_str)
+        cpe_str_no_version = CPE_ID.no_version(cpe_str)
         if cpe_str_no_version in self.all_cpes_no_version:
             return self.all_cpes_no_version[cpe_str_no_version]
 
diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7cd6fce4d8..09b6c039f0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -25,6 +25,7 @@ import time
 import gzip
 import sys
 import operator
+from cpedb import CPE_ID
 
 try:
     import ijson
@@ -53,24 +54,6 @@ ops = {
 }
 
 
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
-
-
 class CVE:
     """An accessor class for CVE Items in NVD files"""
     CVE_AFFECTS = 1
@@ -158,8 +141,8 @@ class CVE:
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['cpe23Uri'])
-            version = cpe_version(cpe['cpe23Uri'])
+            product = CPE_ID.product(cpe['cpe23Uri'])
+            version = CPE_ID.version(cpe['cpe23Uri'])
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -211,7 +194,7 @@ class CVE:
     @property
     def affected_products(self):
         """The set of CPE products referred by this CVE definition"""
-        return set(cpe_product(p['id']) for p in self.each_cpe())
+        return set(CPE_ID.product(p['id']) for p in self.each_cpe())
 
     def affects(self, name, version, cve_ignore_list, cpeid=None):
         """
@@ -233,10 +216,10 @@ class CVE:
         # version, as they might be different due to
         # <pkg>_CPE_ID_VERSION
         else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
+            pkg_version = distutils.version.LooseVersion(CPE_ID.version(cpeid))
 
         for cpe in self.each_cpe():
-            if not cpe_matches(cpe['id'], cpeid):
+            if not CPE_ID.matches(cpe['id'], cpeid):
                 continue
             if not cpe['v_start'] and not cpe['v_end']:
                 return self.CVE_AFFECTS
diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
index 0b222f2659..84271bc23e 100755
--- a/support/scripts/gen-missing-cpe
+++ b/support/scripts/gen-missing-cpe
@@ -5,7 +5,7 @@ import sys
 import json
 import subprocess
 import os
-from cpedb import CPEDB, CPE
+from cpedb import CPEDB, CPE_ID
 
 
 def gen_update_xml_reports(cpeids, cpedb, output):
@@ -14,7 +14,7 @@ def gen_update_xml_reports(cpeids, cpedb, output):
     for cpe in cpeids:
         result = cpedb.find(cpe)
         if not result:
-            result = cpedb.find_partial(CPE.no_version(cpe))
+            result = cpedb.find_partial(CPE_ID.no_version(cpe))
             if result:
                 cpe_need_update.append(cpe)
             else:
@@ -22,7 +22,7 @@ def gen_update_xml_reports(cpeids, cpedb, output):
 
     for cpe in cpe_need_update:
         xml = cpedb.gen_update_xml(cpe)
-        fname = CPE.product(cpe) + '-' + CPE.version(cpe) + '.xml'
+        fname = CPE_ID.product(cpe) + '-' + CPE_ID.version(cpe) + '.xml'
         print("Generating %s" % fname)
         with open(os.path.join(output, fname), 'w+') as fp:
             fp.write(xml)
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1ac538f5f9..53d138250c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -37,7 +37,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-from cpedb import CPEDB_URL  # noqa: E402
+from cpedb import CPEDB_URL, CPE_ID  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
@@ -632,7 +632,7 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            cpe_product = cvecheck.cpe_product(pkg.cpeid)
+            cpe_product = CPE_ID.product(pkg.cpeid)
             cpe_product_pkgs[cpe_product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

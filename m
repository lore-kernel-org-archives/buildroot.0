Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB3AC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC25461B96;
	Wed,  6 Aug 2025 16:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTI-DZDfEVbd; Wed,  6 Aug 2025 16:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1B261461
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1B261461;
	Wed,  6 Aug 2025 16:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC756D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDB961461
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoIdieprSQNU for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65E1461196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E1461196
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65E1461196
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.163.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7Ka-1uu5sO3Nak-00GAIN; Wed, 06
 Aug 2025 18:16:10 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed,  6 Aug 2025 18:15:53 +0200
Message-ID: <20250806161555.3805467-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806161555.3805467-1-fiona.klute@gmx.de>
References: <20250806161555.3805467-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XHQxy7OFILTRR0C1Kmlxw4XLdko2RbSJFaah7QW1S8yUyv+vAOy
 2Lr55L7Kg4VgASg8khKi2otp33YqrW/TroRF4yOD5UmYhYmULbi1O+f/rNPwLElUBXe34iy
 Orx8/01d2noZZ67RQBxJyliARDtgda7+7JlL4MhOOIYcMZaeCx6wmfTkgg3y0s6FpiM1Gp+
 nMWrSksuNXivRa4+HULvg==
UI-OutboundReport: notjunk:1;M01:P0:/rDE+0nfpz4=;Gziodw7h8xWbi0CJO5aa+WQMPW4
 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
 SPHGWPYxp1bzRU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754496971; x=1755101771; i=fiona.klute@gmx.de;
 bh=RLJDtW9w++0ueipOocZ1H7tEIpFiak3hitViwpD7CpU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VY1KO2jlvfkn4tnOjnUu/yFHFV4Rpslw4uNwHWlZdIyI18fwFJmbuj49p0Y0mK/T
 e3hFEGJpGOVD6FAefchbX82FYHE3mXEQdcm1afteP+oQRCSvrQh+o9KAp96dKIi06
 TWv01vki74Wzia4yc8fEDnO+OywadY3U/5WO9YlYY8PAvNH1MnDW/1bZpsBlxnZyE
 u4Z32atEO4fFPR6TjL8GGPZhxsDE9iWKU3+t0OuTDrysagF6leksmX85/Bf++uzjy
 P/BligOj3CYCHWrn1qlICSbfmQD8rD8AymhvmcmtNtbe7LAkCCwDVK7vJ9xHB+Go7
 Wkqu9CQpeim6P475cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VY1KO2jl
Subject: [Buildroot] [PATCH v3 1/3] utils/generate-cyclonedx: support
 including external tree information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

External tree information may be important for interpreting SBOM
information, especially if the SBOM lists packages (components) that
do not exist in the listed version of Buildroot itself.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v2 -> v3:
* Fix merge conflict after reordering of metadata structure in commits
  6098cc45d64e9e7928f888b7cdf79533813d19c4 and
  9cbbc477626c433fe78614de9474f8446b7e2389

Changes v1 -> v2:
* drop unnecessary default=None for "--external-trees" option
* fix help string for "--external-trees" option ("%" needs to be "%%"
  so it's not treated as a formatting specifier)

 utils/generate-cyclonedx | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 34e5672a43..d1a0fe1e31 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -10,6 +10,7 @@
 
 import argparse
 import bz2
+from dataclasses import dataclass
 import gzip
 import json
 import os
@@ -50,6 +51,49 @@ except json.JSONDecodeError:
     print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
 
 
+@dataclass
+class ExternalTree:
+    name: str
+    path: Path
+    version: str
+    description: str
+
+    @classmethod
+    def parse_vars(cls, variables: dict[str, dict[str, str]]) -> list['ExternalTree']:
+        """Load external trees from JSON data as generated by `make
+        show-vars VARS="BR2_EXTERNAL%"`.
+
+        Args:
+            variables: dict created by loading the JSON data
+
+        Returns:
+            list of parsed ExternalTree objects
+        """
+        return [
+            cls(
+                ext,
+                Path(variables[f"BR2_EXTERNAL_{ext}_PATH"]["expanded"]),
+                variables[f"BR2_EXTERNAL_{ext}_VERSION"]["expanded"],
+                variables[f"BR2_EXTERNAL_{ext}_DESC"]["expanded"],
+            )
+            for ext in variables["BR2_EXTERNAL_NAMES"]["expanded"].split()
+        ]
+
+    @property
+    def bom_ref(self) -> str:
+        return f"buildroot-external:{self.name}"
+
+    def as_component(self) -> dict[str, str]:
+        """Format self as a component dict ready to be included in
+        CycloneDX JSON output."""
+        return {
+            "bom-ref": self.bom_ref,
+            "name": self.name,
+            "type": "firmware",
+            "version": self.version,
+        }
+
+
 def split_top_level_comma(subj):
     """Split a string at comma's, but do not split at comma's in between parentheses.
 
@@ -277,6 +321,9 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+    parser.add_argument("-e", "--external-trees", nargs="?", type=argparse.FileType("r"),
+                        help="Load external trees to list in SBOM from this JSON file, "
+                        "can be created by running: make show-vars VARS=\"BR2_EXTERNAL%%\"")
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
@@ -297,6 +344,11 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    if args.external_trees is not None:
+        external_trees = ExternalTree.parse_vars(json.load(args.external_trees))
+    else:
+        external_trees = []
+
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
@@ -307,6 +359,10 @@ def main():
                 "name": args.project_name,
                 "version": args.project_version,
                 "type": "firmware",
+                **(
+                    {"components": [ext.as_component() for ext in external_trees]}
+                    if external_trees else {}
+                )
             },
             "tools": {
                 "components": [
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

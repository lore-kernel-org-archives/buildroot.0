Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62E6C3ABAA
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4056660899;
	Mon,  5 May 2025 16:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyDKR1Mjmc1i; Mon,  5 May 2025 16:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547C860641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547C860641;
	Mon,  5 May 2025 16:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 694B312E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E2F400D1
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vj_-Q2hi38qQ for <buildroot@buildroot.org>;
 Mon,  5 May 2025 16:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B77A840148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B77A840148
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B77A840148
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1uBi7o3ZuB-001FWK; Mon, 05
 May 2025 18:04:35 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  5 May 2025 18:03:25 +0200
Message-ID: <20250505160327.3422096-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505160327.3422096-1-fiona.klute@gmx.de>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BdsrZKIVpVsCva1Jw2d5Jfqb0Pu5Jpw4cAdOXz4/qRb+9rcQqaT
 EAQJ4FAYRm9D1W74qU6W4xrcGaaKqdby/eDWIQxN4QR7NyfDaLzTyX6DVWoUhzGV0iPQd8C
 PFtc1A4ZdiKoTpKX3ds5iVT09X1+yc9yqawBV28YICCxCmI8/Ou8f8LeGXtxZXBMDkSxLBW
 dhco4j0u/FFAi/VAprU0g==
UI-OutboundReport: notjunk:1;M01:P0:ojGw/lhwXqo=;uovQ5IIt7JZ4xdCog/NDCwDAokX
 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
 fAVI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746461076; x=1747065876; i=fiona.klute@gmx.de;
 bh=z/TbN3iYWsSVwyBADin88UpTAoa8wOim94w/ZRipoq0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IUBjv41hALzg7KfrfwBgS+c/3NfUmI9y5fZzJZxtmuSEqhPfN2IcyT39AE9lUtT0
 oJDhZsePekvDWsYE/CPYRvKW7VYlTxeZ6+V4nzjGgOPJmry8QoZGO5dULwQK/WxEJ
 ZD4dDpthzSQ/ewC4Fno/T7r+bA5HdnJvqMJXCigXH1Qzoi577ccGeIH/4vPSLcya+
 3eA1J4OLrOFXCSeq0AdD1FJj/iS1dgplndgG/GeUEz07CaeF2EzhwxCSHf93WC+rs
 IRGdoTeA4oc7zxWolR9FtAhZdT75tJW33D0gcgMg1YuJXT/vin4M8A/GUFEyf8Jtj
 1hjOr0P2b+zvrdwZzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IUBjv41h
Subject: [Buildroot] [PATCH 1/3] utils/generate-cyclonedx: support including
 external tree information
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
---
 utils/generate-cyclonedx | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 46f68ac63d..cbb7ef630e 100755
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
 
@@ -277,6 +321,10 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+    parser.add_argument("-e", "--external-trees", nargs="?", type=argparse.FileType("r"),
+                        default=None,
+                        help="Load external trees to list in SBOM from this JSON file, "
+                        "can be created by running: make show-vars VARS=\"BR2_EXTERNAL%\"")
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
 
@@ -293,6 +341,11 @@ def main():
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
@@ -312,6 +365,10 @@ def main():
                 "name": "buildroot",
                 "type": "firmware",
                 "version": f"{BR2_VERSION_FULL}",
+                **(
+                    {"components": [ext.as_component() for ext in external_trees]}
+                    if external_trees else {}
+                )
             },
         },
     }
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

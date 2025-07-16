Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F843C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 123F94150F;
	Wed, 16 Jul 2025 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTsTIX-ER56P; Wed, 16 Jul 2025 14:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0D04148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0D04148A;
	Wed, 16 Jul 2025 14:53:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45A021514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F60403CC
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xo7YQ9qG0Q-c for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA7E440128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7E440128
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA7E440128
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1uuOjp3DqP-00vCM0; Wed, 16
 Jul 2025 16:53:08 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:52:48 +0200
Message-ID: <20250716145251.1359958-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716145251.1359958-1-fiona.klute@gmx.de>
References: <20250716145251.1359958-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7sF2hODmqbAPpQnQm3sLaP3ilNBU/vEd3sA8rMpyDMtfa2UXBNJ
 XFjCmsF55605bD+VSg/vSeeapb0uHv2Bm406y7Uz6B/poJ6p/dqIFfz+wdgXUVz3O3lhko4
 p3trIV9WQ4Ex4muCx+nf7T4mne1r/8QqEON6G56D0s0l9zriX/InkMjoGDmjKn7ig21slER
 Lk4x5rS3Nos/FbFRKG/jA==
UI-OutboundReport: notjunk:1;M01:P0:31WJEKhtGJc=;/bR93c7EiCoB9wV6wpFlfjEaDfh
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752677589; x=1753282389; i=fiona.klute@gmx.de;
 bh=2TOG/ilOvn2grk1W2EozBtYV5MeeD3gbr6Phqyvj8l4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kekucuvijuFxDnaDiVOePn0dZfy70wATQxl6SGgi4r25DXKLdnnpmrzHlg8s5TK9
 CasyUWQlWxvWnel0sDnXv26szhKSz6ndezV7lQzQrFLPRQU1NNR+B1Wd1DxVs/xOj
 CFoQn1cXv42gv8R5NsPD4PN/CEZ2Z6P6Fh3PAaZSUNzAgJQWFaOdkVqMllntbahXP
 GVF95DN0qrBo00Uce/R3niVN3qdsqBstlUzBjVWbanQXM5Rw7KYtOEhCVQwoX32/e
 DSvvbKDqSABuS74t98Lu9LsVLjvMBd9UWM40UEV72wb/6VDqYKOQkU6rojU2rW7kg
 0jlyvAJXOadvoXcEfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kekucuvi
Subject: [Buildroot] [PATCH v2 1/3] utils/generate-cyclonedx: support
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
Changes v1 -> v2:
* drop unnecessary default=None for "--external-trees" option
* fix help string for "--external-trees" option ("%" needs to be "%%"
  so it's not treated as a formatting specifier)

 utils/generate-cyclonedx | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 46f68ac63d..dd11f4f83c 100755
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
 
@@ -293,6 +340,11 @@ def main():
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
@@ -312,6 +364,10 @@ def main():
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
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

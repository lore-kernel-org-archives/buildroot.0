Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983EACA0FFD
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 13:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65091812B6;
	Sat, 30 Aug 2025 13:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHqmVECDkY8Z; Sat, 30 Aug 2025 13:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2F1812B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2F1812B9;
	Sat, 30 Aug 2025 13:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3645DFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D42F4019A
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vav25RMQTjLw for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 13:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D73F40198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D73F40198
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D73F40198
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.106.177]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1ukLGV2mUp-004hw9; Sat, 30
 Aug 2025 15:11:00 +0200
To: buildroot@buildroot.org
Date: Sat, 30 Aug 2025 15:10:36 +0200
Message-ID: <20250830131036.1295970-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830131036.1295970-1-fiona.klute@gmx.de>
References: <20250830131036.1295970-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:36GksSvpCEJ3avr+yht2A/iFa00jGeSdiFlksSrTJeij5o7p+VN
 OggGFlG74UjgQ+69YCjQShx2tFlnQAEh2pIpCczG+uYrAtZ7cQSGfT5fYvXxB5sgVO/W4MH
 H6ZDOwKD8HlCyOXPsRJ/I7y3kbuq6B0DxvxR5FF9EKMIs1SmbEYUMXWNrDJdPouw8Qz/vjB
 c6mPEPoYHWYLdoyP+slmg==
UI-OutboundReport: notjunk:1;M01:P0:yt3cASjqKpw=;pD8HJuULZjBbUuC3yS0jExbP/Gk
 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
 uVLF7XzyA8aONsdpZggXXuXU0s3X06cA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756559460; x=1757164260; i=fiona.klute@gmx.de;
 bh=RRr3DVJhH3vU4Faq7LY7XGoqZgxIkvUAwCLL0bqDRmI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oA6RSSEj1WLqZdqEGtG7DKayo9CgGykRMGzaJFda6s7s05RLvZhDXXfG3F8SeJt4
 D9EZACvJXrPD8ZlJUSQLBmW7z1pNliYipCgFqgnueyIQiOvlDBXkono/1AfrKQiTo
 xVF0KBApqt2h6fzdWM24EagCXTbRv/FEOdWmIc7UjSuf48FQSsmo8vXaNMaGuoZT+
 sLZVzGS0mh+sZpemD5BCMfBg9gduERsdlZpDVYVLczUggrKzERqUn2/IRReLtAvbp
 mYmXwlj/GlDNaQvw9tT0CNuqYqBcfzx5RitE6qlwEz87F0MX9UCRANIuJmF/Nz0AV
 IAglSZpaa0m2/i9B0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=oA6RSSEj
Subject: [Buildroot] [PATCH v4 2/2] utils/generate-cyclonedx: include
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
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

External tree information may be important for interpreting SBOM
information, especially if the SBOM lists packages (components) that
do not exist in the listed version of Buildroot itself. External trees
mentioned in the show-info data of any package are listed in the
metadata.component.components list of the SBOM.

For packages from external trees, the bom-ref of the external tree is
listed in the BR_EXTERNAL_TREE property.

Note that this implies external trees that do not provide packages
used in the build (e.g. only defconfigs or overlays) will not be
listed.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* Use "external" and "package_dir" from per-package information to
  derive external tree information. This removes the need for a
  separate input file with external tree info (restructuring of former
  patches 1 and 3).

 utils/generate-cyclonedx | 90 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 60983ac1ea..dc1c90bf18 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -10,6 +10,7 @@
 
 import argparse
 import bz2
+from dataclasses import dataclass
 import gzip
 import json
 import os
@@ -17,6 +18,7 @@ from pathlib import Path
 import urllib.request
 import subprocess
 import sys
+from typing import Any, ClassVar
 
 CYCLONEDX_VERSION = "1.6"
 SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
@@ -50,6 +52,74 @@ except json.JSONDecodeError:
     print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
 
 
+@dataclass
+class ExternalTree:
+    name: str
+    path: Path
+    version: str
+    bom_ref_prefix: ClassVar[str] = "buildroot-external"
+
+    def __post_init__(self) -> None:
+        """self.path may have been initialized with any subdirectory
+        of the external tree. Search for the external.desc file to
+        find the root of the external tree.
+
+        """
+        for p in (self.path, *self.path.parents):
+            if (p / "external.desc").is_file():
+                self.path = p
+                break
+        if not (self.path / "external.desc").is_file():
+            raise Exception(
+                f"No external.desc file found in any ancestor of {self.path}")
+
+    @classmethod
+    def from_show_info(cls, show_info_dict: dict[str, Any]) -> dict[str, 'ExternalTree']:
+        external_trees = dict()
+        for pkg_name, pkg_info in show_info_dict.items():
+            if 'external' not in pkg_info:
+                continue
+            name = pkg_info["external"]["name"]
+            if name in external_trees:
+                # already recorded
+                continue
+            external_trees[name] = cls(
+                name=name,
+                path=Path(pkg_info["package_dir"]),
+                version=pkg_info["external"]["version"],
+            )
+        return external_trees
+
+    @property
+    def bom_ref(self) -> str:
+        return f"{self.bom_ref_prefix}:{self.name}"
+
+    @property
+    def description(self) -> str:
+        external_desc = self.path / "external.desc"
+        with external_desc.open() as fh:
+            for line in fh:
+                try:
+                    k, v = [s.strip() for s in line.split(":", maxsplit=1)]
+                except IndexError:
+                    # invalid line, ignore
+                    continue
+                if k == "desc":
+                    return v
+        raise ValueError(f'No description ("desc") in {external_desc}')
+
+    def as_component(self) -> dict[str, str]:
+        """Format self as a component dict ready to be included in
+        CycloneDX JSON output."""
+        return {
+            "bom-ref": self.bom_ref,
+            "name": self.name,
+            "type": "firmware",
+            "description": self.description,
+            "version": self.version,
+        }
+
+
 def split_top_level_comma(subj):
     """Split a string at comma's, but do not split at comma's in between parentheses.
 
@@ -186,10 +256,16 @@ def cyclonedx_component(name, comp):
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
         **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
-        "properties": [{
-            "name": "BR_TYPE",
-            "value": comp["type"],
-        }],
+        "properties": [
+            {
+                "name": "BR_TYPE",
+                "value": comp["type"],
+            },
+            *(({
+                "name": "BR_EXTERNAL_TREE",
+                "value": f"{ExternalTree.bom_ref_prefix}:{comp['external']['name']}",
+            },) if 'external' in comp else ()),
+        ],
     }
 
 
@@ -297,6 +373,8 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    external_trees = ExternalTree.from_show_info(filtered_show_info_dict)
+
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
@@ -307,6 +385,10 @@ def main():
                 "name": args.project_name,
                 "version": args.project_version,
                 "type": "firmware",
+                **(
+                    {"components": [ext.as_component() for ext in external_trees.values()]}
+                    if external_trees else {}
+                )
             },
             "tools": {
                 "components": [
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D3DC83F34
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29FD81162;
	Wed, 16 Jul 2025 14:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1oXBVJmalBp; Wed, 16 Jul 2025 14:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496788113E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496788113E;
	Wed, 16 Jul 2025 14:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA1F1234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB85540989
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVLPTYb9xqII for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70ECC40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70ECC40128
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70ECC40128
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1ps8-1ueFMl0RRI-005zJJ; Wed, 16
 Jul 2025 16:53:11 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:52:50 +0200
Message-ID: <20250716145251.1359958-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716145251.1359958-1-fiona.klute@gmx.de>
References: <20250716145251.1359958-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ts4Y2X1LRjWgQlL71Wwf8hBnlFKgFZyLQ+uZSlOuoaZ3AGH5w1P
 IN87t/GT/hhwwyWyJWtKpMe320tvcHql+74pQLvdp29qkCY8GqCu2UdzW6z58NGqpOECJ4C
 8D0uc94fo2XYE5EiomdnO9pwNIljV9WaACBKpD45vI+xGSGHnwN3NvsHeMqnm6RWv60rsSU
 m58uaSe+i8RIwDgCsLkNA==
UI-OutboundReport: notjunk:1;M01:P0:lrMPewW6bKM=;vm6Zjc8vk+nRd1tTiXZC7q9+gju
 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
 ogjZw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752677591; x=1753282391; i=fiona.klute@gmx.de;
 bh=E5CJXT0qLRtFht7ZcT0lbB0iaDr8f/3ndg0euIa6KrY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=E/FBRaiKX1fNqvDP0CrLr9+VufQJQ33RiIKezFeQFliXm5vwFirJAy/1jdAo552m
 VQ0uP7k0tmnjscb5UFtUeUO01U9P441GjrcahQRguvtAy6N2urN4xKbE2pq+Ik4Ft
 oy1DV585qqfffHq5LLXePgYGsoDv/AQ+0L6RWB2qSlRePpcHna0sq/k9sVIRxh27j
 ogUJHw4LgOe3C3dfOSt+SKByIb9E42hbxXoM8wWgOpGoWMm8daKr8hGEFZGZ7FAsu
 U5FVVrrTtLQZK1LGrVCScS15fGC4SvxY+zq2HlL2V8D2QsdBZhD9PlJ7Gz/aEv//k
 csrbPNCx3u/+mIqeEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=E/FBRaiK
Subject: [Buildroot] [PATCH v2 3/3] utils/generate-cyclonedx: include
 external tree in package properties
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

For packages from external trees, the bom-ref of the external tree is
listed in the BR_EXTERNAL_TREE property. The external tree is
identified based on its path and the new "package_dir" property in
show-info output. If the package directory is not part of the main
Buildroot repository or a known external tree, an exception is raised.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/generate-cyclonedx | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index dd11f4f83c..c672b3e7f2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -206,16 +206,32 @@ def cyclonedx_patches(patch_list):
     }
 
 
-def cyclonedx_component(name, comp):
+def cyclonedx_component(name, comp, ext_trees: list[ExternalTree]):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
     Args:
         name (str): Key used for the package in the show-info output.
         comp (dict): Data about the package as a Python dictionary.
+        ext_trees (list): External trees that were used in the build.
 
     Returns:
         dict: Component information in CycloneDX format.
     """
+    pkg_dir = Path(comp["package_dir"])
+    ext_tree_info = None
+    if pkg_dir.is_absolute():
+        # the package is from an external tree, find it
+        for ext in ext_trees:
+            if pkg_dir.is_relative_to(ext.path):
+                ext_tree_info = {
+                    "name": "BR_EXTERNAL_TREE",
+                    "value": ext.bom_ref,
+                }
+                break
+        if ext_tree_info is None:
+            raise Exception(
+                f'package "{name}" is from an unknown external tree at {pkg_dir!s}, use "-e" to provide external tree data')
+
     return {
         "bom-ref": name,
         "type": "library",
@@ -230,10 +246,13 @@ def cyclonedx_component(name, comp):
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
+            *((ext_tree_info,) if ext_tree_info else ()),
+        ],
     }
 
 
@@ -350,7 +369,7 @@ def main():
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, external_trees) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

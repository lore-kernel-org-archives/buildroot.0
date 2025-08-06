Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6500C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757EC40C25;
	Wed,  6 Aug 2025 16:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jqlOizAvtY3; Wed,  6 Aug 2025 16:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6672A40C2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6672A40C2A;
	Wed,  6 Aug 2025 16:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37F47D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B5A41068
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkLT5U1gKjs4 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:16:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0186040C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0186040C25
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0186040C25
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.163.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1ul3Ju2Dal-007fz8; Wed, 06
 Aug 2025 18:16:13 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed,  6 Aug 2025 18:15:55 +0200
Message-ID: <20250806161555.3805467-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806161555.3805467-1-fiona.klute@gmx.de>
References: <20250806161555.3805467-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SICt3yNJOGdtcSsgp09Fk6TIX2IURuF/VwONE+jeJxlK/BRzP3e
 rxeSYXPKhCMA8HKqevDf/8MVqq+C4gpCKqYdZPHOAdKgjCxZ94Dv7hmiRS3jai+u0VPvXfG
 F9h2wLEE9xthOmpisnAPIYHh9qP1ucwJUeVf4zkotcqAiSasawCLv25veRertemiI/2F55s
 ohSPSjd6DVCcFq9yhRgjg==
UI-OutboundReport: notjunk:1;M01:P0:EOyMMS2qJFc=;8tVVVarmyDyr4uUSXsUfLdrfwkh
 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
 1xtuvCtRWXgTi0bPiBGzuyE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754496974; x=1755101774; i=fiona.klute@gmx.de;
 bh=G1jfkbTk4cyPo+IZD5qf0auOCJjml9Dp5NgwC4oXrrc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bC1zTz3mZhK1hjkARObNHed2Fb5cwIz+7a0mAAs8I55yljKwlDkWmYt9ehhYcgg/
 GduqI+V6PoHFt+ma8CfckP6myXk/GMwFlA7pfpuIfrcIDgI7EtESHx3aBzorLXzsW
 V8uV9eRU7gmtRDvq1Q35cTk1Hd6TATfFehI6Vgr+AWzS5yxZpQlS+9BITTSA24oNs
 WY5JFhaQAzFDM0QrseFgDzCzyMi588rFlDeZu8VHoz57KnnuIhfs+jxOwC9aLD1PO
 8MnUXmQTxATzwlx6Jv2R46JbMjKuNeVXRUQ7vsk25s0e1UZOhOnpdcMixfjcylkl1
 LC0dFzMN5jcj7oYzQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bC1zTz3m
Subject: [Buildroot] [PATCH v3 3/3] utils/generate-cyclonedx: include
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
index d1a0fe1e31..fb24435896 100755
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
 
 
@@ -382,7 +401,7 @@ def main():
             }
         },
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, external_trees) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

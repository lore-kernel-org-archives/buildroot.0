Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2ADC3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 16:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8938127F;
	Mon,  5 May 2025 16:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjMTIMpxi3MQ; Mon,  5 May 2025 16:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3370D81289
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3370D81289;
	Mon,  5 May 2025 16:04:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E89912E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D25160663
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoRVMBgjIJ_u for <buildroot@buildroot.org>;
 Mon,  5 May 2025 16:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6E8F60854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E8F60854
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E8F60854
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1uxe0Y1TpO-00wffN; Mon, 05
 May 2025 18:04:36 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  5 May 2025 18:03:27 +0200
Message-ID: <20250505160327.3422096-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505160327.3422096-1-fiona.klute@gmx.de>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IVmVjSOg+NgQlgzmOSdLwX+B6rDADeI0j0GB5Yb0Ljb1eRhOoYr
 MlnemPJ3pKxclBHtf89o6vRv/4r8Y6Eq47LLLvvnGrPMoKRxXUPLFi/ZlIrd/0yKpZgvVVN
 un9CppXokJl1AexrbgqqEZBSLHou3z52GZgMEhTtdpPF6dFMQ6QMU5iPsE9LoBwiTVtf0hp
 a4PVU44zy9vMKEiEHeV7w==
UI-OutboundReport: notjunk:1;M01:P0:1dY5BmiUsig=;R3s955rmfye7mvMxUu7ewlBFvcN
 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
 V9CI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746461076; x=1747065876; i=fiona.klute@gmx.de;
 bh=HHoWxK3/gVWuMuZYER6nXbeZq8j1eTKEROYt5D3oQ2c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MuhxtINK3usrvsmgezNKN9EnscvZPXij3NgUgUYtigBCTt7sP+bP9yDLSXbvYhP6
 yu9L5cGlo0pBUX2MF1TQA7oUCyno4ZSZQPIlvkr4Mp2xV1fVTpGuIiWW/GsY+9J6b
 bxbMyX/SZsIpn5h3uZnsqhhmtgEBD/d99Ll7jPFAKtJgsgsd2CZ2gc4bcVqB7yvhU
 GUMoujkUy/rpPnABzy7yUSo5BpX53LvR39St18dHgkTcdnrGpOsiSQ52eqPlgTAwY
 +ng0sFCaThZfo6o8Ti/bPLy6mhXRWIgQiHDbxmogCmDAudfVtoKLsPVt7rupDfX6C
 OApHKWQBWI4UPSsWhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MuhxtINK
Subject: [Buildroot] [PATCH 3/3] utils/generate-cyclonedx: include external
 tree in package properties
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
---
 utils/generate-cyclonedx | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index cbb7ef630e..7d7adb2ce4 100755
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
 
 
@@ -351,7 +370,7 @@ def main():
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
         "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+            cyclonedx_component(name, comp, external_trees) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

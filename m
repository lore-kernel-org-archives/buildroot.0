Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F091CC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4774845F0;
	Wed,  6 Aug 2025 14:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id budC6RYE_Q8G; Wed,  6 Aug 2025 14:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC83A84325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC83A84325;
	Wed,  6 Aug 2025 14:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D926D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E76FD61B87
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BljEimmOyPrE for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5E460B1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D5E460B1D
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 372B986EA3; Wed,  6 Aug 2025 14:57:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Aug 2025 16:38:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2982fac48ede2c14e86df670fc4e44399d0a3f69
X-Git-Newrev: 6098cc45d64e9e7928f888b7cdf79533813d19c4
X-Patchwork-Hint: ignore
Message-Id: <20250806145752.372B986EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: move metadata
 section to top level
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6098cc45d64e9e7928f888b7cdf79533813d19c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it more readable and easier to quickly identify basic information.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/generate-cyclonedx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 46f68ac63d..d662f02527 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -297,6 +297,14 @@ def main():
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
+        "metadata": {
+            "component": {
+                "bom-ref": "buildroot",
+                "name": "buildroot",
+                "type": "firmware",
+                "version": f"{BR2_VERSION_FULL}",
+            },
+        },
         "components": [
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
@@ -306,14 +314,6 @@ def main():
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
-        "metadata": {
-            "component": {
-                "bom-ref": "buildroot",
-                "name": "buildroot",
-                "type": "firmware",
-                "version": f"{BR2_VERSION_FULL}",
-            },
-        },
     }
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

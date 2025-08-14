Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD8CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0689780D6C;
	Thu, 14 Aug 2025 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBrFUaK0s9pm; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E8780D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E8780D6E;
	Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01263228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E76DC404C5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME8cIvApctnr for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 244144049D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 244144049D
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1474587609; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:29:23 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b03be1267ab48eaeab15e1240a8354de68cb218c
X-Git-Newrev: 43992a33fb3573ae455d139a2c7a02eca36a36e2
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.1474587609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] utils/generate-cyclonedx:
 move metadata section to top level
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43992a33fb3573ae455d139a2c7a02eca36a36e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This makes it more readable and easier to quickly identify basic information.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6098cc45d64e9e7928f888b7cdf79533813d19c4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

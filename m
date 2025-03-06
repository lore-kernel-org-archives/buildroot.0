Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D543C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE65C41398;
	Thu,  6 Mar 2025 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRnahCmmHvsB; Thu,  6 Mar 2025 20:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D990C4138A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D990C4138A;
	Thu,  6 Mar 2025 20:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D15F21
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ED5460BD0
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4bsAo-jjQDP for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 20:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D44960775
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D44960775
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:53:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 937B887DF2; Thu,  6 Mar 2025 20:53:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Mar 2025 21:49:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e070406523af4547d94fd3fea96354622eccb0ad
X-Git-Newrev: 17134726213a2188946a07b73ff2e2d0363ad636
X-Patchwork-Hint: ignore
Message-Id: <20250306205331.937B887DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: use indent 2 by
 default
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

commit: https://git.buildroot.net/buildroot/commit/?id=17134726213a2188946a07b73ff2e2d0363ad636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, use an indent of 2, which is the same as what 'jq' uses.
This omits the need for 'jq' in the example usage. Also, add a new
line to the output while at it.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/generate-cyclonedx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 39d59173d2..46f68ac63d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -5,7 +5,7 @@
 # to CycloneDX format.
 #
 # Example usage:
-# > make show-info | utils/generate-cyclonedx | jq '.'
+# $ make show-info | utils/generate-cyclonedx > sbom.json
 
 
 import argparse
@@ -270,7 +270,7 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx | jq > sbom.json
+                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
             '''
         )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
@@ -316,7 +316,8 @@ def main():
         },
     }
 
-    args.out_file.write(json.dumps(cyclonedx_dict))
+    args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
+    args.out_file.write('\n')
 
 
 if __name__ == "__main__":
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

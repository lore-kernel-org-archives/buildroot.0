Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE98C282DE
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 18:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC60811D1;
	Wed,  5 Mar 2025 18:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fz2wQ1qC31Ma; Wed,  5 Mar 2025 18:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF4A811DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF4A811DB;
	Wed,  5 Mar 2025 18:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97FC0E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86DF460720
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjrjeun-Wvo6 for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B68C560868
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B68C560868
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A950587EF2; Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 19:55:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 630c20a2b2ad78fa590e80456be9a38484781685
X-Git-Newrev: 66a0513e0eb08b55e1246ba414f80f4f0358fb08
X-Patchwork-Hint: ignore
Message-Id: <20250305185621.A950587EF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: fix wrong
 example usage
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

commit: https://git.buildroot.net/buildroot/commit/?id=66a0513e0eb08b55e1246ba414f80f4f0358fb08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The real file is utils/generate-cyclonedx,
not utils/generate-cyclonedx.py.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/generate-cyclonedx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 365c2b06ea..39d59173d2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -5,7 +5,7 @@
 # to CycloneDX format.
 #
 # Example usage:
-# > make show-info | utils/generate-cyclonedx.py | jq '.'
+# > make show-info | utils/generate-cyclonedx | jq '.'
 
 
 import argparse
@@ -270,7 +270,7 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx.py | jq > sbom.json
+                Example usage: make show-info | utils/generate-cyclonedx | jq > sbom.json
             '''
         )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

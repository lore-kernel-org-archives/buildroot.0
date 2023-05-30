Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBC1C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E015941799;
	Tue, 30 May 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E015941799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QU6DL1UDJvQ4; Tue, 30 May 2023 19:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A805E4176A;
	Tue, 30 May 2023 19:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A805E4176A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC1E21BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B249A41733
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B249A41733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqGguNDPDfh3 for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39E741718
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39E741718
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C67486A94; Tue, 30 May 2023 19:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:35:29 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2317c7775b5237559e907fee28dc4b3bc253e8ee
X-Git-Newrev: e1845fdd25304f36b8e1b3350fa5dcfd344c105e
X-Patchwork-Hint: ignore
Message-Id: <20230530194424.8C67486A94@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gptfdisk: fix
 another runtime failure with popt 1.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1845fdd25304f36b8e1b3350fa5dcfd344c105e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following runtime failure raised since bump of popt to version
1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:

Segmentation fault (core dumped)

Fix the issue by backporting a fix found in upstream git repository [0].

[0] https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9/

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f2a676dcfff886104e83170c274a2e97e9d32aba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...reference-when-duplicating-string-argumen.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
new file mode 100644
index 0000000000..1642343d06
--- /dev/null
+++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
@@ -0,0 +1,43 @@
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
+Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
+From: Damian Kurek <starfire24680@gmail.com>
+Date: Thu, 7 Jul 2022 03:39:16 +0000
+Subject: [PATCH] Fix NULL dereference when duplicating string argument
+
+poptGetArg can return NULL if there are no additional arguments, which
+makes strdup dereference NULL on strlen
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+---
+ gptcl.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gptcl.cc b/gptcl.cc
+index 0d578eb..ab95239 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = strdup((char*) poptGetArg(poptCon));
+-   poptResetContext(poptCon);
++   device = (char*) poptGetArg(poptCon);
+ 
+    if (device != NULL) {
++      device = strdup(device);
++      poptResetContext(poptCon);
+       JustLooking(); // reset as necessary
+       BeQuiet(); // Tell called functions to be less verbose & interactive
+       if (LoadPartitions((string) device)) {
+@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+          cerr << "Error encountered; not saving changes.\n";
+          retval = 4;
+       } // if
++      free(device);
+    } // if (device != NULL)
+    poptFreeContext(poptCon);
+    return retval;
+-- 
+2.40.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

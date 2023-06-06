Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD120C7EE24
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 15:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF5F41928;
	Tue,  6 Jun 2023 15:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF5F41928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MAmNfl_BEVX; Tue,  6 Jun 2023 15:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D874192B;
	Tue,  6 Jun 2023 15:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D874192B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2C201BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 15:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C5081452
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 15:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C5081452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXNbrnwlidPT for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 15:03:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C47C881446
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 15:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C47C881446
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0EC786CE8; Tue,  6 Jun 2023 15:03:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 16:44:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35dea785ef6a4c3f3faa91b20da60aef15d1bcdd
X-Git-Newrev: e0e64e9edeafd6467d20d211463ad28b20705503
X-Patchwork-Hint: ignore
Message-Id: <20230606150352.B0EC786CE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: fix
 typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0e64e9edeafd6467d20d211463ad28b20705503
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Artefact (British) and Artifact (American) are both valid spelling
but ARTIFACTS_URL is used in the emulator code.

Surprisingly, the url actually use "artefacts"

  http://autobuild.buildroot.net/artefacts

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 53876f828c..02cf486128 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -20,7 +20,7 @@ class Emulator(object):
     #
     # kernel: path to the kernel image, or the special string
     # 'builtin'. 'builtin' means a pre-built kernel image will be
-    # downloaded from ARTEFACTS_URL and suitable options are
+    # downloaded from ARTIFACTS_URL and suitable options are
     # automatically passed to qemu and added to the kernel cmdline. So
     # far only armv5, armv7 and i386 builtin kernels are available.
     # If None, then no kernel is used, and we assume a bootable device
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

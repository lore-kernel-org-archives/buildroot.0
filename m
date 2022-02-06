Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9038C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FBC8143D;
	Sun,  6 Feb 2022 14:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZPPnlB7bxD7; Sun,  6 Feb 2022 14:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0CD81435;
	Sun,  6 Feb 2022 14:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D261F1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C089B81435
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id af0-AhLpD7zZ for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:41:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2084A813F1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:41:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B5A7818E5; Sun,  6 Feb 2022 14:34:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:35:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fad154253deb5b5399ea52a19ed6608dcd00ee4d
X-Git-Newrev: 728ece090b894a9404d4944b453b78738774d721
X-Patchwork-Hint: ignore
Message-Id: <20220206143439.8B5A7818E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 docs/manual/adding-packages-directory.txt: reorder select/depends
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

commit: https://git.buildroot.net/buildroot/commit/?id=728ece090b894a9404d4944b453b78738774d721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
 is not logical (when reading). It is more logical and far easier to
 understand when depends come first, followed by the selects."

 Also, the Config.in example in the manual suggests to use this coding
 style [2]."

Use the correct coding style in the chapter "Choosing depends on or select"
in the manual.

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] https://nightly.buildroot.org/manual.html#_coding_style

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39458e33c1e0c4704fd1dbcd64b87cb7016c6deb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 4ceb3fd772..54d96451fe 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -196,13 +196,13 @@ config BR2_PACKAGE_E
 --------------------------
 config BR2_PACKAGE_D
 	bool "Package D"
-	select BR2_PACKAGE_B
 	depends on BR2_PACKAGE_A
+	select BR2_PACKAGE_B
 
 config BR2_PACKAGE_E
 	bool "Package E"
-	select BR2_PACKAGE_D
 	depends on BR2_PACKAGE_A
+	select BR2_PACKAGE_D
 --------------------------
 
 Overall, for package library dependencies, +select+ should be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

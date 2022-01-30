Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA9EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15421401FA;
	Sun, 30 Jan 2022 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibOkgZhPULS2; Sun, 30 Jan 2022 14:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648F5401CC;
	Sun, 30 Jan 2022 14:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8712E1BF962
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FF7340111
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpCpkRoeVcHy for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F1EA400D0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D72C082A75; Sun, 30 Jan 2022 14:05:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:12:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e889bc8db5ac67031abec8a55ba12abb3c443555
X-Git-Newrev: 39458e33c1e0c4704fd1dbcd64b87cb7016c6deb
X-Patchwork-Hint: ignore
Message-Id: <20220130140530.D72C082A75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-directory.txt:
 reorder select/depends
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39458e33c1e0c4704fd1dbcd64b87cb7016c6deb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 docs/manual/adding-packages-directory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6c68d7aa67..e5c7462a6c 100644
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

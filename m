Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B65FC25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF57360810;
	Mon,  6 May 2024 10:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBYK0xSWKBJs; Mon,  6 May 2024 10:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006DD60818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 006DD60818;
	Mon,  6 May 2024 10:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 509F11BF947
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394B182260
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjGLkrCbZfhF for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF378225D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AF378225D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 739198671C; Mon,  6 May 2024 10:51:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 12:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91b1de167e4b4c52850d464a7062a4fd6c68ed12
X-Git-Newrev: db57017f90ec7585c9fd898503897eb8cac1c945
X-Patchwork-Hint: ignore
Message-Id: <20240506105145.739198671C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am6{2,
 4}x: add missing uboot.hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=db57017f90ec7585c9fd898503897eb8cac1c945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arnout noticed during the review that uboot.hash was missing from
BR2_GLOBAL_PATCH_DIR.

"The hash for 2024.01 is currently in boot/uboot/uboot.hash, but as soon as we
update the U-Boot version, it will no longer be. So to be future safe, we should
add a local override of the uboot hash file as well (which is simply identical
to uboot.hash)."

This is required since BR2_DOWNLOAD_FORCE_CHECK_HASHES is now enabled.

[1] http://lists.busybox.net/pipermail/buildroot/2024-April/689283.html

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 ++
 board/ti/am64x-sk/patches/uboot/uboot.hash | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0e171c56f5
--- /dev/null
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0e171c56f5
--- /dev/null
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35D2D10C03
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6594026F;
	Sat, 26 Oct 2024 19:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt--0Bkso6OQ; Sat, 26 Oct 2024 19:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8388940274
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8388940274;
	Sat, 26 Oct 2024 19:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6A65C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 300B481188
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAB8jvgRX_aC for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DED81194
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75DED81194
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61DD781D54; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:13:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 202566ec145ad838d438137f5cf11fb4f8fdd190
X-Git-Newrev: 04892eca6369dbc20e96a18a560c9bcf68687c23
X-Patchwork-Hint: ignore
Message-Id: <20241026191437.61DD781D54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/andes/ae350/uboot.config.fragment:
 support loading U-Boot in RAM
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04892eca6369dbc20e96a18a560c9bcf68687c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not disable SPL RAM support so the u-boot.itb programmed on
flash memory can be used.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/andes/ae350/uboot.config.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
index fa38bbca3a..4497ed4c74 100644
--- a/board/andes/ae350/uboot.config.fragment
+++ b/board/andes/ae350/uboot.config.fragment
@@ -1,6 +1,5 @@
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_MMC=y
-# CONFIG_SPL_RAM_SUPPORT is not set
 CONFIG_SPL_OPENSBI_LOAD_ADDR=0x0
 CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
 CONFIG_DISPLAY_CPUINFO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

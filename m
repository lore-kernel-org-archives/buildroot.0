Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB79CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBA242AED;
	Mon, 20 Feb 2023 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBA242AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwoC6E60MXpa; Mon, 20 Feb 2023 21:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378C842A5A;
	Mon, 20 Feb 2023 21:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378C842A5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4CA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC897610B2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC897610B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSAJ6rBhtrgu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB08D6109E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB08D6109E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E61E0828C8; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 21:58:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b3ab978703e0597b4bdf17d3e32cf0357db8315c
X-Git-Newrev: ec9519831ed5d5698c787b48d2ab952525cacb93
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.E61E0828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/zynqmp/kria/kv260/kv260.sh: fix u-boot.itb without
 CONFIG_MULTI_DTB_FIT option
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec9519831ed5d5698c787b48d2ab952525cacb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch fixes the kv260.sh to generate a working u-boot.itb
now that the CONFIG_MULTI_DTB_FIT u-boot option is no longer used.

This is a follow-up fix of
515319b86f17ea5a2ce3e51c9063bac9f9e00a01 ("board/zynqmp/kria/kv260/uboot.fragment:
remove unnecessary CONFIG_MULTI_DTB_FIT option") to fix the build of:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/kria/kv260/kv260.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e3467f3068..e891852009 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -8,5 +8,5 @@
 
 UBOOT_DIR=$4
 
-fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

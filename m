Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D87C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 199568130E;
	Mon, 14 Nov 2022 20:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 199568130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I09aGujTzshH; Mon, 14 Nov 2022 20:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D3880DAB;
	Mon, 14 Nov 2022 20:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D3880DAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB451BF299
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8624640052
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 20:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8624640052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85LOHTYQcdYP for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 20:58:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75CEF40002
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 20:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CEF40002
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61C4783A43; Mon, 14 Nov 2022 20:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 21:58:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3ab978703e0597b4bdf17d3e32cf0357db8315c
X-Git-Newrev: ec9519831ed5d5698c787b48d2ab952525cacb93
X-Patchwork-Hint: ignore
Message-Id: <20221114205856.61C4783A43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria/kv260/kv260.sh: fix
 u-boot.itb without CONFIG_MULTI_DTB_FIT option
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

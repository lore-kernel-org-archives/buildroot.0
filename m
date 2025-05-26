Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B96C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 026F241A65;
	Sat, 31 May 2025 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59WtQslQkX4G; Sat, 31 May 2025 16:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294D641959
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294D641959;
	Sat, 31 May 2025 16:55:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45226235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D980401D5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urV2q2b8-L4Y for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D0E401F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7D0E401F3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D63E187708; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:45:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a0a963a9d4d3fdee82a6c0280320ce4f66c7df8
X-Git-Newrev: 92d93f321549aab40415d495f80450cf6484c897
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.D63E187708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] board/freescale:
 imx9-bootloader-prepare.sh: fix cpu name
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92d93f321549aab40415d495f80450cf6484c897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This commit replaces "a35" occurrences with "a55" in imx9 bootloader
preparation script. i.MX9 families have Cortex-A55 processors. See [1].

This change is purely cosmetic and only for correctness, as the
mkimage_imx8 tool currently uses internally the "a55" identifier as
an alias for "a35". See [2].

[1] https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS
[2] https://github.com/nxp-imx/imx-mkimage/blob/lf-6.6.23-2.0.0/src/mkimage_imx8.c#L773

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
[Julien: reword a bit and add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a0b51dd088de15ab7a039d7d7476022e826fb4ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index 8ab5a241b0..2db887a785 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -18,19 +18,19 @@ main ()
 
 	if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" "${BR2_CONFIG}"; then
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
-			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
-			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
-			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
+			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
+			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
-			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
-			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
+			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	fi
 
 	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -append "${BINARIES_DIR}/ahab-container.img" -c \
-		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a35 ${SPL_LOAD_ADDR} \
+		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a55 ${SPL_LOAD_ADDR} \
 		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
 
 	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

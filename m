Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132BAC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A4961398;
	Tue,  4 Jun 2024 13:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYlVsheeHEC1; Tue,  4 Jun 2024 13:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E2F613A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E2F613A0;
	Tue,  4 Jun 2024 13:28:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A50341BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89D4E80FF8
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9yGln_HtByz for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5366847FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5366847FC
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54ADC87AAE; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 15:25:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d4896c52909b43e0c3049f8f79f77b5c502e2dd
X-Git-Newrev: baaf7f738a76d363aed753888da0712c7c430976
X-Patchwork-Hint: ignore
Message-Id: <20240604132830.54ADC87AAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/freescale/common/imx/imx8-bootloader-prepare.sh: fix FIT external
 position
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
Content-Type: multipart/mixed; boundary="===============6834786567176043513=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6834786567176043513==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=baaf7f738a76d363aed753888da0712c7c430976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using imx-mkimage 6.1.36_2.1.0 or later, an additional data structure
is inserted in the generated image. The FIT external data position passed
to the uboot mkimage program needs to be adjusted accordingly.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15973
Fixes: 72de78902330 ("package/imx-mkimage: bump version to lf-6.1.36-2.1.0")
Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Sébastien: Tested on i.MX8MM EVK and i.MX8MP EVK]
[Sébastien:
 - fix subject
 - add Tested-by tag
 - fix Fixes tags
]
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index a9ee154e9c..b353d506fe 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -8,6 +8,8 @@ main ()
 		exit 1
 	fi
 
+	FIT_EXTERNAL_POSITION=0x5000
+
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		dd if=${BINARIES_DIR}/u-boot-spl.bin of=${BINARIES_DIR}/u-boot-spl-padded.bin bs=4 conv=sync
 		cat ${BINARIES_DIR}/u-boot-spl-padded.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
@@ -16,7 +18,7 @@ main ()
 		else
 			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		fi
-		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		${HOST_DIR}/bin/mkimage -E -p ${FIT_EXTERNAL_POSITION} -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
@@ -28,7 +30,7 @@ main ()
 		else
 			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		fi
-		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		${HOST_DIR}/bin/mkimage -E -p ${FIT_EXTERNAL_POSITION} -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
@@ -40,7 +42,7 @@ main ()
 		else
 			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		fi
-		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		${HOST_DIR}/bin/mkimage -E -p ${FIT_EXTERNAL_POSITION} -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x912000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
@@ -52,7 +54,7 @@ main ()
 		else
 			BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		fi
-		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		${HOST_DIR}/bin/mkimage -E -p ${FIT_EXTERNAL_POSITION} -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x920000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin

--===============6834786567176043513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6834786567176043513==--

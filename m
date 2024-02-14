Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E6C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693DA4173D;
	Wed, 14 Feb 2024 09:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYO5Snu03REL; Wed, 14 Feb 2024 09:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F15C4179F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F15C4179F;
	Wed, 14 Feb 2024 09:11:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABA11BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63F660ECC
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkIyofcM44mc for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E587360EED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E587360EED
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99D908794C; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 10:03:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf9c8fa2c844748145d83ffc279a9548cf3792ce
X-Git-Newrev: 6c455505eb5ed8ed5bbf090f2bfb6241c9f153a2
X-Patchwork-Hint: ignore
Message-Id: <20240214091150.99D908794C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale:
 imx9-bootloader-prepare.sh: fix script
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6892224096080155773=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6892224096080155773==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6c455505eb5ed8ed5bbf090f2bfb6241c9f153a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c05f27c "configs/freescale_imx93evk: new defconfig", when
applied, added few ShellCheck fixups on top of the orginial
submission. During those changes, one extra backslash was added,
making the imx9-bootloader-prepare.sh fail.

This commit fixes the issue by removing this extra backslash.

Fixes:

    dd: failed to open '/buildroot/output/images/u-boot-atf-container.img': No such file or directory
    make: *** [Makefile:820: target-post-image] Error 1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Tested-By: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index a9611a81bd..8ab5a241b0 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -21,7 +21,7 @@ main ()
 			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
 			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
 			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
-			-out "${BINARIES_DIR}/u-boot-atf-container.img" \
+			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
 			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \

--===============6892224096080155773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6892224096080155773==--

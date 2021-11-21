Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C6AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337A580F36;
	Sun, 21 Nov 2021 20:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hl3goLd4xbIa; Sun, 21 Nov 2021 20:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755FC80F49;
	Sun, 21 Nov 2021 20:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBDDA1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C881240366
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6qGW2kGiXZK for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:55:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2343A4035F
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:55:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F329F8E17F; Sun, 21 Nov 2021 20:51:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:55:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b115aff1a3bc906bd53ea6dbb091c9376e4f3c7
X-Git-Newrev: 932e51abccd3d8a08d9552cae0d288a19ce0ae17
X-Patchwork-Hint: ignore
Message-Id: <20211121205135.F329F8E17F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nitrogen8mp: update device trees
 list
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

commit: https://git.buildroot.net/buildroot/commit/?id=932e51abccd3d8a08d9552cae0d288a19ce0ae17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove the A0 device tree as this (pre-prod) version of the CPU isn't
supported any longer
- add '-m4' variant to enable remoteproc api to Cortex-M core
- add ENC variants for our ENC carrier [1] (+ 1 with tc358743 support)

[1]
https://boundarydevices.com/product/nitrogen8m-plus-enc-carrier-board/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8mp_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 3c52c526ab..dc7427c856 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -54,5 +54,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-a0-nitrogen8mp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-nitrogen8mp-m4 freescale/imx8mp-nitrogen8mp-enc freescale/imx8mp-nitrogen8mp-enc-tc358743"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40D0E40106;
	Sat,  8 Jan 2022 14:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR4imRejxrNG; Sat,  8 Jan 2022 14:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70D95400D3;
	Sat,  8 Jan 2022 14:02:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F233B1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD947400D3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2aK7Zg46yhk for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A98D400CF
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0B0082BC9; Sat,  8 Jan 2022 13:56:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:02:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ec9b3abd9dc8d24bc75f2b5b365ad78e2b09b8d
X-Git-Newrev: cf2a7663ccc6089e98e0d6ec39fa8623749c0c24
X-Patchwork-Hint: ignore
Message-Id: <20220108135639.B0B0082BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6slevk: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf2a7663ccc6089e98e0d6ec39fa8623749c0c24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

After the update of u-boot in commit 9a04bbec1cd59b (configs/imx6slevk: bump
U-Boot).

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650628
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6slevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index 6f0bae5aa9..9448267e2b 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

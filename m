Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C76FC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FB582173;
	Sat, 23 Dec 2023 20:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FB582173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxbsXDpZf4F9; Sat, 23 Dec 2023 20:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E3C82165;
	Sat, 23 Dec 2023 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E3C82165
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 919A41BF388
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70791417E7
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70791417E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35seOCSnCmKI for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:07:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF931417CE
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF931417CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86003822AD; Sat, 23 Dec 2023 20:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4873799fe761ed3ac97c4f54f8079edbfd4047ef
X-Git-Newrev: 297c88cfca6586e05769cc41ae755bcce6d69044
X-Patchwork-Hint: ignore
Message-Id: <20231223200709.86003822AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker-s_rk3288_defconfig:
 use zImage by default
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
Content-Type: multipart/mixed; boundary="===============5455012422159956031=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5455012422159956031==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=297c88cfca6586e05769cc41ae755bcce6d69044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrates tinker-s away from deprecated uImage

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker-s/extlinux.conf      | 2 +-
 configs/asus_tinker-s_rk3288_defconfig | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/board/asus/tinker-s/extlinux.conf b/board/asus/tinker-s/extlinux.conf
index 5a2d05b811..61ebe50c71 100644
--- a/board/asus/tinker-s/extlinux.conf
+++ b/board/asus/tinker-s/extlinux.conf
@@ -1,4 +1,4 @@
 label Tinker linux
-  kernel /boot/uImage
+  kernel /boot/zImage
   devicetree /boot/rk3288-tinker-s.dtb
   append console=ttyS2,115200n8 root=179:1 rootwait
diff --git a/configs/asus_tinker-s_rk3288_defconfig b/configs/asus_tinker-s_rk3288_defconfig
index 7082869881..00b42990f8 100644
--- a/configs/asus_tinker-s_rk3288_defconfig
+++ b/configs/asus_tinker-s_rk3288_defconfig
@@ -25,8 +25,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.65"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker-s"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y

--===============5455012422159956031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5455012422159956031==--

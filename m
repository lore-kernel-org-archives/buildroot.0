Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81696C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C509815AB;
	Sat, 25 Dec 2021 15:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtqyOqWL0xDw; Sat, 25 Dec 2021 15:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F90081463;
	Sat, 25 Dec 2021 15:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC331BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F09A6070A
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUk41ZoX_R0u for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:27:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEC56606F9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1897B826DF; Sat, 25 Dec 2021 15:22:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 16:27:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c4c68b8fbf471919fbbaf4e688a75c4de36a331
X-Git-Newrev: ea667f523aee0a4cb38a2be524bc46a2cc9f26e0
X-Patchwork-Hint: ignore
Message-Id: <20211225152217.1897B826DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_sd: U-Boot needs
 host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea667f523aee0a4cb38a2be524bc46a2cc9f26e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

In file included from include/bootm.h:10:0,
                 from tools/image-host.c:12:
include/image.h:1178:27: fatal error: openssl/evp.h: No such file or directory
 #  include <openssl/evp.h>
                           ^
compilation terminated.
scripts/Makefile.host:112: recipe for target 'tools/image-host.o' failed
make[2]: *** [tools/image-host.o] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/stm32f469_disco_sd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 5ad4068e5e..ea1361efc0 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -19,6 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

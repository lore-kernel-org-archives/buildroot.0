Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD6EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF09881E36;
	Mon, 17 Jul 2023 11:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF09881E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsY6b3NeE7bE; Mon, 17 Jul 2023 11:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D291781E32;
	Mon, 17 Jul 2023 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D291781E32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 119FD1BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E076540562
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E076540562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBqC4HyAXnBQ for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C9B40108
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C9B40108
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFFEE87142; Mon, 17 Jul 2023 11:08:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 13:07:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2f9f55b000531d360cf95c4be0cc7ed26dded98a
X-Git-Newrev: dbacf9108a6852d8a35a5c69dcbc98d5cc5fc296
X-Patchwork-Hint: ignore
Message-Id: <20230717110807.BFFEE87142@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] configs/chiliboard: uboot
 needs openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbacf9108a6852d8a35a5c69dcbc98d5cc5fc296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes uboot build errors:

  In file included from tools/imagetool.h:24,
                   from tools/aisimage.c:7:
  include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory
   1383 | #  include <openssl/evp.h>
        |

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ee2bd48f11ec9362f6bdbec29a733296b7a01e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/grinn_chiliboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index e7862d1738..a5a8f7a65f 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

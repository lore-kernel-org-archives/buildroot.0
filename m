Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C1CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58545828E3;
	Tue, 25 Jan 2022 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwhTmXN9SrHS; Tue, 25 Jan 2022 17:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE6F828B3;
	Tue, 25 Jan 2022 17:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9FEE1BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C911160B55
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VokYVKqA24IV for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D4860A7E
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56913827A2; Tue, 25 Jan 2022 16:59:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:01:37 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a059006a1b8c2c8d4f1e04819031308a08e87898
X-Git-Newrev: e77dc1817a9f42e7ec9733b6c616ac534851101b
X-Patchwork-Hint: ignore
Message-Id: <20220125165919.56913827A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] configs/warp7: select
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

commit: https://git.buildroot.net/buildroot/commit/?id=e77dc1817a9f42e7ec9733b6c616ac534851101b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006500
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f7071471ba64bc3e0036c1884dc3657568859113)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warp7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 830d5187c8..5fca9f6cfc 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # wifi firmware for brcm43430
 BR2_PACKAGE_LINUX_FIRMWARE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

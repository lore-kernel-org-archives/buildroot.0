Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D38C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B92401D2;
	Tue, 25 Jan 2022 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnSYlDpOAHO8; Tue, 25 Jan 2022 17:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62FB94029F;
	Tue, 25 Jan 2022 17:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A33E1BF995
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1279E401D2
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZKGJVbIZ2GT for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36EC74013A
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6913C827A0; Tue, 25 Jan 2022 16:59:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:04:15 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 850b8697a2f46c8d0f5c3ec816711bff74d8da25
X-Git-Newrev: a8a25482f3083f0d69ba3d48771477c61a24ab13
X-Patchwork-Hint: ignore
Message-Id: <20220125165919.6913C827A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] configs/imx6ullevk:
 select BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8a25482f3083f0d69ba3d48771477c61a24ab13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006189
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9f72e37bdad345d80a5dd1c12ab7df2396b35b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6ullevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 06641f1458..c6e2981697 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

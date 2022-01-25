Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E6BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F2541552;
	Tue, 25 Jan 2022 17:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0WnUmdDgWoo; Tue, 25 Jan 2022 17:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C4C41526;
	Tue, 25 Jan 2022 17:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A35B11BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F20E60A7E
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zj1rMJNOMKwb for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C5AD60B0C
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5EBEE827B3; Tue, 25 Jan 2022 16:59:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:02:33 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e77dc1817a9f42e7ec9733b6c616ac534851101b
X-Git-Newrev: 850b8697a2f46c8d0f5c3ec816711bff74d8da25
X-Patchwork-Hint: ignore
Message-Id: <20220125165919.5EBEE827B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] configs/mx6cubox: select
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

commit: https://git.buildroot.net/buildroot/commit/?id=850b8697a2f46c8d0f5c3ec816711bff74d8da25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006257
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 635f4b8b5a04d0802aa429fb92dbcd757feed66c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mx6cubox_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index d0ce2f9a6d..e80d995525 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

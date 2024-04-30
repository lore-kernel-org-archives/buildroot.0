Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A38C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5E75400C4;
	Tue, 30 Apr 2024 22:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB70-KteSE9t; Tue, 30 Apr 2024 22:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060BF40169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 060BF40169;
	Tue, 30 Apr 2024 22:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6E11BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8458680EE3
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohqKI0rleNb7 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAA4C80ED3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA4C80ED3
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:13:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCA3F86356; Tue, 30 Apr 2024 22:13:57 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 00:13:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffe920b6447a9138cd679f98ecffccbcae0d107c
X-Git-Newrev: f5aac04c362b593011ce245549d4bfc3311dbe9d
X-Patchwork-Hint: ignore
Message-Id: <20240430221357.BCA3F86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_licheepi_nano_defconfig:
 fix missing linux headers
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
Content-Type: multipart/mixed; boundary="===============6017642335593204875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6017642335593204875==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5aac04c362b593011ce245549d4bfc3311dbe9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build failed with:

  Incorrect selection of kernel headers: expected 6.8.x, got 6.5.x

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278078

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/sipeed_licheepi_nano_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/sipeed_licheepi_nano_defconfig b/configs/sipeed_licheepi_nano_defconfig
index 8be26165d9..6eb4a3069d 100644
--- a/configs/sipeed_licheepi_nano_defconfig
+++ b/configs/sipeed_licheepi_nano_defconfig
@@ -9,6 +9,9 @@ BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_nano/genimage.cfg"
 
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y

--===============6017642335593204875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6017642335593204875==--

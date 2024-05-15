Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CCFC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 14:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A78605AD;
	Wed, 15 May 2024 14:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRp9ozDR_V1G; Wed, 15 May 2024 14:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC5C4605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5C4605C7;
	Wed, 15 May 2024 14:44:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13A521BF4E5
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B947C605C7
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ytJy6mkflqN for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 14:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB97C605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB97C605AD
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFEA287390; Wed, 15 May 2024 14:44:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 16:32:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cd987cbcc13f4f6fa74be0b4dde511bc1642a31e
X-Git-Newrev: f113543d83d57f9c5ef621e03b4934e2623e20f4
X-Patchwork-Hint: ignore
Message-Id: <20240515144426.DFEA287390@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 configs/sipeed_licheepi_nano_defconfig: fix missing linux headers
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
Content-Type: multipart/mixed; boundary="===============1870808458387530430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1870808458387530430==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f113543d83d57f9c5ef621e03b4934e2623e20f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The build failed with:

  Incorrect selection of kernel headers: expected 6.8.x, got 6.5.x

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278078

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit f5aac04c362b593011ce245549d4bfc3311dbe9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1870808458387530430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1870808458387530430==--

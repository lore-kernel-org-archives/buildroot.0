Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA20C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 17:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49478111C;
	Sun, 20 Apr 2025 17:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGTMFTV4AL_Y; Sun, 20 Apr 2025 17:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C07811F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C07811F9;
	Sun, 20 Apr 2025 17:55:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC1468
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C61B3400CC
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0F-n05UwSx2 for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 17:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18AA040429
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18AA040429
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB42D83912; Sun, 20 Apr 2025 17:55:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 19:52:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8181727e23603bc717fd9551ce0bbc97d17231aa
X-Git-Newrev: 5926b3b3ae0d10005d7eb984c7575e0a8ababb72
X-Patchwork-Hint: ignore
Message-Id: <20250420175512.EB42D83912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: add note to keep in
 sync with kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============6422873937837112323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6422873937837112323==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5926b3b3ae0d10005d7eb984c7575e0a8ababb72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump of packages rpi-firmware and linux have to by synced, since the
linux package does not install yet its device-tree overlay blobs.

This adds a note to remind to keep in sync the versions of rpi-firmware
package and kernel (set in the defconfigs).

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
[Julien: rebase patch to resolve context conflict with commit 80ccb3e667]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index c7437f5d17..2577d16a01 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with configs/raspberrypi*_deconfig
 RPI_FIRMWARE_VERSION = 1.20250326
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause

--===============6422873937837112323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6422873937837112323==--

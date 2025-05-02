Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C65C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93CAE83EDD;
	Fri,  2 May 2025 11:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_s4xhBW9Ivu; Fri,  2 May 2025 11:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B004282A8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B004282A8F;
	Fri,  2 May 2025 11:12:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C25D22D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20A6E6119F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 355pK7NTohxB for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C196158F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C196158F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D3E0864AD; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:13:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8337e700ac11952bc95e4cd760b5f1d26182ad26
X-Git-Newrev: 6ca44f4b7c764931507f4acfc2b4cf08521898d5
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.1D3E0864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rpi-firmware: add
 note to keep in sync with kernel
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8322363010968430404=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8322363010968430404==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ca44f4b7c764931507f4acfc2b4cf08521898d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The bump of packages rpi-firmware and linux have to by synced, since the
linux package does not install yet its device-tree overlay blobs.

This adds a note to remind to keep in sync the versions of rpi-firmware
package and kernel (set in the defconfigs).

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
[Julien: rebase patch to resolve context conflict with commit 80ccb3e667]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5926b3b3ae0d10005d7eb984c7575e0a8ababb72)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 7ae9ff6c28..8350d395da 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with configs/raspberrypi*_deconfig
 RPI_FIRMWARE_VERSION = 5476720d52cf579dc1627715262b30ba1242525e
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause

--===============8322363010968430404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8322363010968430404==--

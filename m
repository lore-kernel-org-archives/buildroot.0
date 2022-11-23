Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D534C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A328740B92;
	Wed, 23 Nov 2022 21:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A328740B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7AyZExMSYjW; Wed, 23 Nov 2022 21:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B194040D;
	Wed, 23 Nov 2022 21:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B194040D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27271BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC0C610B0
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC0C610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxUYZurmg8kR for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:42:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC54C60A6C
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC54C60A6C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3BC68438E; Wed, 23 Nov 2022 21:42:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:42:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40c05259d89545c40a2ead709be161569db54a05
X-Git-Newrev: 2cda2584fbb566284019f39ca89f44b42dacdb03
X-Patchwork-Hint: ignore
Message-Id: <20221123214245.A3BC68438E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_ebbr: add host-qemu
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
Content-Type: multipart/mixed; boundary="===============8817190242359861100=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8817190242359861100==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2cda2584fbb566284019f39ca89f44b42dacdb03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the host-qemu package to enable testing on gitlab.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_aarch64_ebbr_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index a0d8105c43..d293ad0e60 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -48,3 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

--===============8817190242359861100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8817190242359861100==--

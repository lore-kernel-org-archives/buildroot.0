Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C226EE01F6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567626080C;
	Tue, 30 Dec 2025 21:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1GVUPXtKPe7; Tue, 30 Dec 2025 21:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C29960881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767130993;
	bh=BmJtw4nBJ1W5IU1AfHFSRc0XOkafIBgKsvFklHEzxxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DOxPpnR/HfXqou8QNRp0rgguaK/YzLQgK1Ofqf+iEItq/Wk42Mzu6KH1ctkSxx9Bu
	 Rs3dBMEKlJx+TMRf07W+DxOoEY1mlSKH0YIiKDaYNiRGKkGj6hpflZsJLSk6QRaV1q
	 Xid+o81xNS52H2qXfa7n7XmNQxzeRCgiYKESTZ9q79QGK42xk/Tu8NlTc8VzpKG6SV
	 CNq2z23bIzhbI0NjsPqfShMpkYGqSlaH2MXQ3U8H85Jwohysn8hpfNoowBf9DVW7hL
	 HGT4jd4d1Cu3b+gOYRRVvzN3rOhv5IxA5Zv+nLYr2dMiU/DLX9YjQgH7irfObc29N/
	 owpvdNp3i5i7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C29960881;
	Tue, 30 Dec 2025 21:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BCADD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61D0A402B1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEPta-gLBuEO for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB5844024F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5844024F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:43:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B73687C90; Tue, 30 Dec 2025 21:43:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 22:22:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 244f01ae45103dc8fbdbd66617baa9658a720b30
X-Git-Newrev: d3c02bca133ef6ca4f8a9abacebd1ed1580f471d
X-Patchwork-Hint: ignore
Message-Id: <20251230214311.9B73687C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: Switch to Bootlin
 glibc stable toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3c02bca133ef6ca4f8a9abacebd1ed1580f471d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to Bootlin glibc stable toolchain as requested by the 2024
Buildroot meeting report:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/beaglebone_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 86bf6bce9a..8a8f618e40 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

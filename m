Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CEFD88CD
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 23:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D6A812BE;
	Tue, 10 Mar 2026 23:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0L5FvFpkHfH; Tue, 10 Mar 2026 23:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92EBD81197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773184733;
	bh=lPB7hRLTURERl3Q7v5Alt9QscqzLh+otJe9I1K+qp+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D/RuOlaACLSOLvB4P8llqkvfBeQV2pJOnHdPw4yqgEYyONg4GaO2sW5Iz1DyZ+RNk
	 4bJEYpoMZXsd4bs3fHqWH2S+ZwsbARfch1cfqKd4PUnnkvBrdD5Pu13z6YIRvcVv8+
	 mqTXImhY9qPft3gUhw5j7JPAhmDnmUIEefgeJ7+r+eDU+Y+RafpjyLVNsm1G4ANIS8
	 vZfq6NRYGPLLm9j9aouWFV6U0GvcLyk3hQhVvbjGyK5yUL43S17dI2Apvf5q8r7gFS
	 M9BXGR/nfOS0/OVh2m89CJqPLkYw7DvnIg6MesJQQIgYUZ2uid9F9xCkkvlRM5NNRO
	 kJgoapO08wb8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92EBD81197;
	Tue, 10 Mar 2026 23:18:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75CB233A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 673E660EC9
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLkjU_4I0k13 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF77960EC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF77960EC7
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D52FE86ADE; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:47:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b4d44d71b8f148c21a115131b458c1d4f4c41ae
X-Git-Newrev: ea2a0e5cdb52b9b77f12ac26b9e22b547611470a
X-Patchwork-Hint: ignore
Message-Id: <20260310231851.D52FE86ADE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai64_defconfig: bump to
 kernel 6.18.16
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
Content-Type: multipart/mixed; boundary="===============8900596144525522321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8900596144525522321==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea2a0e5cdb52b9b77f12ac26b9e22b547611470a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There was a previous attempt in commit [1] to bump the kernel to 6.18
but the SD card failed at boot. It seems the actual issue is related to
the "cheap" (or fake?) SD card with SD UHS SDR50 speed.

This offending SD card come from a lot recently purchased in order to
fix my “Too many boards, not enough SD cards” issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4abb8a98b26922796b41bc913e72be487337640e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beagleboneai64/patches/linux/linux.hash | 2 +-
 configs/beagleboneai64_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beagleboneai64/patches/linux/linux.hash b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
index 7fbb81d7e3..eb4dcee958 100644
--- a/board/beagleboard/beagleboneai64/patches/linux/linux.hash
+++ b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9b4ccec7d8ceff4824f149e476ec06e83c86546ae8af82582871647809a62ef0  linux-6.12.70.tar.xz
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index 5e0adc0dc2..b41ea09f3e 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.70"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"

--===============8900596144525522321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8900596144525522321==--

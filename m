Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F3FFCC050
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A88C83D99;
	Fri,  6 Mar 2026 18:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCZsuF3nHqPo; Fri,  6 Mar 2026 18:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287F883D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772820972;
	bh=GqzJr/kYEAsodPgXDPsJWkZSLMZq+l9hYfqHe11o/jM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PuFcRu3msQ9TLTaFDPdtRm8o0yPY0OTnTvC5Z0R4bZ/DaAS1rYCHdr5Ds/5JQ1+6T
	 xMZxdW7nNlKXkn1CJmhZPq89Mb/thPIXjFpXE1IbTWHhwKF7Ap8YqRv8y6JubWozwF
	 k1bqCPaGMRcLv1euTbghBZrsOAliOvgcN46gkGkCsMvs3FpWrad6JdUh6IiqxUIVSX
	 68tS+ViXB3omIoWeArJos0hYkySWlhLwiZ2rdm30pfhdzYTAnmPi9wDbgSsZvuT4kA
	 rBRmOUEqXh16i/+RZ50GNmFZx9q/EGtQnpwRjoRczIpUTnwrm7T1NTVzHqDxnnKFKd
	 eo1hbZ1xqJglQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287F883D8C;
	Fri,  6 Mar 2026 18:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 011E825B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D02612FF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 191x3eOgAkPY for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A6A60C20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39A6A60C20
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E28E8626A; Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:15:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b483b6eac4653f586ef694c9593a4459065a9902
X-Git-Newrev: 6f0300a8fbfae69ee8d5997b3e7b2f6c50acec49
X-Patchwork-Hint: ignore
Message-Id: <20260306181610.3E28E8626A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/khadas_vim3: use external Bootlin
 toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f0300a8fbfae69ee8d5997b3e7b2f6c50acec49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/khadas_vim3_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 21a16cc1b0..89bae0f114 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -1,7 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a73_a53=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

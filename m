Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942B6FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45144842F0;
	Wed, 29 Apr 2026 20:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsZhage5Z1U6; Wed, 29 Apr 2026 20:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D01842E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777494812;
	bh=fSZaVmUpy+ld6gueVvBSmpHXBUfYao/ml9vFBPfmV88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K0MLCXr/xs4eg4PKzgDAxXB3YwRkxLaDdAeKQKLGZcIxrG1NaWCMJmVk4fRwZvAU0
	 1E7eBTocmW92LEVmIq7k53QQFm5gQ29BGx4Lc+NqpVP9tXaXJCpgkrgd/8x0dCDFw/
	 ItifyZ2w1r9nklYW0HP1jCNpi3qKMwq1x0KdUv3m6BAFFpGiPlnKZoM7BAplclWQ4a
	 IUDNKi5WDPtSpt5LrD4aeohgXdrYG9C7s6eKvSWklPiw9Ub4fHE1JdP0PrkvpQ1H/Q
	 NjYtpUedA0PN6p3v2z6YeIwY2IXBDETBh0KiSBBgMV3JV+wf4UTCOIpnmuG1SU8KRl
	 JOuxIG5xmRcyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D01842E9;
	Wed, 29 Apr 2026 20:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D48F1192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C65ED421C0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XR2eOFcJ0CXf for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C85A40079
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C85A40079
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9CEA83B2B; Wed, 29 Apr 2026 20:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 22:03:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90304b7129bdc74c37b932235348fba1f6bc7f3f
X-Git-Newrev: 9b31ff563d2113786f15c437a76621a24a56b6d6
X-Patchwork-Hint: ignore
Message-Id: <20260429203329.B9CEA83B2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: switch to
 external Bootlin toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b31ff563d2113786f15c437a76621a24a56b6d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the precompiled stable toolchain from Bootlin.

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/kontron_smarc_sal28_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 181a92daab..09d3142589 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

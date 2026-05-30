Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F8DCD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FB685DD0;
	Tue,  9 Jun 2026 13:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymaxBhWK-Yq9; Tue,  9 Jun 2026 13:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC01585DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010322;
	bh=0eMr4712D9uqBu0cHDMQwBaaX2pW7w28cqj+Hn8y/sg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QVYNfljsBUYaukKFFp5zGi+NBHm22qhCIQhtfAIDU8NtR7SarmoAtK6TK8e/N0iC7
	 YLmkRWbyL5pLjnBuRQa4btsqvlSW5aNDwLY5nnTCQFYC8OAXcFyfXYJM0gWCU7cjE7
	 3KSWobiR0X6YOA6uIh7EXURIFmsdEOeeQfJOP7kjOo8kG6p7cSTLm0/66PF3d+gYPa
	 7xe+/YWwvLbPgEOGZuLluBcB8v4NHwG0gU7hNlOkLAjgZw661630birh2uCG0sIzcg
	 Kr7SxLlXm6M5Y3dXAoYo+g9GX7AWjy+j07q+htN053uWYndnxA0ev87+7abxtFhceQ
	 TBEMxuJvmgZfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC01585DBA;
	Tue,  9 Jun 2026 13:05:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D3C190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888EF412CE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-6bUiQkCWDz for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E003F43B5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E003F43B5B
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2798A87E8B; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:47:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6e989615286e317992bfab7de878c3ae7069443
X-Git-Newrev: 7d466c7e4c2ae8c1b3a9f870f6ab92e0f7be0a13
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.2798A87E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: enabled systemd-boot on
 aarch64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d466c7e4c2ae8c1b3a9f870f6ab92e0f7be0a13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This adds support for compiling the systemd-boot efi application down
to aarch64 in buildroot. This is supported already by the software and
requires only a change in Config.in to allow buildroot to benefit.

Signed-off-by: Jack Wearden <jack@jackwearden.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 5200e4a8f9..4c19a884b4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -116,7 +116,7 @@ config BR2_PACKAGE_PROVIDES_UDEV
 
 config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_GNU_EFI
 	select BR2_PACKAGE_SYSTEMD_EFI
 	help
@@ -163,6 +163,7 @@ config BR2_PACKAGE_SYSTEMD_ANALYZE
 
 config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	string
+	default "aa64"  if BR2_aarch64
 	default "ia32"  if BR2_i386
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

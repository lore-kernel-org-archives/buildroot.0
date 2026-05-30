Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDADCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D334885414;
	Sat, 30 May 2026 17:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFVxufQKukIf; Sat, 30 May 2026 17:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E37853FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163288;
	bh=YBocBSq9XidzhJ4p0jb+a6FoCzP8AESXKJ8WbWDFN3Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GoZI94FoL220SE6llTp/ZQiy0EVu85/gApmsB74pOd8edsvpAUNbWlotlQbNfg2JP
	 Wq8snarOWCEUKscWvgZUXT5yr6/T8vRpm0x5LsluGVnRibVXP8f96bJK+7L5OFc6De
	 ZVEclHPjCcTkDPAN9SPpOXjbF3qtWeVxJjlBu0I/+fg06LRouBM4i8qflyLxTJT4N8
	 MTiqS6mZolfzacqYI6A6nJIYVg9UQW0kGLZwxMFUSZz0Ovhx/rcq+uYcrXqI0qu74F
	 Ji8EqX2SUMwMJjG1gisEFXRw1Pb4+0xKZ2E04NMdpJuePu3x2304PeXRX3UCjQu627
	 65pxGL7GQWMpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E37853FC;
	Sat, 30 May 2026 17:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A07F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C7460749
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKSgvGoRD7mK for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B34260DAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B34260DAA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D9FD87532; Sat, 30 May 2026 17:47:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:47:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e6e989615286e317992bfab7de878c3ae7069443
X-Git-Newrev: 7d466c7e4c2ae8c1b3a9f870f6ab92e0f7be0a13
X-Patchwork-Hint: ignore
Message-Id: <20260530174749.6D9FD87532@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/systemd: enabled
 systemd-boot on aarch64
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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

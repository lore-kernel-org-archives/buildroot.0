Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBEECD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3A285A45;
	Tue,  9 Jun 2026 13:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypWhg7gSFMPC; Tue,  9 Jun 2026 13:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F92859A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010204;
	bh=gZ1hVGExn4CFuD8EuyMDvb/Zmt/Ue9JfSjGvr0dqzU8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fzJkVsdYSxPRLEDz+T01y5r+ZwhLAAqWZexs/QOu1Z0/pQMYcGgpuH7ayHAuXlnaf
	 NUvpOFUZPGouoq3jQSzqasJXy9Gik6hhLL6UIocPeFFKtXBfJjVBf4P3R0JpPJcbLJ
	 JpireM2SIJG6+sabpM9rxvgdnWBdZPISi47q9Tjdl7e9CQ48XE3C7RnzWyCigB7liq
	 1W/Q6knmv6Otn7zlrVYeOniqqfksqiHVSUSG3xFRXE+KHvSTlcxuaRTEairB6tiqJh
	 1RBS55oI5NT/1A9qbcOg/HFnXaob6zr4oX/0yu8hzcSnYwGo/KxLWTa3H8hH94kTpA
	 qw/w+hv88t7Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F92859A4;
	Tue,  9 Jun 2026 13:03:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EB2C2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A2D45BE9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jICaTBSDQw7m for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E2B4542E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E2B4542E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C5B987E7E; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a397689ee1256d1dcf8451f0ddf467f93dd2c0f8
X-Git-Newrev: 03108175ce3b1067709b1235a9703f7abedf50d2
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.9C5B987E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: provides libudev
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03108175ce3b1067709b1235a9703f7abedf50d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 65cfc1d2de..5eefed71dc 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
@@ -19,6 +20,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 3c22b13d86..a060e8f0d8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,7 @@ EUDEV_CONF_OPTS = \
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES = libudev udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484BD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A18781589;
	Tue, 13 Jan 2026 20:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLyL0G_37FVM; Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7640882E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337936;
	bh=Ti4MBPJk0w7zo4+Iam0Q2253ZCnIUyxj52DgLPs+aSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mHnea4f21GCfWQQrC1FM4npFhiWiAniNAgPEHCS60J1qY8FrkIwRjbLpWCeJmgBe9
	 7BrYiwudIDIJgxvMSD9/0EQaZIH44Pyf/9oslV2WDm8/GxsNQC87sPaNmc8h6o+nyE
	 2aFQy7VMrt32jCksyL2WlKOf26SlVpURgtHg29EnOWMBShF3yHfdXirf0yvI2mXdYi
	 3n+4dbyB2XBeGGw4JNXIhUyHbBNvPCWrwNoWDIbChaplPPinwG9RumWEOzgKGnSwaw
	 zJfwrNzr0i4zkjufWTxb+xiF2WIGEQQ/RaAE1mq0fCrImr5cWBNKzmUGDDVBhwknKh
	 vYdEiOqebgy8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7640882E19;
	Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9FC2CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93FF040C2E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-L6tcWkMDbz for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7842740C1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7842740C1D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A9488573; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ad7b859e08da0a2592a40c8a7083fd040ddbb4b
X-Git-Newrev: 66d25cdfad73bfb5202ba1745356d2b26ef42377
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.70A9488573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_fonttosfnt: bump
 version to 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=66d25cdfad73bfb5202ba1745356d2b26ef42377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-December/003651.html
https://lists.x.org/archives/xorg-announce/2024-October/003533.html
https://lists.x.org/archives/xorg-announce/2023-September/003422.html

Switched tarball to xz.
Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 6 +++---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index 72077bee60..05ea16b02c 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-June/003093.html
-sha256  1a1bb4ef25856dea7de3d491ae7231493225b400bee0f6a1f949017ffd203a64  fonttosfnt-1.2.2.tar.bz2
-sha512  ceac6ccb064043d46f9f16f31fb89c6cbf7f026d049f7b5325d6af97e809b4cd068e6149413bb328c0af601a98b5070e21d469888a6853f6cabecd5b46f60240  fonttosfnt-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-December/003651.html
+sha256  2e251e66e8753c08aa280b26fd4a10d0d88e7d9bba5c8aac3d3fb36705e5918e  fonttosfnt-1.2.5.tar.xz
+sha512  3be2a625234175dfc8a637b13f2d273afc82126ccd624a38afcc7ef3e13814dac0e55c8ae0a0a713725cf52078f8b45f3e86d7b357b1a19a55def55f969d0640  fonttosfnt-1.2.5.tar.xz
 # Locally computed
 sha256  f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 9fdccbb843..d341272b09 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.2.2
-XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
-XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FONTTOSFNT_VERSION = 1.2.5
+XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.xz
+XAPP_FONTTOSFNT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
 XAPP_FONTTOSFNT_LICENSE_FILES = COPYING
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

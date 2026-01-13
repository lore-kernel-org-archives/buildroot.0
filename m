Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9390D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C96E40D5E;
	Tue, 13 Jan 2026 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgGwnck7IOw7; Tue, 13 Jan 2026 20:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6718340D44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337976;
	bh=hNOleIYfHfJGKqw0Q1+bHxTEalQmFanQCjiH86NtfP0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B768tT0ihFWWJ0+y76CYQfvgMWTDXugo4HBZESi2hLzYYOSIzpDcvEH4JUV7ZIAL9
	 5tUflgBfU897b2M9pqNsjc1dfgp7nq11qks8m/xomuihGUDDwBvIZ3ZpTVqUIY+Ls/
	 GLnnwS8idDP2vBWWqSGWQmlCmiZEMqomprBftSALB5bR72SwqTjWq2EEULYHBHuI9J
	 3Isl7maj2ZUtdOKebsn+BS1qvxwwM4OGswJYh7GJJceceLuJIBs3MYGT+XaS8IMt/b
	 W3O7RIJmoyx7lZuIAXPabeNs6dhZNfu59X6rDZPctkpEEVqxM7o3Jc2XhBjaHtyZaS
	 TuBVshAEIRSRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6718340D44;
	Tue, 13 Jan 2026 20:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8793231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F624407A1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ej-5UEuTOZQU for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B64740084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B64740084
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A5E4819E3; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 130244a730a7210498cf784bcbc5f9aa2ae4a3df
X-Git-Newrev: 0259107f8825ee53e75f8e59d8747c03b3f261ef
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.1A5E4819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxcvt: bump version
 to 0.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0259107f8825ee53e75f8e59d8747c03b3f261ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003571.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash | 6 +++---
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
index f635c90fdc..2d8ba5076a 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003195.html
-sha256  0561690544796e25cfbd71806ba1b0d797ffe464e9796411123e79450f71db38  libxcvt-0.1.2.tar.xz
-sha512  3f6b2baca712a4608780686932f8881255c07bb74b1a788f9b07d4e22975c038d75111cd6b452257882a0b2bad57eebb2002f80a3e435d2e2d16936597f039b0  libxcvt-0.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003571.html
+sha256  a929998a8767de7dfa36d6da4751cdbeef34ed630714f2f4a767b351f2442e01  libxcvt-0.1.3.tar.xz
+sha512  2fecc784375e69b6e8e46608618a5f5a8ad20ecd5229fd093883fe401dd6ea231d8b77c6753756fff01f3040bef2db60a042d40fc349769ef5348e5cd9ed1f28  libxcvt-0.1.3.tar.xz
 # Locally calculated
 sha256  4849851554bdeda9a2a85ce93946b786605e009685941b8b907a9a36b02ae068  COPYING
diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
index 7f61054dbe..428553a19d 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXCVT_VERSION = 0.1.2
+XLIB_LIBXCVT_VERSION = 0.1.3
 XLIB_LIBXCVT_SOURCE = libxcvt-$(XLIB_LIBXCVT_VERSION).tar.xz
-XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXCVT_LICENSE = MIT
 XLIB_LIBXCVT_LICENSE_FILES = COPYING
 XLIB_LIBXCVT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

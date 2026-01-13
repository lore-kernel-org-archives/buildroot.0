Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD2ED30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFE5682FDE;
	Tue, 13 Jan 2026 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OEJZVJuCGvB; Tue, 13 Jan 2026 20:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DECA183211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337940;
	bh=dTPUA4Pvz5WpcYmycDl35X02CUgmP4e3aJdY5BjrHCA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bp9KDqRzMdkrEMjWfl2j9DYXecOaoBSJNX9lR2MgS4lz33Knxp+A3YGSpuOxDmitO
	 +Oihlec+wDtCXovsQFnQLTlMT2c7emPIm4H06Fs7wGngpWBsedxHm31G94k4qj0H75
	 vbR5bxiIbkgNbprxiKHa5r2oSjqpgObz7wCg87ik0514KhmJ7rnJEujbYXvR5Jvoq+
	 MIHl9WMuFPGJ+zJalRXSfgGfONQcIFE7dXQBH7iYxDRXPlocjjr0t0BLbCNcb8igRO
	 hPAUjdedOnevGH4SU+2mXlrPknaY4Eg4vOUJCeKcoBgYmUwmy35SBOy9UkLusQsFk3
	 HKg5+xjzomTog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECA183211;
	Tue, 13 Jan 2026 20:58:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DC6231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FCCF40797
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAKRi4Dxtzpl for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE694075B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE694075B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB9588570; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ae757762c32b5a3d0cd259fc196f9d8d515f168
X-Git-Newrev: 39cc6f9572a8ca154fcc333ed7f2da2bbbb27a8d
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.BEB9588570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfixes: bump version
 to 6.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=39cc6f9572a8ca154fcc333ed7f2da2bbbb27a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-September/003626.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 6 +++---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 03de906245..03f5838546 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003382.html
-sha256  b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58  libXfixes-6.0.1.tar.xz
-sha512  b46deffb30cd73ec8a127390d99f2ba2f3ab78f334fdba227f1f461441644a0c169b0d13ffa47576fa458780e7a6db664ff8b93e9195fb217262efd8128f1ffe  libXfixes-6.0.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003626.html
+sha256  39f115d72d9c5f8111e4684164d3d68cc1fd21f9b27ff2401b08fddfc0f409ba  libXfixes-6.0.2.tar.xz
+sha512  87542927ba9839fdd83282b0fba1bd2afae853ffe4e0f5f548915de22432bbc34a064578ba8527ba6041a993ee27390ba6ee2f1a957cb961717d45026e40ec75  libXfixes-6.0.2.tar.xz
 # Locally calculated
 sha256  a07d8a5a6972638a745a03983207a1052881c24eea29021fdca7794bea8d7774  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 3f535fc1d4..514cf97d75 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 6.0.1
+XLIB_LIBXFIXES_VERSION = 6.0.2
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.xz
 XLIB_LIBXFIXES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

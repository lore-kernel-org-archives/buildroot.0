Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F1D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E1D40CB0;
	Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9i-pq_FrhOZ; Tue, 13 Jan 2026 20:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8655240CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337947;
	bh=WGThfCYx8d0T+7tpV7C0euDPneqFMgiX6aJ4r8jJlM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eBUOvnQ6P48VG4OOwVs417EuvdEqqn1v2XOpERkLtni1Iph7zbWT6jtzyqUS1N0tb
	 bKB0DHx9NMbUT3ze9Da2FfSE7nLsnc8rdf5GZpOkz7ZdFSj9esIjMG/HCL5TDPoxWQ
	 QrFcyLoiiGe2C/8XV65wKwlsnH9S2Hwxh1oraU1hQdk8ezP6J/OYRBL+n9aIkCCKyS
	 8HiQ/iFpSfRMPEF2nN0QnDvvD79bs/yrCEVgygXmnA39/c4Cr4HL8D1NjbMx6kTmwt
	 5otKvBu7/9ST0dtIikP82W3D7m2iF+5SffObE3/PUftgq3qcSGLK1iVz30udM0WiBO
	 iRZXA1SsiF2mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8655240CB2;
	Tue, 13 Jan 2026 20:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC8D231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F343407A2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9kMsMerQNEa for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8B2240757
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B2240757
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A74EA88570; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c1af9e35e99ad5836107ca4264a5d79dc4e0937
X-Git-Newrev: f824e8fcb64ab6a8a2ada313ccfee70debf7de2d
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.A74EA88570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXres: bump version
 to 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f824e8fcb64ab6a8a2ada313ccfee70debf7de2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-September/003628.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash | 6 +++---
 package/x11r7/xlib_libXres/xlib_libXres.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
index 2e6d3d5c55..4c6b6579e3 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.hash
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003278.html
-sha256  9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f  libXres-1.2.2.tar.xz
-sha512  897f2d426ea6f41169a5a52c356d1a1cb2ffb9144ae41b9fedd06455c3d81042930fe55be269ce4b8545ee65fcfe168101192a599053d810e8810f627c94f810  libXres-1.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003628.html
+sha256  d2de8f5401d6c86a8992791654547eb8def585dfdc0c08cc16e24ef6aeeb69dc  libXres-1.2.3.tar.xz
+sha512  385dbc87bd4e0d306a1cad6b317d8431494cd2a381766bc3f9e6b7f488ff41ee1f4f25e756421f6a2b5681976d7da0108cea6305f7a34f7105d861cb6c1ae854  libXres-1.2.3.tar.xz
 # Locally calculated
 sha256  0d7300168f85833ea2564835f66a61e036ede90b33e76c06a7b4078096fedbcc  COPYING
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 25498090fe..65be80f67c 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.2.2
+XLIB_LIBXRES_VERSION = 1.2.3
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.xz
 XLIB_LIBXRES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

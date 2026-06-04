Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD7CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4739F40E90;
	Fri,  5 Jun 2026 12:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSfoqYPeJJgR; Fri,  5 Jun 2026 12:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5189A40EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663072;
	bh=5KdTl4uVw7pS5kkDCud2R6K+YNBi/N3OUVE4v2NrbEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k/o0TP6+DIRtS+HLicLjUqJyOkTnx3MsAQNFsO+jVj9VOxwzOVrxXsIR0G080nKkQ
	 f6uYpXuk8lqEjKKaxsIMcYPD1aRFo8cR1byCLFeY3C/4jO0QPh/trPJPa7V6e26we+
	 YcZCxZOQRGW88LdxuRKKUBciFFVNJoYcU2/GrfrUFIFMLNa9WKPgbgAAl2jRTHG0dF
	 hePKzQD1PPn+2MLju4jHt4Nengg4SjNZF9Ya3Iedkb1PPF3YXDwiN43su+yMRtjdYw
	 VoVdO669+R1EBuZCv/DrAsQVQR59KP25SZEDU5KL0SYTm7ABXUQuJAPOOrBLidTxc3
	 dnMsmLElYcR/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5189A40EFA;
	Fri,  5 Jun 2026 12:37:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E8A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75FD081E96
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyzD4suu2aWH for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBCAB81E53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBCAB81E53
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E65F687B3F; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:54:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a623c4ab7931a0326eabf121b1e4ab2d0f81aed
X-Git-Newrev: 9e7e4eb543af74a237054eead81fa4389652fb0e
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.E65F687B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xwayland: bump to
 version 24.1.11
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e7e4eb543af74a237054eead81fa4389652fb0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes a number of regressions found in 24.1.10.

Changelog:
https://lists.x.org/archives/xorg-announce/2026-April/003697.html

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Peter: mention regression fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 94d6d266f4038157818dcaa37a16fac8089d0043)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index ba84d20b9f..6204400852 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003679.html
-sha256  459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0  xwayland-24.1.10.tar.xz
-sha512  bceba1db7f4d7ac92d2b2a3c8f6f7ab0cc093f396fe89406f8dba25e32ffc3edfa552df246cbfb3b0708c1d28b3e179694d11870b063d5b8f9ab2db9fb861a8f  xwayland-24.1.10.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
+sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
+sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 28efc5126e..b708139895 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.10
+XWAYLAND_VERSION = 24.1.11
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

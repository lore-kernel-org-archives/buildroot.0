Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C40BCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 654CF60D8C;
	Fri,  5 Jun 2026 12:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJ36Jo9aK-iU; Fri,  5 Jun 2026 12:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BCE660BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663173;
	bh=d6Av9tZYhJJOGfJdbUwsCu3iYbWF8cQ01TmkChfpSc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pCjGkQEvuio7+ZQ0oPXnpJIpdFtB7s9J7GDlYwZgd9a5OLg/7dAqmuiIESJI6VMFv
	 VAwU4+gPI38FBHEEwvP3p3ANjoXjrlFxke6/mRgP08h8x9w2XtceBMKXE0hKJqgY4C
	 Vv++5LaRNH2yGi7hBnqtksy6a9RVOVII20hLfRq3L/oJA9CjB2T8jny9Ueuvw2beqg
	 TqDt8IbuD7Ljqj8bgbK1Qtm5RYugbc2HRh0S6xAvMZJsDDtIcPp8z3pOly3HorzW8e
	 jPsNy5ZmUe0hjyCUGPjOlBWbgtIx9dJP6wnixmrG07hNgwocyP4P9rX06ulQGonSRn
	 o7lJ40Y5T+Q5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCE660BE9;
	Fri,  5 Jun 2026 12:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D70AF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D17A81FF2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaLgle_OveYT for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86FCC81FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86FCC81FB0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B7287B03; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:54:50 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: be577a367aeb00a2a640dca8bd0b067fb3f027df
X-Git-Newrev: 8fec33c70d1be6cdba467470d22aca8d23cab520
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.B0B7287B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/xwayland: bump to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8fec33c70d1be6cdba467470d22aca8d23cab520
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 5902f85d4f..0643cc5c4c 100644
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

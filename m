Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8DACD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB5AF411A7;
	Fri, 12 Jun 2026 11:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4mnc5vEzQmM; Fri, 12 Jun 2026 11:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D66411B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263378;
	bh=9jKpXUV+qjVyqdVpDZW9EJcsFF4LOTCPRTQwlCael1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZGzOKokZOENZZ7/9ctls4aenoGMrlXytQtRUtHC5yPvhaRt7BxxA8I6+ldBvZm1Gx
	 RTDtCZpUIwneWibG83HFvwXE3AFKXXd/H4dQD+NhOUKZsqGHMiCtTsc42ut+IPMYgG
	 n80nBXjBioJTbf0D4bov+E/pdnPmhsOVzFn/n9K4xByvQ23Mj/Nql2MbJBu1rpjBIV
	 1sDB543Z4TF8m0jWDkzTx5rfy2WLaowzYPkMvewUKfnTvnuI/yy6CUbs29bxXdgDB8
	 n1Wp+s7iLaQ7eZdle+jST+NEgeQW+jEDGhUMbpbVbTz+o45+N06ZgnnxFDIHQ8HF4B
	 ZJYqJvZqkyElw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D66411B9;
	Fri, 12 Jun 2026 11:22:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4ECF237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D50A832B3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaZQDf4oMb2d for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A9A8329E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88A9A8329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61723880DE; Fri, 12 Jun 2026 11:22:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:42:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f5e232127277952b482417997e83a830c0d693a8
X-Git-Newrev: 992d69bc528a59e1d69ab4cbebf7de843d6b0a18
X-Patchwork-Hint: ignore
Message-Id: <20260612112211.61723880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/x11r7/xwayland:
 security bump version to 24.1.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/992d69bc528a59e1d69ab4cbebf7de843d6b0a18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Advisory (no CVEs yet):
https://lists.x.org/archives/xorg-announce/2026-June/003702.html

Release notes:
https://lists.x.org/archives/xorg-announce/2026-June/003704.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 990c39b588054390de8b0d9e9f049ee470655d2a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 6204400852..2bf2d19020 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
-sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
-sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
+sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
+sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index b708139895..1242ca5e55 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.11
+XWAYLAND_VERSION = 24.1.12
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FDEC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4EA280F36;
	Fri, 28 Aug 2026 14:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-4U4_Y00jQh; Fri, 28 Aug 2026 14:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927142;
	bh=nBy0j5f+iGbQccpuQK9edchcYe/nc/y3V0i8CeHLg8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OHKGCO9f42tC0Ln8+4W+FyrzKzs3+Zyh7lP3IgUtHjZugM1gqJBlAZJqYK57se3Rl
	 pKhOBHCGN/7MY4w60HQS1Nk4uw63qXd7NvZJUWQRpBc0hDjsA3geTU9J/Lbblc0iXE
	 U6RtMR9ZiuJomd8f5Dt5oE2YGL57RfHVC4cWBr8rz5inpcoxO0xp1TXV8q7J7hRreC
	 cQBPVTSLn/x5TudutYFJ4xcmRPMcx0pnvHAheeQt29Jcxi5luq/NitJzgGzU9DQ25o
	 OwCUW1rcQ9KK/CumOe7t7sNsLT+MZRxtZID06DRfFz03Uw3IMuUIr/Dpg3eudTL1V6
	 Wzvkm2WswI2iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56B880E6A;
	Fri, 28 Aug 2026 14:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C44AD28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E2FA80F50
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oaDHdoP79nJ for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD6780E1D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AADD3921FA; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5bec46058aa0b2c2d3196e04456c32b5fe01b832
X-Git-Newrev: 662b43976b8549db734782a583042af7c7752d7a
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.AADD3921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/go: decrease
 debug level for CGO linking
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/662b43976b8549db734782a583042af7c7752d7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Workaround an upstream issue that arises when packages are build with
gdb -g3 debug level:
    https://github.com/golang/go/issues/77436

This has been fixed upstream, but is not released yet, so add a comment
stating when to remove the workaround.

Fixes:
    https://autobuild.buildroot.org/results/97cd9c2586a0cc2a16cdb2a75dae1836feb5ffc3/
    (and probably a lot more...)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ec8f1b03e61e865a93c9253b1a57431cfa573f1d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/go/go.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index a64d7538f8..265d3aa880 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this to 1.27 (or beyond), remove the workaround for
+# upstream issue https://github.com/golang/go/issues/77436, below
+# (i.e. revert the commit adding these lines).
 GO_VERSION = 1.26.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
@@ -75,11 +78,14 @@ HOST_GO_TARGET_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-	CGO_CFLAGS="$(TARGET_CFLAGS)" \
-	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
+# Workaround for https://github.com/golang/go/issues/77436
+HOST_GO_TARGET_ENV += \
+	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
+	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
+
 # Allow packages to use cgo support if it is available for the target. They
 # will need the toolchain for cgo support; for convenence, include that
 # dependency here.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

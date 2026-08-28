Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6703CC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76E080ECD;
	Fri, 28 Aug 2026 14:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOwHwA3B6HKw; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927020;
	bh=U40YT9uOZQwwYB8KZ1yI1r5eA8pJ3DvClwjNdKlhzUU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lkqWauW5oVkVYjndG3uQI5Vw1ZsX7rhu1js5mmbOodpFwTgsU4x5uiLVaa+fQDvTt
	 +yuV8J58gFi1jGPEr3LpyZhgP1b0dwSH0oV/UoJ5QtEns5gMq6zVfRopAzjp22cjrr
	 zN0GkdrthBZmC9RNkgSglH5LI4aluv2GEiLOS0D4At0JMVPi1R+J6wgKo8PV2FwED8
	 V1aKkhMKws6thfIwx9uOOFgD75ln2jt3doZuulnp+dMUk/z3/6BUWIQULyV/sK3Pe8
	 9ZxSiB+NoOyGvg2Iv60n1iG+PP7Oi90EEcAmsdnTEatI3JDyLzKLCmXgQeMLjj6iu3
	 p2plGKH3n2Hrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D3180E6A;
	Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DC5386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41EC040861
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xvDzSkQKCMV for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC630407A0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7BF2921FB; Fri, 28 Aug 2026 14:22:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6346dc1d96af967ddf9a2fb6588faec73d07cd4d
X-Git-Newrev: 850a3c2a550854111a4ac3b1ec99ae6406b2a93b
X-Patchwork-Hint: ignore
Message-Id: <20260828142240.C7BF2921FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: decrease
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/850a3c2a550854111a4ac3b1ec99ae6406b2a93b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

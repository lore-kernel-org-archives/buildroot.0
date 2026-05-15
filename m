Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317EACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5598453F;
	Fri, 15 May 2026 17:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAS-1hnJJTei; Fri, 15 May 2026 17:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CCD684585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867116;
	bh=xvnu7chD/3vKfyzNNqa4QWc1xUAXU5h7lBvCgG38L40=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aMP+tocGyoKDJO/tr736AxnZ7Iw0bJOdV/eJtZHz1ivsoCC9TNF/ysyeQGt+L3pKW
	 f5X5ykKY6FPRtzAGn8n4Jmfo4mFZZaIkuZWe8IuYiOvoSoCbDfqQkevVOXSHkAin9M
	 91E0g1MQusfW4sEVsuvfq1xfjBijbZdt5EZsPZxGe5Re3Fz2rrfzBkNoamHB2NAoTl
	 qZ0SARoWMjCPPkrY2GPTTNAPZSQUD8nnoEvOaIP21sDjXFrQyj86+eTYNSvNWI47JD
	 hHVvo5PQhq2SlY75eJUkFm75XHqjEkMEreb/cDL2Vulwk/65yXwa6ofQAXvROOHGx0
	 gDiZBbADHjKOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCD684585;
	Fri, 15 May 2026 17:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0E645B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15F5761623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HdKtOFzu7IN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB2B6169A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB2B6169A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 089C98633C; Fri, 15 May 2026 17:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 417dcac3d28d3bfa93176aab4f5cdb48595cd4c0
X-Git-Newrev: 836584a0afcc32786fa11d579ab4df0c1b768656
X-Patchwork-Hint: ignore
Message-Id: <20260515174450.089C98633C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bubblewrap: bump
 version to 0.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/836584a0afcc32786fa11d579ab4df0c1b768656
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ead0c6b1827b045bf830bac8db0b2dfe89602cb4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index b2b88ffe92..696c20ee07 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,6 @@
 # Also checked GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
-sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
+# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
+sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index ea46d7a127..afbb29eab9 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.0
+BUBBLEWRAP_VERSION = 0.11.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

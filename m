Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D646FFEE4F2
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4B2417FF;
	Sat, 28 Feb 2026 16:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBEBbG3K4J9P; Sat, 28 Feb 2026 16:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A7D4180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772294737;
	bh=AOJdsP1Pdcu0y2B9+RMxWlnO/BjqZRwQhAh3rmCuFLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UR6eBrAnLgAgn29zRML634DFwsHL+V28kqTFlrlai1+ORvPQvSwW6wJ1QeFFLDGfq
	 wzpGtYjm5jc9nuCWNcxjCPGTtxXvpUSS2EBeJzA4nBPqSzBd18i8pLS/4zabKqXigm
	 R5oi7YSh+IXVGj1uekvoH4bmDfyDtuo+Anletd/0XembmPlgv1JbthYDJridO3t1cO
	 gbVww2El3HSx1UJvOdln+WkEbs99uJoJ/acq90kULx43dAk0O+6DFizrnoe9IqWxYP
	 3abRmsJAXEZfFjN0DqcKtbMizXW+G8Vc6tTcIU7Y6cm+d7LyCoS/AGRWwssc6tmX01
	 Qp1T9pYKooGFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A7D4180B;
	Sat, 28 Feb 2026 16:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28B381EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB1E83D24
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6Rnrz4igqPv for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B2A83D22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44B2A83D22
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32B9685C38; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 16:54:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eba0a3e68302a6c971035879fb6acb56744f85d7
X-Git-Newrev: 97ceb56821b5c1a23ef763bf98e55c6e09ccd846
X-Patchwork-Hint: ignore
Message-Id: <20260228160533.32B9685C38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/transmission: bump
 version to 4.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97ceb56821b5c1a23ef763bf98e55c6e09ccd846
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/transmission/transmission/releases/tag/4.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index b6dcaf9ae5..d554f8034e 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  dcd28c1c9e6126229c4c17dbc9e95c9fd4aed7e76f4a1f2a74604c8cddec49d6  transmission-4.1.0.tar.xz
+sha256  e743283ee03a42c4d0b08fed2bd52b554aa6c9f65b4d4d45b795c32d98762a79  transmission-4.1.1.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index e4b6d8d189..b7e204dfce 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.0
+TRANSMISSION_VERSION = 4.1.1
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

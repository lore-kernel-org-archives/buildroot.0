Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA81DC61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCE68108F;
	Fri, 28 Aug 2026 14:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzr_ehmR_cQz; Fri, 28 Aug 2026 14:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927147;
	bh=gESDNoEqADa6dEfjgWsDHFbRL7jAFhcI6MZ66FLGWCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XHSAEORAgDHVQqbUo0GiHOn2pF7DezGx6xUISZHyPgGaK/1tg01rlr5ZjLS+Er68k
	 hTMT45MbPIeX4vKHGrXnDQfV1Itnk2qys1q/Xa93HjNzAPpa22ue6lA9I8P0tCm/Vo
	 29dKfer0szcVFEEMc2JbVP1nPGbFPb8PpQbcvlb9rrHB8UMKEzpbF2rw8evvjAG4Lp
	 OxAoOcBfsEbp+idHr1H5H+Eorz/cDF36PeY/w9XdyOZTHdQ16abcrLWDadDPBhw4to
	 G/S7xb1qdlGi1Kh1hJ2smQjuZkQhT5zerNt6LmatHoZvx8wDBx4X8gmHqL9d5PX1eC
	 DJPuAr44J+0QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCC680F85;
	Fri, 28 Aug 2026 14:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A93D2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB9B80F5A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSfbZmiU1m1w for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 004AA80ED0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E587E921F9; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 9c36b45ac6bfe3041eec6cfff05a6a15012b2d18
X-Git-Newrev: 34cc95533a48a7d8bbd47e5169d29977dab8df64
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.E587E921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/udisks: security
 bump to version 2.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34cc95533a48a7d8bbd47e5169d29977dab8df64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This fixes this CVE:
CVE-2026-7867:
https://github.com/storaged-project/udisks/security/advisories/GHSA-j42g-v9jw-6ph3

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 93049b2559b4e87a6d03cf8c1b0125ffeab86477)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 8a70b90a67..f9ed24c823 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
+sha256  18630a8aad806bea0bc626ce97e71e50ec82c742956ac1c834a4275f8f22207b  udisks-2.11.2.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 43d066c9e1..0203d037cf 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.1
+UDISKS_VERSION = 2.11.2
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

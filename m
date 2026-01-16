Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FE5C982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4A3849AD;
	Fri, 16 Jan 2026 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkHA8jm8qLRH; Fri, 16 Jan 2026 20:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3296A849B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595919;
	bh=DYNGDZJgHsjARvSNSR2NtZ0iAKJDXnM79ibbV8dQ680=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rpoYN8Qg4v9keI9HRGB63F/OK2ouy41gix7VV0XRuhcsGRzshlacbk8SXQjCngQNL
	 fwev1PZeBcDNbuvAvFZNKrQDFNLJ3uekiKe0xb8TgBrZ+z1DLOvAqvtXgx39+j7s5h
	 dinoMJVmpjWwvWAnNC5S+XP/BVf7KdY373MyncPGVCt08jB2zGyOEe7ybdf2eWSerw
	 jSnOebthOJuxojgu4hKeWZJL82JbiMZ58aZ7sNX9Z1B7h5ZRwLcgziuGvxvdBLYVOJ
	 nC8veYgG69ELSnBRfPzS6fd37mcBtBG3Wtvgep/9slyqCnrbMqGIakS2RTg5rUGvVm
	 A9rNuiajnUiFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3296A849B2;
	Fri, 16 Jan 2026 20:38:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62180223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48381849B2
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNELO3cLSQOR for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCFB849AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DCFB849AD
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6137588698; Fri, 16 Jan 2026 20:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:34:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9868f67d38c598663b72e8d2b8878380303a76de
X-Git-Newrev: 598237cb153e29c7d719ddde11d56c6415c7891c
X-Patchwork-Hint: ignore
Message-Id: <20260116203837.6137588698@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump to version 2.5.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=598237cb153e29c7d719ddde11d56c6415c7891c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce, see:
https://lists.gnupg.org/pipermail/gnupg-announce/2025q4/000500.html

Quoting the announce:
"""
Note that the 2.5 series is now declared the stable version of GnuPG.
The oldstable 2.4 series will reach end-of-life in just 6 months.
"""

Also, an important feature in the 2.5 series is the introduction of
Kyber (aka ML-KEM or FIPS-203) as PQC (Post-Quantum Cryptography)
encryption algorithm.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index ee37e6a3af..feafbb328b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
-sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
+sha1  3acefeef08c82a4d4a8ba36f95c2986fb925d359  gnupg-2.5.16.tar.bz2
+sha256  05144040fedb828ced2a6bafa2c4a0479ee4cceacf3b6d68ccc75b175ac13b7e  gnupg-2.5.16.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d083ea850a..fafc383ec8 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.9
+GNUPG2_VERSION = 2.5.16
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

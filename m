Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3485E7315A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D96140A7E;
	Mon,  2 Feb 2026 10:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuaJlCR6ZP-l; Mon,  2 Feb 2026 10:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C0C740A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028071;
	bh=au/kB/3CSpsnr1SOFEroU6Aov0ovq9gwvX7UYVZXBPw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2PMKOhRIjvZdTzPCl0qE9vnlIm0GZQ/7+RirnU7qGW6JS5MfpNlBZDBVN/vaZgpQ
	 pmc8UIBrl8ODccdBOL1dr7lpBnRTW7M5inGFmSSSgXPvWTtUs1TlB9aDDLV3s1KMQC
	 cfIECA2PEABcagpBN/CBmy5wzNRlVzoo4D+sV6LhKz3PQ7kD3UhUuXH08T1Yr4hClJ
	 j45ITHI8LSFpoegfzBMDQusgYHt3Y03KRXvPhJ4zGdz8rnewdYevlZ3FLITSFD4ire
	 vgxPELzSyPfQzLt9Eml1/bO5PUooeLhLj41fIQgaLWpgu/M21S2SyFq8hVL67P6JAD
	 8/9qtcvhwUB3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0C740A48;
	Mon,  2 Feb 2026 10:27:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4825149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 972EC40A0E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Lhx9m__xUvS for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B060E408AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B060E408AF
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96F81862CC; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:27:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab9bb65a98de7da2a6daf79545daeac38f14a5bd
X-Git-Newrev: 6b4381dda28ea335ff278efda0d629ec70546b74
X-Patchwork-Hint: ignore
Message-Id: <20260202102747.96F81862CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 10.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b4381dda28ea335ff278efda0d629ec70546b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://octave.org/news/release/2025/10/01/octave-10.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 4ae6ad4684..4c4c457b65 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-10.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-10.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  d0bf8992b6d4ac2bdae93590f8520882150a239cc260b43c632b4a9ad28e8991  octave-10.2.0.tar.lz
+sha256  68bc82885a3ae67a806debb14eb229506d2fe398c969dd42e2e38cc1c35f2aff  octave-10.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 2f9346138b..155dfc8427 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 10.2.0
+OCTAVE_VERSION = 10.3.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

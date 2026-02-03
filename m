Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4A0E8B36C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE38A608FD;
	Tue,  3 Feb 2026 21:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxviBjlMgcxf; Tue,  3 Feb 2026 21:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6EE60901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155673;
	bh=Ry5dAySImqCMwi4xpYhS7A2Ie7ltCPM2kffwJxci7qM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I4CbftT/x7GdfrTEkSlWfZeOvsKRDOOR+yOb8duTXYbPIXiH46nIQEtCOOJibOQI7
	 Kx5s8tlf1ScLCIp4rgNsP3qfmQQQH6NZDWpQk4Fe2mNKRoSxrvQlR+VPT3SOOhT8VT
	 O2nbyIv/26Y98+A9k61NgBIAnuImiL9rv4wN0lvM0j8Y57IDisc+wX+W76VfCh7x1N
	 Kl7+AB5lWBTUqwuRIu6Fn3aoUeAmbPOfEUgS4pphDFBFHAYYRkTLy39TSjiRsAo3Ft
	 1wnVb5ZDMPy1lLnG8Qj467bFMVa0Zwh+AX832tdjYnXrHXE39k7TxQF+DsUHRUxusZ
	 EAZ3GaVJqij8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6EE60901;
	Tue,  3 Feb 2026 21:54:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15579F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0010980D2C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5b5A3pa7GgL for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08C0A80AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C0A80AAB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08C0A80AAB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A079F19F57E;
 Tue,  3 Feb 2026 22:54:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Feb 2026 22:54:23 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@mind.be>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2026 22:54:23 +0100
Message-ID: <cover.1770155657.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770155668;
 bh=PKLMvR41pkedk4fZMwk/Nh5xVwgIeBiEFfGk0rx3qO4=;
 h=From:To:Cc:Subject:Date:From;
 b=utLS/C3TC+Qy4isT4KsjvWByzsJdPYz8jN8k3f2iPXbZemZvKpJ120PhoP2jYb48F
 fdMuJaQsYbQXunptIP6RJYebZiSr8oWqjvj92/6g73RViGEF1tF0OujEFR21X1T4aQ
 11HvMtWFZKwvQJ+4gknC9+zz5QVN4JTBDt/eotN1j36e61yoBBSkvR+p3CLZwnskO+
 Kfu+rNw4EN1+r6hTOzqOmwIjd6+jeXN/V/4bBTQsEPc++7OVzqEmRpV5WxpZBA6m/1
 VGM/Hw8haamrWpJw7oVoJRY5FbUCHd8S7KlBuSpt3XmJA+ZKG6oVCZu96pM/ZOJCYp
 DpjeVPd48SNBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=utLS/C3T
Subject: [Buildroot] [PATCH 0/3 v4] support/br2-external: fix shellcheck and
 better document BR2_EXTERNAL (branch yem/misc)
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series is a respin of an old patch [0] that has been
lingering for quite some time now...

Baiscally, the case is to only document the fact that BR2_EXTERNAL is a
space-separated list, like all other lists in Buildroot, and not a
colon-separated one (but still support colon-separated lists for legacy
purposes).

As a bonus from the previous iterations, the series now cleans up
shelcheck errors in the script.

[0] https://patchwork.ozlabs.org/project/buildroot/patch/20240904205354.504964-1-yann.morin.1998@free.fr/

Changes v3 -> v4:
  - fix pre-existing shellcheck errors
  - extend commit log with more data

Changes v2 -> v3:
  - add comment in support/scripts/br2-external  (Fiona)

Changes v1 -> v2:
  - fix typoes

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      support/br2-external: remove leftover trap
      support/br2-external: fix remaining shellcheck errors
      docs/manual: use space-separated list for BR2_EXTERNAL

 .checkpackageignore                   |  1 -
 docs/manual/customize-outside-br.adoc |  5 +++--
 support/scripts/br2-external          | 20 ++++++++++++--------
 3 files changed, 15 insertions(+), 11 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

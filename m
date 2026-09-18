Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A6AC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 834F440AE5;
	Fri, 18 Sep 2026 18:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QA_vjERNsBUU; Fri, 18 Sep 2026 18:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A45F140AB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756946;
	b=W2Zejp5JgUsSbEApjor/+B0kNRJMOv/Fkn/PaZ+VwFbL3N9/+u6CpZp3mrjmpYKYckBv
	 8LjG5W/PRC8eO8RXjEU1pSwTgqRoL4fbaGCPuY7uRNgma73FvFmYFJrPETqPDNDKdwsri
	 gDGw/MOpqL9tHKOFslzBiqoIOIcehTfSDoS/6Z9AiyAQPg2eRXVtsbgyId8edMTqAYj6r
	 OKpwWlHWMfhdeoJjYe62tz+5njx+p9o1B7/YWe2gZi4uTtxfEwpjXorFtb3P1BHT010Gz
	 Qfid+P/s+M9NP7u0toaep1h9CA6ASGpzlJRPvQOhs2Tx8/9DBfdroYNdc0PpmeInTAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=voLgU9krUGIB85ADxIiSQsju9eiZ6O38+FlkXwA/zkY=;
	b=LLKO7DKVmGPGJUk7icCAKkL47PgDl+g59n4AWs6NyOzETolMGyg5/zvGuFNDcfiRZclq
	 /eXg4cgu0QZJ9YpyZ8NPlwlatRniCbO6Fp6NsHeYDKV/93o1fn9gIhgjDEErEX3aEmkRY
	 8Xtyj8SED4EWvc1KQ3g06oiy2x8/55I96SY1l9iyM4zndQLdB/m7sIV4odsvQVef1dclE
	 E9pxHAKUl6CVELEphyvtU91VSDJseBQPtJB7pktrxws7axcz/oFrnexmik7KYOkwTLFBw
	 EvXvXp/W5UbYnBoa4aIbzcB+YYxAsZuwkCDXwC+tXQq6gcCq56aOYcj3oekstl+SLdw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756946;
	bh=voLgU9krUGIB85ADxIiSQsju9eiZ6O38+FlkXwA/zkY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F79IT+DlJV5W39eOKiosggi81VQd1zGjG4M3BRyCoL/Pr820YranPrzt+iGCjR3ZT
	 f4VE8qA5JHMKiDDcrT92bsHL3yjrdWFT9+r41Ci9B4+3FpiGk0k0C0QlV+a7KPz/oI
	 nLL70xxBESqfgS879zTXgzJQBVnmlt5BIJtrwvDPT4Ptt2b5OF8DKZLW3inVicZ3Ll
	 9jGu3MIAGmDTHcz1zrL5V1XOIw17bR6Xk+fRTGeMyiI2pxpqwulut3AyL2dn2JI/vN
	 Vwrbsx4ZlFW3xEQVA3P9nyQifTh0brj3ppmBXIGbLIARlVUAv3gLIeNQfIbcz4daev
	 r7fiS5zJp7NgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A45F140AB9;
	Fri, 18 Sep 2026 18:42:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85010237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7712760617
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HPUc2PyQSIs for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:42:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4731360DA9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756943;
 b=bhXeYKylvn0fqQEkhdhu/JXw9ZOhi3XTtcnl8jaj/lGwWmjWo7kVQOTycaZ/fnvP6oG0
 MvT6AOZ+kunE3Nvg8O6aWguoCgXRb81VJ5H83BUIx63pvuqF+2K0Jtr9WpyK90ykfEpWS
 YKVQDxdqyl3oVJcqvVAe5MpuYPsNhyZvFbM+xRDFi3Rr5RJkn4H7N1+SKQGY9caQvbcyX
 V1XmkZtuAO5CKysl0Oc68BcgaY+ascm04p/SVswyh0WyA5ISOh28IapFyGzqaVnszmnhP
 PmKtDVPiDtBqppTyL2N6y3ohHtaAEvD222JKDED9zyvQlHCumSi3DZWDTyU5+32fcZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756943;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cmE/69f9wuAP1rqy7nraQnNAA7h5ltgwuj+wB41F8vU=;
 b=h8+hmPYoUeDZIcqG0UX+bM0kJ98Ek46KuTMW0c37P+zFr717QXwLXPe3EOXPWfhznHzu
 nphAnD4BTgxEVP07NLiiZcW4d6UGKnppuziinxgRGbygDSgOk1DQTZENI0D4yOj5YLjZp
 vH/osnW7xW+zFr7LwT6V1IqeuX+isLSXnwuWKsxvn6BgfIugqa/Qz2p5vt0WVE/wDM5PH
 y0rqYExlMWSkOM/M+6BiTIUYtojZY/XsfeY4CNQdVrH5i35lQPYlJ1sAcUlD0qGhdfe/1
 g+Mesm3ocndyZCFO10d1iEdQlnnFEbEL7GmMvpoGA/eNP3qp0k/68Tt0H4R/1+kazrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iZ6BkBEw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iZ6BkBEw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4731360DA9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756903;
 bh=cmE/69f9wuAP1rqy7nraQnNAA7h5ltgwuj+wB41F8vU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iZ6BkBEwWCF5r0kc++xYFr3hXdcfsJlITzhEkRUeGHdV55kJQvjwsrLBbhUHOSXci
 6XtqhdxZLza9lEVzPHM5J0sY2k08sZMUyrIK+EJIQYkV90r8Zb22JxrQKeIAC2qEot
 v9EDTpfeWDx1HjIcNYC9v6obXKrA3vg5IgNqZqYEhYSc/YKccv0coV6Gw+pn0tWK2b
 Kl6SCu99x3pVseuXmcpzOpIIrnkHZ/kB0/dfG2RzaiDI88t4sJWOQGE+9nSd9iSGaz
 mZvqtRNxU4raEk9xBGSA6CsiQ5kUwQ99QlLPKCo/BAGFcsdFMt2OvBU+26VzTHaOBA
 ILnP9kPMRlKnA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:rW7y42XVy78XTxNiOq1PySKOfFgTUW5ShQ9CuKrAEsTCUbDQtuSLgtX6TbjtjSYzm39/NAWDBc03FX5K/rJEVtim31jV57ZieRXWBFgUK4SYkKQrMEVOBGM8I59VeGKWbMz+jZnueWvf0KChsbsO/2FlI3+Q1gVKmPLgGLvn8yWD3uyPl/3zM4vGVv1S7Mwozum7v5An2W0+E7GImg9GV9GZbAYr7MgcaGeL6ftQ2RXs+BfnF37SzjOwCnEEwUih3T4xndzVcyD0Pecozs0BsK/tOup3FCGCuV4WjqOA8DjM1FvoDxidRgh6AVlwI8qsRu8GVph0PEzXeXIFQHndHrn6K3w/huCUtcJqeIuhyZdtG7Z5Uvq5Ndt/75jCcuGkY0DxZuCQa3YtA5hif5ApIP6bLeh5y1UZe2zDgXo21IjfNtZL3J+dTDvugqTnyiKNpGYNjBoUruNCtam49zmKJY2Zbn5awr6+fzC/LmMY4cRBwV0IfhS0rIM0huNdD+y1iqfvRIeo+tq9rAGHQebXIiWx+teFuqduVJSrVOs+0PzYvIaSOAcvIiy/V3qaPvFvPeRxjZTkUEkB0T6wDwLXRQtixrsebUxY9WHeU+vnlLpUZf
 0KopjGmxKSIwjraTbPO2wNNWx6OcolQl7wceRovtdg9R1Tp58TfJWSpr8isXhPGw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9596A4C46B6;
 Fri, 18 Sep 2026 20:41:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWp-000000007cB-1eIc;
 Fri, 18 Sep 2026 18:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:25 +0200
Message-ID: <20260918184140.3631274-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 03/77] toolchain/Config.in: drop
 BR2_TOOLCHAIN_HAS_GCC_BUG_101916
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The only package using this option was heirloom-mailx.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 toolchain/Config.in | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ad73204b14..7452d96122 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -196,13 +196,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916
-# ICE: on SH4: Segmentation fault signal terminated program cc1.
-# This bug still exists in gcc = 11.1.0
-config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
-	bool
-	default y if BR2_sh4
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
 # ICE: on SH4: unaligned opcodes detected in executable segment.
 # This bug still exists in gcc = 11.1.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

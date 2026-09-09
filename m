Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032F2C79F8C
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 08:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A862E60771;
	Wed,  9 Sep 2026 08:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vb7Yh-e5pFA; Wed,  9 Sep 2026 08:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D2C7060725
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788941647;
	b=LLUJkJ5mwl1X3wT4MssxkVoFacsUzvX0McUKhRq8pLntf6dWIs3id4Y54WmQ6qQtrL59
	 DUvJlOC5nohZ9TOWi8P1Enba7kgFT+0wzwNpnduhbriUEVY+Ku/Liha9517UgJix3TH0w
	 r/fBOmNCA49Cy4vGC+nMClcCkHfXQQ6XHoB5cNzS5VgaMlM+ta55mo5YKAd/5WZOGzo9E
	 Ni8LSLTZX8DXsEdQWYfvP7eChtnx1mly9bNlQozQoepl7vjK23OdtWsqllXB5+b5jaa5D
	 Sl67dWhcb66Rvnqb+IXQIaDUUPoG19cIcmbKNHBFxkohsx80OIHPeB2hjBCY8fg6N8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788941647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wznUMUhScBBjJOUYggetciWbnjQNpjrthHJUTGSxCHg=;
	b=M6fQwoGZOKbS47akFtpHd51nfDYHmEa1OqSZG+Y20oimrxjyKN/5ChqGk+nGPNo5Hokk
	 LzlWr75XQ3yhUzil9nPqn8g7E3WLsBkf/KBUiSfgZIIEIsBGB8U12R8Gpwduel+5RJ1VN
	 jaSL2nhPFlf0X/wwpt89bS0gDvisHBHjppn9l5WDSuLf+t1VNCHFX6P0Vwegn/RMg/wJP
	 LDztjVHTGDwLsu0Pqs+lVNekiFZyxda2d4scMmx9MG+Q2YV3iCW96uTFOSsNa/JUELitj
	 WHsBIPwkegY3IWN8ML3nfCvy7xmhQIk7KSzqCDhdxVYgM4c2ip8ynb1e//F66UNVVxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788941647;
	bh=wznUMUhScBBjJOUYggetciWbnjQNpjrthHJUTGSxCHg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJP+y+e81uQUPcyioJCNJ05CCnHRTvZ6lhcyXSYbQSBe7dXxFHCLStqNAniR7UplR
	 EbqW1RuKEaNqPhomyOiwPw8y27YT7OpOa+P6EsM4nyr9pfkox8d2CqMNOcYCe73iIQ
	 hDrHxxnJ4T9i73usgQto/2eZLKD2cNkLagXNG2sisXJFeOgpsxQ9VdG60ZJ9lmU9ei
	 q0yc285gZ+SJobCRpfijO+7qWEF2IPbRRfEW/JxMQ3KNONmo0znIX2/Pi+D92V8vw7
	 q3pIybah46YEteNMjdjube2DnbaeshDGzIodCRPxHmHZLlFJxokKSEPCfOE8ywRjLf
	 hqRZdoYRo1Mww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C7060725;
	Wed,  9 Sep 2026 08:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CBC724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89EF406CF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_rHi_8c_jvO for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 08:14:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED62E4069B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788941645;
 b=OdxXP9dhVG4Iwb77KK88gWDVS4qdpxIaUOfxrZlvCTueRHyA11g7ROPh/9rO1+gIQX5e
 bNRNFLTtEju7m0DvOX8bG52HWcZtfdv0jbcH/HxsHH3Zwu1XKIGMtKWjLx4xSOzH5y8o6
 GBW2ul5cW64TEmmuveoFPx3ugE2usef6pYRCAcjE+34grGV8zaM3w/GX0p/ya7aPXGsoW
 fMdCl6Oyp1WHyfBGRzwg/rM1qs2Lm80hxc+4cukMc6hpMIOM7B4kwU29nopScZJf0UxDp
 Saa0G9u2kG6qmE5ct4EOKaWJK01X+YYb0oWde8t1DCsT+pQR3toRZAPJMqfKHC5wAUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788941645;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=001nxBcUwFHTHA30i9Zzp8aUMMpjuoIAlj4Rz6T+w2s=;
 b=CXa0pYRRbL82wGR0Ne7nnSoTz5j/eR9Qm1CIRtlscHvH69861fUGElxNGN9pk7yK2bwP
 UlF3IYjsy/t3CvGdPBoBaso7uJU737y8RUejbFG8bvK9WPil/X9GYPO1WYX685fcyx04D
 ABqHdFxgXY04W9cvYwEgZFJCIWMEJ1kfUqQEHbDJk2ULWelupXo5dyFeHJ2bF8MTznjQJ
 lUGGBfmgmeW7fYX1BN9NBxaWkJSLz3v9I6GF0eZBhV51wwGHH+TaMDdOy1kBqHhWuc+3W
 nuOwCFW+EtPk7Ae5XsWXn19h6iTZ/ukGrP9H4FzjR7+E8tB7lMxo1gFUet9GY8eiHJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hGflle89; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hGflle89
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED62E4069B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788941626;
 bh=001nxBcUwFHTHA30i9Zzp8aUMMpjuoIAlj4Rz6T+w2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hGflle89sc15unqV/jFljG1eLoGDeLFsYFYPaCIDqwtHgny/Kyq6745EtOqxEmAgs
 7s2InhQM9YI2+/G8ftgF5dViDEq5nGSq/pEtSiJacWdGzXMYmYY6HJVrivtD0LJ4lj
 ipzA6dzZZ60ULa6HMFdKg2Ze0RdNMtkhnQWhzi8IOXXkNFuIS4MDhjfTuIDYy07oMP
 WVOSdj4gAHOxObf9LbaStp3JO4tBFTQiu6z4uVDNdNUPXSLcLbXo7B91r9Cz2d8Oz1
 JCvhXOzn79xCFuRm0l7GJssL1K5sDitx49xEG7zmdBXc14Qrx40jN+fl9h8sjwwxPH
 o8Hcp2aTGX6+A==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D84BA4C310D;
 Wed,  9 Sep 2026 10:13:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53672)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4DRC-0000000012o-0RkI;
 Wed, 09 Sep 2026 08:13:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  9 Sep 2026 10:13:42 +0200
Message-ID: <20260909081345.3114385-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909081345.3114385-1-bernd@kuhls.net>
References: <20260909081345.3114385-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/4] package/lttng-libust: bump version to 2.16.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.lttng.org/?p=lttng-ust.git;a=blob_plain;f=ChangeLog;hb=c896a32e65fd23d30ec541f78e7cb5867ba531c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lttng-libust/lttng-libust.hash | 4 ++--
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 946b22d40f..1f82e33b5b 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.14.0.tar.bz2.sha256
-sha256  82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763  lttng-ust-2.14.0.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.16.0.tar.bz2.sha256
+sha256  1e84e02fa1fc1261eb6cf3d14d64006506a29f7c605ac85de02180318c6aa38a  lttng-ust-2.16.0.tar.bz2
 
 # Hash for license files
 sha256  5a93d5831e1297ab10fe643e1a631e83be392896da14ee2951285a79012df69d  LICENSES/BSD-3-Clause.txt
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index fbd565271f..7ecb18748c 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.14.0
+LTTNG_LIBUST_VERSION = 2.16.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
 LTTNG_LIBUST_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

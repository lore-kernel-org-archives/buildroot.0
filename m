Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC0C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0582D40B05;
	Sat, 19 Sep 2026 16:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC95kDpIADHY; Sat, 19 Sep 2026 16:01:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B64840AB0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833717;
	b=gzDNHfgwvhTbiiCHjNiK7ld13mtJ2MN6bmA5AigFbUJ/XxrLgnP84e/WQ/KEQ9qLmz5u
	 WH0upkE/j0xQQ5tG4Rc/vqxZNQyQ7n2mOVtL9mXECEgdhJSkM7MtD9YuUJoofd6TrlIxX
	 OeUQkE2R6FYKDvGBgqNH39aHI1TVCpPW04ORv2pTzB0nPoo8RhtZ//o7QJrku9JJRI36e
	 1+9OdujApKMXa12M25FFZtU95ESb6vkjd626O5n/W53+xHWZpwWVBT0BWe9DnhPxGyeep
	 ee/fK8bQ+nvlHNxEapI/Kok2P5b5YGxJGEIejz1P+e0nY/CEfwDJr7t+quYA3wgS3TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=i/6CmZj1GJhKF2YBj+ooq+U1HzpPwGF0wahOR2LYupLLeJH0XKMBTVT9QKFtI2DGiYGF
	 Er9UKj5g033wpr8MYPUM2AWUeJTXvH69KLVLKQKgMu1AQaL/T5zgVipYLmc9JYXRwyfIk
	 zPQJKXzUdhZaUZUrPfqujJfXvI0q++eiZ0uavjwLuFpfEeFe1kDeDDnkOMVMYG7BquSvg
	 AvJnjbco+EcusS/GrkGFD09TiGLjhAKNS4CujZoU2Kcw/d1QLO46uwJznQWH4xWaZNTKT
	 3itW53IpMJmpiKIin5n2K02JXfgpEU5N57nDj4PYb8MmhiQuB1RX2n4stJav77sb/pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833717;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PqPFFEXRhbLpqV408saRpULcXTV+zfq1HaKgEMrZZf7LvOG+IYeSXmTSJcEHei2hj
	 z+TsQdKRvct6nQGik0WZX2on7TI3q3h6W968l1CSXmg3cjMwFjtsMgabaTNpJWrDWl
	 WirImq95JG9Ip04NHgytg5Zrxkjv83/mTcwAYsFH0eWBy1ZQbhlUKaC8cPt/JoUz0N
	 XcFaz8eswA2qhApBRdeMD2y7028P6NUL+lsTFYNqE0o6+j+78Qtsgv0qz+QQYbrS/g
	 0jit2CsCRaSMNjdbJpMaEWB18zEG0pIf+3B4hUIbGQVO1Q58eK6uzhyjgTl+xfqr9m
	 GlEOpKuANAyYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B64840AB0;
	Sat, 19 Sep 2026 16:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AEEC37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D0BF811CD
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9GSk0RwOu0L for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:01:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 445E581100
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833715;
 b=ZYu7c+/TLYWWRvOSXK9IqtMVUXzHDFQlcnZUA4BOU/c5KR46yjQaaMYtCMZ28ppYevf3
 jqTGANJEizV4iSj23R1+bXxj/40Ez+RdoHM3nH7uA2QvB0XoMrASnpAYkMOFUtBPIgqY+
 fUphx+3XJqK6kiJ41niPzbuOvchbLInmSU2CgfGJfXVSfCh4jcKZXiWc+H2jTrB7W215K
 VqHK14+eMeka5OfteJ7JyVjani4eVcIKFQ5h5aYNIQ9vqrPXTFWzABiehDDq7up9s7bqB
 0libqRlXy7/0vuCsKOvP/zqdFiPVvA9/5T3WDSBw78Rwbk0tysm7VUuo8EdHbCvSsqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833715;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=G9bAXiwGX4xkNM0Ublpf5z7jRdyKLuWSwuTbxRG+YlguThrtPUEPaiL7NQMjJVusB/Rg
 DLxOoZpMUB8XeI16rLGKwQj7yuBhzh3eRsUPZTNOLZhalshR9+/xOBEcOd+lPU6lzvt/5
 Pyk5WQ0+EQVbBpdJob+H4OLaOXHRopCIfVWAnzcCUjOtakJ9MkX9dhLBDJUhehUuFlEHj
 l+qqYt4+Uu/fTTUFwqb7kSkklJ4ah4+sdJAD8piQdtYyNXeBy+L0pQXV2cBy3AqkltUYN
 n+I1tcOPSl9eAjnDsElvCX5Bj71fQurH4jKzlSit6OQgIiZ8bht6UCqHX6TEIKcdN8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W6h8gCeS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=W6h8gCeS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 445E581100
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833541;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W6h8gCeST0NSWknBMrlN0YDAtaeL3taXrCPTVsVxEo49V8DSqfVmBcBOZiXjn4Nit
 hWSd+Um9KakRKuwRkfZNBJadiqi8rxUOilEDCRFLbkEYRxIxCO+g+hg7qf3mbbweOq
 NjtwjXJ30GERkb669FasK5wf8uj2gKaENqoj56TWM6+7yCJeYfnuVQBvtE1wfPh7LN
 Tq+pC4u+KPIA45+iy1yeJ2q/FK+F6ZurGUareZa4QjhMox9Vd9cLHVkHWhbEqth+0m
 Tb0xKFLiq9OQNj3sOCR/2UNdoZKRPAA0B1tPg+zFaowRHgOtJQPfDp3TZHPQpkrHFr
 EK4+yyzirTFVg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:weA2H0cXwetFW7MlpDCAw9HTMIGL9EoFZG8b8Ml4viofrfcH3xmv1zY+qAgSvE2sd5NzGubI/Lv7e4hQkS8naauTnR4c+wc5AXOzaMQqpxMao9/5Y3N9FOhGWOlQC2ES2+0N6rQLJxuzre+rchHMBUr3im8aMda2zacrimFhhGIk3BVlxs5+uV+mhfMxpC6HOWmQJhZHKyItYRfEMQe8r6fb8P3+032qhSNT05d5tCy4grWMGU8fB4wO9JJAV1ALdL3/AJLVozzbYTxEBJDN0dzrGHjHXCLmQk0nr/uPPGQ7kXrB56ekikzJ2gQEpvlofv59DNSgWgHhJvp3zGRkdCfwucV9fFs2V9/+bjf4QyBBUMvPdJOAlNpWl1/m6OTXuw5DZ1iiu3nJX1NTh6LWNBEZ26Q91hjedVDKJpPjP+sOBeTu429CeU8EvYlHrE2JBMNxd2TYSR2TTSc1w2m7LN8vMwVcBgc76uaVPAEMXB+kexXy+SghUUNye/7461/KPjV242dZ+YGzYjMw9eUtD/0zDdbi7f5ZEtk0D5eQHbb/YUHU1fKsCB/1UmmDPXtH5cjCC4/Ow0pNOI0K1REwu3QYJ0mX4DwKQ5xZ9rXPnlLUFO
 UxJcrKAw4Qdki61TsH6atlt8YqgKcBwzTa85JDnPTOvEo4lznj0AroRCZk348TPYlEE+M=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B72D0A4C47AF;
 Sat, 19 Sep 2026 17:59:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSo-000000005Jx-3Khr;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:53 +0200
Message-ID: <20260919155845.5776-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 28/77] package/snort3: bump version to
 3.12.2.0
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

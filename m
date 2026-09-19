Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC989C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 15:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E04540AE5;
	Sat, 19 Sep 2026 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEkdrGhAl8FS; Sat, 19 Sep 2026 15:59:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0D20240AB0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833590;
	b=teNp8AIxxBXepeJENRh4/4l7+dDPsY5avG5OLI9xXuRs8EPNYwOAiltdf8lbm5vXvgi+
	 Z49aoRsw2hxo6eI7tj8WzLlciKlEpzK0g39gDsuvucHs3B+RkSpMNCDizsrc5ohXStqxu
	 8cP2Jvy+WcIGjNQyPP61IzgXgkxzX4aHjrUM936TUzwhJyeKW6uX1/PK2Mo57SU+JT99X
	 Lm7z/xjKjZco/7bu5CEZQRUtY1+myhlDZ9hEoisSWBDAsOA3Uke2SsuPTetzC2QIT9pa0
	 GKh73wOyzaFJzBuoygnffxfO2SVpoH4Q4xiy4NrIXSet5BeIEQnLmQlQ7hnxkar1EhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lyfO52L4nZzRNfL+R3GVisLkFCBuK5vi8HnRhRJf1qQ=;
	b=UMrCQWN4UzK4IpDigW89e6JgmSfSv6oFEiyCFzrbdp8zyebrsFS/GRTOTH5PPAledp7s
	 1KOgCPKmCYZXthscXoutzpSMsfcWkW4rd5J51a08GrXRE9EWDKTm3gVQtIU512rX26h8i
	 5eC5JRwDsUJID8EB9dTs1H97JpJvNHWg6SWjNpMtZ5B4n4Boj4neFq25xP3SYChef4Y/D
	 /GI/SihKiFJeDhIqLElra4NNzjJUy8rPtUg9omSNu9Mc3AEfcxcDHBkGpzD18m2QQyJXL
	 6jWpuwp/JHkIV7WlvcTNJTNxvtdO5CD1eY2jbQVRf7ODGfNF/mMS9hQpTcNN5/r0YPw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833590;
	bh=lyfO52L4nZzRNfL+R3GVisLkFCBuK5vi8HnRhRJf1qQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FFJLCNE7ucQQI0r1qevx/1Q3ICs3A78mQuHALczbfPivOrGc7+tHm2Bcdt8hWiCAP
	 rBFQgGjBN4BbamTYzU/wGlG3//9x2QD2yQ4thlCo+wCXxsm7qRqCoCiwKi0gjqnkhb
	 wi6ngFsFSgGiP4GsziawBk6Rkx9o4ASn2kIvwp0JQQwLg066TV9JKmqDxMfa8Xqjdi
	 E1r8/tjye3sI+CkSZ8zNfrW/SQBmdl3A0SYbgStOnz+iP68NdBY2v5o8GfG89t9+GA
	 mR4tYouGyNS5pVLIj5SKxvfOS/YcWtl0iDgZ2oF8YiYFtbFyutAwIzA7ab4AjyFNXp
	 APQh9/jBFiMVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D20240AB0;
	Sat, 19 Sep 2026 15:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EBA37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6722481182
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CANB9UJxkqb for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 15:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6800F811E1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833587;
 b=GeT/nc7DCPndNDP/Q721nXie48fxOEmOoSoV9DymeSUB86/czJcUY2SF+ByFvSQXjPLa
 7KTl1H4RgW0wto+G7f6D2ZpUU+DO2cmHTTnjrzW0VXyPfRkw3i3hD62KBNNWnXW5RqwRl
 UB5nd+N6HceiUJC6gvqbC5vfpMZfKOBzZR0Ec4qswyPHDcYDqugfnqkB90s8qho7vx4yN
 k9tjpNCCMLMzQ1LbKofsCuLvkbTna4y6j+CYZz1iSmhtTOvhF/QA2J49VB7qsiJt0jqVo
 2edIKGBkrPsf5bNcDGKNV09N0QmEjWDelTj9G7qht7ARWVKeeCCMV1y8DzeMXO5zq5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833587;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4SeHUKyoFLfS0DEuTApxbr0zpXzrODf6Z66miyFZQBs=;
 b=KlbU5YFGSnXmzfA+ikXQwjG0iA4MB+oHTxR8JkHzs6U2pRGbFeaMWLytuqKOxLjWRSpN
 cRa521RESleIdFXGyEBSrzj6/6VXR5cdDIB6LXakZGJ1Om2n/mW4RiiUXAvmV1tU7V56u
 GUwgObCYsyQoFi4VxAS4WhC/srPF5+C/KTdURMYULZ8d4JPrf+akxZCtY36BTl7MzR1hb
 k0C9lMvXTgHJowEMRf4dK5B7xSMLaTb8ktzmaLxc/Xx/6J6dhPiW2UJ6C8WTH1A5gtZdq
 KNcT6Yev0vbv/voZeSMjI2wmgYJ32k+Vy6r8XhT1JdceOhHLi8c3ikAWwk25EgruWBQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="gysKh/yS"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gysKh/yS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6800F811E1
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833530;
 bh=4SeHUKyoFLfS0DEuTApxbr0zpXzrODf6Z66miyFZQBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gysKh/ySEUJj932wTg9BmASEKFfenh1Jykt7Ez+wv8WplaFvhqkTY2GbRqkq0bCC1
 9iDCptn3XpXqp2HgQff0zgw+EKXuQAFTOSQiAEfkTXXfvz9Q1kqlU37f+6+JP7q3iw
 qhRy51sgEofq5yvHoqn0yrJlYCSqKBV7Hom1xHnzg0fivM24OwmV5wLNAFiQc7VY2r
 yaGEKGmgkpW4Xl11AW9sSGasueauJNxo0ErkFmM5f3//UEK2XOY4aVu6531ZNN7eHO
 q2wgUniplXwYJVLW2FYEPOs6B4S3+he3VbQcejDwHYYeDpyhmDhyDkRdXMzJagTWxw
 RQR6U4lSNsuew==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:xM/uwzpL3EkB8mL7+zIV2T45XVbXDBWSgPQnkRhrToww+k1yfSFOfTWnrK50MbnuMpU9zccZPEK4WDWE7VoJy82HJIwEnk+LyAZZ4U2PqqPBvK57wTATt80zYcRFTvBzcBUZuF5AY/WE/tW2zyMTAmUJYrhGlD2Mj1y91J7wUKXqRBgqq6OENNPT/M5YEfhFTP3oFXjOP6VVqNSbUF7nbVN5dyb0cMpiYX4/Nm0Faqyt29WMAC7ULn7KrRWkRoyF7iLzsQK7YgF6m0ByWF6bWvDhzGDTiLoG4RQcLgOhr4/jr+NTs0ule7PdFLAiEW1CcJwHdZthqUVEP0dU6r6e6dNvkASmmH3rHJC10KfKmSM/JQB7eT6cA/gjf9D/RRvtjIOyBNdvrIE5jHjAuIdXPhpDYKg2CRHeJgR4n6sFr5iUrPTu5UcENWYidzGNU9eKjVJQ7as5EMRXwlUIF0tVUKlXZefwfdpbjCBMZllYA1OmCtrfRuSVOYHbioSuE7N5aZH4f5YeY/+lC46+qF3WrXo6THy5JNZ0tqCgD819hxKBYpxGSD3ayPKwgZC0xiQQ+15VQQfE0ggQSAvgIQulYX9GwVYdWVXzifVb1tGxl8MJm2
 iDVW816/xeapqGv9+B0YRadg2M0NJdgvLc+sJi9yoHe6LEcJjb3zsoRky+D/nPiYzXmU45aWjokQId13ISHWeFpIYNoz/0F0sxEB8aYoW4rByQWw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C96EA4C4799;
 Sat, 19 Sep 2026 17:58:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSj-000000005Jx-1U56;
 Sat, 19 Sep 2026 15:58:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:29 +0200
Message-ID: <20260919155845.5776-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 04/77] package/qt5/qt5knx: remove package
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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

Build is broken with the upcoming bump of OpenSSL to 4.0.2:

ssl/qsslsocket_openssl_symbols.cpp: In function 'QDateTime QKnxPrivate::q_getTimeFromASN1(const ASN1_TIME*)':
ssl/qsslsocket_openssl_symbols.cpp:1352:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1352 |     size_t lTimeLength = aTime->length;

ssl/qsslsocket_openssl_symbols.cpp:1353:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1353 |     char *pString = (char *) aTime->data;

ssl/qsslsocket_openssl_symbols.cpp:1355:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1355 |     if (aTime->type == V_ASN1_UTCTIME) {

ssl/qsslsocket_openssl_symbols.cpp:1415:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1415 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

Last update of the package dates back to 2020:
https://github.com/qt/qtknx/branches/all

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  1 -
 package/qt5/Config.in          |  1 -
 package/qt5/qt5knx/Config.in   | 12 ------------
 package/qt5/qt5knx/qt5knx.hash |  6 ------
 package/qt5/qt5knx/qt5knx.mk   | 15 ---------------
 6 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 06d06110cc..e6c4361bb9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5KNX
+	bool "qt5knx has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5knx package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_QT5OPCUA
 	bool "qt5opcua has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8aacdb639a..d15fffea27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -249,7 +249,6 @@ F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
 F:	package/qt5/qt5coap/
-F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f5245e723a..8b4903a5ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,7 +44,6 @@ source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
-source "package/qt5/qt5knx/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
diff --git a/package/qt5/qt5knx/Config.in b/package/qt5/qt5knx/Config.in
deleted file mode 100644
index 991e93c8cb..0000000000
--- a/package/qt5/qt5knx/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_QT5KNX
-	bool "qt5knx"
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt KNX module implements the client side of a connection
-	  between a client and a KNXnet/IP server. This connection
-	  can be used to send messages to the KNX bus and to control
-	  the functionalities of the KNX devices.
-
-	  https://doc.qt.io/QtKNX/index.html
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
deleted file mode 100644
index 2600a739bc..0000000000
--- a/package/qt5/qt5knx/qt5knx.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hash locally calculated
-sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
deleted file mode 100644
index 91b99aaa87..0000000000
--- a/package/qt5/qt5knx/qt5knx.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# qt5knx
-#
-################################################################################
-
-QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
-QT5KNX_SITE_METHOD = git
-QT5KNX_INSTALL_STAGING = YES
-QT5KNX_LICENSE = GPL-3.0 with exception
-QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
-QT5KNX_SYNC_QT_HEADERS = YES
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D75C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B08C60624;
	Sat, 19 Sep 2026 16:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gGapZDvHNYy; Sat, 19 Sep 2026 16:02:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA2C66066E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833730;
	b=BwcdQSNbLmfjYCrlMX8zjIKaizFTiW/epwdoP0G6q+7xHO4KaaKJ00Zhb0O68daL/z0S
	 rRgYZ9SpkiKmW7AUkEpFESyC/eI7zeyxU/H89w1UuD+j9erHNu8kMnvmIpeAtrv7prqXd
	 v3fHTQnqjriBYihAnL2s9ApfeXzmPbG65xChoNpPqQjcvopW1rUFEkjFpsxmSoe6WWz09
	 8v4Yfxqs4ZDuk6Cf1ZDVZlgEMBTZ30/HQ51ESRah19lGwXnL0ybKLF1DcLDbSWNbQcWEg
	 ilsPhnKmGBmjq5MzKjQK9T0mZfQoyEQebSdGq4JUlD0qD7Y/EnDAz1dKD0gUcfnoT+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=BvYd5tia+3dSN5TeiH+NuwuKusipLttHOoNW5HEsMsZVEUpmA3NW5I4CeZ3+Ru2ZJYoL
	 ajXCtNtdTJaz0MOIIFAtDwzianvAOfKWtMSVzXsTrTgZ3aitqt9IcRzM97Lvmfp0gHBQv
	 fGp/rhR2D7F7VZPQqVb03ujOyCp2o1vkUNsqxbUoNf+ebklM0GIOYa8HvaooKoGGR1vvK
	 i14YHyMiqk31bI0lm2lf1FITqQDTHyxF8Tx1qN8aPpRj3FA5l2WvCHV4e33JBjUbVDjde
	 EgcJID5/xQFqmyor+xb2NEZ+Bo21JNUuSEkkuyA8om7a/J62L4KdYSW1MKBcqbzNweQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833730;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HFD6cHa1Zb5fkTG8f2FcrWM6jqblI41ypSehEtCAYZ9FXa6N7WqXCz2Fr4ibXd5FV
	 KGM3DJxNLjVFayLuSwmJlWBLTioaDDFeAibtht24DTTdxNt4iy53k3MdwfbDK0JDCo
	 YiWXhetH9BdEtgnTCXja07kJve0OYscx3eCoqbtB4rxWUbnPvddhVQjscmBnG6/g2c
	 Ivq0Gdlg25OclYtlXO1nRtfvMfQ/OGxKJD2wTVHsQaeuxka3bbuBBxLCqWo6xOE4vk
	 ZC1BtGWkIoeCO25bqaOcW4z1O/SaXvSwDMhQFgLsQy33WjM5EvgaTXSrdpW1c2z+s5
	 er8Gsx7TBDvxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2C66066E;
	Sat, 19 Sep 2026 16:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F8024D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA8D400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FGbCEdo9MZz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:02:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8A99840026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833728;
 b=mWZJUiBuX8dI7OYVBMeK5ENhsLyhnAxAFeHcc1RHjttSuFfy42EbULmIAirnKn9xrv6/
 /qetE0g+ScAjIXuWWLRIEUJ04p0NqhfU4vjo2g/IRhqqzpQOhHwpkzPfiAlqzOs35YzpX
 K1Qpwyfr3zoC2IEuyHUf3jPvsBxXBe7pb17UPqeJVihqmMEghUNTap4/qMMyksSHF9TIm
 RdsGAtjcNhdUZk2WD1iM7e3es1o+okXYfTqSYRxhWHk5RBPjHGJ9Rfa1i0g9gpk1kA1a+
 VDvaKaZCQiJvZbPDMLZdx/BbR8M6vUi9ao6hqqPWqpcXmIAR9U5QFiIAxP1bIk1XxZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833728;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=n0voB22CuyELeqVt87oYvQZQLmcO9vhGoa7HPq/ipJo/1IcHs02nYkB5PHWFmb9g6i4f
 2ZUrRvD2sEkzXrSb5MOaKZRIC71H4qrVgyQJCDZ1x1iymOZUxWdiYdRLlZBzwtWcVSgci
 qq3ywRICsfmDVS6PlHumKFPnuXoTL6kP1kaTuVD5FbShhCbYt+phj5mDKCDVgpWl7i1df
 5QhwIpUoaWpDJC9QXECTx+7WqQpSjNl1HaruasU/NTeKPjCH7ZoW806VpsHufpj1Sf8IX
 CrpCsKj8UMo6iKIqBbzoXjBggiobJHR8c5j2LVfn6vVuMC/UkRWJWUU0wLJ356VBSzQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YrIlNHCh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YrIlNHCh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A99840026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833542;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YrIlNHChgXJ0P/Ot+FNwPV34lr/yZbHr+UzFySEMPxHYV6A2CvuKh5MipI8HtqY1x
 /KJU4Htq53ga2jqZ4fDuhoya3Jgr3/Q5PjgI5Ya6dYlkxqvpmlEG2eFdUDQX9y8m/h
 mtF25gkO11qFQYn49gSY9Ka0r8QzOvGgXGTxjVqzSKNWWG9E3cMViPlbczD9AQU0nY
 9AFNVOeqTWf+rfmQ/ZgyLgtDndqc7WjqBqOzWQwzhl9X/vRaUvBC0sU1xlPeWccla5
 1NNoBCZyKlJn1eS9ll4UuRh4RwRxS+bVNIqDqpir3OYO1sS/Prn52JGEgFqbe/VFrz
 kNVG1pLrPf4fw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:GS7A2U2Yd6f3Xh2YYQ/atiqPoKXebG7RAvIPLaF08tuhOxnhADZbtPy1GdmvKv0PqJ5EcTD3RggXqrdUw4cJo9UEJN+WVPM4tJw6AoAzj0AW2Pp1lhsf15KUx8CeThE2h5fZnbpz9IPOulnoSLwDJdMGoN66LmNc+zl5acO3/frKLRReFlCT0C64ms4wOhyVvM+5deuhnjkDctWjYu0xZeUJwSWpTJxOk44KhmU6exO/xMxaqjTrU8WxyUmjzw/s3awWgnYt6XjAyVQEb5wwVe6q6ya2pXDrXGFTxqzQv5qvI+oQas1IAp54dbrt2msjXFCQXaNLtmMU0GavsDg3y5uUkI7NFtHC9cqHD2WoaGHbHnpiFo6MaJHu9KD3OI4l7xFkMmGFhIJYHKsZSH3nrpcTAbTaytx5shIq0PYwNBZDNvP0J0Q688TM1DJBldiEo+ypza7lh3x5KlZhqmImRyQCMWOS7PfsXuHZR/T4QqueiAiJclVC62lLb2oe6WGJuAqqdWX8equsrO7NfSeRMmjBz8X4gTQYbzMgulwxUXtxVHOZ0hYqEDuH90Zfm26l9YC04V85W9/4wP699ZwJpb6oFQgGCoJ1+lHBBrcIohMV6f
 J3whvPZWuk+mBB11Sdjes+vGfOjFw7OI2S1qCNVbt10KCSHG+4w3+5YleSbguba6ws+IQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33C47A4C47B1;
 Sat, 19 Sep 2026 17:59:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-2RMl;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:29 +0200
Message-ID: <20260919155845.5776-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 64/77] package/sofia-sip: Fix build with
 OpenSSL 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-Fix-build-error-with-OpenSSL-4.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26849C9832F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3476067B;
	Mon, 28 Sep 2026 08:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btAT8woWCjzy; Mon, 28 Sep 2026 08:28:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C02B60664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790584115;
	b=aorg3UjtiTy5fx/Mw0q1sbOfVbfQ7kpUZSC1hjdh8yWEfE3sBrl1kc2Wmp29+/8AH4ut
	 FZ3tB6hkZfMC+Fr5TsAT/deh/ms7QXwcpT/my4mfZMd5Pv55DPc39ecCZiTrUiuBEjDd5
	 PfuZ+kbV8WxtdBJcCwcKxYbgLfz6+TMW8doHvaqC941KAiNj1Ezng4CIE1Y1hKzKfZP/0
	 ivEvrz67Ji10CjZCO99+8UuaHn2TzYhfJ/09lAbwvXuxUUpaJF7A43ItqZveKnw407Qv4
	 Wnepi8dEvtDtLkPlz8KcWQUDF0QivEvBIGUDeghwihQ8l9yLAVlbvoqrRFeAZ+FF2cQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790584115;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IlNXdAT1n+tAoyJZj+whHQ+Ia6gBI1HneB2sgOW/Drs=;
	b=iTRVa5Kb31SPnpo7Rp569Ks5I12ev/DZEZdFRh36yoifMg0IwyhfA5jUNNbkCu416Iuj
	 JqMrM2e4HchqpfzIoOP1Fp4d1zsj7O8MDgqUpl1IkE1mp/WFgFreDhFYnw5wPI6iKFUDP
	 M2rtYyGLx73pniJQUxG81Gr4dI2ONxLw1L2bEjNLhY9mmbuk3jNcORsxmSBFCYk+B/HtY
	 BPSiFMHFxTq+rQ1du8DXJiiKFJ6QhqGFt6l9XvU2ElGjbtHik8WKNusyKeieWXE0I5UDf
	 AkogrjtAUT1YA5tPnn02gsLIe02D4O8DB+ozYlv4FwJNTDJluBRbtTICUYpSl8I1qmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790584115;
	bh=IlNXdAT1n+tAoyJZj+whHQ+Ia6gBI1HneB2sgOW/Drs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=COLQrWQiTjcDV6lYc2p7eaF+Ll4u8cdwwL2F+KNMrwLOkKmVw6M4v/jCKG9q0dA7/
	 ITT7PFbagtWcjHc6knQ2cgjEjdm7YTElI5AAWHraQoOJDd+uqtK+iBGux62dfNBLNg
	 vHitPeKiv7wTNAHIAllsQQxtvDfwex+IAMc+Ob5HFFx3x/tNvl5+Hck3UZMjXVeHbv
	 UXF7WSFg9fC5rf2OYWboi8iKjZoR50WArLKMfSvKGZ2IjFoBO6w9uZvaxL8qCgiyat
	 xyc/1LeqLFUnGllHyLujW+qL85dS4K24PZ3zMvuzAQFVBFzCEJqZr1A5UCANH8u9Qi
	 zT9HDVt95b/lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C02B60664;
	Mon, 28 Sep 2026 08:28:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC4E361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D3340102
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXrr8dOnaS-F for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:28:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5E37E400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790584111;
 b=e7laGMgneMPqD3mh6GrBJnqEtvQ7xXK55eYGaP3JaBSr01U0a6nVeu82epe13LjBzAva
 ugQBARMBtPHfG1jJBefxPd/Gg/t8D9ZI/hlLL+o6/KXJnetzVeYv2CX/NY1Ljd8pitkA8
 yVxL5EeIbrtdqTaevkrvg0+l63U3U2WQNR+UamMp6SXg+sKNIkbKVvOGG1dqbooJao5cY
 hCW8cSa73A1ujvUHqAV3vMBivN5GNYmXv3kNvIOOy90gqi4uIQw723vbIPEPmDv1PKxnr
 j/wRzo+ysAnX18j0n3L7asraPR6RiVKYkjR3LQ4YPEMRe/Lw33lMWGyAg/SL5gyu7zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790584111;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Y/g39MrBSOdm3a88IGMlWgf1F51bP7zQYA56ggy+msE=;
 b=Z7Sfr8CMpWpPz+/B4WkvaXw3ExYa4kP3vPRFxUa9Dg06oiu0agkcS7ND17o6T1kRu9UD
 4E7cEw79SwGIuF8WFA9HRF60xs34Va+N4MmpiHydapej9YgwGmqvkxhl+Efoc6Vl6zQjv
 slcMNvWAyX0aB8xth/Rc6QpRGXW6idYdt8wew9+mpdUpwlDOEjky/eMg7TyvkoOJ7clDs
 wbqfEXvGmD/dlXp88upmJxXzfKh25GXHR3nLbGy3ZmOfdieF36LuL2idbEO3A6V4cO+MW
 QMpknLehChtuPl/5fG61Mc27hissOOBZLQObXX4UdV6LKNhzLD1UWt2YPDNv2wB5iSA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZWlPESgm; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E37E400AF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:28:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0AF62C5CD52;
 Mon, 28 Sep 2026 08:29:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3191601BD;
 Mon, 28 Sep 2026 08:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D24FF102F1EA6; 
 Mon, 28 Sep 2026 10:28:13 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:28:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <arok_f9pm2sHStpN@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-24-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-24-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 23/82] package/asterisk: Fix build with
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 buildroot@buildroot.org, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 27, 2026 at 12:42:01PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
> 
> diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
> new file mode 100644
> index 0000000000..28f9d4f281
> --- /dev/null
> +++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
> @@ -0,0 +1,63 @@
> +From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 13 Sep 2026 13:08:28 +0200
> +Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
> +
> +Source of the patch:
> +https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
> +
> +Upstream: https://github.com/asterisk/asterisk/pull/2162

Thanks for having submitted upstream! Since it has been merged
upstream already, I replaced this reference to the final commit.

Patch applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

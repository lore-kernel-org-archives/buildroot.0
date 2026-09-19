Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DDBC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B2AB40AB0;
	Sat, 19 Sep 2026 16:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ETLZaGG2Plm; Sat, 19 Sep 2026 16:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1F43140ABD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833679;
	b=syoGCad5/Z5rEnBsLx8TF7BUdDKKzawDcPsvd+6N6e+7Vc4vRr5USCvgjeYn6ngwWxQY
	 BPQJlw4Y1P75Y0YL1jVDn1B3Nl7li+uRRkyFVDq9t6aREWRry7JcFLvLQTaFdg+Ic9+tb
	 puaMoYNB1lYRKkmR71RdRxPpj0m4ZPkF7OeMODOpdkyNta/8gknfVZ8WyZkWE+jByiAEe
	 jP7z1+DrQQg9fVuxxMb7M+GbnEocgtPC/Z53lCY4I2RHb0+lWpyrBopp0r4cINYnk2+Sj
	 6Hci0DD6LB6mObkPHCp+xYoDo2R42FLS+WCIAVizpjQXN9UDhGLjdULjA7m2EXxAy3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e5bbfP0gIs/ilmArzE+cgtlAKS6J/pwt33myB8R7WJ8=;
	b=Fp7NmsZpz/6m3/iArUqCnXyUymT1g+t9grMaq4LCwLWYzg5zbXx/TvBwblONt5WqpWyv
	 oqsvZ4ZP6aqO3NkoaAhTA40MrsrqOw4u9LrAShkALft3ZuBPYdXoORPSd+ePjVUIU/vuB
	 6nTmtEsOmh5pGbm/4dhuOhFBuI6CF/RH09DaaqNOo8hMkNVPmednm8P7+pmlQASlmmh7r
	 9pAkDZ2Ygql9zJtYvHFbLx3w1E65QdDfrSMMlzS5KMZUCL5rwLEaQe29UyLHSygWKwsqa
	 rvP3ahHro36XxEGN6wp6YYSILiaVOewTP5QvnqMTgS16DhbDBiQ73wL/DwC96XWUifA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833679;
	bh=e5bbfP0gIs/ilmArzE+cgtlAKS6J/pwt33myB8R7WJ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TXfby4POAtJ2hHBuU6LMsw548cIbi6Gz8DWcv3PBvw6hyzADPe7I2gUX2OHGzZYIf
	 mfeYtkRBdNMjAdVeT1DphsnfqJFgfdJHB7qxt1pzrlo82NelU/TNlcNabkF+zX1A0C
	 TXrXwVeggnHZcXRTfdMMBrdHO2jNGPf9cxK7pg3sPXNbFOS1TNUzmL0WPK7BXDS+hJ
	 ZhjLbOcSHv2DXmPD4XZjVQinGiKIk4eJFNOaMFG1igUZVgeiN9PHp1WsBmGT1zLyCY
	 UI4lz+Q/+5qvR4EEFRgR6za7nlfXR47SbFmI3ieb7T/MqXrrTJ3mUR2Fj5Qxg1kxfc
	 LZ2W4fyEnx4Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F43140ABD;
	Sat, 19 Sep 2026 16:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA5A37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22CDA6066F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVU-9OykaOSm for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:01:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2303860662
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833677;
 b=OqN8+DYM86Z5WvDbDueiBsvyM1pOwaW0ieTY6H+z2bFHSyHdL25OFRUh0Mmnwy1D7z1E
 nnTLy01YsIsdQY+a+EFoT/Fr1WYW94xRQ7ziBWwIkbRQ0sm/Iis/JK2tOTsYf6bjsq24u
 SqGhLUzly8ITrVxulpBO37+E9d9t/XLiNra76+5OFDE2v+mFp8UrNtYDraARUL2BS+XVM
 9ghCdYwe7YJEmcwus1EXcCpbJB6etR+7ZQkvH3vvkBBz0SPfmC1NahSylboN8PkiCdLUA
 SxUeR2itGaKYdLddbOsucdvN+krQe80l5/+/tZWXF2m0Q1BWmhNt3RpKm7n5jlZc61w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833677;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=juAB7F8bfidWi9Id3CzH3Wsy9xyz2G6DyHNJ4CUfTb8=;
 b=sEwfZ2HtOOygjUfuraZU6g9RMMj/jMuj0iYbuAHiKIcCXBj1Z3txTOe3xmprwBtZ1uvT
 wzvMcNq92f4S06JHvVGnAqKL6rIUCesGpnP4+rOBLaQjdepcMG12y1+Tr0rnqutelNXNS
 7tuJ7Wy8oV+MYfAzuyGlLl+iKEQt+qX4Ji1CALqyd8NAyz2OUAQv8Lm6Ax/NSb9fAshkp
 /3IWzJ0+IQlh+jcvDN2wYn41yKcV0ilCWKIeNGjlLPH4XEzlpJ/8IYYsZ3EFXULnE3JD2
 FssGE3l9PnUudqSRjJVvnG6/PtSqqFoCP1L6inLHmnmTe0K+aR40F4101LZnV/SmClA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=V2XK7HHU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V2XK7HHU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2303860662
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833531;
 bh=juAB7F8bfidWi9Id3CzH3Wsy9xyz2G6DyHNJ4CUfTb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V2XK7HHUW2KibvGJGgEHFjsK6XjK/sjfiJQVWU9edfs1jFkaLS3Ivj+0hvaX5apsF
 1QkM6hW5wuEioo8/WJ7qegSYoHg//X7kNepT5hDCAm/y2cb6eXWZA41x1NoBVxla3F
 WRTvPK5KuoFC7BrEdc2bZVlrvHlYRH9q42epaCvpcMOiDuG8liJghAb0bBrOg0bb/f
 RErJkShLhvXWUzJDV8yeYr9twXEBqP08i9fBu+iOyLRN9HYgTgN6DQ1fH84HkjYoLY
 GGxRHsge2FYNqyvaWV/pIQSHnyvXHY9ps3DaKjvR5VUbEwZNS39+1XpMGF06zVbR3B
 MCjdvNmHMSG6A==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:K3WpIk5Mov+4hgpR1aCxqTwBzLPM+etCz4+FcG72ZtZGpwxXkmtvideGAaeVp9sbZEn3huzjQSj97reXo9XUxWLt1U2I75l0INDcQ/WLpqO1iJySy3+udcMDh/1ltC3mJKQLS3CNhplqt0GU5fQNpfkW963fZ95Bvv6ZvAwqNV0o9+J/puQmf2vYDXUsNG+zO/sp4oqDORMY+/vagQ+UXUMpHOcOEg3SkGSRnyqLI5iWvz2lenVR9NcSdwzcb9o8AbJ5sU+jt1zExsbDF+o4GZahr1aTiXY3C7dVohJ3zeeKJ/Va+UoKc8Rd1CIzxRmfsn5c/hU9Q2TdE2MMn432MZ+glix7iqw65BaFAnKTAiBXZNEVkeSRmshAXuqJ7Z+jYu7RTPCj3o9tEiX7PhGHGum54ELYwFkd484ldtQ4NRZg4YDb65Za8Ymz9t3XxBXYvxbHqrgL5LSCEVXgd9A2FD0yKKqwVgC1Fo+u2YEvkJtmdJXG6BxIkcaDbG7NpXJXkiyrEXIs0MtFq9eYHW3LCKb48Ua8E+9e09dr14wLe3dzJXWC7NesvYjOVH6C2kZ5GJb0xE8lYIPaEBOi2caQ3nn968jEssU/sKkEsexr78h/4c
 iW3Pbo64x7fzMbdAQjCvQ8vkR4+tUKZO+1WbMqvDLuC/r1t/SYE4wU/aIwEpteXjbGg20=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2DCAA4C47AA;
 Sat, 19 Sep 2026 17:58:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSl-000000005Jx-08Du;
 Sat, 19 Sep 2026 15:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:36 +0200
Message-ID: <20260919155845.5776-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 11/77] package/boost: remove dependencies on
 Boost.DateTime
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

From: Michael Nosthoff <buildroot@heine.tech>

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D7C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4932E40818;
	Sun, 27 Sep 2026 10:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWY03FxvZW58; Sun, 27 Sep 2026 10:52:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 738364080B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506369;
	b=q394flGRMwrYRNHw1h3gSLmTsINneOw4bgQqnMll1j3lH6lDYXboWh870JT9Jb3mY9zZ
	 vYvcX+aaEJJ/9XUsIINRY62uWxel8De/itOTwGTG/B2kEddFj2M0mBDJJmbWLUTS226Fg
	 BpxkoDMmtA3xXEnWQjxvi1MAlen+73WMH4TLcREsodBtJfVlopTJ3c+PEi3tx4FZNSIHS
	 P93BvgmHHwpPSxCbG4uKeVenHFnkqFyL04AMluLCbbtfizkWui9PNJHsze1gaj0f7Ooxv
	 oRYgYHaYL5HoGTx6hbWBLgrd8pwjayNX/JfE76Fk+H0kO86cFBGMvAvliB5raVrBi3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=evgLyuow0/q0dvHSjI6gGCktfb76bJLm9zU03tf6QXg=;
	b=My9I7LKpXuM/e0dQO6IuwsdBRmt3hXkkSMdOfMp2TYqEPUSQPi/xVYkQZcV+z4svFGSz
	 8BVVhvTsNVLLyddvFUtnEL7V78Xyd4nWzlcIhdeh72Hx8DtRQnqeBDFWeZKA7YT6eN/Ps
	 un/cAS123o82qT4+APoHKVTKfkyxZJwz4GK7Y4xn0IwY0GiI4JS06oTm4Wlvhv1diAylh
	 gLP5S/JYNvbX0pfVsDIs550CC/il9KFT9WOluegemCiAf1zlpft/ueLGcbqlM6L33L2OJ
	 2IWxSMiKaxTl/XDKlf13fF3i5ao4DWlDGu7Cuq94PqEB377eSyJ3FgckBX5seMt3PxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506369;
	bh=evgLyuow0/q0dvHSjI6gGCktfb76bJLm9zU03tf6QXg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sA/emO5opFHZJSE34SSCxKYF41Skt9TyNjzAWYD6l2wJV9MBSL72aGEyrXp9XqjX+
	 dJGORVgZisfxmnmOTLPSCdT/KKlNNJY8aXidQ5Rt71sVfTvQFYrsFICjIUmUc3GOJD
	 N4TRwgQKY/0MItawjHHd2SlUNuZHcC2AtOjlx2NMLuCBnBy8xKu2lS24gEzroWxkHh
	 NQjDaN4c/unSIxrENKIDj5oKpaoFy7ZWTwURb7dSdeCccyv7UToqzC+tdBRJL53SBm
	 GNgsy6U33yfYQQc7IfcgQdu2W9yQa3UDndTu0JoZxlLuOSJcywkQLdKNrap6gOxUqY
	 FrpgKBPICXmXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 738364080B;
	Sun, 27 Sep 2026 10:52:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CB3D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1669A60698
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEqwFl5_tX7V for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 26EE1605F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506367;
 b=jUnejJf5MfvnqCJ6Tb9m7wvQavwnxLFBROmla4Htf4SOUnXouBNEaGjxUDCySHznet5Z
 YjlYfItfCymNfyptSbfNdvYju9vd64Cl18MPDWGb4D5WRWk2rNLPqCldUFnK5Jr5USW9B
 3zjwNEniB7zmZ+Tyj6CqfxL3wXOkFWRwQk6qetMfookCM7II4zSTbl2Bc8jV/8ShF4gou
 4OJqiIv2EXXKfrfrnsnAXvhfTyAV7svkUsBs7B5eb7zuYgiHVZVFWj1aUkR+VG553u3d0
 FXxPgxPN25hHmqRmaG8DcVjyCteJ+5ikNd4dOapr7hIpbZraA/txgpQB7Xd3HN74aOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506367;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+Jhn7gt+5tqhz7/oyTKu7Z4D4Zq2R1/80tOMvxVPD8w=;
 b=fpbfQ7zaWh967jXNQDeTW2FospODIAQ2V0sTPyGtYm0ZKJmVC3rKYc5miTJ+yUZ7o9/a
 2MzprycaWrRlx71p81ZQOu9PTLlNfXQ+hIkYavUjJETJuMOp468ZpXQ9DECjlN8oyC1fC
 fi6ZR+XMwK+J/COcKpPW5ED9gY7sSZNat97jjmPvhtrboAJFckVQd5dGJjCLb4yB3k/6Q
 /DSVNtN+SuxiKGsYfzqvQKOLkiS/KlZe4ZjVJj1YEKzM3P+iN7e6UlgmZ+qu0is0DMJWf
 a2ckE+v2E6fjfPB8a6XFe03toON/SDGkWGq/EiXJHrQmH1M4Lp/7A/MT+sUFI7eYoFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UtPJqbiD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UtPJqbiD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26EE1605F9
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505851;
 bh=+Jhn7gt+5tqhz7/oyTKu7Z4D4Zq2R1/80tOMvxVPD8w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UtPJqbiDyR3Z6Q0hyr2Kov9Vd53syuxbisMWF4/CdJHPhWY2HHWcn6/mxM9Pal6j7
 DoQEZNTXI6dDKp9yJW8xdYbQTTolxqJ3WW2l89vAQtoWOr0lotJjZpXiUwVHta/ZAo
 W7RWE6MMvAoYu478BC7cT/AzD/ENGQSOjxDaRAdKUWvXB9qmga47w3SIEpLND4xevp
 PwzPs+lfbB6UkVy1Ktynw1Zlpo6+WfpwwU2RujzaM5+CIf+HMReleK7AagIkFi+T0r
 70yOp10HzOHFW8blR4Wm7s++rKgTomFEq5ojGzHW0W1rheDcaO4Z2JQrgpw91hXwBn
 ogRmB+/zGTQLw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 /D266lKUgBIQf9yRgg77k4LMtWeMH/PKtoCbPkzUONd2tqGEFxcMq6bhjEjbPt7aDb3GLzKBRTk
 0P/1NcyyFgW/mJSayF5xA0gIVwJjMCdvhOLbsQ1GIyw8MO/HbfpKJKc0U6CxxVm5kuIInOr7A4U
 LaCMqyPdAFe1NbH71tfEtMbVM4KQYewqJgfw4irURDFk8qYCK7AYSxPAlsgKfPaY8NjdL6xtYlv
 HNsdw+hCjwmTdlP4w1IYtoWSfXhY9/uqv/tlQWNQAPqtvIFXK6mZLe4T7GhV+n8VkIhyxeFX9Yn
 aJUEjx5pCsZ0xC9xaN5KTdPBopH88BAZRVhFDhDK44+nCwFUmsAs+8j5zeZPYaGOVfSE4Cuhs/4
 xUYdW7vMNKeP5UCz7mBr7wsStyKNrzB4tx/c9PDXwMEYUPythmYqeV5tRkZZDMRpKKBEv7wRDqE
 pqOPkBVcTM9sMzsjWHeNLZE7Jt3i7FZm0wggN1QH0fuBiEcBk++e5TDfZn+22RtR10cdrlWG2l3
 lJWZ27zj54E9g/ftZrJv/i3iHC4Q8uMpBcve3Y+mfWBlKiwQVvsJgaWBuUcaQXD68M/sX5fadcK
 QUCEAGuhldNdvSD5s3jekPQgUYWwP2urgKmo6ANXCxkz+pCbBWkjKUA4XZ+mAkHw/eRXJLXn6Y2
 EFsCFvnXqamaE41Ktqpc=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C8C3A4C4FA5;
 Sun, 27 Sep 2026 12:44:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-2sxH;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:56 +0200
Message-ID: <20260927104301.1801638-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 18/82] package/boost: update locale
 dependencies
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
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

From: Michael Nosthoff <buildroot@heine.tech>

- now always need thread
- charconv

this changed in boost 1.88.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d4626bf79a..93ba15df50 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -217,10 +217,11 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
-	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # charconv
+	select BR2_PACKAGE_BOOST_CHARCONV
+	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
@@ -232,7 +233,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_PACKAGE_ICU
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_LOG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

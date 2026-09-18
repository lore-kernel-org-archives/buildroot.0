Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89EAC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9188B60DDF;
	Fri, 18 Sep 2026 18:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44AJzsWXnybw; Fri, 18 Sep 2026 18:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A51FA6064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757097;
	b=CDU2w6ApD+Pvu+kijC1b6kwGD14I2CWWvswG9nNQ5ZSPSzve85j9guhZhgY6od6p2pDR
	 ph3guOKKf31Qn6b4mfI8xLAFcqISzjCPO/VjWawWCQxx1syFL8Nu9O44O6hCZQrDwKbXw
	 S0ZIdUk+fPgQczf3amzgKHrrYbWcdSern2bmTj+8/6I78aizB0wEQHHhBn8tOLNvUAbHh
	 gLslNtW40EWLQRk++p0BTYCiZFR7IgZzeUqQim+PbfobjFcrQa13n1RAFBMZCVP9CghQa
	 1jukH2Gy1aW6sYeOygc6uY3G4iWYKkumlttV9bi+UkVG2Yutbwa/9ia7E1zIgvLyBzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aFic8FrKzANVAxKz+PnWbFrRrNGYGlBPUJ+llmnKNx0=;
	b=JlzDjlvBKzCUKyWr+25JJiRuU5ChCxhjji58BXgLKGtQ3Cz4/Z3LKsaml60urX3bM2LF
	 57yvwrwliqpAmlLkxbngOoqrXGoJcHupXCso5rHk7e75WkqBRgUyc82QFsm+7FHC8DkE2
	 H73EgBFhbDrecE851gXY9AGkWEAGyx9vesSj6WElAwLJieRM/mnXH0EdMqZsOzTGriClp
	 p1T9ZOA0wRrCNK1Pe260A1I1J4GSvVqbIVGHjNsp5+DiHmQjwG8Bd07azD5UIGC6Mo5IT
	 mosG9y61+voUMX2vk3cH7HnrI4f9iSOyo2D/qv5X46+tj98oVS9nBOkt8/iqHMhUHsg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757097;
	bh=aFic8FrKzANVAxKz+PnWbFrRrNGYGlBPUJ+llmnKNx0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mdRSeYB+W+mJHNoVtWNtRsKH+GEeZWIXZikw1HEuTpOlpQl+UmsIea7IvhfvlXrxU
	 nWZ0rzpIcVJfs8v+bOO0OSdwsPgowLOkn/rGmvNBj1wlVilhr/V24vLSRWImr85Rgb
	 +a8qpx6Is8JnLre7vo2lMbVBMqoBUduu+5ln7ouJdi2d2Qxv+ohHWPmGY1mG2jJfAh
	 8dn7IF3YanNgxYXJYYBzR+JeXP50ylMCs0bCuSi9bJURvFsqChmti1sjVq6vHPcYVH
	 OqeANFHNqzWouk9e2ZmADidSt7/RYeLyoUahyLaXHrngHLzAfiWxWPhGuVxOcUKAR/
	 5S9aegfLng2kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51FA6064F;
	Fri, 18 Sep 2026 18:44:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 770E413D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D13D812D5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR_G_GYbCpPS for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 73821812C4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757095;
 b=LLosnX7kMvbDZQRKIUGDxiBIK7zCsPFgVw0KA5zRhbuOZv3101w/mlypJ3+a2l+ym6h9
 NLv2cYIGQZS22wZ2jCft08W15TLzUU4Qtsj8f5QBFcCuKPVqZ37gu4VEz1DU9DE00y+DR
 Zgf2zJPR3bZ0wQG5ojUmZmoaZKTp1bpD/cT5wgx7L5NGyhsH8WwCKGzpVqO3CkM7LplFI
 4bo7O2StSx4VffiXO/jtBI1e0zAhzUBjgNRBtuuU2mVdwh/9k3/CRAKED9BlTBOEbTScv
 UaH4bL7dp9JvU/ryjr5Cqa0oCc8GqLlemDU36o+fnAZ/xEVOWHT+h4YL2fUPqDWLHZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757095;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5PkZeO3UEe0e8x7VCsoB+XcXnDewbRTw7cY+TxHD+ZI=;
 b=bmIGeQXZkVTS+EXQXQ3hUVfsS0YNEGp/mC4bsrHFjZhosC+2JjcVnj0nHYjj5ksKiJF9
 g97r7TZcTtYSEBWgiromCbBiJ68Nmbmgpl1w1djFoE+DNiqDs8bEdDw8lOK4YGfs0D+e3
 oPfsyXhakeVVkHY93HQgvZyUKbHCZm/NQI7scSavjW1CMQB72YhcVGbfaoyLLLtKt3aM3
 ivLV5OaxXE9TGYYrYXxXgDzHi+yQlM0lwsVjKTDNxbfYUIv32EKyPuj5jqeFsUfz9yC/h
 4FUELuPXu/yEKkE5iWxBwh+8vLw61HCUwlhnpa7tfOJk4NKd1L8y2CqlC9QeRPJciQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Nky6Lt/K"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Nky6Lt/K
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73821812C4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756906;
 bh=5PkZeO3UEe0e8x7VCsoB+XcXnDewbRTw7cY+TxHD+ZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Nky6Lt/KgiGBb2bbSsjtkLA2G5VveK62vbTdenrGvvEFBrTW9MEzlqbGZxuY6FaCb
 nRsFAUV+UNS0Aaicd0erO6mOhwP1Z/sHUaLzScKemBjH4t4tJrXmc0kTnJPcMNfbsE
 yNbBsMqTtIm+KSn47OA1DY3DRDDbF6yTUzesNA3MwwuHTSmkAGQ9BXh0smGRi7lDaR
 AVxhWtkn0VY3593xxuRq7Jr4qENFchKQ0Yde5+G6gQEVuNSessY8atqTbCLWyzL6rK
 07wu0xJ59ZxSVJEvdDFhkLaEcCvDTzeQ5RnnOEh3+ow3mSq5yN2GKl4Ot+pejzhgfe
 hRP5TsdAyCEJg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:UGPZDHK0wGmBwOjkCmhWijPmuczhbCQGXHFAQw9goM0vqjMsUUzMzbkrtHx3QBZ8g4fUsBakVhgRM7q+XdZJZ2moFQ5/yqYmCplTVK1mduhw5A0s3N2NtemOgkbE0O4aM93+BDzum2CbtZmwRyu2sSbslZbClQP9t1LtQGREygUjekCf/PZZqZKSNNsNVjfFICIzQu9S+Z/5+Cy8RaEegkBoaFQHlD10Bp69kQ6Oj/WQ1VUi3sAgxSJKzOLqNP0ZEXbS7gm0hi8uyEYkVHhZ1Gnsw0rDYbvPY8KBljQXmfdF+FDzg7Q+4njqs3Mg6eifi6v//qOHGoDuiQtAVvEBsu04FdyBYNEZ0lLnLvr6/Uuxh8jitW4dhcBs3gitUw3FLwhDwQUgc855Dn2N3MoHt6vYbPgObiuS9CvPrGpQUo4zswhb8oTYM7jX7dFHIxE8I6tcpHlEv4ykO1wsZbH73H0a277hzko5bST8Ir2pjygyiKjzDKhM9hWH31sUuhztbM+6bAY7NOvMVm3FmjGCu2D51Qv0lbm7owQ7N9Xeqh20W58rEWNSMfS2pS4JmQqw0KEK+6kOLdMjyt9KZSZQd+nIUotoSdvAMnBKO0VBduj5MN
 KxgZqOgqEXxAB6A7WE39msk0ADGTYU/vxTR/NSHLTwccBLh37nm9r2FOHh/HM2eHWIbPoMZ+CW
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DFD9A4C4708;
 Fri, 18 Sep 2026 20:41:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWr-000000007cB-3cNi;
 Fri, 18 Sep 2026 18:41:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:37 +0200
Message-ID: <20260918184140.3631274-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 15/77] package/ibrcommon: Fix build with OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ion-without-deprecated-OpenSSL-1.1-A.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch

diff --git a/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
new file mode 100644
index 0000000000..8a8b21ce7e
--- /dev/null
+++ b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
@@ -0,0 +1,42 @@
+From 073a1b779826d1e1bbf473ba45db3ac1e273efce Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 27 Nov 2018 10:18:37 -0800
+Subject: [PATCH] ssl: Fix compilation without deprecated OpenSSL 1.1 APIs
+
+Upstream: https://github.com/morgenroth/ibrdtn/commit/073a1b779826d1e1bbf473ba45db3ac1e273efce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/ssl/TLSStream.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/ibrcommon/ssl/TLSStream.cpp b/ibrcommon/ssl/TLSStream.cpp
+index b18b43c3..e336db55 100644
+--- a/ibrcommon/ssl/TLSStream.cpp
++++ b/ibrcommon/ssl/TLSStream.cpp
+@@ -259,16 +259,22 @@ namespace ibrcommon
+ 		/* openssl initialization */
+ 		/* the if block is needed because SSL_library_init() is not reentrant */
+ 		if(!_SSL_initialized){
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 			SSL_load_error_strings();
+ 			SSL_library_init();
+ 			ERR_load_BIO_strings();
+ 			ERR_load_SSL_strings();
++#endif
+ 			_SSL_initialized = true;
+ 		}
+ 
+ 
+ 		/* create ssl context and throw exception if it fails */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 		_ssl_ctx = SSL_CTX_new(TLSv1_method());
++#else
++		_ssl_ctx = SSL_CTX_new(TLS_method());
++#endif
+ 		if(!_ssl_ctx){
+ 			char err_buf[ERR_BUF_SIZE];
+ 			ERR_error_string_n(ERR_get_error(), err_buf, ERR_BUF_SIZE);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

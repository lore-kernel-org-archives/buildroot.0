Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE83C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC94E41076;
	Sun, 20 Sep 2026 17:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEe7HSSvQawU; Sun, 20 Sep 2026 17:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E433B41012
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924923;
	b=dD//F7NTFIJfewz90xspDvChAECqL86FJOyQxO3mjOLYRavjG3mkUipVvpf+7p48yGOm
	 uP0LG64qbrRRM/rLMMP6FSimNj5KafWJzmzWNjOgehRwEU6s0MKLR47dXUhcaUWHVvgIF
	 oh7E6UiTdurp7hf6OKUIVhfvxv7SjcsPNuK4m1FHL0wcwBRC9n6GVy0G+PWoEz1iIXut8
	 U85mFUwxN4cT3KEKwWrPvult/Uq+eRUik1FWamPqz0NEftvmrlKiLXsttRLHLV6VW1BDK
	 TWiy4VPw5g3ybDnB49QRZgrHSzYBqmYrDL2X8Vrd7WTH1q3piPzneRvsBXOFSZ8o6xA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=aPQvkjAGcoYSkbTcAyqGF6rcHX0GpbgL326AS26ydE/Jua0hWR8Zh8YuHOjFFa8SQWld
	 0nCS1jTxkaaMsjgcYF1vA5XWYeTK9opBe5mLaJwivjWV2BbxEluM2iu0UWBtTaL/r76ZF
	 1pDbpuJX5kpRbhoy4M7/ODP2tG6cJFcgdq77wTPPL3BYUHYQ6GA3ISp70+vKULREpB2+d
	 UiOO5a+RwHQRj437621nOd/S63HrdlFBcPxuZ5bpEi837V/DeBFg4/Minj4/kwxVrseMO
	 ea4ZMLSNNOGvZCIbo42lm1lctjfv6GRhu6wQNY2VideGww9bnXhcAFGmCfYM4Ne7+Uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924923;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i3wBbAPJjrs08XPhxge5WcxqsaH6AabWM4rWJJ3NiCO4hz5Gtf7JhqZfe790psbm6
	 aWlm7+Djv+JBmsg6hxurDi17/j5dz2viC9x9QVxSlg9EV3aTMhGZzEDyCRaiIEzrD8
	 XinVTu5f00Afoju66B1bFp8pKjHP4uf1dUlKld8rZw79UdFftA+dUXi+UC369kX0ka
	 j3xYNTZF0oif6o3tpE3nMaHfYDMcGyviUIBGsNpLZourLCrAwwbBcr3pwXzeUXcwAe
	 bwRPUw8M9/C2I7TH9zI6Zy9+C/xuzCzNY8Q+zINaAmS2JPJvVI//3L60Nkm9vGmg/T
	 t3v779vhQU5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E433B41012;
	Sun, 20 Sep 2026 17:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 240D925B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15FB540099
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZS-Oau9BAU3 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0281B4007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924921;
 b=pIyWV6G9xU5AE7izKqpEZ/xY/4/PCYDeGfO0j8S2y3W34Zuvksj6ASClLdjWKS4H31aS
 Bz4xNSVc9M/ywQ/Tl6M/9qDMxGzy6JhGoFwbyq3vtvuZqR5BNofsmLZe2e63bLzQckcBP
 llBZkodwXwa5A9gHHDK+tAGuRXHA5ccwaxxF1Dn+veNM+0E/cYED2sRwYUAHzsc0oiKMq
 QeNCmbfgnuWwppJbGNTEfSJ6E986UFuEL0l1bSqQZZhrtaGJd1R3NtS5ouXvZCEKbAmb6
 8w68gLJERWX/0SMOFEwpKNTcoqWXvrAHKHiae46vHrRITzpI6iUcv0vxutdhp9hPVtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924921;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=g3yRnM3oPV+BeRUkg+0sSjl0PwzLEJaJ2/VGwLYIYrPMfncA1Cjb9GFFWdgtQzzxl94J
 lxgxc1WnPOF2Wm+6xUV6W4NF9EBDKK1BznArtEiUb+cu2CjI2bIg7VHNo0d2ctY5CNCjS
 1alfagtUOAP4d/UqHL5cR4K+9xEpGxP5UXIFeBWMi/ULB+RnW4bUqJWiJgZnCJ1AVDshI
 x6cM7q3QrTadogSyU8OG3ryeeXxZXEKDfIHz5G+7/7WPybCdQoBJW5kNZkL0YzI18QtkI
 gLxLeyvzMdCMW7OyqF3FtWQFNGQ5psi9AkzX5JZCPXGYFQravIt4AAl9Mz/kVC17XLw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XhM+KK4T; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XhM+KK4T
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0281B4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924168;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XhM+KK4TuFiVg4HRMMoPA3RGJ/XaD+U/eeusnYYmuDoK33LvG/g8BN5+EsxkphXBG
 88BsTj30BHtsfKTBMlPaMarPRYK7mVKfBgvUHlDGvs8c4Benj7bQgJP7a6TtqzEozV
 IR3bBO9SbeFKZhSCkhOjBz7G6l83/e9JMx70IUgrKFJ0rwoNzE0Mkc0mCDiGi5Dhiw
 cev2ixJicWSs7HaJ27gaz5bCX2TefPgigCPTLFg0kbmqzaA3syPerRVsr0x6h7L0IM
 mShHyXANZ2HjJYPE1JiBsAlg6CTTgDFCwJLFaMp9duWLNeNBWSnyJsfdgS+8R4NrEu
 oUlBIF2Xnvr0g==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:tVnaDmRNWL5L0YvtvpoXzZkBTBwTd8d92D6ihWtbdOef7JiUxdtUuS2RMIi5VAlSVofRVTPU7PHxXf2s/thkDMoluJa4Gzx3HDw1Rs0xWEJyjl8mpG5+kXvBQSJyKXL6fOTrtb0Gl/8PPZ9B9WBAjp8C81FEjDoiiDhCIIoAYRCZ/jyIxNNTwvbt5ilJOwKGI/ux7itBbOeh99PY+MaFAUc+RB7a9hN0fLmLpqDX5L+m9tUUbLcrHtiLkzwEG0trUVK18JfLn0I9KUFQM+/0LYWd7n293B2Ttr/aZD0DKQz2vLsQwMVJAY/3HleYRMFdUitmMkFMraXYqijZ90Kua/0lzi5A4hDsnN82r2Um5qG2AD2ugLhzRmqVs0TFnUUbwZLd7HsYBXmLet9lxfDUS8BIhv4km2+KhtWmewEf4CRca3SS0u/HH13C1eDglFVSpxpqSjvtjWMvC7yCNckMQQi62eFy2vPTtKw3Bf2riLL+ahSZWU7ChwYQk/gsR0PlcSIcmgd9Rg3GXYqhvvwAD7qWrlcl6UvwomOUFnDs4zyHa2jw53jDQW28Loo17OogL1LGLeckAPQWyaWjcMsdC0vq3BLrVtuITTw9Gm3NM/Xwcw
 5mrwmjMA7E1gHQ955G4nBi2Q2c5mKiSLLp3pBGFdAyPRy4bpCO54OcnzF71rlGkBzaW9QpJg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CC7FA4C48A8;
 Sun, 20 Sep 2026 19:09:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1f-000000000o7-2MJo;
 Sun, 20 Sep 2026 17:08:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:02 +0200
Message-ID: <20260920170815.240247-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 55/67] package/sofia-sip: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

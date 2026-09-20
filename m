Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F7AC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D9740619;
	Sun, 20 Sep 2026 14:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ttt-ts9ylfa; Sun, 20 Sep 2026 14:10:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A38A40D82
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913410;
	b=sjY/ehRP0JDytHJ0DpRdXigbX7KDfXWQ/XYmmPHweiqzSO5RW5qrVm9UAtDF/26U7kue
	 v2RXJIog/7QfzxGcnSrPRUxcpg/tWOBL9+WAuhqc1zcghynSG0JAoR4FWuvVVZ5WeQDzz
	 A3WSOBVFU18oLsyr7cT28umu8LyS2gTS2V1m14XnGBwrUBB4wQE1zW/OsH2mO2lzNl57t
	 cB7eJEqgIxV8F+b5bRq47rItGopdovBRvTcV8UIvn4Q8fKWSYJo+7ZOUb+4FuhBekSTKf
	 r3BOzcXAVNOdn5t4OdGreRN/YK9oW7FkFXiWrAF7oqKOC5SfcJCcOMmgamrZuJYToQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=QOAhD7pXojgrEWXnJ4Fwwz5D3n7XxHCao+633Tsay1shoqUKnghSfdnREOGNpkz8VjcH
	 gzlcG2YqFi2XDpp5Up1FNYSo5o7QK4YnsmKjgmbKZjiG/6hHRWWk/mF3kLVv1ajcuth+g
	 fefrAbhZNbccETmfCuCuNCKoDnm9P2RxCjRSPcQHhGHUNRSCgn9IEjB3xKPyx41W8APvd
	 vbWcVm4wa8J7SJdpABuy4wsBaPut3L21oA1YY8MmoxCybn6xp8KA1I0v4VZM50qZ4OCx3
	 sxfJINIZ5alpDVjbRpY2Myzo922iw4zHDOE6RepMLMzrYHvNEqMy9RgHGOy8rUN/3LA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913410;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UogsmUGK+clV53cXgI8+QH1c9qFuYa/IRZ+bYwUsdbCKNNVpDBL4B2Lx7qtG9B4qa
	 JgivZGRlxw5C9WIRzjnMM4qkyKKjB3QxwAwLx1FfJWsBuuvtSMYe3nAypfaGOdDApE
	 rGImblECr/tLR719bbU6BAd/gx4ujxs23VIrZwstRtVnc0JJUQhULf+Mc86H/U828h
	 f8cOKrLj1Pmx8HYO+eu+xSqzjgotn1LaC3Q6nw8/k6dItZ2YjewdEDf9kId+dm9OEQ
	 xklfocalQqzW7WieFtdwOb0yMrAlmiAP8J+i9BkXT7XP6qUlo7ndrkYhC2eFfmtMhM
	 waYGWqT2rGVmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A38A40D82;
	Sun, 20 Sep 2026 14:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 214FF3AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E81E80F2B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCWH2rj1u5T5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 139B080F19
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913405;
 b=nghKZMBPkLcOAy69pfuLLL+SP0rcmzzqp6oHcXEaZPxSQvDTvswvy6yn35Yap01ou6p2
 MbATYNFDyY4YxoOxnBVoZZVfIQrqp/Y/DyCmSy5F2JHfx0hf5Gc7E9qnWZa10pedsTGTL
 wbnMi+d67hxaWrW9ihovPrFSC8u0kvjRh+u6j0mEHwEYwDQy9pYVtj8KBsJcnuhnJG5bY
 2xYvPsT4luPwnzjAmAQGE0BdsI7xtTeiUHbMqUsAJbR2+dj6MYkvp84oqsNe2jI6XS4Gx
 /lYGr4X0Z7EQAjmp53xX9ObTc/2D8/b9JxN9R0NK2z+Lt211WYvcqVLE7zR8I2D42ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913405;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=kdN6AiWiO0hMNciPGm6Cm7XkBCVjrUqStC2UnwW+gIMO2vbKbHtM+1SsdrbzDzSLRb6M
 A1Er1ccs4OwK/8qW/BgDtzX0V5tg+9x4WmnBmIEwzFWkUBMonmgvA9hJBNR2OiikoH5eg
 Fi/kTQGtIqhrwSLaHcSNYWN0/qwEA6/hzJcPB+c2/0cRWaciSobHeiJfCYdLWdyKjYCAl
 DyKJU1Vv6sQkMd8/bP1jf2cTH/stNyMD/YtKQgNAjoZ4Q+n431Qu/lR+MzsULBZ0ND9RK
 QUxJ0hozoxQnYCV/5zdaP4i56LbGZIyDyzhyTd77zaWwin3VwTK6q45E6lM3u+6qidA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MPIpmPCx; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MPIpmPCx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 139B080F19
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913227;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MPIpmPCxBlNBFkTFQdvCsjSkrf26wymXxykVHTZX/ea+qDw+mwRgcEaKaua7oyQG/
 fDaFN6NGsaGj0eA05kd2AQVbi6rBE/QO5Y8PTQgUrosVwweee4QUOyY2IkUKHDO0XS
 hm6P0Il49VNkDL8mqmSMSpn//Y39UUSHWPsupBxzf24Ytj8s9n+MrLNRYHqYfEDPTB
 ewYj/sBhjTMzbCR06SCJe/9+JDL8+cNchErU+h3fxfTBjzoLJ54KRHUb7yvahvC+Zk
 YexXl1iNhce7do9Q2df55K15ddHXMTlf5A8M5rYYNC6tngJzcV97Z/uu+ziyJHFY5H
 iurU9Q122Xmpg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:SGleMdbnGjwNPTCCRe8cMV3ArdzL1MiZvcVNLMoH5q6z5mEhfbkdJD8NIsI4V6/dgEiTlv+NZbcVA9fK+KVCx2KMv4477YVHfk2K0scK7dqivxcPctSfB2+Pqya5T1CEWMdOIT9UeJxFqg6jEfNI4RYm+Cb+ssVQMkufDUPXgRTxV2DR0pU2lp37L3xzCUDVTPD6Db5Q8pGlItrA1YyQq7toJaHfLAEmfMHBsQsVv0CRIY5OOceH6wUGjFb4paJtYFKJMrrqjY2ayyVNT/QquqlKf7YnZQtY5Ixosbf5iQmQvo+5ImD+d+i876uSO6RN0DFzF3lGm9x42FsA2fR7u6LmXdx3l0XEix243ix+lwK3Uz+m8MruQe+XGLOin0m97v8U8jqgkILD9S5kDhrJEuYYv+ElkJ22x5ZYdYVlGSZHrVQgzyknDYv6lEsm+obyAOrW8mPlQ7NtdmXDvj2Zbd9IyOZ5lqoEbU+pzraW6yVTajB/BdoJ2V3K1mzEuPXy62SVYvn4St5ivXJuISGgiJ+lD34/UluSfho/gPJxWlHb2ib+DyxyQiqYa8iopG/pzXayogZy76+0jZ7UqWrpRgx92m2ps99pP2mLQgB/wVVf2P
 Gyb113a8bHOG1+w6tziIrFsDjNMnJu86IM5ymv20n/SXWVgAdF+hHsQ+z3hOWDNWUXS3EPwh8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80F68A4C47B8;
 Sun, 20 Sep 2026 16:07:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBE-000000002J9-1AJP;
 Sun, 20 Sep 2026 14:06:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:06 +0200
Message-ID: <20260920140605.3005461-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 08/66] package/asterisk: Fix build with
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
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch

diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..28f9d4f281
--- /dev/null
+++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
@@ -0,0 +1,63 @@
+From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 13:08:28 +0200
+Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
+
+Source of the patch:
+https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Upstream: https://github.com/asterisk/asterisk/pull/2162
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../pjproject/patches/0030-openssl4.patch     | 38 +++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+ create mode 100644 third-party/pjproject/patches/0030-openssl4.patch
+
+diff --git a/third-party/pjproject/patches/0030-openssl4.patch b/third-party/pjproject/patches/0030-openssl4.patch
+new file mode 100644
+index 0000000000..bfeefa2677
+--- /dev/null
++++ b/third-party/pjproject/patches/0030-openssl4.patch
+@@ -0,0 +1,38 @@
++From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
++From: Ravi Kant Sharma <rks1986@gmail.com>
++Date: Wed, 24 Jun 2026 11:30:40 +0200
++Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
++
++---
++ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
++ 1 file changed, 4 insertions(+), 7 deletions(-)
++
++diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
++index 000aabad61..93fcf10f14 100644
++--- a/pjlib/src/pj/ssl_sock_ossl.c
+++++ b/pjlib/src/pj/ssl_sock_ossl.c
++@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
++                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
++                         break;
++ 
++-                    if ((xn = X509_get_subject_name(x)) == NULL)
++-                        break;
++-
++-                    if ((xn = X509_NAME_dup(xn)) == NULL )
+++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
++                         break;
++ 
++ #if !USING_BORINGSSL
++@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
++     pj_parsed_time pt;
++     int i;
++ 
++-    utc = tm->type == V_ASN1_UTCTIME;
++-    p = (char*)tm->data;
++-    len = tm->length;
+++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
+++    p = (char*)M_ASN1_STRING_data(tm);
+++    len = M_ASN1_STRING_length(tm);
++     end = p + len - 1;
++ 
++     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

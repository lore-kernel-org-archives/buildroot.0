Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3303C40D90;
	Sun, 20 Sep 2026 17:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sg0fnmKUtOfw; Sun, 20 Sep 2026 17:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C6C1040ED7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924824;
	b=m+ZHSJV6T6EXC5zBmeJU3UZEQTAUt75BT0GJxudoaJtiQci5cQn9q5S8ubUw2BWB/lch
	 qSgI6AGow+hiKmX5YGeKHj+sIZS59bSvMtWx57LAj1Pvp70kfuZjWPru0QqxH6i1qTWbC
	 7wZkMWH+2P21v7u4T4ae3IeTJ4N4pgz2MBnnRc+L98H306oyai9BK3ea8O+Rl7Hg7qOw9
	 LTm9uJqKEMqhAn5En0nO22iYxq1DMPu88aGHstU1pL4ITsdLyz5htL+UeLDqJ6yYu9nxq
	 HzcHLJ7qUGLsL7/7658+zlZmFcckAZvZHsro1rCBj6vYD8jEYo9l2rbpIFfdOdJ1cvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	b=g57AfvvDdEb81M4dwzQrEXTQV1ePV62WSZPluZy2eFP7ekHT2EUYXni2afGOiUacZWyT
	 iDords7GQ6/nvImTFM3sVztJxWo6+TbCaxi6alSNtjpYuubxfxJrJ9bbT/KBdAH8ROfHE
	 tehW4SfIz3Cxe4fSByM5CFak0AEvvc75T3vmRh+HOlcVAtO009jLeKRbdSI46PPZcgfFG
	 98wLogBKcdwH5zIpOjKA9uICAO3gUD5SMm84o7S4LGuQuN7pvIAURQXCajf66wLG50Fka
	 XkVYmsMjXhGNoMVPnriemeTbsoQuRiF4eerhUWgzLVNNl0eV4FzWW7MyM6xVwJp7cnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924824;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HgI0irj+KpJPJXA2agTdG6YT216Fsxba9LrGBVQibCtnhLIr3rQkGjhHDEIP6G+bd
	 tJ7J7ZJfr0M1LCyq7z/Qb2jQ8hynxQ6J0ZUW9uub+xApp5nf7XNindvt6tklnHVGrY
	 lNp2UmT0AfhcJfLVYRlEsVEMklJ6FLXy5wOb7F29VqJkcO+FhfMvFmUj/m+blho6MU
	 Q61/VBYBENs+FVWGGjJ6iYAI4R6vbCIgLg2e/TW1kqcl7Hh01OJ6CGG6lJhkjjUZbN
	 4210ZvzggiVk19rhGfVkr2RfPYrHAJVvvcFbXGxo95D17ytpHvmFlcD+Gf6HhpUFB1
	 1akcaWhcHLFCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C1040ED7;
	Sun, 20 Sep 2026 17:20:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B30AC25B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 991F54007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gnu_lrxoQ7uy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1E76840022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924822;
 b=tM3BlPrFfgnml85Nh0F78DfZ14DGYdvS65D1rjYn7y2DIu3u8/b+yHr0dwcVuc2rV8gH
 X+XEWpjJ4DRX0UQziMz7cXp+TdsGAk1HYinDw7Hwyo86AtATVgJZsmJUsrXZSvJk+QHlg
 QsY4H4ZAbXXstIALv4VSVZAN5eIsYjTWbE0QdtteRfBRI6PtOoMrWstbQapXLtu3R/CH9
 5JrVv0pzL8vM++qJZ1XoSxxWN5heUHTPvADlTlNwSIMLDYzPoJoyZh3/t3hOTNvY02FxM
 dxuX/GRW8FlBGC9sy2g6QIrKhAV5aU/hs2DIdiemXQdNVB0HJOx3ZupveD+2fMgEWjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924822;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 b=UBcnBYgJgjbk6afY1/Rdyhdmi7YWLjZktM2+7Mbku5yzwhSKHU9rFqZOXUaLo7U1Qma3
 tvepQ/gD2G3BR1CFlCCAijnHkzNYvc+Qr2JEDq5b7eWXyMyT8ogx+cm99dR/orCNxSIkm
 LK1CJvukt7DDaCJh9blzVRYHyzP+XcGZt+4NtuzlD52pSRTwWliG4BIc2En1aT0tU0lM8
 X5Fvy3BVAIZ1V4aiXlpJICEG77inpP2B/UuoqWHmr5YjroCbSaYTzWflwNMpJjphukxbp
 cZjXEeMx/ddZv6aGvgWaeULddSXcW/mhS0v/zeIGD163IHhELrGMyCOakoPTR9nV1ww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sqJfCzbw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sqJfCzbw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E76840022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924164;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sqJfCzbwObBggIbL9KSDA5luq7zzIYhsOBSL8yQU4uM4ZtRnKBxTyTAfKlJzoZuG0
 +CQf7CfW0PWvR6hTFWv5daa4jkDoGzb/ufUD5PHtoKs2jGV1r+HAHjBJ7IlLdWA6sG
 CHsxXj40Uiv1x4HlIoPYwyS8w9L4TDeJMM7OQ433kwJfGGCHuDKppfzWmiRr3Lsxcn
 WVBiCZLhnMjiKR2p79Kc3K1+9MyLff9W1WQbocbi4vkdhigSC2NS+770JIDHWgla5J
 sl022P8mgvjLZydE/YuDdkL0scdtS/igeSd1scz+0pouxyANmsTfA/sbL4DO8KpHuG
 4nq5vlSo8XtZg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:fctMEcCZ1exQI3HSAfvBw8LmtW6NDNVY27q/WdiwumE+hmh/hTi1b2fuD/CKFsY9Qx2tO0x6zrliokkQrD4IHzvLqz2O/YJqOB4DVbiZK0iOHrL2qKDeTRWtfZD6vCPBEkMQ+a4/m5cL1zI6vthwsy2woaontLqSle3YEBOFMzI5aoB+dB5igo7Eep6PA3QfAQLsos1E/7KtngnZq8L/OZoOHsK/0uUFBJgVsvDK/oSEeP/WE7jLuMenKfIdBg1CZOhwVxZsjPfDY+mgiAi0lTghvWwF6JvtLcfW+ujTPLR8kSgn+1LPMUoGmEMwajpeyxIG4AxPTnBGR92IF8ft3IW3QQ8YjZHW9Vq1M9SfqBUVkGLN12D7ZCEcD4I6VYLHJbv935hxtSQ2QLV/1bmv7JVZ6jV/H/Vy+fvx5fnPv/0hLzTlkOBWnrecJAIpxMgSs4CF1BB6IrY2bgiIkdWI0QQpQsK1WjMVZWiF2odiLg/hc7Q2bRlYiNWIhENV3N6ayiHkRIemM/JW2/I7v/UYQ+7Si8E8aaWY5OrCZGp3YAwR7XrtBjDmRkRhRsjevvDnK5Ke7Q1mOqP1m+bxCW4NFH9RfqgtlWcdKLRGwckmFbRYzY
 i8x9QTPYb8/cvlDHRYM87mFb+nLlTui4qYSXBjXnhyDWMLG7KVwWQGSI9r4HZ9oRYzxnkdsNQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A599BA4C489E;
 Sun, 20 Sep 2026 19:09:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1d-000000000o7-0EXj;
 Sun, 20 Sep 2026 17:08:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:53 +0200
Message-ID: <20260920170815.240247-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 46/67] package/opensc: Add support for
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
 .../0001-Changes-for-OpenSSL-4.0.0.patch      | 333 ++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch

diff --git a/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..6039cc3fc0
--- /dev/null
+++ b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
@@ -0,0 +1,333 @@
+From 8ad96adc5fea0cef923a2a679600f3a5c4c5bfce Mon Sep 17 00:00:00 2001
+From: Doug Engert <deengert@gmail.com>
+Date: Wed, 15 Apr 2026 15:10:42 -0500
+Subject: [PATCH] Changes for OpenSSL-4.0.0
+
+Changes to get OpenSC to compile  with OpenSSl-4.0.0
+
+OpenSSL says:
+"Opaque Structures: ASN1_STRING has been made opaque, and further work has been
+done to make X509 structures more memory-efficient and const-correct."
+
+ASN1_STRING was made opaque thus requiring the use of ASN1_STRING_get0_data,
+and ASN1_STRING_length. These routines have been in OpenSSL since 1.1.1
+and are also in libressl.
+
+ASN1_STRING_get0_data returns a const pointer, so the data can not be changed.
+There  are a number of reverse() functions one of which was reversing the
+bytes in a EC pubkey.
+
+Changes not addressed:
+"Global Cleanup: libcrypto no longer uses atexit() for cleanup;
+OPENSSL_cleanup() now runs in a global destructor."
+
+ On branch OpenSSL-4.0.0
+ Changes to be committed:
+	modified:   src/libopensc/cwa-dnie.c
+	modified:   src/pkcs11/openssl.c
+	modified:   src/pkcs15init/pkcs15-oberthur-awp.c
+	modified:   src/tests/p11test/p11test_case_common.c
+	modified:   src/tools/netkey-tool.c
+	modified:   src/tools/pkcs11-tool.c
+	modified:   src/tools/pkcs15-init.c
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/8ad96adc5fea0cef923a2a679600f3a5c4c5bfce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/cwa-dnie.c                |  2 +-
+ src/pkcs11/openssl.c                    | 14 ++++++----
+ src/pkcs15init/pkcs15-oberthur-awp.c    | 16 +++++------
+ src/tests/p11test/p11test_case_common.c | 24 ++++++++--------
+ src/tools/netkey-tool.c                 | 37 +++++++++++++++++--------
+ src/tools/pkcs11-tool.c                 | 22 +++++++--------
+ src/tools/pkcs15-init.c                 |  4 +--
+ 7 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/src/libopensc/cwa-dnie.c b/src/libopensc/cwa-dnie.c
+index 47f3792dad..6020921dbc 100644
+--- a/src/libopensc/cwa-dnie.c
++++ b/src/libopensc/cwa-dnie.c
+@@ -646,7 +646,7 @@ static int dnie_set_channel_data(sc_card_t * card, X509 * icc_intermediate_ca_ce
+ 	dnie_private_data_t *priv_data = GET_DNIE_PRIV_DATA(card);
+ 	LOG_FUNC_CALLED(card->ctx);
+ 
+-	X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
++	const X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
+ 	if (issuer) {
+ 		buf = X509_NAME_oneline(issuer, buf, 0);
+ 		if (!buf) {
+diff --git a/src/pkcs11/openssl.c b/src/pkcs11/openssl.c
+index 0a5d4394a2..a4027339b2 100644
+--- a/src/pkcs11/openssl.c
++++ b/src/pkcs11/openssl.c
+@@ -463,6 +463,7 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 	EC_POINT *P;
+ 	BIGNUM *X, *Y;
+ 	ASN1_OCTET_STRING *octet = NULL;
++	unsigned char *octet_rev = NULL;
+ 	char paramset[2] = "A";
+ 	int r = -1, ret_vrf = 0;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+@@ -516,13 +517,16 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 		if (group && pubkey_len <= LONG_MAX) {
+ 			const unsigned char *p = pubkey;
+ 			octet = d2i_ASN1_OCTET_STRING(NULL, &p, (long)pubkey_len);
++			if (octet)
++				octet_rev = malloc(ASN1_STRING_length(octet));
+ 		}
+-		if (group && octet) {
+-			reverse(octet->data, octet->length);
+-			Y = BN_bin2bn(octet->data, octet->length / 2, NULL);
+-			X = BN_bin2bn((const unsigned char*)octet->data +
+-					octet->length / 2, octet->length / 2, NULL);
++		if (group && octet && octet_rev) {
++			memcpy(octet_rev, ASN1_STRING_get0_data(octet), ASN1_STRING_length(octet));
++			reverse(octet_rev, ASN1_STRING_length(octet));
++			Y = BN_bin2bn(octet_rev, ASN1_STRING_length(octet) / 2, NULL);
++			X = BN_bin2bn(octet_rev + ASN1_STRING_length(octet) / 2, ASN1_STRING_length(octet) / 2, NULL);
+ 			ASN1_OCTET_STRING_free(octet);
++			free(octet_rev);
+ 			P = EC_POINT_new(group);
+ 			if (P && X && Y)
+ 				r = EC_POINT_set_affine_coordinates(group, P, X, Y, NULL);
+diff --git a/src/pkcs15init/pkcs15-oberthur-awp.c b/src/pkcs15init/pkcs15-oberthur-awp.c
+index 22c943127b..fdb06ab6b4 100644
+--- a/src/pkcs15init/pkcs15-oberthur-awp.c
++++ b/src/pkcs15init/pkcs15-oberthur-awp.c
+@@ -51,21 +51,21 @@ awp_get_commonName(X509 *x)
+    	r = X509_NAME_get_index_by_NID(X509_get_subject_name(x),
+ 		   NID_commonName, -1);
+ 	if (r >= 0)   {
+-		X509_NAME_ENTRY *ne;
+-		ASN1_STRING *a_str;
++		const X509_NAME_ENTRY *ne;
++		const ASN1_STRING *a_str;
+ 
+ 		if (!(ne = X509_NAME_get_entry(X509_get_subject_name(x), r)))
+ 			;
+ 		else if (!(a_str = X509_NAME_ENTRY_get_data(ne)))
+ 			;
+-		else if (a_str->type == 0x0C)   {
+-			ret = malloc(a_str->length + 1);
++		else if (ASN1_STRING_type(a_str) == V_ASN1_UTF8STRING) {
++			ret = malloc(ASN1_STRING_length(a_str) + 1);
+ 			if (ret)   {
+-				memcpy(ret, a_str->data, a_str->length);
+-				*(ret + a_str->length) = '\0';
++				memcpy(ret, ASN1_STRING_get0_data(a_str), ASN1_STRING_length(a_str));
++
++				*(ret + ASN1_STRING_length(a_str)) = '\0';
+ 			}
+-		}
+-		else    {
++		} else {
+ 			unsigned char *tmp = NULL;
+ 
+ 			r = ASN1_STRING_to_UTF8(&tmp, a_str);
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
+index 1dd6eaba67..f571cd1598 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -776,34 +776,34 @@ int callback_public_keys(test_certs_t *objects,
+ 			switch (o->key_type) {
+ #ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+-				if (strcmp((char *)curve->data, "edwards25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") == 0) {
+ 					evp_type = EVP_PKEY_ED25519;
+ 					break;
+ #ifdef EVP_PKEY_ED448
+-				} else if (strcmp((char *)curve->data, "edwards448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards448") == 0) {
+ 					evp_type = EVP_PKEY_ED448;
+ 					break;
+ #endif /* EVP_PKEY_ED448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected edwards25519 or edwards448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ #ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+-				if (strcmp((char *)curve->data, "curve25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519") == 0) {
+ 					evp_type = EVP_PKEY_X25519;
+ 					break;
+ #ifdef EVP_PKEY_X448
+-				} else if (strcmp((char *)curve->data, "curve448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve448") == 0) {
+ 					evp_type = EVP_PKEY_X448;
+ 					break;
+ #endif /* EVP_PKEY_X448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected curve25519 or curve448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ 			default:
+@@ -893,14 +893,14 @@ int callback_public_keys(test_certs_t *objects,
+ 			break;
+ #endif
+ 		}
+-		if (os->length != exp_length) {
++		if (ASN1_STRING_length(os) != exp_length) {
+ 			debug_print(" [WARN %s ] Invalid length of EC_POINT value. Got %d, expected %d",
+-					o->id_str, os->length, exp_length);
++					o->id_str, ASN1_STRING_length(os), exp_length);
+ 			return -1;
+ 		}
+ 		key = EVP_PKEY_new_raw_public_key(evp_type, NULL,
+-			(const uint8_t *)os->data,
+-			os->length);
++				(const uint8_t *)ASN1_STRING_get0_data(os),
++				ASN1_STRING_length(os));
+ 		if (key == NULL) {
+ 			debug_print(" [WARN %s ] Out of memory", o->id_str);
+ 			ASN1_STRING_free(os);
+@@ -925,8 +925,8 @@ int callback_public_keys(test_certs_t *objects,
+ 			}
+ 
+ 			if (EVP_PKEY_get_raw_public_key(o->key, pub, &publen) != 1 ||
+-				publen != (size_t)os->length ||
+-				memcmp(pub, os->data, publen) != 0) {
++					publen != (size_t)ASN1_STRING_length(os) ||
++					memcmp(pub, ASN1_STRING_get0_data(os), publen) != 0) {
+ 				debug_print(" [WARN %s ] Got different public"
+ 					"key then from the certificate",
+ 					o->id_str);
+diff --git a/src/tools/netkey-tool.c b/src/tools/netkey-tool.c
+index 23bab2a8ec..683ac182bd 100644
+--- a/src/tools/netkey-tool.c
++++ b/src/tools/netkey-tool.c
+@@ -144,25 +144,38 @@ static void show_certs(sc_card_t *card)
+ 			if(q[4]==6 && q[5]<10 && q[q[5]+6]==0x30 && q[q[5]+7]==0x82) q+=q[5]+6;
+ 			printf(", Len=%d\n", (q[2]<<8)|q[3]);
+ 			if((c=d2i_X509(NULL,&q,f->size))){
+-				char buf2[2000];
+-				if (X509_NAME_get_text_by_NID(X509_get_subject_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++				int idx;
++				const X509_NAME_ENTRY *ne = NULL; /* no free */
++				const ASN1_STRING *a_str = NULL;  /* no free */
++				int out_len = 0;
++				unsigned char *tmp = NULL;
++
++				idx = X509_NAME_get_index_by_NID(X509_get_subject_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_subject_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Subject-CN: %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Subject-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Subject-CN: %s\n", buf2);
+-				if (X509_NAME_get_text_by_NID(X509_get_issuer_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++
++				idx = X509_NAME_get_index_by_NID(X509_get_issuer_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_issuer_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Issuer-CN:  %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Issuer-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Issuer-CN:  %s\n", buf2);
+ 				X509_free(c);
+-			} else {
+-				sc_log_openssl(card->ctx);
+-				printf("  Invalid Certificate-Data\n");
+ 			}
+ 		} else printf(", empty\n");
+ 	}
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index 452ac49617..cfc7486faa 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7389,8 +7389,8 @@ static int read_object(CK_SESSION_HANDLE session)
+ #endif
+ 				point = EC_POINT_new(group);
+ 				if (os) {
+-					a = os->data;
+-					a_len = os->length;
++					a = ASN1_STRING_get0_data(os);
++					a_len = ASN1_STRING_length(os);
+ 					success = EC_POINT_oct2point(group, point, a, a_len, NULL);
+ 				}
+ 				if (!success) { /* Workaround for broken PKCS#11 modules */
+@@ -7464,9 +7464,9 @@ static int read_object(CK_SESSION_HANDLE session)
+ 
+ 					a = params;
+ 					if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)len) != NULL) {
+-						if (strcmp((char *)curve->data, "edwards25519") &&
+-								strcmp((char *)curve->data, "curve25519")) {
+-							util_fatal("Unknown curve name \"%si\"", curve->data);
++						if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") &&
++								strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519")) {
++							util_fatal("Unknown curve name \"%si\"", (char *)ASN1_STRING_get0_data(curve));
+ 						}
+ 						ASN1_PRINTABLESTRING_free(curve);
+ 					} else if (d2i_ASN1_OBJECT(&obj, &a, (long)len) != NULL) {
+@@ -7526,26 +7526,26 @@ static int read_object(CK_SESSION_HANDLE session)
+ 					}
+ 				}
+ 
+-				if (type == CKK_EC_EDWARDS && os->length == BYTES4BITS(256)) /* note extra bit */
++				if (type == CKK_EC_EDWARDS && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_ED25519;
+ #ifdef EVP_PKEY_ED448
+-				else if (type == CKK_EC_EDWARDS && os->length == ED448_KEY_SIZE_BYTES)
++				else if (type == CKK_EC_EDWARDS && len == ED448_KEY_SIZE_BYTES)
+ 					raw_pk = EVP_PKEY_ED448;
+ #endif /* EVP_PKEY_ED448 */
+ #ifdef EVP_PKEY_X25519
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(256)) /* note extra bit */
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_X25519;
+ #endif /*EVP_PKEY_X25519 */
+ #ifdef EVP_PKEY_X448
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(448))
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(448))
+ 					raw_pk = EVP_PKEY_X448;
+ #endif /* EVP_PKEY_X448 */
+ 				else
+ 					util_fatal("Invalid or not supported CKK_EC_EDWARDS or CKK_EC_MONTGOMERY public key");
+ 
+ 				key = EVP_PKEY_new_raw_public_key(raw_pk, NULL,
+-						(const uint8_t *)os->data,
+-						os->length);
++						(const uint8_t *)ASN1_STRING_get0_data(os),
++						ASN1_STRING_length(os));
+ 				ASN1_STRING_free(os);
+ 				if (key == NULL) {
+ 					util_fatal("out of memory");
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index e011232987..b978e0677a 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2593,8 +2593,8 @@ do_read_data_object(const char *name, u8 **out, size_t *outlen, size_t expected)
+ static char *
+ cert_common_name(X509 *x509)
+ {
+-	X509_NAME_ENTRY *ne = NULL;
+-	ASN1_STRING *a_str = NULL;
++	const X509_NAME_ENTRY *ne = NULL;
++	const ASN1_STRING *a_str = NULL;
+ 	char *out = NULL;
+ 	unsigned char *tmp = NULL;
+ 	int idx, out_len = 0;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

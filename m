Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41567C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0811C40B2C;
	Sun, 20 Sep 2026 14:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZSjgMVNkww9; Sun, 20 Sep 2026 14:06:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 22A9740B71
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913205;
	b=irvOFDC5dklvVrGh1ucltj7I8aToB/kbq5aTkLP5VcB0YHB/B2c+P7dZ6yISJeJ9e3Z/
	 z7krEixTvBdO17ykXTQ9EygY0b/lMfAH54hqza0W+RFo+eB6w1lbGTkFeVLPTFMPz/6j+
	 6F9GejnMvM375HzTrXO1YrEWHdKN6pwiN+xIFLN1qdu5VXtjip8doClsYsHBGKeGqiwMA
	 fu9kAdKNuOY53Rve/D/RGCjPjxHTucI7PaTxLxb/w59yo0L6hhuqw2VHRNnhsq917VP3p
	 jk1Dka7kI1ZTxpPRns+BrIeVgmJ6u8Hg1mD81y538cD7XGTs7qoh1qflrCiKI2PWqJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZXnqoVLsdTTLOp+gSkudV/wtngJ3K7taQidbBvT8K1U=;
	b=DsHW8JrtADIN0Ga7J0rVEOwKuNlIFmSDe8rW1ysjB7z0CGrVlVOktVMeXepVbCkcGN0P
	 VDJ8MRr53bZF70oFZVkpb/IyGSeYMKSy+KKPbsHEQ3CcxIoB/VbikQE2r8MYaCdBubQVS
	 jQqMAa0vjxKisa63oqr08sEUx4YcKUSLbRi5TVFsmpcrwGtJ8zqnI8ub37SmGiPLpkK3y
	 NvuCbYmQ2J2jlMEHUR6JOo3Uj7HEFLtagUlIBGngnE0v5uEqcKiAOaMQzeyhtE6ojDMvo
	 suHZuHpuAVwE/8vJ/UHOQh9iuS/fvzJumhTNE3IPyntLa4XrLZ1po3tTTWPns9AV7+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913205;
	bh=ZXnqoVLsdTTLOp+gSkudV/wtngJ3K7taQidbBvT8K1U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TYS8JorrkDomb2EO3ypQPSlC6XYM/6df76fUPj5+/xW+3LztjXSLQVwNfbIkRAO8G
	 vQanxRFSYsZbbxNqj1A3xDDriN+YnnpBF3z12gpZFLs48dIqgmjgqVdPI3T1IKshJq
	 E5ejtMuRBpNOtIGaXGjxMmn1HLTMNnW9plcuHurP02wiav6IqId+gAdXjwQiupfXVG
	 JGSrJTR1pzO9YlwJcX2GUA2Z41ja0/lySqhrmYsUXI4udSRo2nJhfO4HRwVHu3rgjJ
	 8uGo5mLS2+hBF2+Bh7/6XY+UkKHT3P7oSTB1IipjMTaRc38owZYhroN4xA1KVALasJ
	 04yzw2ZT6uSxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22A9740B71;
	Sun, 20 Sep 2026 14:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3863AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABE8400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-08OvgnVA6G for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 916DF40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913201;
 b=eZZFnFUuqNNpIojOETJRQVSvQSCfIntZ9K0iaPnpBoBF+fCJ/xgvBbdEO5y7RbCYK7lZ
 KuD6gIejRPDcoLtE8oFmnWI5UcW+l8jNBEC3AdebCMYbWWzc90vMmgobe9JYYEqhLyw59
 8iprcL3qEWrMBZaiT9a2vmBb/iH7RkTRA4QLaTEiD+wT0Ioh//bz/i+xU8XgIfsvUrmTO
 DMK3H8ZVBQebDUJmFCsqy7oTbOb9iq+0qlhrLJfyaRaekZ00//+khYg0hA/oz8LwG0yU7
 3GOo8cgws+hf5+0m/PblkPcfoXSQDvNTNH2v9+wcFUK5wxfAlbpfoazn99VHhVH666A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913201;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IahBK4xjGxvHzz78Sm2BG/dV8inj40Uu1uFvQMB2IQE=;
 b=hMeE/sUfSbP8/FcczHs0Ox2Dv0ChWXe2jCguHWK3CuxdYRRsqZXOR0JLwPx72+wM8J87
 A13M/KyD+f39uaqXsBND9zp0PmQPXzlRdUlRJfS3x21NtFk3NqfBO3BaICmxfLLlKkngS
 NkVp5KGWif1sj+zGe+jUnDzHWYeUsQiWcTVvzb+INvEON5vVOkgAe0W+dQgLHtoTrLHuG
 jhECTXy75HO9YMTDn4BkoZ9lh0hFt1GbfZpKklSsszjGObPLazwTEsfybeOFeGQcM3/rN
 iYDjNrZRwUyxoZJU1We5ITY2J5KGttqVg8wyCOCdo3WCfwEwgir44ZvZ2Rdi+1ATp2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ed6KPCFK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ed6KPCFK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 916DF40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913167;
 bh=IahBK4xjGxvHzz78Sm2BG/dV8inj40Uu1uFvQMB2IQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ed6KPCFK6Fc27mW8FTZzulrE+BKCxSX5YwdvWGmhSzKh0p2Ln7UstFFK85wBC7PWA
 zKiAuPdXx9hpWqofAHFXh1djK3VgvsA9bGzoN8+kYSZYt7vv6v2r9zZS85g1e7zBLY
 qJJczEVRnz3DkMdkpMjpohA+DVHf6eCgFXnttJXofqoKwEueVtjp4ko7u+DqDQr9Ep
 JHm1mnSXjELWxqO6qQAb/8mIPmSj+GJJQqRExxSkWhpCF/YOKAGM0gL3s7s4kaJ1xP
 dkqOGLPS/6WkqTS6UKnTQynuuLTtdPvMjD9qsXvd6r7HFITYbadx16zOCdxzgXvVUH
 HSLTKyLwLUswg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:7dFguZGj8kRrEajdVuZSTEhee9gNvR7hSotoN3q1ZZJQcyfkJvTon4BPuJ6dw8Q7I3n6Ld0FLBhaKBhgLtTO9O1VkTqD61xeg+kogYU5RXxIT71MXwn4NFlCYrtMBYEtKfccotR/81xGwc2JNW7pUk+m5Z+5NENTLpZu5c3LbK7pyXLmS/XD5Ka3u6Z7D9o70xxB22VcSU3kSihqD4c6RWXAvk+IASIY1fNy2Bw9/XS7G58Gi44mPmJtGDhLVCVrNB9FSMeyVzqnW4v+3a+ijNj8pYT9IrHOzumm/CKIDqx9TPFSB1HfdkOir2JA+DwZXGiG5+dzR0tOIMG4N0niSr3RY1Fn4fzGjuT6NfnRGRviaPKhFkB3RuUGxxETjEQe6/zXBdvU8mRNEFWcSXo7jnykM/amLL8aEFuUsRcxR5Ag9FywnFgoJUHma9MUy0O0oF0eNs+JrFMWzsiOzNhWCYdidpoyeOmdwbSGztYrICcU1mADas8FuSx9CV2jMxLwexn+oYPmKkAaxRezFPLOVFDYqV3ugojzIRy9oYdWa05ied9XZ8QmIQoeMcHG+3C5NOyk8ntdBOi//0CZsBoWu73zdimV0tHu9cB/ONMdBJLMtO
 mTOjcjBvHeFihg8TeWxuWWUzOpHhIm5zvk2kgugVxm+H1KgniwqXtfIsJQ+2Agw0doCUE066t6SnEasgAG0ilUI9XmaHeoTHd/PD89tX5Zpm3AXMUk
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7050A4C47FE;
 Sun, 20 Sep 2026 16:06:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBD-000000002J9-0sYJ;
 Sun, 20 Sep 2026 14:06:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:00 +0200
Message-ID: <20260920140605.3005461-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 02/66] package/qt5/qt5knx: remove package
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
index 317c22befc..747683ff5a 100644
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
index 9af019e627..6d9ab5892c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -252,7 +252,6 @@ F:	package/python-spidev/
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

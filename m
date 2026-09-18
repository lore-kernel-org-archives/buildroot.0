Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC3EC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5CB760EAA;
	Fri, 18 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5Sry0pgXc7x; Fri, 18 Sep 2026 18:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E30B460E8C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757815;
	b=nfTb0gmZVzYhMPE431hha7hCys4srTKenbcgmgddau/T2+1WjtPGevsFARqTSF/O+5TP
	 JXxDzgOBtjN7XNLWs+04fGnOZ2olEv8/RMZTNJtMrg303TXvduoK1kOuRE8OywoAQnfPM
	 XaUwSSQ8+TsHvVdpy7kZeN3JDkx3MI3FwrLWBFO2GiIToWoOsZ5xRQ2cBR/Kl5vcEAzhj
	 QOLczen8n9h8Rt15iXCZpAJ7gEmZz/1vXtf4ivImFcaOOhl8hn3Zcb270j2QTvNvp03Ng
	 E1X9J6ppc2/hB+Xb6jweU5CUUQynLRzr01UZn2pt4MAfQWBtko/+qFeccoDQ2OlipbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757815;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=O6nboEgnBW9krLICDOe+deK8cmezqDYwulNNwbENfGW1aLDWJYZadt2RMMCRfoNSRW/N
	 SNo6tWaE9BB189YK3EN03QR6YtxyGIky8l1Kk6DwPNfiFdTCxZk5HxI9UQsgE0qFkFgdd
	 BDOPFd0nVuolWo3u+oMTJzIlexjXNvOBztvqfvUJxLXetov/wa7UsRKJIoPh6W2RcJp5S
	 q172piH9zA/GVSwXcoUUseIee2vJfQEllV2zoREHtiOZjJhm5Z7saPRq3JGWjEFzQyNnk
	 0mUH2ul6fbe975X8JzhF7s8FQAVt7LfTfNGcyZ4ymn89uzgIGO5Ko16aMbQrge6mrDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757815;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GnJHpV7Jlm+hh3IwnRbNorXgqra46r07e/TprlJQDc0rtswhmQ6jTLya5tQmuziyM
	 GvawyUrHWW51fR4/caXjks1dzQRdvk8SLdrLBuUpqO7QKtAUz8Z5JN6HZM+N13njuE
	 h64PkXX655xJ2NQiwpXqjTaHAHuT7Qy15Z12SloarEKgYwm7u7u1XV3ID7ff64kXPr
	 Of8S732cadews+OkGMHEkMuZCk8Xn5fyi9NW/OTx8RPAwGsla4d2PJIIZvTHgSJdvO
	 SEj5pEkIMVjpUFRd5WSWZAk9B09ZTzikgDxjutIfjEMKQJzWZmPr8weaXTQy3icgck
	 FaixV0BYAglMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30B460E8C;
	Fri, 18 Sep 2026 18:56:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73481237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70E3D81303
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fksNwjB_dKt2 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 926D3812FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757812;
 b=ivJ9tjP19qeAznZIEQ1OInBibJghidiJXqHjum8cifDSgchb+D8OFNB+Vg5Ws0m6MopB
 rEaRcDxWjJpJ5AEXX+UhqA5Ys/htYAboLJFzDLhh8LvaUi2laj+dYDNuM+IEwJj/k5Hxw
 R2+27z8+1wUkdFd9RGRCjeA1N6gpAPsreASRybbXW+WuIgkg2g99n+djNyqw1feHblcXf
 dV75m/rd9DhKHi9OwOWUiDDu7SQnKo1iSlwd6XG6lGqSE2RSvR4wjW2PRTzHab0uQdk2i
 HBVFZCczSzwQCLqE8YcEy3fJTgqWnXXr/v+t/iMVqSOBHzuysrzWkB9y8popfJE7vVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757812;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=hyM6WteyXnDq+YJZV+emOo4Et3uNtTfZF1FzO/uI09l9xEFcjModRvm+nRcqYt4ip3mp
 znvHzrGszsKhNYjdmJVZhtF/3COG9kYTuMZtvQ3mhWGN/pKGxDlIZtKAEB+a0k9WKEwrs
 M3ef3Rsa2ipcwdOmI/aSaibiJ0yy443YH/PWPw775hkWi7JqRDMQCHJFFEW1UEytgbmDa
 bHCgV7UrL7b5PChRNLUzenx5rTvU+t2mVft6SRAFWGxvFzYK2RQssYjdS765EUKNigBdn
 MoLEE2FA/tV0rHMvuJHLfJ/IdBi3VNpsSnTNpmXJtN1ZR9ahcXTXUh9sdy9jRWdAzWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kN04F+Qu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kN04F+Qu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 926D3812FE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756951;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kN04F+QuGWTfm2h/RgoNp8YrECHpbuyTQrXR2btLR1grZaGwXt8uZqwOSRV2vfotJ
 y8Sd6lGe+VgHks3H+pYIu4PPx1Xv56Iy2/rN/AQvx0tolTCOkKYCp9GaXbY0FuxF46
 ynSbEsSY9mFkRA9WZxwiZ/uGF0pnQK/TULVgDa3WUBDjg6zt9kLw8VqXON3LZYTsNH
 5J1qZhO12t2GfPZXMS+apMcQPjuPIXgngY03IAkPnudByI1bzTQitoC3uCGB55Tx8w
 ZhGgbcNSHq2atqkBxu/MUCZU3d9GeGnJiKh8gWwEBvJmJ2VbX61UGh13yWxxY/OfYq
 Hf2hqHOFouiAw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:0OlavCeFKb9TI8sG2lF2r/ra1W0g31VvaQLfFTaCnawRQy8Ie1igjOkmOcqDkXYIYRvnZKqKQ1HNM0bsriODgvlVb3/m/YDfIWlJuXqfOb85A8j+0BapAkq+ie7iowQtqJgthIXB7AywAgLNpJOR0caLzHAhpJQ2oFny+GRqSJepVcglheAE7jhPJDTvH8SuchEVNJHZHRXTz4epG2NEFqr2PPSwreXrR/8eF/xi8dQo0LmtOPvxInxASXteX/NCf9BJyjWD79gvKoHSYxVjF+Z9NjHuiR9/o1en/e2+9oKYttG/eB+xf5ocrarYAFUkhe5tZBlENBdq8U26JJx5mWxCHKsauQCIwE0uVMnJjn4szMfNZQvzIRsonkv/ezsmnCRAXWJUzTE2yxzrF/DnHiNE5aqVC9O1Hc80IukWk0315ctDrrmlw7k+xQczd6f8Sj6WCkT0cNq+uzuG4qzYWeMX2/6/x2/eoCkb3lRQ7k79LV15YFWD4bIpRXqqIsmLQ+A0DRc8WZ753X0BNKQ7zotQ+thW0EIjpIanK7L9k0atozysGD/LnWeHjYLKRIq+73k7ojdt/834w61Axa6jHp/v8xzgdMxGHqVEl3LUzFrihi
 0DTcYeuqXwRYi8zsEa5VvBf5xWSmUjT01zEEPO2T3yDPm+yYHWYBUYjWmTb4Q68vGWE+1NrVE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D989A4C4756;
 Fri, 18 Sep 2026 20:42:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX1-000000007cB-0biJ;
 Fri, 18 Sep 2026 18:41:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:26 +0200
Message-ID: <20260918184140.3631274-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 64/77] package/sofia-sip: Fix build with OpenSSL
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

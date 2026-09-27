Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA3FC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E1F4084E;
	Sun, 27 Sep 2026 10:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CoXTgvRUILX; Sun, 27 Sep 2026 10:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5678840811
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505979;
	b=hBQwpIVSzgDVue8iCy5vydsgCbeZCvfGd9mQ5DDtb2pXUL2ZvGfnEHXeB4uPCXY1N1LD
	 sNwaZxG8uHJdIbdcKconL2nha35fVx9ugIYdAaxu0IC5N8IZG+DT9EZ+2rEc+B2+B26j6
	 GYdzxBqh6mBsVXzFwzzmm8gZ7iTmH+vU2HMh2LjtkptRXKlU6MDAx5btOLkkzLADRFfv7
	 CP14oJw3wo5Ak5hdH7Xtxtzgx8HAlAo3tVeVZVfKsSwdBll64lvcha8s+NFAmaAqvl4Fd
	 CQdFpkfxziiHMMSXr7StviX5O4xOUe+uILNuqb87qNCUpZTtnZhqqF9czgGIwdEiK4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505979;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=UM7+p0MbT4qeHrkH675Y3RnSzfN/8cttCmu9SqlM1EXevJy0+uiAGH4UvXBOF+7q2pjF
	 ocEoSsRWGwkkDM9whpP/JDRZV42htT3M/5bUHVku1BJuNsYZfCIBrPmIkpqyP+KHn5Nnt
	 M6IXsa6sizdTfQzpcTEUAvEGaurqZdb+i+BgLsSYJ2WhoRt3hTvBpxV0W9Le57SE9bmCZ
	 mQ0WvHsBPPtEe2M+l8sdscFObIbKZH6ECUqUn7xxGwmj38UNwhYseoSavIgEeIu4EKaB7
	 P0bigMHqQ3mV/1VbIJP3ah8S7HnYloqoPYOFTYvKVK73QiJ+2mUnJ8uxQFfYG1rbtag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505979;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kqu8uTAejU4RSqHU2jSLcdBM6CVPqSPvWCwHIVVs92f7BbyWgX1aYMgd2bgwNTwj3
	 1dVOSgZD4OV4ZIqRbyfGm0vKM1iykit3FKnmFBn8EVLB/ynVi3dGQD9M0r5XdvVdtP
	 hNmNgBc+stQYZrO/ElkNYoKSAW4H1QbG51xiUupfQ3kN8x5sazCGybSRhVuIfuzFGf
	 I7YPEp3eG6cOT0+IoRiY1B0CNyf0zy+m9VAzJUvBd1+oiOKdyLcQdlgJX7U2Eug1tq
	 XKb9XbAw2Lqr4nRNg9xFo1SqVbeH7y9+B6As0CPK/jNQip4QLfqZdV+0jopCrkCj5t
	 lsdBMV8fxXQTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5678840811;
	Sun, 27 Sep 2026 10:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1030C334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D9E1810AF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHhXOu2r532S for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 02D20810AE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505976;
 b=X3hNlg9QBieHJ0ozkG7u8jnX2FjfWdvekh8RT+KAbrzyUMPZznarrRXHes5UXgh19Pl9
 R8rAXrTaBjkWGBjf54fE1c3i6hDwhMey+5l0NFK9BPZcVV+frkq0L2TQ+XJaei6f5/FK/
 708Ivdsup8+QChAu9zVbeHTbw3rSfKGXhaE6+SnguRVa323XR280dpFwulRk8FdpTLBs4
 8ezlZUEJ9MKDg2fJPVkIDEqtFCIyi/GzuXtgUgTUoWxrEO978ZkSzif4kJDcH60pyCzaf
 i+a7Cm0LqqcoYTCompf6JCs8kNRMUzBIKkxzebn+WlhT2/O14J3zhMBFIsjbZRIY5Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505976;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=Jy5ad2yALUT8Rag7TuBd2D0T6pn6Cup/qIc60+PnJx0h+ElNMjDxNvGKZoR0sSg2w+Ha
 qqu4cb2WsoVaoExC/8XeQkAxFPbw7TAqVyifR9vcB3gi6VrvohdK+dVOOdTIynhbZBXcq
 fRjbHF/3MlReGA9ValqLb2c+UULHSg80vPqjbELJ11kR4B6LCQoRDt3WOM8xtF6JhXtNe
 KPwucUoq5gebbv5bO7NgJcQy5Qs5u9NYcppV1Qtkh0lgALPiBBONOtYDGof1yHkrHupCJ
 p4unwCe7bW0wWw/NuoyrRfllNaH+eSUV31WDxyPPrq4SPve6iYj1Fv6lwgy+5OJe9xQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=d6fa3wIc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=d6fa3wIc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02D20810AE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505826;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=d6fa3wIcDmVW+4WE2ay6TJbaTNpmlqhx0SgBOlX9cP22n26SayQ7g/dRYX04RGOjZ
 VU5z3mSA1wCYp4c8sUA1Qr/Q0w93SSWyxk8vgR0Y9w8aDcy5++pkKfSBZXa0PqTG7S
 ti9tobghM32oIigzpz80MFFi/GD2M0OnMoIJ+z1YTD8Iua0VlnbseHEVa1CMIocsIK
 uA7wSg3BTyHinXbE0kn9c5JkZ3blZDXtl7xlecCbd7oyJDQ+JzXBK7v7n9ejUvjFaI
 cidclth/3CXKdnASlEbZYTJ/AddmxbyGq+hwjc01+l5MzJu+C4+J4xl8YM6lke7C6w
 XI7OIvu1TU0Mg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 WwE6whO4A2nntXK8nux5+zAuKejfg2nH5qpkACWWtl/Pi4qqxKHtcWqquhJLGAmAnbMUA9HBOWR
 9uEPCXrsS8luEgkyI4b+bc3DP1QpqpqYrC7FXBZvtmxOpncgFVDv0/90Bu72owNpESeN1CpJQoo
 lNBFIB1ymneX20Jg3J/e/arxZoVBMSDUZzl154ihsSW9USrXmu9d+vtCLLrPVB2YDapRMrwHMzv
 46EeZZJRxMnRi9CjKzD6IRBkwv1p8vbOCimiMZHnXmqkhnAgyjB/e1fZdUDswABI0+J80aWyEVX
 mEs+NoKAbxK1W4vZS8t6j9yHwlomJ6PGxRjWcglCMILFLnxhX343fUQggS6viLb50eywIPNJTBo
 iIPzbQqB7ks+XJUgVWXxKKqpARPiLcq5FLCSRsTT/a5tXa6zTicAOEne5bBGQ1WapZivdUZgtlO
 2Qc6I5RkSH6j1YoVaGZhdqv/TtQwo5x2wsXYx4ueRiChjE+WAtjtif/KqlQAk5FPlp0jldG1vL2
 je/CdziMXQUvnPCT7lQWrtLwgzP9nQkV88tPnpyQDhvzS1byJgZ40cT2ew/jcJhCUbo45rPUZLx
 0zzwp+izVfib3IOAaG4W426tJGA4KsQ0oKJx3IlAWU4xQ8b7oFpp6aC3ylxzNG9fIQdDittA+lB
 PW/DSJEl81+UmpyloBl0K
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F32CA4C4F76;
 Sun, 27 Sep 2026 12:43:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLg-0000000007a-3d3h;
 Sun, 27 Sep 2026 10:43:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:41 +0200
Message-ID: <20260927104301.1801638-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 63/82] package/pkcs11-helper: Add support for
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

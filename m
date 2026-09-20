Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF50C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91D840F5A;
	Sun, 20 Sep 2026 17:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4oyGzNJKeWP; Sun, 20 Sep 2026 17:17:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CE3A740DB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924666;
	b=UQt3Qx2noN7Uja1+3fbJUfSMc8pvTczGHnlziZwE6jJZgNsAFi4upsn5GzYBVW9T5f17
	 8mhdco5s0H0Voi8gj98LgKdQ9f3Tn14kNCaozSsMGjwnuVrLWUSw+c9FAUnsVVaZdB/ze
	 /dKEFwD6K/YKbMnFJ0zcX/5qhw9LPeVAA9FIBuKnO071hJiFsNSdy2ue5z9l9N1/f9o7m
	 QCKbuo5/cilapEkmwPC4kuogBVuejINcndW9iqM3W4guAnXVtQn34J1GXoSBjziNOzCZP
	 Kc3IPZfkg89GJ9ImQYp0J+Mt9QNE407XZnicEiG3C1Vy+gN4v0WHe09/qNgnosAuJ6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=Hru5VD2XQJcpN8ccJoHRfN1zJwZA/tECOLCu+wdSPyMJASkykZXBebTIJ+omCX4/fpdP
	 wfmHRT6pLjoHTUmDp2eOjRWSvfEuID7WSoREDM0bRePPzUp3nzw8jcYMblGMvO3/UHtnV
	 vuB9qPfLNRwGRvwQJQOSBeoRHut09BQEeKIRl5KEjhBv16HahMZI2OUSc8VlJwacHBQ76
	 2wWK2xWk8ZDtz2fbkoCdPH+RvE8bWlZ16Z7tY+doID9mTPTMG5IUXpIX2RzLLPqBW940B
	 GaNhBxVbfD4LzPdEZDjE6/KP501OUq+R1iHwvwtUbf2Rex7IOGoJNI9YvrZrmpm/xaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924666;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=neY/jT7Gx0AxnNvkRhiJw5DbSO1rBNAku31crlfriLRCT+NURLqha56EZ60oiBbE1
	 4zBzLWVhs1cZsDzwxt+IhfcaKjof2a5rHZvuMTPXj8gUVWY0r03ziJyR7C2dOMpOEu
	 5GCT5EP46szl8L1bjVVoNN9Wvk15b+KS376oeWp3x/UuTRqKT/7O1XVGlpcG5kvPr5
	 3DPw/9aHFNLeMRpPv2EeImJ2O7XfnCa3fmRrX4wRcWQIMOvYedobnF6VOlfr7f04aP
	 1R3ORigO0JJOWtYufMnysHgghEKAbEXR05w4uFtoEzR/IBFPfV/ZB6wKgVdg2pe4iC
	 UQMRg8vWgv72Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE3A740DB8;
	Sun, 20 Sep 2026 17:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C776F37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD0A9606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tb0mzpmNABeA for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A082660601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924664;
 b=Y+9yXir739J2TFlilpc1VRlmhHCGWM6LT6D/yX0fJi+57En3dfxr3KLJ23BabHlf+3OE
 Gm3X3D8d/5IWIB6iHzjOlyZVcboCKpZwEjJYYJQ8gH7vwCfRe/J7bfsEg/bbHn6WyWWmj
 ZHsgqEHU7WyRd9HjkUbKGtLOrlA/LngsQBniRxdirZhg5OHFLs0JjK6+EEBkz3/NecGox
 d7FAN0LbrGjuu4Pju7IYxksbVvPveRzu8JqzvHc9IzConPqbMb0WmH+Hv9ZLu/P6EBN9w
 Mjn1MPLQ5YC1hfOiCowij8SOfWzwp4hFUJuRW72iBOkV7UE2HGkwS438feHwcJhiWVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924664;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=hPF7hPFfCZmEYUCd5uLxcW6HtwjnraH3S6+jsLtNaQWCe9LnKVWYe7LLvt1XcrJzKYST
 jOTEHq7Rn9vKt7mhoEPwYIXRjDvvUfLJRsxB3pojPv9bKa22Cz7YNiLlhSPgWU1bDssNi
 pjQz20ExMoE9VHHEiEiAonO94OOlDPqJKrVDPLyqBvwp5zQH+IsNahN9bPPPGzxqi7jP9
 7h67utzDpymwYoCegJeNtWPTEWONJyp+5Vt30G2JpWcFetwTW64dizxqReGXQdqH4HirV
 +MtIwMZJPreeTwmv3MDkIqPKd8EGbumDRv3e4VX4V2z5RclJNTpBRb4DOLyhJ6dKsKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=g+0jz28m; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=g+0jz28m
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A082660601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924158;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=g+0jz28m/jrRUf/ts3u4BOmBFm3OAAJnxScjL+LN5SPTJ85JxuP2hsJ9CBR5ZH8+e
 tZIrVHt9GiXdX7YOMcXBTRzgbJcFqbeHTAGbrx5PV6KgyaD0vS+59C5mve6y8BtgJj
 IwENcgaeqSyj9ARhnZ7Vfmy8ZrDjWB3+crrNulTebac1aPkXIr3mmYPyZJZaeogyxU
 jY4PDXV9144D72SHzwXPm+Hr4S07QuGoyBUxHplmIG0/Iphl2xl5hEbNGaQSDo1DUA
 Q7rur9rgPqo25gkV9WD/vXe8wYg0KCx27jjgtfxSuhmejMATACHp6c+wRjQE5p0aet
 KjBuZ1F06QuIQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:kJq2qSk4Wuj7U4jGmm5Fp6p9zxECUQSBYdTXa4nTrRvmQCr4+udBqihXA1yLVoy0h6XwkRrPga/jYBzOwj1U8g2exMkjuPJgzL5H9hpQy+lvnIEgQsiD2tZwCeqaJO3Wb4xHRmfzk0kzz50IRYuA/4GBD+jv3O3Oe+QDDub9oDQaNwenyuRseaKE97lfMm+YWOVZPkUJ0qos9TdgHj1l0OR4i7FaX/2Cf46DFhcFUoYlVo44vSagQx2o8aZuDB1NawWJJ+hcunsPSQACKsbldmvzHsk5t4GUpNv5OMuAMgCXtfk9R1tZdaYF/ZEKaVfy9jVIF0FkAvsWQA2F2SHWG97r8RuJtlPOnp1xx63wFxg1g5KiM2QmbFyUJ6k8f4gKYToROtYc8z1voEx/XqWeUzSb/5jZos65hCRuTFtjw0v9VeX+Ux9TnIfzNDCLxEtvHTPrn7fQB3GdQL3x30UUvvDhJ8DT6/u/wcqBznO3bPM2Xb+jQXoh6RIeGRmWS+ppgMhYvubKc71OnSyktcwbQ7P6NXTB6crxL1rtiz0Mtw4wcsiSdLWHA8MIRcLii9WKw7qFPPrEZCdlimU5Uscbcnj4pSnVZBiZUFl4CyEARXj3j6
 RHthiWCN7WCCDvqLa6kwcEwbCTlTkzWJX2aKiS/CbxZEWXunibkVO0zhihk0c3CKyfeuVFF58=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 977BAA4C4891;
 Sun, 20 Sep 2026 19:09:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1b-000000000o7-04Mc;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:40 +0200
Message-ID: <20260920170815.240247-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 33/67] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

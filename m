Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57EEC982DA
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7455540D0C;
	Sat, 19 Sep 2026 16:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_PMWovQEHMj; Sat, 19 Sep 2026 16:14:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8F5C440D03
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834447;
	b=J/ANO+qM0FSt6Zd6Yl0nQMu+v65PCCiLHav+qBBAZ5kdo/sWIxm62bjIqMUMqSJjvDRn
	 IFQTlQUj//y7oIGmSBCCVFboYN0j3O61zC44ZY/7YqCzwwHCE2lWaPQJduMdnFkF3UYVf
	 Aw/Zr7CztfWd4N61nYLwNgoFGoUoaDxz784dV2LZ4uVIMAGglMJw+HlInVRC8DdbykEgz
	 dNP8DzN+w2X1U3rSM4WlBIY3f5iWN8pbbVVgTHWesO4EU+06LxxfRt3qLJchPbQegZnKH
	 b/IELTSwIDGRshdyQSiOIb12JkO/TviafepqQjhZe/7baYa9c15WYT/90hg9Dl59SjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0+sZknX8TECdcly4qLiFcpwwQ06hNuA3M8UCpu0Bt94=;
	b=DVnkM9YC63pUWbgbI1QO/j6t9xYgUQFM9ZPrLCLmAiux6kV/vZQ8f73rd0Tbm0ujFzYW
	 2Q7VBfGoh3eccRorqJRkr10Jewm6ofsY0YMdjfhRG9jvHMN4qgB/zwxVcoFMwvN58esC/
	 6U42v5cvvOBYQ+sMhdjCHcm75lSc/Z+LhdZXJcG0c0HojxcgGU2cwQUGSFKFCK3l3Zo9E
	 Q4UiUWSPNicrNIDMFwcp6St/+JeSdgryNAeFcCX/LyHoP7UwCVWTtigPD+qoD8Wo5p7ur
	 BUwkaFEVrnBM4S0A9OgTcQxMNKVWBzfQzEu0ozV9wz3VC2ensMjYbdS7leTQo86p6EA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834447;
	bh=0+sZknX8TECdcly4qLiFcpwwQ06hNuA3M8UCpu0Bt94=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B+JwHioCbYuE1s362/40ROl0r+3PgoIS8rqbp3F3df3xu7jVvqUqeMV+PtqHnalFw
	 f/Tp6dea/HEFR8HIdFAIz+R9bZ/iemoDv3h0/8Sr13Y4osamrP6TMMtZbcDzfxwVka
	 73zlWhCgZO3neuG6qPQi+J/mJXt7EfQGUgCQRw10+8FNMs4mhs0ppoauKYks2ZojUW
	 qUY2PaXb/8gV+Lmrol31cs3x1Y0R6A84Q//eN+odW1qmW+sIUOFvWlGeyHgFX6mQVE
	 Ce8GUjAjVwhFTI4vDArCyYKZ7LQMJd80g0H9w3XGIq0ObJwjOI18QNB1pVV4vvstnW
	 doa25yRNbNSDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F5C440D03;
	Sat, 19 Sep 2026 16:14:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22594333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1447F40085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsjvddZQpV7t for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:14:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0185A40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834445;
 b=G+/Bg/Xs7nMqqbBOF4+7vw8sTXgBrQO+5uuRvdRzt/DUjX3VSldM4F3iE4MQWDIymsLM
 eZ61RRKJw5WoerYIyiJWNHmscPerQYtUcBYRtBzeKOizI3Fcl3PfTcFYKDhqpa5MnyrEn
 Nk95STvb8coGCpzAmxe0UULIbUw6UC1wnPd3w8kwPN8aBzgx7Vpx8QMHHJ4VL1NZQgxe5
 D3KUmZD0R8PPEaBRENo8uGpazv750RF67jAEJ6lwXDBKds9V8VihzEc8Z9QHfWe1t3cBF
 Upx7jquoPrBzl0fhOtfWfez540JeeWcdAvTFkr/paBksEyIOwADTIE3zZlfnrgDipBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834445;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IsKJ6nhHUCpYF9rkotrVH9bxe6CSxYwy8ZH1pTyYrPM=;
 b=gXQ2y7FRZ8MW5HYSi2NxeQupn8WLhu1cnOSAiYaeokSOUjMF6ofRQtF1B4FBytf28l2Y
 Y3OUvP71K6a0jXcM8oRMlzpSJTgwMbFNEHJDlw7UA/80JVDykb9D5JCiIbvPYQEJUY0Xu
 ajL+9ThkKgfi82W8yxVjBOYiy8Nru9OqQ+qt1hQQIXH8Cqu+dNyPoQGKHJpj8KtCPK2n9
 Iro9M3pXsX6e41lJxRyea++u8q6RZeCdwVZ5QQYhKRCEVjyfIRXPEs928GyzM2AoiGvoa
 cqF7lFf28oJf01lRhgU0DTarXASIej/TdwnRo1I2a1eLoRIS2mVrnkT/65wniuqlprA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Di1wPmw3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Di1wPmw3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0185A40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833559;
 bh=IsKJ6nhHUCpYF9rkotrVH9bxe6CSxYwy8ZH1pTyYrPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Di1wPmw3o/p5E1ddvoddG/5CuTFfhWxIOBbp6rHfekT+EpU17ZKLTJfmoXXIKJb0Z
 zmOyF0Vf8eOodbzrucCnLFdJJVLuvteIoYEpaOoMGvjy1mAX56+29nqV/c2F0SOh6j
 yGVo0hnRf4Gpna0BbZi0gr6iJU755eV3ofRiLhOWknZWd4mTmtGIjF9j6bFwjcrXG2
 ytUOuYRpujSvSK0bSnzyT2ouqNZbKC82GFvfwwUq/cZyjl0KSa1V0x6IUwOQNvYJ17
 d4OwxMfou9OtlMxZVShcC0SwbD6Bc1wOv7NIqo9YrPhqN5xkZdXTFswxfqPatKY+KK
 Io50CRd7m877Q==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:C5JVDWv5rxi8Jpvdwtob772zT7qxjRsNC0SrxJ1UNUfXTVGIbk6E0YkPsXbonuu8RaOLtPAdJQU7a8s6yTQcKKHXpb/rSyoiWzbX7I4bD1qIWE+LBSuLDgRWvkNaLiQdRoFNqWHAXGGvhJqZIbzxZ2PoxphNLQ5gdYQgz8yAT1ksTKJ5iWOIp5xJW5gwbi6x8MIOx7uRJpR5vClDWvUuZCSRxGbZfRKSz43B5CzrA/olMPywwP3cUuVjhWCvpbHuU5VOM0ufiiTU87NGMHip6LSrJs6ZBMovsaXB0IaKajWWoCkAmlzyHT5PqTlw7T0JDLYadbsOKeTCQQqWLNtXEwovflKze9rEI3ZlcyhIzY8sRbSpdKe0VHURwg+fmjqaUAdCL9/8CCcnMdvG1Jk4ZTZw4/EVz0clqi2AiN9zyjHGm/PTxdy2Bf/pyMESxi7tZKaHmV5AHxLkRM8BQ79nb21heX7cYcmIPs9ZSqTcdxDTPCX9kfnXoWHZuVbBlAuHsC4ClT3aMn34tZFmFRFMWUBYwzixUFv4YPmG7SgMs14q47v+2WxwPMDMfva9FI7Ks3yr4VYsa7KLHknqMghxJDv9vAK5YuQpAPyecCXdxqCQ2J
 AxBN3K7WL1k5S8VBUYuPZkLeP/6YTLiLTqPJonr51zuXKeIxskqIrktXWy5u6q/7Of40fK
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2AA88A4C485F;
 Sat, 19 Sep 2026 17:59:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-42Yg;
 Sat, 19 Sep 2026 15:59:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:38 +0200
Message-ID: <20260919155845.5776-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 73/77] package/turbolua: Fix build with
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Replace-deprecated-OpenSSL-API-ASN1.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch

diff --git a/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
new file mode 100644
index 0000000000..efd1dfb080
--- /dev/null
+++ b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
@@ -0,0 +1,49 @@
+From e473a5b44af312679c89b759e6be2608357de57b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 11:16:12 +0200
+Subject: [PATCH] turbo_ffi_wrap.c: Replace deprecated OpenSSL API
+ ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/kernelsauce/turbo/pull/374
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/turbo_ffi_wrap.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/deps/turbo_ffi_wrap.c b/deps/turbo_ffi_wrap.c
+index f4a9e94..92cd88d 100644
+--- a/deps/turbo_ffi_wrap.c
++++ b/deps/turbo_ffi_wrap.c
+@@ -77,7 +77,12 @@ static int matches_common_name(const char *hostname, const X509 *server_cert)
+     if (!common_name_asn1) {
+         return Error;
+     }
++
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++    common_name_str = (char *) ASN1_STRING_get0_data(common_name_asn1);
++#else
+     common_name_str = (char *) ASN1_STRING_data(common_name_asn1);
++#endif
+     if (ASN1_STRING_length(common_name_asn1) != strlen(common_name_str)) {
+         return MalformedCertificate;
+     }
+@@ -113,7 +118,11 @@ static int32_t matches_subject_alternative_name(
+     for (i=0; i<san_names_nb; i++){
+         const GENERAL_NAME *current_name = sk_GENERAL_NAME_value(san_names, i);
+         if (current_name->type == GEN_DNS){
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++            char *dns_name = (char *)ASN1_STRING_get0_data(current_name->d.dNSName);
++#else
+             char *dns_name = (char *)ASN1_STRING_data(current_name->d.dNSName);
++#endif
+             dns_name_sz = strlen(dns_name);
+             if (ASN1_STRING_length(current_name->d.dNSName) != dns_name_sz){
+                 result = MalformedCertificate;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

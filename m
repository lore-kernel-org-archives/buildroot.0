Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442B606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 05:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X99DI1Pe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lhVKQGdm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECAFD405A1;
	Thu, 22 Oct 2026 05:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0vVt0H74GoE; Thu, 22 Oct 2026 05:14:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 109BF40587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792646042;
	b=DnKygDi+jD97Dn2B9U/FCmscv25QNJfsHu+gUmxLSp9kieyARLbDAWGyUzGrC2EzXdeg
	 jJu1as529KtT7CXnuI+OJ3Rvo/WN6AwHqd5QnX1clGlRU/IPWMqqVNgrHhd2v4IWg6iHk
	 98GFUdTtJFzl3XljopulOE2srjUHfymX5xQSDrWimNtB0Py05kYLyVAMv+mt6bLRMaApF
	 Mk6gvx+8UPvwniqh492MQZPAWQMUmgqg8m1dPaFGnuGQZgtI+xqE+HK69vC2olsCTg/os
	 e3JPNBoREi0fY1qgbY0CKTP/mjkdT7BXahPjnfqkgCzxNZWYQ9Y9ZukylEty4lilSLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YitAIklXUA4fke1cHNgxuoKXvKhY5YbuZXZCMnh3m4E=;
	b=mNPn3ROWYWGz7Yso7ABQlcvCLUUcxjKYmcmybfNvb1xRA65BTtij9ATensoBUQmQbz/Y
	 BIEddqCd4e1TQ6rsaq7oJuYfhJn9n5S6R0xZMfWQnTqTSGWJWD+nPVJcwy9kLnPJTQVB/
	 gMzHiG6Y7PfnC/nt1LII9uxZgFxLSi/8nBTzsm9LLetYqrtnZOaUZmGwLUrhrJ+MzOY5t
	 JzUK0UKmo/CITvf0yFAWjvRTVtYRTBe8Llfe/Y6dhnuJq0anKYtYbC9lxOGAGo38eCpYF
	 Ksqm7s9Ei1tcV7M+PnEck6VnzOUihi4W/VdkeUlEGP37lMo/rs3lpI4rTiyIhHT7jTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792646042;
	bh=YitAIklXUA4fke1cHNgxuoKXvKhY5YbuZXZCMnh3m4E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X99DI1Pe8UZC8MJWrvbowRYOJktBn+0DYZnnVQS/jQ0zXp3uUmJUxxTs0q+j5t4M2
	 +WxjWTr+eCxzzb/xuQvlVVkfuPIpYHtIwUY5APQkWWI7i1QVzFKyHvi39olwmXJVyV
	 IBpfRbrvLc9A0EQ4P113grElRuqZrmY77nNMz2sgtWA5RdDj5Y0ojF5rz1J6Iu6x34
	 fjSPcvEyjrA74TOr42FTtRZ8A2vKoMabb+hsjedmG12Tyd2GEvZkmYX5mqKqf54PnG
	 OLi6wbOPU9ZA5SX/dg1i2LhvHJwzRHQEJ3ab0ZPeFew/pFo+yMR1aMQBglpylCzgsh
	 c6NYCXWSc65xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109BF40587;
	Thu, 22 Oct 2026 05:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4EC3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A2580ADA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqmHF1E8gCLp for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 05:13:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C93E80AAE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792646039;
 b=Pk2EHFp2DUJXMEbuJKspJQ9pWOTq8z18jAM2sZQfQEkJ2HmkXMuJWqkDdFjP3/UXNjqt
 0rEGtB98xFoCULCOswG/wShfSw4gqwFmAZV7/eoEv4K1EdUqRMifZSt8oiuzliThLoTLk
 GsSOxvaTFc9TKaAMzysn5XwGG1LQqOYpieZin/wtxjyn0L2hXLsS5bR8G7uG75ZoKlw/B
 IB6GknpFxQbd9wfz5ilDj+PV9ZZE+aw8uPya3HbHtwHNb803ehXv+jjF8nWwMOD2JJXyr
 SgZWBeqmhVX2k/N781OQfKZvk1VU491tsX3Vx3dLALshzZ1kB0t4Z7BGLefe7Ua5LMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792646039;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=u9FoZVWX8G8Tvvor5g96yv2c+ZWQ/oE0rheZrOlzgRk=;
 b=bfv0wtsxXvax8/DhbiU7VDwEif3IArtde3JVZ2p0Hz0smhZj6mURxiFKFBFkaITy4V70
 enLRTaScyBGmf7pM6lMp5VyAxB7Hdk/9V2KqTYYZ+KOuVhgQVlMSkvYo/v8ds7v3gK01q
 tT/5mCcx9dAiWE4M/4eXygRMvSptDbI8wuKm4u587+vSSEJ6PPGhEEDDH9cMkBxTej2Kj
 8P7RF4RE068KwhhpQ44kQ+SyoZFQEEIrhTx3eYw/pT1+ZLxBGcg8t9PYMJBawcpavos87
 YozdKkKFr67e7P1626ZJazcpm1DCA6wMfy7rMw8xjx1a9jL+WJwthVKg97qgQAVWcZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lhVKQGdm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lhVKQGdm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C93E80AAE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792646037;
 bh=u9FoZVWX8G8Tvvor5g96yv2c+ZWQ/oE0rheZrOlzgRk=;
 h=From:To:Subject:Date:From;
 b=lhVKQGdmihEv/GgykWOqAkUAFn42Nq8GOH0VFwcEOGQWMK9y5CbKCoJgWgNAsu5YL
 n6yaox3XQedtk4xAIhaOmj2/AKHUTsItqnv/xLfxSrDB5kCSfrUX30Gk2z8Jxz1Z5u
 MOLoKcbghXM2ynCogDanW1WC9e6jJsMUGGRyc748YhhQ++G13H2lZs14Tx166hyUso
 XIO3EShX36DVPo2vscw01d4X3v24qZVFymH/RXhZhx3q8y7XerypSfgBt/giVN75U7
 2Gld9TsnD5XhdWvJoJTu7egjiXysPLGHPxlqAW+KkI5ziIlRPfeDMXzhtjaddu9tur
 Zu8F5mrA+OwOg==
X-KAS-Sym: v3:f51bdf72230551df:dvRQnSoirjFrkl+6nf2Ex4c+FN4SYVpYJefIsKxdAZm1C
 zyVaeMi5uXC8hYhH4FDu30JiWluh1m8ugqQ1a7hVHHjHvqD2JHo1IgVT7wIFRZfy1Rk6fRTRFqc
 XNij8e7YGl+LIzPLLupgQBygGOqTY0iJ17+Ng3amiV95FbIvqj9ZkeeTJdv8q4/SMmYskvKPjYE
 mPkqt7+BJG7z3tkp4VJCDxAN1TWAd1khSE2JSJiZH70kQMeUcdtMNCSWC2+Oni2nKmEX4jOtoy5
 UE0wVosLDTkG5nMET6eKAuVDHPL3/QgFwi7QePq4i8NKF0NZPCBgo5q5/7M1PYMwirtKFRXQ==:
 aWWbDutCasxMDAzQ13mfvbviOfe0bvLxEgZohlpmV7ZpAMGSAwtOwJN2zw8b6UJGk74J0Y7KAYV
 yx+paa6nooUiWgaGm/twveKd1srMxX6VsJ/I8Q+BFgrHr7okGl+KC1vPw/4gq5TzuIebqbgDfRX
 9cr4Qxc53/SFSZaLYSwGcQ11fekseg0tSFuKN0yPYanXmLK3VUahiXpUSfdHiWZvJZIuiBQM/uP
 ngtzjURdbSKSuHT/rqFQiYuQ3ojZQeOP9lpHcOaaD2QDui2NfvsDSqPPl7sqk0uMV1mwc1XLeF6
 c+2699AF6nsHb9FApQTcnHel/Up1025eLMPW/9GrT/9MpO5rF2/R10G5MxhVbk1CJtrguGU/QRZ
 g6eEjcWkSdImfdQtIv/YkS53cA/4HKSJBlxomnTFc4/ogITarLqFhdxN6XmCkEHm4aQ1bc/Ipka
 fDvzQ9T1b4R/+uAY2waFst/UTKogMjMP8waZt2A7m6Vpcl1QLQiESQyqeH8uoiR42XAg/+743jK
 zqtxK5vkFZ/Rj45nqcAU88lOlNIJt953g0DDrFL2j3RKdqxSApKUPI/p4fUJ/qzStQgA+u+g4pj
 N5ECVBFPUNh60AlNhQwNsPcTRoD93mrnplq0VEwhwA==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6C88A4C621E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:13:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56220)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJl7k-000000004dP-0oCj
 for buildroot@buildroot.org; Thu, 22 Oct 2026 05:13:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 07:13:56 +0200
Message-ID: <20261022051356.5768-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 26.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://stellarium.org/release/2026/09/28/stellarium-26.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e9a5d08504fd408c292c54294f8f9807ff890593

with the exception of unrelated build errors for these targets:

bootlin-m68k-68040-uclibc/build/qt5base-bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8/.stamp_built
bootlin-x86-i686-musl/build/qt6base-6.11.2/.stamp_built

 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index d0dd53f900..1e0e0fa9c9 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
-# From https://github.com/Stellarium/stellarium/releases
-sha256  9a068d00aac82151f2b24c7f278847a2f9416f31f17c0326fc56ee4cc4cb1aed  stellarium-26.2.tar.xz
+# From https://github.com/Stellarium/stellarium/releases/tag/v26.3
+sha256  01cc5fce373c3fd2262ac0457f0b52be72adbfa30f8a959274be221b436b7ace  stellarium-26.3.tar.xz
 # From https://github.com/Stellarium/stellarium/blob/v26.2/CMakeLists.txt#L857
 sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
 # From https://github.com/Stellarium/stellarium/blob/v26.2/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index a3ab725017..df59305650 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 26.2
+STELLARIUM_VERSION = 26.3
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

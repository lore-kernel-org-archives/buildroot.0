Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3D5C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AD160706;
	Sun, 20 Sep 2026 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoyHI0cSHdbH; Sun, 20 Sep 2026 14:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B772660712
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915552;
	b=c5ghgTrZaFsOqaOtO2x6pJ0T04WDawZfzFo+qmIBmMWB2EkeJHLwAwO28arfGeWH9077
	 yCnCsjYIXQSy2taEFT9ikPNLTqdIqnAEUilL51/ImRjuLRztF0XioPCTDa33V3SiEBi8p
	 LVSwCjdi0CFsf/fJ/yvr3F/jRiXLef/DllbdrAC5pREhEpi0n/rHCvK2MWRXW1nbJDawN
	 tIrMERk5/2Xwcn+8aYCtcoNCyx03GZgHj0+1L4G7XG1ndaU+aDlKh2EP18P/uis6pPl9s
	 0tGlkq6oUTmJDv/pUbVqlXtwokXlzquPZMuXj/3opbo1+s4e/e34mwXGDiXjx+qywvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915552;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=S+1DPpOsPIRvcCcXYl2DspenTyPdhyDwDeyVbn+EeSts72S2/x+w9ugkva0jpRld6Vlk
	 R63xlwXLSTthSBSuZrcSOYS3jN0LHKOrc5M7R/p7EZfksXKdE5VQ0AP/lERgH6s+Prs5b
	 DzcEHuzd7QY6yaINdYkZEHLQvpoctkT/AyjHw+YjAyyigFOK0vxHjaFhnjpJ5LOiA9n4u
	 yIj1UC0fJ1rsvz7n6iguHgiC4m3UxHKP+18knG7hF/4EeGkmxXuwNL5IYodB8hJvjHKDG
	 /D5jg6LMvK03OQlB+H41SapcqaRKsQAxpIUztE+8VWSX7tsmo9Z8JjMmW57455EnUpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915552;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onyk8QdQ6GRuqDeWs/lR7y/VlPZdo3rd9aLNPzseTu645QYehVwWKtPuEKD3QwyI8
	 jKFf4+5oKSuxUCPCuSGB8NMCfDXcfqs1IOF81XbpQOTHvUo6mYKryfF5t45WTIArZw
	 1sa4y3ruE03CPjWllxJFbD+ZIw7JONO5VOYy604P8MBkf0FzB8XkpjXo4lAaXl3qky
	 DAw0MZCDeOS222Nu8a5w1oS2YsE5OwLP0eLI5ggmjoqfXTSg9tA/MlIfnAZQMd3L6V
	 E2z6aLlK3v6JZ6Mad2v5O2Kiv5imR1A4m2OGRdk2LNgkUl5RiFwZs7R9LdBHayy5Ys
	 wNiMxZUbVflaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B772660712;
	Sun, 20 Sep 2026 14:45:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93BB03FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D0080EDD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT6auzIsHsE8 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81EE180EC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915550;
 b=mPNYTfv8wGyyC4pEi20t/UPa5alCMRRtjIYop1ia5gKdc2Rizd8BDCVekGlFppXGC0xb
 AN3Tq1SA9lelGdbkuEHT3XY2YvyHABXhOIo72KxM1opjuzisArZcrmyIGru0Ad4/Ccls9
 jFnYxqIEh8VAf3WIwcsbsLJGF/KOyB3W8rry5BBrvt5Yvhfuyd7jPqNQAu3M4QV+Jkn0K
 CRPK28LAznmxtUtN9PTtazWcO1MsSqEtiG9Aulmi5nW5bpsMMA/mR0kOEh9dEO8ItV0fK
 AyyFk8dhoOdw1sGMWDEb6A1TMIiwKfJJ2LuVsYt8CUr2/3WbRPaXPM+zzjeAXz22+Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915550;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=aFRwXvW/4LhaHPb17XRXvTqRh2B99ZNo2+5oIuqG+oq8A30d2Fu2w+acwIyfXOu4Sz4s
 Kt57836gjkjvYWWFwLTA/toKxHh6mmXUbFw+iN87qkjzyy83Uev19OiRaGFZ85yNJhXXZ
 6cM7VpwsRldy71B9vng+Mwye024xSSWOKpOrgYOm30mgQCOgy0N83SzRxLIIRY2Rc+eBw
 yJNDlAe4mES8DUrsLuuhMAelZo16pbfSgwJaYyXpkOZkJXMYzknQOqWWIAhMU0gnSnJU7
 8S0B2TZXsRNRJeTh2Fi21cYWBZ8EbzxCjjFFLVV06012SJavSscKE8fsWetvOkXE02g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RqBaZ49H; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RqBaZ49H
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81EE180EC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915483;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RqBaZ49HXNKPHvVtMHXOjgOpgvaRgSxytvUIco0goSKazhr0IzTg9Qx0DjDP/CCcX
 GEJwLQZe4f76IIfowyWLpSViw6nApgZI4r/IYKya4rqfbNpraPECXu+uFBBrqFlu2m
 eFmZdhFmpXXUDXaYbNeswsLrnVz4YdIjCLSs2QM/148tRAzUfXjaW8rLWJgHd8U+At
 V7cXY0ANx/ZHjuSksFZKcNUyfNa7dBErKSyk52w50TP9dKu7goF1QIrGH1GxOIZnce
 zDnns2sULUGn0q+yd/nHBQ4oMnFGrxfzMjwIUUbAT7NjkYJw66UETZM/lF4j4RMXEi
 Y/jIsDSlOVmOA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:tt2loeNI4QrvPAA6fKrTN35Nrd6MQqUT7t28Mh59uM5u4ytc8ekmgHaAm0z2cIPzSawJ2toiY8QfG+X/EDZXdLgiXMBFmbGhiqe+pwnR5DMx0rpa4xWawbD627yzslX4b5UgFZbKPeWs/n86vV4COUW29xOf7KbshZMMA5DK2+9ZRkyU1P/K6IUQ4vveTD46F8itBZ73otZSilKK3687yWsYC/1Xke1I4M5YVqyi8iBIGTxPrTkVIfeRs2wlxfKg2cmv+rgPg5HqHfvA37lvGP/NevfT3jDv4U8FYRhWypMDrvQqa13/IZdo4BlBKr0cimjPBjSps4Ug5MQFI47bEnppQwFD/q0kA77hxENAxWOemNBDesiVviz156QyG8YWIrBIVaYLCTP1c9IE/EfEh3SAGanI6ct8Ij+G4NXLYGj06ogHuUIuP9HmoVCXiF+I8hEQpw3+t2x2t7FNUOc/PEquKSxbg2wKWYTudCo5KhlguSbAU3ozyL9kL3F8zE5L+sumBkSWHVzERcF4893lLPJmm/I/cffGuN+76naD2m7JoLlGW3oRdxuUqdJSqAb9MGDupiJhZ4ZUkVRLsXAWgXJN1mx0CQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3C1AA4C4857
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ImZ-000000000hB-1wiR
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:29 +0200
Message-ID: <20260920144428.3009612-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 08/66] package/asterisk: Fix build with
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

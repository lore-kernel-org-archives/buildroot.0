Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E18C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3558360BE5;
	Sat, 19 Sep 2026 16:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QX3alzf1OkZl; Sat, 19 Sep 2026 16:14:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C88160BC8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834498;
	b=RBfeqrfO2rEkahMgkVE1wjQDd6dBP9X15cHjP30xzMIbN3w9anOB1HEnwwpA3FRcMPBH
	 KtcE6PMUlu8uXPbETQOal5NcRnmmwyM+eSchqb8gay6a5g/jjSL/zz8B3P3nI1jlCl0TF
	 tJrvlWVUM5ui9RzjEEjrtWrp2jAtQ2Qn8NBtcWfpBEnW/qppTT/ErwsvW2N3gXW/tTPLn
	 VnjxJK4T7Prr8I67tnEkNHDpfxPU3HCPEGnTTGC/Hqxj3VGivpIrbF7N94YBY+BMvHPGV
	 ndAG3TgcUf+UdDM8qnLevJ2Za5rpSwVnVayELL4M9AvUjGfHBPu6l17wjKdYsmuOBRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=XNm8TW24IRBirFxcwcuUYjRxkfNIijS/yIjGhNA+9RnVtbhVJXLA/FbH4Ms5B5Dg5FAs
	 01BO80B9K5XrgnK6SMHWumT4OJoaR77pKUxvt5H6N5nXBOETlwe49VCAckpGidCTz44o1
	 OubTt7BAbilMsSqEXBC50pPvzCP8hcMYz2ElG+eJ/TSsILUV1vjek/TGR53Nd6tywJUKD
	 E+4qiJ7479Y+t5PDI5YUF1CWwJucJvuPWO1aqb2x9IKPgaO1Zi8NTkfE6krTMcC/EYQvk
	 o4VZM6xD6SfZRL9OHu9YffDIKXgt92z/jcnTUvqIkKeeQqNYxEUFfy0aDNn9Mec5hHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834498;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oOQfttuaO5wpXqUPqk0si4NgxSVMTAXNGH+Y1rPs2558qgLt0yzzbfMwf8/zaszCB
	 FQ9Ci/B5TfG+UHuXVb7Lrscaa0MCpPosigSAbinjtE8JuP5o1h6u5AtAyMW4UKFapT
	 Gd5yiszYHtsar2fBsLN5lKryYdo9eOCzYHNfLvs0OjxtJ2eSGjB3bSsIV8hA/6E6he
	 X52csP5gCheyF32e3ZzwMgswU+r+RxQhI09olIsuhuqCcPegt16awwwtkUnkLUh9Qi
	 8ahGVguw3OXtHw1mXGNpFVepW+4gd13l3L8Nge271KcAGlK1Dw4dQ+YyLPpFym5u3A
	 9TVpDfqrGALpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C88160BC8;
	Sat, 19 Sep 2026 16:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51294333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4249040026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLbkjlNJOVkF for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3AFFC40085
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834496;
 b=SQzGEb2a1N0fqyWlh1FYZLZZn8lKYt8N//WJAb48zbC1eiomj7/zHRmmThlYYIthcMuB
 yEWB0RwWrPNpLltmYqQhi8xmtKddzqQ+5y5Sj/UZFr9aAAty3WmOE0CENhRwEGaOAcRCV
 Or09wqu4tm9GTn7KodMlFj+58ACdxucsL6ccAxIoGHuEAtxtV3MP3Dq2LTwolPCPyHipY
 NtFZRDdk4k+2uKcIVwgDwhe5yErA+45o5w5Nr2ZZB6F1XjNUp2V2shAoyM3i/HlupF3Hu
 aTQAjYoEtTutGJwVqjMuIPQVzyMwb3xD8oham+m+khN69g7LGS8dG2ZYS+AdproGJBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834496;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=CTM2MJ7tUXXeKW2S5TSHa/uM1ZUAmA9zOvgjZ+dPxGj8TlTraXMSIWHgJY8EwcosMM2V
 9i8APwj4NpTZt9OwNVkozfGZK7n3CaD0UDMrgQUgjiDfvnHDmYV8n0aAj9/W/lNfu3oAp
 81bLhZa/PxXNdQIleWsZrU2PU1pmodC5Y6EpJpKu3ATvD7xXScHghv5o/7HycvMf4kH3H
 UqA5xzR2us+O7ykL3NJeiIiYfW+ukzMFHbsTeqvQ8XuNemKHvSphmXNHeCeGU/GPiuXk6
 5KOuy8ci03zWvsFs/Lg9NkvC6qWskLR5FHQjboA6F93EsN15qYF19vWcJvGXdB7nNzw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gtO1WS3i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gtO1WS3i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AFFC40085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833557;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gtO1WS3iA48QLxyEKKMvMZ07zHYHtIG/WJh2iltrU4wBeAmOiZfB5naUvTEvBJIwN
 bgZWC4as5be8wI4gpE1Mt9o27nC8/6ebIlQjxtrZEo5Z8Jn86ufUjsVPv82V63GnSJ
 rOfwL7rMcv3DbRaV8yypkUPz2SXCDy8mMHU1W4pWJOjK2OQ4Q5hw0pJw6wIAID2s4M
 cd4/kG9l5Qsr4ODdMvhqgn7T9cG9ao52iKgF93CWMLcfA2ZzC03vNQv0njDvh0deeP
 rDkC/fiQeXb5PS/Nxp0JS5bexff0IlW5ozXRm4xGhCfnrqtjr2bkvTHcFfyYeLo9fU
 mbfd66k0eD91Q==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:zpf9NI7H9warvHXxtOqcaZvXvjsCRc405HU+SJXrQ9NlKI1Sv2AY+S7Yy/aAZfMrx600TwXDqqP3V2oWRRshA94lUJNPaC7V9wbk6DNTOajFJXfJ63ZGS0AGNQf1CEUvT6FnOBFolsbdYFF0l2kdHbZPtTdy/0erd8YJSCZIk2trAQnHlJv2B9UA1jMwRXxINT+pkVZm/ETdUg75UApHoL60i8x+WExbE2RdDhR5dCp9BIMNDV1CFsSgpbMe2H2aCwDPxBEO+nKqNW0nPkXP8ZEP2cdXAbfprc8+P/D95qSZPuQ9L+7eA/vMIsJbXYzavvrxIy12pkhh4mEty/mn/uKiYgY9zjxhi7NtdGrnDt9zprTbEOIMV6MOVM7ycxCIadsKax1hRToe7gHxtu7NYYRisEBsj1HWCAt8XG2nn4eHc1AydYrEfDMIGLPj3lWUdL0HPOhceyB/mMnscyYxJRtbET5g/nk2VC2Ta69b0yhC0AEbcyAQF3EvlY+8vOqtH/ZqRsky8xqVGsyLEnL2VXuHoozyMZHh+9uRylt+YAIef5UEIGN7U2Tvnr+aYE1zk3B+ZNiLyMxEyB+meWe0yjgkeI8W8vQ7g/x1mzEaNP05+I
 91X0XLg1YOelhPIuTyl++gqHyW88kR5Q+wIhKcApL6hVzbAzzspTivvF5Y2iC6LgCEq8hT
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7D26A4C485B;
 Sat, 19 Sep 2026 17:59:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-1EZY;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:33 +0200
Message-ID: <20260919155845.5776-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 68/77] package/sudo: Add support for OpenSSL
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
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

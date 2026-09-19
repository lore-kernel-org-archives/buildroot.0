Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F50C982DA
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D06040BE2;
	Sat, 19 Sep 2026 16:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwx5yJOZJg_Q; Sat, 19 Sep 2026 16:09:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DF54B40C8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834174;
	b=DXwSin21hstBMuuP2xXw23xXuOxry7Gi+FpROvMnbh3CkyQdu/pkw4DrjyiQBqGj6sP1
	 h02pDGjzhK8EsgyUqtN5mm8A7nWU05aXHaQG+tMLlKclAjnPQidu2oGqHR49QauAc5cF1
	 gZrUWrmXt0PZW/sIdYCE1VRMkSwAb1HmTP8BzPegOG4d6Xw1zw5THH0SzUxNZFCLgAGTf
	 fWUlFF4YVknFTbWPBG+WY0dpuNvRKD4KhM722d/5+JTkdcMtl3jkMouIA8DGg807hZteA
	 Da9hhFRcBsTS9QmqJ8e/rig9jG/81JodmdDdGclIOP+2KmJns8yjehc2LrZx7W+gvIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=hgf2k+CaSe08e2isQid5vH6U7jPph+mD4PmTIpJASSj60Tu3bpp5FbEdOOMYQR7rijPH
	 JKnhfbZxOtNP7v/yoB1aM1LAelnLF/6UDrxexH6CDJrcu8vfi0b/nJrkqZ4TQGT1DDvYb
	 HLKl/vG7zBN39fy8TMBwPaDDmDg9N1w+n+ZGQiZS3dX05pkZXGNw5ioxSNh8adB+7ae9l
	 hg4vpbJmj4wJi90k/k3bc78O6B/IEJPmD4b/e9WrtDp83jYoWeC1DUkmQnJ7i/NaCI+SQ
	 ns5WZ6ofCfp8ZFnT96qT4qWHrgBufSF3dnEC0dAC90YocVXhRMfr41z4UD7IbUnd9Qg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834174;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sA0q5EZ8Cc9opBVhX0SQnnT3wMVkT/2Fxjw1dga6a8VQqzyRR3A+QUOI7I+rfhJh+
	 gWLm85DlhjBECgddftSUgTVMj3yOHV6d3SCrWMoxBEOtit0I/pIsnuxHuwKc9xl65E
	 hDIANe1OcGGSGoOgDhxJszySkbjXgjyJEJLuueJXAfQtAilh4rhvFJXxxinBM7+q6n
	 w2jDa/Uoyx17ysuFxBPimyAegeh8V+r5UhcpGXaAkFmtzeOU7RGuJgd+1pjyB6Dk3e
	 NKokCCulHtruj5RwAf+opi5nrSD6UerKQVU8vcNeh3NLMe7dZe9FgeDSnZCfPqBp4p
	 lXJhziTZiKbiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF54B40C8C;
	Sat, 19 Sep 2026 16:09:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF4637A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2525240085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSOx1sGfLd3u for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:09:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4337140026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834171;
 b=MVkeNf1C9ZKLoIeFCgr0mJxARuGhnUpoWHT5f4S2RNdnn05qfVxMvTVRdRAu1Jiiy78i
 CMVghK0TsQnS35RVyWS6NiokbNdwzxejsfPSz+gV1+ycY3NW1zS/Gh80a9nTyBei2ht4d
 6gf4+fhdD8q/gi7ZdRZvWsr8PwU1t7l2rXaC2w7oWkDbM0f9SqpABw5clJNcbel/tlAJw
 UnfhOh69C1knxldsmnWzqVoT/OTuL44npFOZ2/0QpVfhWOWkiVxviwBGf+r64mE3g7461
 Gh20h3QSKKAHEw/7uIciyhQ7lDuoYdUXfVvLHS6v3MKwDLNibC8FE9Wf42wkUgyc2tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834171;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=SR2N6WIVe+HvB7T9+ZSbbmqgGJKyWV5hIYgVqdqnMyjo4YIujePXs6U7msNMKS1kb1N8
 N84+oH+55yZuXw8tP5uMHUsYf0zPkmUVcqTHjJV46SnX8UDtc6cQDODEFmrE5824qpZYq
 2RAFOpXtejPmtAx5Yg7iy+WopgRyKgqVSEK0WU4ZWGDQlKPa5ZZAjsbzJwn714j3d7Y9I
 qyaspDyMcf8NnU6fJAp9qQ/mNvX+NN1d8ooez/Z0f435vNSltcf8tQ8kr1yPaViKVm5Qz
 TZ/WmreIcbu+TwqkLP1PzGghdccCF6Y/aHz04kaLwqu4QmOa7aQ0EY/OKOb0MnS9S0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k0q6BZqE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=k0q6BZqE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4337140026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833551;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k0q6BZqEL0pzQH8LeNXnOA06OCgXXmiJuUKLrzHgFzRNPfL3pBm72vp4HK4MZ0VqK
 +7VmB7x43SKF2twys4he/RFkEsfKUWcxzCyazAJq38EqFe0dH20wgitiOiEFI9TwRs
 b915qKfsgIl411BrkWgAnYnj77PHEUYk0V7HW/QZl2uOV+mQausHq1Dix4AfjjIuQm
 T1xoYsuvmw5arhB1u5bV6m18P+V4JG/Ed482EL37QIzzDcJ3d5NY/3qSpym3P8mV7C
 YK9ZG8/mRYaVl+oIpdkaKdG5tkSPZZGiygvbdoYYrWf99eviat7msYPU6XTP8izR0P
 tmGPKJEapO4Ng==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:IULRi7IJktyKqufXDF0Cj6jgICeC0mnvlEF7+I+z37Xf8pG2CohwunBd3k1ZOpQgJWtrb3TeqFS81L6IGKztJ/B9uNR2bI/4rZ2/zDuMAHiGstM7bc/7B1rA6iNgM0LC+struJnVNaYAnGlESEO/0lH9Rk1QlM+BJ3o7cOJ1eJi5NpVQD4VWKc2sVHJXmybgN6bXSV6IDOzuWzg6iYSyac8q/QQ69QIqWgny+y/QsRWp4JupzbBJrUBeHXQizkGFokWzuxueKeSul7C0zla7NaKIiJxZtycx2lDIcJFBWCkNuisekQnkXnNa8g0Aejm0WxqvZ1VNDQV2DQ/Sqnvp6y/50sG1ePKvSWLWIQTWmjGIi5wcVbUkjwvv2C9nKVLWaI1EzZs39l7zEDxrFVGUnzvTjngNh2tsDemXsHqf1a+Um1nXTFh0QrBK2xgYokOYBlgu6CgM+4Epdw9W8vdfWibjrOCOQdpI2drqulsAZffnYrSyFXOEf30TFm1hDn2DmeiFQm9DXndPvR45OOM63lnjFA+69tJLACxGymZD4DtYbymfYr4PVxjIPcdj+q+qhhjyjaSQzmHwRhnds/fl2wGyxEJ57AqhPpLuoRs3y/L7hT
 t8hPrN1NCRP3D7M1ddSvHmIl4Yw0E1cQbeJlSw9trdDvLGOUTf6MxSEUgemcBJ3tlZIUYykGLBkEKNIrzX6S8ddHX+nbeIxndci7S8oImv6m5nfOs=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0DEEA4C47D0;
 Sat, 19 Sep 2026 17:59:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-3jzm;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:10 +0200
Message-ID: <20260919155845.5776-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 45/77] package/libesmtp: Fix build with
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
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

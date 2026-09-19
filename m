Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364BC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FE340BA7;
	Sat, 19 Sep 2026 16:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVvLb4NV3Osv; Sat, 19 Sep 2026 16:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3939C40B6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833984;
	b=YlYcE7omR/QikW+lhVJLib/rXtpN86NvIw+V6znJ43YgPVZfbHvpVe4AT/TIumhWyVi6
	 WktUzMUWiI5yA0IHHy2Yw74WTCEAU/J9uRYvNRFmAfqRzR4xXNQCXZXj5mtBT9M3CRp+w
	 LAUgRGMH9IX8Uou1/5oEba0hQ/6uQ2Wrf5HFCwbBoWEPn9gdacH9x96G3mSNr8WB2cpKw
	 rh/v74sTji4T4RVhOPzMRwLDQUscykd8sy0PhC3Mn+DOTuEysgedgOULg0n/DCugWLeDi
	 3KMjQDjrH2ObQTlf/6CudCdR3p9zF35aLMTigwOkGmDmpD+XzekzfTvly0Fpn/S7Eyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=W6M0Vo/Itu82wxOICAgXNcbaz3SOOQ+8J0J7mCwAeS9b3yPEJS0kYKf/if4kRZyZme1h
	 6HXV6OOu4LVtxNWB1Pfm002VmQuU+tL320eL64prKgjbQYd2M2CbYvLelj8GD3tncNXO7
	 FuNz11wPmZXkJYw7XfLTK2dtybeVO7+k4jlOyk2syPVzT0AzSVgZktg0HcUYMHLwdkdu/
	 hwu8345A7siAhuZiLjunMyAhUxD5AGsjcM/3NJFAFW/CeFzh8Vd09SOIEr7Z5TyUPsaAR
	 Devur6+gvInfKhp/4t9Bz8cuz/qkFz592EzE9IK5A9CJHo65mpPuC3R1N91DxzwWXNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833984;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RxmGl+RzIhuwe6YWjMyg8NXbjOlCQAnuB+EYRt5LUfJt6ej2Jq52Y9hFkGzjFXtZe
	 JjN2KY++AosxAnV7TD/s4e+Mbiz2oFxZ6K/np7rM7+8P/tT3QKIxP4V3f83sn/m88a
	 NLfZcSFjGMje7cZHyT4EqEEDhozQ1oxt1+iBx1dPyNxxQtGcyrFX17qLALsKQP82Nu
	 krep6H/zUpBcDQiDPDs4Zzxizdnqq+aRGixR4Au9I8NGU1RKH9dQ6GRA6EjrlL4pNt
	 Vahp6xpQmXLVO749iYNxDsOasb5eXWqlEvEugajaSWHCQZQCejzTSfFLD63K5jzHir
	 52RWdDART+DCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3939C40B6F;
	Sat, 19 Sep 2026 16:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4D0524D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5798113E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D80G2tg_uxAs for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:06:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AC99810F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833981;
 b=CtcmhtdWPN5XDO2Y1rBfLSFuXeZmgkBBIFEH64UeNdh7oIzC2pdi4jn0bTn8uvXTBbj9
 UBEJTa7MAgFsK6Wl/qJ6II9pieWaJDvABeja+zuuf2TsLREFdwCuPgPkVLeKAQ9HWsjdk
 2xlFG49xMnFdTUC4HurkNNX5tMPtCECUjlsgmbCrPjDWe1USMN8p5gVnVykp2v0o5fL74
 0ssBXf4A9bY1HgZE60f2R9sY0C4ribwP49ykPyWwFp7hhC78yJY0nqQsXabF5Iuo9ph0f
 kdRiJ0OHI+AVILZcEw1q+7DBvemARMfDwJKrNteAElZSUkaKUC5yqkPIHl1MkfpM0bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833981;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=U88AWN2ioyJJVkG9pModEAr9bPY/XJjNBFlzR0dKqn948t+inU2jd7RocJfC842NNfSs
 IkZV589yCgvNToVfHiNk2OGYS25hbwYL9p6gOCh2O26RLH3f6jntJAC+fXUejKV9IuoLh
 zFTozKK+L1Q7hXAPm+Wj42xSmfMq0smsnorCKHUnviQjV9MkEfN0TdK7KUdky7Iss3oLr
 8Is0sNcrD2fR70sNrrjuFyUjsZKmI88QPRwi0lDaiJ1JGBxNWHHcTEkUkYgcM9EDMibqt
 Y7DoGRvTthu5JzjDbIvkoZK6OCSpMfFQg5EFLeGJwtqVnWWtJuh+7vztnhusyfiQtXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VdnU0JGQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VdnU0JGQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AC99810F2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833547;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VdnU0JGQg/uP89bTYXwOnmShzd4Jl2N24hNK/NJzIMC2eUEFOXoNvowHTbnmW7x0E
 vnWY+HDTH4O2Y1nI/cKmQrdk1NZdKwmk50+OQKG1EkxUwXRPXVkb1PdG0Fh1/xlppl
 cAyQVg0sjdJe4Byc3LzpIVkg8ByTV+vhREH8i5GeRc6wVx8T2ca+hXjL8SlP/q+Tw6
 phBTozmtp7kn3W5UupMNmZqXZqOx8mO/f5et7ZzgEEpDeB4OdK8j7KIidT73Bc7G7K
 awOj7rnNCVrDspEh0wBgxVR/UvVteFQFWlb0N5juWjWmSrrMHUrwiTeaF8YhYHHnGN
 dohUrkplMQBZQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:JBxaadyOwwwtm1g5PI2oXWwfVkojCR3gVrOZ4/vERDDeHGx0abfRnJTkiQLAIPU78ZnRlrHH/Io52H4NuBuSZiCl3wUdE1BXAZpdwkd0OMVyciN+IhYSPtKqYRpO3jjMl7naFMEmp1i5fUaRcdhB4qM2DO7Se75EDTcv6Nd8K2Z4P6+49tlAk9ZSCxQu+YjB2TON3l16frGy/h84ilxPazovwwpcicDxqGD3DQEf32ldRPlz4Vd+RO+zUz5VPJ4XweVXERB9XPCnzqymsbIykN6vRkUgpQSShhS+zItUWzj8BTt71HXyLXznh3Fu7k66s7hfp1aJV07fG51FSXAsm9hZstmkcxVK1MTPOosjQIcoMTk7kwVA1jz53+GA0r+/njnKHfB4EjaqX0uTRHkL0HxM39J1czF2V3pTQSJPdohlEExhj+iYvrbqmF6252Qvu/j+ocUhg/AfdXRsuSDCYmffFC1Bn/RKL3Z1etL1btyczXhSxsjeoHgRfVJe6GUTO5EEbdTsUyyDJ5vh0mMb2PXk1HGjGmnLZ2WLKT7pL7WG2iYvys1dQ4OvtuEHI0QTnwpw7TxLtLwqTZ4xM2YTpzW3hFgAB4yENoVsHm6sjK1Kha
 ick+oPDVUB8799mYBhGDrrSiXJDxCteADLVoGIB7F2KMbRxRuhmBdmTdi70/b5FZWkRmiD
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5EC27A4C47C0;
 Sat, 19 Sep 2026 17:59:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSo-000000005Jx-3hvs;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:54 +0200
Message-ID: <20260919155845.5776-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 29/77] package/snort3: Fix build with OpenSSL
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
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..9f4232901a
--- /dev/null
+++ b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,63 @@
+From a32587b0fc22a716b70f242f7a130de003fb3b42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:45:48 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+This is backward-compatible with older OpenSSL versions since
+assigning non-const to const is always valid.
+
+Fixes: https://github.com/snort3/snort3/issues/476
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Upstream: https://github.com/snort3/snort3/pull/477
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert = nullptr;
+-        X509_NAME* cert_subject = nullptr;
+-        X509_NAME* cert_issuer = nullptr;
++        const X509_NAME* cert_subject = nullptr;
++        const X509_NAME* cert_issuer = nullptr;
+ 
+         int cert_len = ntoh3(data);
+         data += 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 int length = ASN1_STRING_length(asn1_str);
+                 
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 org_unit_len = ASN1_STRING_length(asn1_str);
+                 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

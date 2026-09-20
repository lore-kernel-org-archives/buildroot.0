Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4478C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0EC40E9C;
	Sun, 20 Sep 2026 17:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiw6LyG3VSHv; Sun, 20 Sep 2026 17:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 569E340EC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924467;
	b=f2udVXkJnYaCSqoKA9vFW7/z12XEhHzagjANb60Jvs+lr0PvuRn6+EYTwilAjFQHOtuS
	 ECY/RUgCFoYJe22U4D4dNl21ZCY6zZqIe8ojR56FY2QIjqMlkyYsFEdupynZkByf3uUCZ
	 vF0Sf6QjrYTC7d8qGVeo+FqEOrxJ/0sZVyMppnyjDvA6o3o4KqfzvmYgQG7jAd8F0QTZe
	 O0hw6TuF2NHlvI9358bcdf/e91Wi1DoLT6Cycx1AWnQb6ZcB5ZpUI2Nn5UIl75eLXgB9K
	 Tz4zaWIgn8G9dhYu4LzUtswiCbKFe0HUg4wBVwkoX/rLDefLh4wxhvUE7Ji1FBBwezg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V/7VAiBPK5PzkoQVJP0W/3HvBng8jhZA8/Sl/agWggE=;
	b=jraJleXYQTV9TacLPL8Qn29vGaK7xfHfyfMbC1XQ6U5MZnvbLiAt/MgZ8yVe9zw+B9aW
	 5SvSWiluq2Fdue9E9VxyUEV/LPblB3ZpnmWSmBlUgLPzQh1KCD4fhJonSVbhvNC4EfQQl
	 gWiDKeC5eFMikoBZxyOIe6NxD8JAzyccGuzVmk0rMEtHZ69JALIErjXM2sQh0dUSr/B+a
	 sKDx/SNazQmKUrRVHMoE62duCjVI59KquoHuKF1j+VF1pQvNhOvoTMNLYenw2rX9q/5w7
	 Jzu1QFuTRKvKWyQeyg4JgteSdG8E7LlbJ4+WcEQbE5GXGrarTgPuGFd5Z384N/3GsAw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924467;
	bh=V/7VAiBPK5PzkoQVJP0W/3HvBng8jhZA8/Sl/agWggE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IpdYqUuGAEdGiQ9HsDM/uIT2IFNwis19PMHDInYqUHS6F0pYk0unD4kKS9sUFOnXQ
	 OzlWby1NtIq5IEdOpTFLqy6ho/HgH7M6N9p5eveqOLYQt2L7kodWVdlGrsCjruCEzA
	 Fmd+J0O1hjUNdRftPvNjhUqkCY0dOfK6oNegqE1nx+agRWcOyNsr5Q2I0zdz+tA4CR
	 +6DAptCwjc6t/n6LuDtCk6M/D5pyU6IVn/K4lpZoBcDnv6yDSiRDtcR18YXyXzxoMp
	 loPG1ijrhPXRdqIwzqsg4uaLne0Uc7rPwEHjrYnDUc947b3IcIOHm9hsjKdeV8TNVr
	 +VYiFz9ZTaaDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569E340EC2;
	Sun, 20 Sep 2026 17:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2292037A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 081CC80DB4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBEQkUpC5k-o for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:14:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0DCED80D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924464;
 b=S03EbG18pZYBl8fTLmAsM7M9AbLd2ihgqkqU2c4XXg12oYRU9l6HLuN48S/aCTUcPPyN
 2tH2wlJED61sLYhvvUBi7TKlBdvG7DDYDiFgFwasJpZ/EOwA9FWvK1zy3CIKGiD5M8I20
 XyW6Hcw6IQF5czpoecP+R2/TBB/Cyua5pZ+J1jzK3rZlsKum4MBijkSZl7I9l0VYo9iOa
 8V4JA3H/j/dmoTZ97zCvta0iLrom8oIQhtE93kXXRdpG8kSu3iSvzHm881c2mxxBmog0X
 QmadGaC0Pik8INSKYV5JwOOX2RL8tAlWBwi+3r7q9S0yrpCQsd1vXAai8vMAnOUqgeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924464;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vCS68kRrrOODIAd0Ldo+22/WIgkUoElqm09KKGsf9J8=;
 b=HiUy75CT1oOQ/iwI0EzxBvFGx2UjyVLXbD21F6qiL1LmzoqQDLyxautmI4OCPMmelb1Q
 vzCRpSr1K42LDTUwjT7q81qdzq8uvGBQXZOqrUAyd3hW3IscN3P4WJPstiS2NFfLZrKQc
 KadlR+QYJb+om/5cc17LBBasdfSfXabS1zO1EkeQYEI1daOWIIVGpgfaiLiO4xZQTDpEp
 rdFS/MLdEBdls3sPeF9Ajb3J/JwZoWU8E8+qMgLVC1ZzjAF0g26/YFHiewz8Bwmpeqpxc
 K2DDWMEbgiYUr6mPkPNDvPqnZ9UtjGesefKfQG3XnfOxzrpFZwQBz2VYACvpu6kqHng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Cjifc+Dv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Cjifc+Dv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DCED80D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924151;
 bh=vCS68kRrrOODIAd0Ldo+22/WIgkUoElqm09KKGsf9J8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Cjifc+DvVCwWusNLmahW7jx7wWebZa9rZZfskagnTkL+1Ao9OhLLEICBjeQmA0P3H
 N5H1JLTPX+fvwbI7UsV9qQWpeWWvk588cEiEz4XTcju6QpBYNVuCshqhF1fQuqnVhr
 7Hm50gfSj80K6zleQyKZs1ROFuwLs9XIr/xSv0nat5ISl9H03OI1k6FTNUdSsXYIQi
 pELXpztzwz6WPrVhmp61TkUqB5VRPR1M6s9vQ1O+4jta4mv+6tO/KeKVuDXYhcayVV
 I+Jfa6tnqPB6CwQvTpNdXc0vhOF9Lj6kyD15mU0wnXxaMWpDiKevDTRmFs8eE9KntZ
 fmKz+EPDrnLMw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:suPrz8zsqk/f6aUvdEnuHl0NMLuOojzekJKHE9y70LZQoOGLIqHu74MknbX+O9xjn7an+XaSjIOd7DB8jmVohociYnq2qZgCEEjSb+JHFOJwQ0QpzzA25DQuU0Pyj5jOwpsSTYTnkKfOpqyfTMHMMERg3lKFKeiEMOJpqBRnHnVxvBRqbHQ63rieATj/uw+Z84tcrCjeP8IpyaQhKVJmO+M6AFIabnH0/B3wKsq1nk/e43puNj/iKx/leFBSqBtk785UYicHkZZwzMQLld0AJFJWt+JVkW717YJFsW113B53YfF8xrKJhTfPhx/0/VbwyxuNe6H5qGAlhRLDZEjvxtnkW8o1q1qTCoCo1f1tlknJ8vHdVyOWadUuMFdQnSJ1Ea2HRf8AeDLnOVm/UJuA86mOjJWfKw2270qt3hGAdHGB/Odm9NvPxxVueIHxL1NGEJih9OIlD2EjOnHDvHM78KgfTHL99EEhYOK2Yq+9KUU58A2qtvDQTC50XV7XNECcscas1GVXBsJ7bPUpahdDjB0X6Kaj7aH6OJMQ/wboU9Sh4359eAmZ5pI8X2sV+66iwqz9nU8qBeH8YoWVargHOglC7MRzloc/fLLK7X1EXmjrns
 Rx3qXoosa33IeXHHc1mzmDWiw3Tmf6yamMUyMdK4fYjLRoiBNS1wiev+wRbmy9kL9DzI+kl+l9a+6eUg44CjaMfGiws7dzUW8dSQYiixQ1rGX9xhQOpA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B224DA4C487F;
 Sun, 20 Sep 2026 19:09:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Y-000000000o7-3JwT;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:24 +0200
Message-ID: <20260920170815.240247-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 17/67] package/resiprocate: Fix build with
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
 ...precated-OpenSSL-calls-fix-upcoming-.patch | 597 ++++++++++++++++++
 ...aining-build-errors-with-OpenSSL-4.x.patch |  47 ++
 2 files changed, 644 insertions(+)
 create mode 100644 package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
 create mode 100644 package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch

diff --git a/package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch b/package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
new file mode 100644
index 0000000000..f4f1c55976
--- /dev/null
+++ b/package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
@@ -0,0 +1,597 @@
+From 10cfb3678293b3485dc73d781428da0205b11144 Mon Sep 17 00:00:00 2001
+From: Scott Godin <sgodin@sipspectrum.com>
+Date: Fri, 18 Sep 2026 16:38:36 -0400
+Subject: [PATCH] ssl: modernize deprecated OpenSSL calls; fix upcoming OpenSSL
+ forward-compat break (#489)
+
+OpenSSL 3.0 deprecated several APIs the code still called directly,
+producing warnings on current builds, and issue #489 shows an even
+newer OpenSSL (which makes X509_get_subject_name()/X509_get_issuer_name()
+return const and ASN1_STRING fully opaque) fails to compile outright.
+Fix both while keeping the project's existing OpenSSL 1.1.1 floor
+(rutil/ssl/OpenSSLInit.cxx and resip/stack/DtlsMessage.hxx both already
+#error below that version) intact.
+
+Deprecated since OpenSSL 3.0, version-gated so 1.1.1-2.x is unaffected:
+- SSL_get_peer_certificate() -> SSL_get1_peer_certificate() on
+  OpenSSL >= 3.0 (TlsConnection.cxx, DtlsSocket.cxx,
+  AsyncTlsSocketBase.cxx, TurnTlsSocket.cxx)
+- SSLv23_method() -> TLS_method(), a pure alias rename with no
+  behavior change; the SSLv23 vs TLSv1 protocol-version split is
+  unaffected, since that's controlled separately by
+  SSL_CTX_set_min/max_proto_version (Security.cxx, TlsBaseTransport.cxx)
+
+Deprecated since OpenSSL 1.1.0, safe on all currently-supported versions:
+- RSA_generate_key() -> RSA_generate_key_ex() (makeSelfCert.cxx,
+  makeCert.cxx, CreateCert.cxx)
+- X509_get_notBefore()/X509_get_notAfter() -> X509_getm_notBefore()/
+  X509_getm_notAfter() (makeSelfCert.cxx, makeCert.cxx)
+- drop SSL_library_init()/SSL_load_error_strings()/
+  OpenSSL_add_all_algorithms()/ERR_load_crypto_strings(), which are
+  no-ops since 1.1.0 auto-init (makeSelfCert.cxx, testDtlsWrapper.cxx)
+
+Forward-compat fixes for #489:
+- const-qualify X509_NAME* locals taken from X509_get_subject_name()
+  (Security.cxx, AsyncTlsSocketBase.cxx, TurnTlsSocket.cxx)
+- testCertSerial.cxx built its subject/issuer name by mutating the
+  cert's own embedded X509_NAME in place, which only works while that
+  accessor returns non-const; rebuild it via X509_NAME_new() and
+  X509_set_subject_name()/X509_set_issuer_name() instead, matching
+  the pattern Security.cxx and CreateCert.cxx already use
+- replace direct ASN1_STRING ->data/->length member access with
+  ASN1_STRING_get0_data()/ASN1_STRING_length() in subjectAltName
+  parsing (Security.cxx, AsyncTlsSocketBase.cxx, TurnTlsSocket.cxx)
+
+Also remove a dead EVP_MD_CTX_new()/EVP_MD_CTX_free() shim in
+DigestStream.cxx guarded by `OPENSSL_VERSION_NUMBER < 0x10100000L`
+(pre-1.1.0): unreachable given the project's 1.1.1 floor, and
+misleading since it implied OpenSSL 1.0.x support that doesn't exist.
+
+Upstream: https://github.com/resiprocate/resiprocate/commit/10cfb3678293b3485dc73d781428da0205b11144
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ reTurn/AsyncTlsSocketBase.cxx                | 12 ++--
+ reTurn/client/TurnTlsSocket.cxx              | 12 ++--
+ reflow/dtls_wrapper/DtlsSocket.cxx           |  5 ++
+ reflow/dtls_wrapper/test/CreateCert.cxx      | 14 ++++-
+ reflow/dtls_wrapper/test/testDtlsWrapper.cxx |  8 +--
+ resip/stack/makeCert.cxx                     | 19 ++++--
+ resip/stack/ssl/Security.cxx                 | 62 ++++++++++----------
+ resip/stack/ssl/TlsBaseTransport.cxx         | 13 ++--
+ resip/stack/ssl/TlsConnection.cxx            | 13 +++-
+ resip/stack/test/makeSelfCert.cxx            | 27 ++++++---
+ rutil/DigestStream.cxx                       | 13 +---
+ 12 files changed, 123 insertions(+), 79 deletions(-)
+
+diff --git a/reTurn/AsyncTlsSocketBase.cxx b/reTurn/AsyncTlsSocketBase.cxx
+index ef60ca956..1594be1fd 100644
+--- a/reTurn/AsyncTlsSocketBase.cxx
++++ b/reTurn/AsyncTlsSocketBase.cxx
+@@ -141,7 +141,11 @@ AsyncTlsSocketBase::validateServerCertificateHostname()
+       <<  SSL_CIPHER_get_name(ciph) << " " );
+ 
+    // get the certificate - should always exist since mode is set for SSL to verify the cert first
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+    X509* cert = SSL_get_peer_certificate(mSocket.native_handle());
++#else
++   X509* cert = SSL_get1_peer_certificate(mSocket.native_handle());
++#endif
+    resip_assert(cert);
+ 
+    // Look at the SubjectAltName, and if found, set as peerName
+@@ -157,7 +161,7 @@ AsyncTlsSocketBase::validateServerCertificateHostname()
+       if (gen->type == GEN_DNS)
+       {
+          ASN1_IA5STRING* asn = gen->d.dNSName;
+-         resip::Data dns(asn->data, asn->length);
++         resip::Data dns(ASN1_STRING_get0_data(asn), ASN1_STRING_length(asn));
+          InfoLog(<< "subjectAltName of TLS session cert contains DNS <" << dns << ">" );
+          hostnamePresentInSubjectAltName = true;
+          if(resip::isEqualNoCase(dns, mHostname.c_str()))
+@@ -182,8 +186,8 @@ AsyncTlsSocketBase::validateServerCertificateHostname()
+    // If there are no peer names from the subjectAltName, then use the commonName
+    if(!hostnamePresentInSubjectAltName)
+    {   
+-      // look at the Common Name to find the peerName of the cert 
+-      X509_NAME* subject = X509_get_subject_name(cert);
++      // look at the Common Name to find the peerName of the cert
++      const X509_NAME* subject = X509_get_subject_name(cert);
+       if(!subject)
+       {
+          ErrLog( << "Invalid certificate: subject not found ");
+@@ -346,7 +350,7 @@ AsyncTlsSocketBase::handleReadHeader(const asio::error_code& e)
+ /* ====================================================================
+ 
+  Copyright (c) 2007-2008, Plantronics, Inc.
+- Copyright (c) 2008-2018, SIP Spectrum, Inc.
++ Copyright (c) 2008-2026 SIP Spectrum, Inc. https://www.sipspectrum.com
+  All rights reserved.
+ 
+  Redistribution and use in source and binary forms, with or without
+diff --git a/reTurn/client/TurnTlsSocket.cxx b/reTurn/client/TurnTlsSocket.cxx
+index c30021e48..bae1ecad0 100644
+--- a/reTurn/client/TurnTlsSocket.cxx
++++ b/reTurn/client/TurnTlsSocket.cxx
+@@ -110,7 +110,11 @@ TurnTlsSocket::validateServerCertificateHostname(const std::string& hostname)
+       <<  SSL_CIPHER_get_name(ciph) << " " );
+ 
+    // get the certificate - should always exist since mode is set for SSL to verify the cert first
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+    X509* cert = SSL_get_peer_certificate(mSocket.native_handle());
++#else
++   X509* cert = SSL_get1_peer_certificate(mSocket.native_handle());
++#endif
+    resip_assert(cert);
+ 
+    // Look at the SubjectAltName, and if found, set as peerName
+@@ -126,7 +130,7 @@ TurnTlsSocket::validateServerCertificateHostname(const std::string& hostname)
+       if (gen->type == GEN_DNS)
+       {
+          ASN1_IA5STRING* asn = gen->d.dNSName;
+-         resip::Data dns(asn->data, asn->length);
++         resip::Data dns(ASN1_STRING_get0_data(asn), ASN1_STRING_length(asn));
+          InfoLog(<< "subjectAltName of TLS session cert contains DNS <" << dns << ">" );
+          hostnamePresentInSubjectAltName = true;
+          if(resip::isEqualNoCase(dns, hostname.c_str()))
+@@ -151,8 +155,8 @@ TurnTlsSocket::validateServerCertificateHostname(const std::string& hostname)
+    // If there are no peer names from the subjectAltName, then use the commonName
+    if(!hostnamePresentInSubjectAltName)
+    {   
+-      // look at the Common Name to find the peerName of the cert 
+-      X509_NAME* subject = X509_get_subject_name(cert);
++      // look at the Common Name to find the peerName of the cert
++      const X509_NAME* subject = X509_get_subject_name(cert);
+       if(!subject)
+       {
+          ErrLog( << "Invalid certificate: subject not found ");
+@@ -235,7 +239,7 @@ TurnTlsSocket::cancelSocket()
+ /* ====================================================================
+ 
+  Copyright (c) 2007-2008, Plantronics, Inc.
+- Copyright (c) 2008-2018, SIP Spectrum, Inc.
++ Copyright (c) 2008-2026 SIP Spectrum, Inc. https://www.sipspectrum.com
+  All rights reserved.
+ 
+  Redistribution and use in source and binary forms, with or without
+diff --git a/reflow/dtls_wrapper/DtlsSocket.cxx b/reflow/dtls_wrapper/DtlsSocket.cxx
+index 1091350f2..7833f9ac4 100644
+--- a/reflow/dtls_wrapper/DtlsSocket.cxx
++++ b/reflow/dtls_wrapper/DtlsSocket.cxx
+@@ -206,7 +206,11 @@ DtlsSocket::getRemoteFingerprint(char *fprint)
+ {
+    X509 *x;
+ 
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+    x=SSL_get_peer_certificate(mSsl);
++#else
++   x=SSL_get1_peer_certificate(mSsl);
++#endif
+    if(!x) // No certificate
+       return false;
+ 
+@@ -418,6 +422,7 @@ DtlsSocket::getReadTimeout()
+ /* ====================================================================
+ 
+  Copyright (c) 2007-2008, Eric Rescorla and Derek MacDonald 
++ Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
+  All rights reserved.
+  
+  Redistribution and use in source and binary forms, with or without
+diff --git a/reflow/dtls_wrapper/test/CreateCert.cxx b/reflow/dtls_wrapper/test/CreateCert.cxx
+index 7e70d0b36..1b2b39c57 100644
+--- a/reflow/dtls_wrapper/test/CreateCert.cxx
++++ b/reflow/dtls_wrapper/test/CreateCert.cxx
+@@ -1,5 +1,7 @@
+ #include "CreateCert.hxx"
+ 
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
+ #include <openssl/x509.h>
+ #include <openssl/x509v3.h>
+ 
+@@ -22,8 +24,15 @@ int dtls::createCert (const resip::Data& pAor, int expireDays, int keyLen, X509*
+    // Make sure that necessary algorithms exist:
+    resip_assert(EVP_sha1());
+ 
+-   RSA* rsa = RSA_generate_key(keyLen, RSA_F4, NULL, NULL);
+-   resip_assert(rsa);    // couldn't make key pair
++   BIGNUM* bn = BN_new();
++   BN_set_word(bn, RSA_F4);
++
++   RSA* rsa = RSA_new();
++   resip_assert(rsa);
++
++   ret = RSA_generate_key_ex(rsa, keyLen, bn, NULL);
++   BN_free(bn);
++   resip_assert(ret);    // couldn't make key pair
+    
+    EVP_PKEY* privkey = EVP_PKEY_new();
+    resip_assert(privkey);
+@@ -92,6 +101,7 @@ int dtls::createCert (const resip::Data& pAor, int expireDays, int keyLen, X509*
+ /* ====================================================================
+ 
+  Copyright (c) 2007-2008, Eric Rescorla and Derek MacDonald 
++ Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
+  All rights reserved.
+  
+  Redistribution and use in source and binary forms, with or without
+diff --git a/reflow/dtls_wrapper/test/testDtlsWrapper.cxx b/reflow/dtls_wrapper/test/testDtlsWrapper.cxx
+index 80ed9102e..5f8d02155 100644
+--- a/reflow/dtls_wrapper/test/testDtlsWrapper.cxx
++++ b/reflow/dtls_wrapper/test/testDtlsWrapper.cxx
+@@ -68,10 +68,10 @@ class TestDtlsSocketContext : public DtlsSocketContext
+ 
+ int main(int argc,char **argv)
+ {
+-  SSL_library_init();
+-  SSL_load_error_strings();
+-  ERR_load_crypto_strings();
+-  srtp_init();  
++  // OpenSSL 1.1.0+ initializes itself automatically; explicit calls to
++  // SSL_library_init(), SSL_load_error_strings() and ERR_load_crypto_strings()
++  // are no longer needed (and are deprecated).
++  srtp_init();
+ 
+   X509 *clientCert,*serverCert;
+   EVP_PKEY *clientKey,*serverKey;
+diff --git a/resip/stack/makeCert.cxx b/resip/stack/makeCert.cxx
+index a3e08d411..8033a0c83 100644
+--- a/resip/stack/makeCert.cxx
++++ b/resip/stack/makeCert.cxx
+@@ -7,6 +7,8 @@
+ #include <openssl/ssl.h>
+ #include <openssl/pem.h>
+ #include <openssl/ossl_typ.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
+ #include <openssl/x509.h>
+ #include <openssl/x509v3.h>
+ #include "resip/stack/X509Contents.hxx"
+@@ -35,8 +37,14 @@ int main()
+  
+    Random::initialize();
+ 
+-   rsa = RSA_generate_key(1024, RSA_F4, NULL, NULL);
+-   resip_assert(rsa);    // couldn't make key pair
++   {
++      BIGNUM* e = BN_new();
++      BN_set_word(e, RSA_F4);
++      rsa = RSA_new();
++      resip_assert(rsa);
++      resip_assert(RSA_generate_key_ex(rsa, 1024, e, NULL));
++      BN_free(e);
++   }
+ 
+    EVP_PKEY_assign_RSA(privkey, rsa);
+    resip_assert(privkey);
+@@ -106,8 +114,8 @@ int makeSelfCert(X509 **cert, EVP_PKEY *privkey)   // should include a Uri type
+   X509_set_issuer_name(selfcert, subject);
+   X509_set_subject_name(selfcert, subject);
+ 
+-  X509_gmtime_adj(X509_get_notBefore(selfcert),0);
+-  X509_gmtime_adj(X509_get_notAfter(selfcert), duration);
++  X509_gmtime_adj(X509_getm_notBefore(selfcert),0);
++  X509_gmtime_adj(X509_getm_notAfter(selfcert), duration);
+ 
+   X509_set_pubkey(selfcert, privkey);
+ 
+@@ -132,7 +140,8 @@ int makeSelfCert(X509 **cert, EVP_PKEY *privkey)   // should include a Uri type
+  * The Vovida Software License, Version 1.0 
+  * 
+  * Copyright (c) 2000-2005 Vovida Networks, Inc.  All rights reserved.
+- * 
++ * Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
++ *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+diff --git a/resip/stack/ssl/Security.cxx b/resip/stack/ssl/Security.cxx
+index bc18c3671..563700cca 100644
+--- a/resip/stack/ssl/Security.cxx
++++ b/resip/stack/ssl/Security.cxx
+@@ -125,7 +125,7 @@ verifyCallback(int preverifyOk, X509_STORE_CTX* storeCtx)
+          BIO* bio = BIO_new(BIO_s_mem());
+          if (bio)
+          {
+-            X509_NAME* subjectName = X509_get_subject_name(cert);
++            const X509_NAME* subjectName = X509_get_subject_name(cert);
+             if (subjectName)
+             {
+                // RFC 2253 is the preferred format (readable and reversible)
+@@ -1209,7 +1209,7 @@ BaseSecurity::BaseSecurity (const CipherList& cipherSuite, const Data& defaultPr
+    SSL_CTX_set_options(mTlsCtx, BaseSecurity::OpenSSLCTXSetOptions);
+    SSL_CTX_clear_options(mTlsCtx, BaseSecurity::OpenSSLCTXClearOptions);
+    
+-   mSslCtx = SSL_CTX_new( SSLv23_method() );
++   mSslCtx = SSL_CTX_new( TLS_method() );
+    resip_assert(mSslCtx);
+    SSL_CTX_set_default_passwd_cb(mSslCtx, pem_passwd_cb);
+    SSL_CTX_set_cert_store(mSslCtx, mRootSslCerts);
+@@ -2404,7 +2404,7 @@ BaseSecurity::checkSignature(MultipartSignedContents* multi,
+             if (gen->type == GEN_URI)
+             {
+                ASN1_IA5STRING* uri = gen->d.uniformResourceIdentifier;
+-               Data name(uri->data, uri->length);
++               Data name(ASN1_STRING_get0_data(uri), ASN1_STRING_length(uri));
+                InfoLog(<< "subjectAltName of signing cert contains <" << name << ">" );
+                try
+                {
+@@ -2599,8 +2599,8 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+ 
+    Data commonName;
+ 
+-   // look at the Common Name to find the peerName of the cert 
+-   X509_NAME* subject = X509_get_subject_name(cert);
++   // look at the Common Name to find the peerName of the cert
++   const X509_NAME* subject = X509_get_subject_name(cert);
+    if(NULL == subject)
+    {
+       ErrLog( << "Invalid certificate: subject not found ");
+@@ -2666,7 +2666,7 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+       if (gen->type == GEN_DNS)
+       {
+          ASN1_IA5STRING* asn = gen->d.dNSName;
+-         Data dns(asn->data, asn->length);
++         Data dns(ASN1_STRING_get0_data(asn), ASN1_STRING_length(asn));
+          PeerName peerName(SubjectAltName, dns);
+          peerNames.push_back(peerName);
+          InfoLog(<< "subjectAltName of TLS session cert contains DNS <" << dns << ">" );
+@@ -2677,7 +2677,7 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+          if(useEmailAsSIP)
+          {
+             ASN1_IA5STRING* asn = gen->d.rfc822Name;
+-            Data email(asn->data, asn->length);
++            Data email(ASN1_STRING_get0_data(asn), ASN1_STRING_length(asn));
+             PeerName peerName(SubjectAltName, email);
+             peerNames.push_back(peerName);
+             InfoLog(<< "subjectAltName of TLS session cert contains EMAIL <" << email << ">" );
+@@ -2692,12 +2692,14 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+          // MUST contain exactly four octets.  For IP Version 6, as specified in
+          // RFC 1883, the octet string MUST contain exactly sixteen octets."
+          ASN1_OCTET_STRING* asn = gen->d.iPAddress;
+-         if (asn->length == 4)
++         const unsigned char* asnData = ASN1_STRING_get0_data(asn);
++         const int asnLen = ASN1_STRING_length(asn);
++         if (asnLen == 4)
+          {
+-            uint32_t ip = (asn->data[0] << 24) |
+-                (asn->data[1] << 16) |
+-                (asn->data[2] << 8) |
+-                (asn->data[3]);
++            uint32_t ip = (asnData[0] << 24) |
++                (asnData[1] << 16) |
++                (asnData[2] << 8) |
++                (asnData[3]);
+ 
+             sockaddr_in sa;
+             sa.sin_family = AF_INET;
+@@ -2712,26 +2714,26 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+                 InfoLog(<< "subjectAltName of TLS session cert contains IP ADDRESS <" << ipv4 << ">" );
+             }
+          }
+-         else if (asn->length == 16)
++         else if (asnLen == 16)
+          {
+             sockaddr_in6 sa;
+             sa.sin6_family = AF_INET6;
+-            sa.sin6_addr.s6_addr[0] = asn->data[0];
+-            sa.sin6_addr.s6_addr[1] = asn->data[1];
+-            sa.sin6_addr.s6_addr[2] = asn->data[2];
+-            sa.sin6_addr.s6_addr[3] = asn->data[3];
+-            sa.sin6_addr.s6_addr[4] = asn->data[4];
+-            sa.sin6_addr.s6_addr[5] = asn->data[5];
+-            sa.sin6_addr.s6_addr[6] = asn->data[6];
+-            sa.sin6_addr.s6_addr[7] = asn->data[7];
+-            sa.sin6_addr.s6_addr[8] = asn->data[8];
+-            sa.sin6_addr.s6_addr[9] = asn->data[9];
+-            sa.sin6_addr.s6_addr[10] = asn->data[10];
+-            sa.sin6_addr.s6_addr[11] = asn->data[11];
+-            sa.sin6_addr.s6_addr[12] = asn->data[12];
+-            sa.sin6_addr.s6_addr[13] = asn->data[13];
+-            sa.sin6_addr.s6_addr[14] = asn->data[14];
+-            sa.sin6_addr.s6_addr[15] = asn->data[15];
++            sa.sin6_addr.s6_addr[0] = asnData[0];
++            sa.sin6_addr.s6_addr[1] = asnData[1];
++            sa.sin6_addr.s6_addr[2] = asnData[2];
++            sa.sin6_addr.s6_addr[3] = asnData[3];
++            sa.sin6_addr.s6_addr[4] = asnData[4];
++            sa.sin6_addr.s6_addr[5] = asnData[5];
++            sa.sin6_addr.s6_addr[6] = asnData[6];
++            sa.sin6_addr.s6_addr[7] = asnData[7];
++            sa.sin6_addr.s6_addr[8] = asnData[8];
++            sa.sin6_addr.s6_addr[9] = asnData[9];
++            sa.sin6_addr.s6_addr[10] = asnData[10];
++            sa.sin6_addr.s6_addr[11] = asnData[11];
++            sa.sin6_addr.s6_addr[12] = asnData[12];
++            sa.sin6_addr.s6_addr[13] = asnData[13];
++            sa.sin6_addr.s6_addr[14] = asnData[14];
++            sa.sin6_addr.s6_addr[15] = asnData[15];
+ 
+             char addrStr[INET6_ADDRSTRLEN];
+             if (inet_ntop(sa.sin6_family, &(sa.sin6_addr), addrStr, INET6_ADDRSTRLEN) != NULL)
+@@ -2749,7 +2751,7 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+       if(gen->type == GEN_URI) 
+       {
+          ASN1_IA5STRING* asn = gen->d.uniformResourceIdentifier;
+-         Uri uri(Data(asn->data, asn->length));
++         Uri uri(Data(ASN1_STRING_get0_data(asn), ASN1_STRING_length(asn)));
+          try
+          {
+              PeerName peerName(SubjectAltName, uri.host());
+diff --git a/resip/stack/ssl/TlsBaseTransport.cxx b/resip/stack/ssl/TlsBaseTransport.cxx
+index c5dc8ad5e..c8afdf915 100644
+--- a/resip/stack/ssl/TlsBaseTransport.cxx
++++ b/resip/stack/ssl/TlsBaseTransport.cxx
+@@ -60,11 +60,11 @@ TlsBaseTransport::TlsBaseTransport(Fifo<TransactionMessage>& fifo,
+       switch(sslType)
+       {
+       case SecurityTypes::SSLv23:
+-         DebugLog(<<"Using SSLv23_method");
+-         mDomainCtx = mSecurity->createDomainCtx(SSLv23_method(), sipDomain, certificateFilename, privateKeyFilename, privateKeyPassPhrase);
++         DebugLog(<<"Using SecurityTypes::SSLv23");
++         mDomainCtx = mSecurity->createDomainCtx(TLS_method(), sipDomain, certificateFilename, privateKeyFilename, privateKeyPassPhrase);
+          break;
+       case SecurityTypes::TLSv1:
+-         DebugLog(<<"Using TLS_method");
++         DebugLog(<<"Using SecurityTypes::TLSv1");
+          mDomainCtx = mSecurity->createDomainCtx(TLS_method(), sipDomain, certificateFilename, privateKeyFilename, privateKeyPassPhrase);
+          if (mDomainCtx) {
+             SSL_CTX_set_min_proto_version(mDomainCtx, TLS1_VERSION);
+@@ -104,12 +104,12 @@ TlsBaseTransport::getCtx()
+    }
+    else if(mSslType == SecurityTypes::SSLv23)
+    {
+-      DebugLog(<<"Using SSLv23_method");
++      DebugLog(<<"Using SecurityTypes::SSLv23 (dynamic version negotiation)");
+       ctx = mSecurity->getSslCtx();
+    }
+    else
+    {
+-      DebugLog(<<"Using TLSv1_method");
++      DebugLog(<<"Using SecurityTypes::TLSv1 (pinned to TLSv1)");
+       ctx = mSecurity->getTlsCtx();
+    }
+    // FIXME: would be better to do this in a method called asynchronously after onReload
+@@ -168,7 +168,8 @@ TlsBaseTransport::createConnection(const Tuple& who, Socket fd, bool server)
+  * The Vovida Software License, Version 1.0 
+  * 
+  * Copyright (c) 2000 Vovida Networks, Inc.  All rights reserved.
+- * 
++ * Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
++ *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+diff --git a/resip/stack/ssl/TlsConnection.cxx b/resip/stack/ssl/TlsConnection.cxx
+index 71f85d299..ed4ffba55 100644
+--- a/resip/stack/ssl/TlsConnection.cxx
++++ b/resip/stack/ssl/TlsConnection.cxx
+@@ -268,7 +268,11 @@ TlsConnection::checkState()
+                   {
+                      // OpenSSL docs:  If no peer certificate was presented, the returned result code is X509_V_OK. 
+                      // This is because no verification error occurred, it does however not indicate success.
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+                      X509* peerCert = SSL_get_peer_certificate(mSsl);
++#else
++                     X509* peerCert = SSL_get1_peer_certificate(mSsl);
++#endif
+                      if (peerCert)
+                      {
+                         ds << "peer supplied a certificate, it has either not been checked or it was checked successfully";
+@@ -724,8 +728,12 @@ TlsConnection::computePeerName()
+            << SSL_CIPHER_get_version(ciph) << " "
+            << SSL_CIPHER_get_name(ciph) << " ");
+ 
+-   // get the certificate if other side has one 
++   // get the certificate if other side has one
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+    X509* cert = SSL_get_peer_certificate(mSsl);
++#else
++   X509* cert = SSL_get1_peer_certificate(mSsl);
++#endif
+    if (!cert)
+    {
+       DebugLog(<< "No peer certificate in TLS connection");
+@@ -775,7 +783,8 @@ TlsConnection::computePeerName()
+  * The Vovida Software License, Version 1.0 
+  * 
+  * Copyright (c) 2000-2005 Vovida Networks, Inc.  All rights reserved.
+- * 
++ * Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
++ *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+diff --git a/resip/stack/test/makeSelfCert.cxx b/resip/stack/test/makeSelfCert.cxx
+index 10ec52b28..89cfcfbc0 100644
+--- a/resip/stack/test/makeSelfCert.cxx
++++ b/resip/stack/test/makeSelfCert.cxx
+@@ -1,6 +1,8 @@
+ #include <openssl/ssl.h>
+ #include <openssl/pem.h>
+ #include <openssl/ossl_typ.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
+ #include <openssl/x509.h>
+ #include <openssl/x509v3.h>
+ #include <openssl/err.h>
+@@ -29,18 +31,24 @@ int main(int argc, char* argv[])
+  
+    Log::initialize(Log::Cerr, Log::Err, argv[0]);
+    Log::setLevel(Log::Debug);
+-   SSL_library_init();
+-   SSL_load_error_strings();
+-   OpenSSL_add_all_algorithms();
+-   //OpenSSL_add_ssl_algorithms() is insufficient here...
++   // OpenSSL 1.1.0+ initializes itself automatically; explicit calls to
++   // SSL_library_init(), SSL_load_error_strings() and OpenSSL_add_all_algorithms()
++   // are no longer needed (and are deprecated).
+ 
+    // make sure that necessary algorithms exist:
+    assert(EVP_des_ede3_cbc());
+ 
+    Random::initialize();
+ 
+-   rsa = RSA_generate_key(1024, RSA_F4, NULL, NULL);
+-   assert(rsa);    // couldn't make key pair
++   {
++      BIGNUM* e = BN_new();
++      assert(e);
++      assert(BN_set_word(e, RSA_F4));
++      rsa = RSA_new();
++      assert(rsa);
++      assert(RSA_generate_key_ex(rsa, 1024, e, NULL));
++      BN_free(e);
++   }
+    
+    // TODO: remove this once we've tested this
+    stat = PEM_write_RSAPrivateKey( stdout, rsa, NULL, NULL, 0, NULL, NULL); // Write this out for debugging
+@@ -133,8 +141,8 @@ int makeSelfCert(X509 **cert, EVP_PKEY *privkey)   // should include a Uri type
+   stat = X509_set_subject_name(selfcert, subject);
+   assert(stat);
+ 
+-  X509_gmtime_adj(X509_get_notBefore(selfcert),0);
+-  X509_gmtime_adj(X509_get_notAfter(selfcert), duration);
++  X509_gmtime_adj(X509_getm_notBefore(selfcert),0);
++  X509_gmtime_adj(X509_getm_notAfter(selfcert), duration);
+ 
+   stat = X509_set_pubkey(selfcert, privkey);
+   assert(stat);
+@@ -165,7 +173,8 @@ int makeSelfCert(X509 **cert, EVP_PKEY *privkey)   // should include a Uri type
+  * The Vovida Software License, Version 1.0 
+  * 
+  * Copyright (c) 2000 Vovida Networks, Inc.  All rights reserved.
+- * 
++ * Copyright (c) 2026 SIP Spectrum, Inc. https://www.sipspectrum.com
++ *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+diff --git a/rutil/DigestStream.cxx b/rutil/DigestStream.cxx
+index 339c8522e..2bc99184d 100644
+--- a/rutil/DigestStream.cxx
++++ b/rutil/DigestStream.cxx
+@@ -9,18 +9,7 @@
+ #endif
+ 
+ #ifdef USE_SSL
+-   #include <openssl/evp.h> 
+-   #if OPENSSL_VERSION_NUMBER < 0x10100000L // openssl 1.1.0 api changes
+-   static EVP_MD_CTX* EVP_MD_CTX_new()
+-   {
+-      return new EVP_MD_CTX;
+-   }
+-   static void EVP_MD_CTX_free(EVP_MD_CTX* pCtx)
+-   {
+-      EVP_MD_CTX_cleanup(pCtx);
+-      delete pCtx;
+-   }
+-   #endif
++   #include <openssl/evp.h>
+ #else
+    #include "rutil/vmd5.hxx"
+    #include "rutil/Sha1.hxx"
+-- 
+2.47.3
+
diff --git a/package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch b/package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bb5a936fdc
--- /dev/null
+++ b/package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch
@@ -0,0 +1,47 @@
+From a45447eac1cb839b7c4429811590a46272e7525e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 20 Sep 2026 15:01:10 +0200
+Subject: [PATCH] ssl: Fix remaining build errors with OpenSSL 4.x
+
+ssl/Security.cxx: In static member function 'static void resip::BaseSecurity::getCertNames(X509*, std::__cxx11::list<PeerName>&, bool)':
+ssl/Security.cxx:2583:51: error: invalid conversion from 'const X509_NAME_ENTRY*' {aka 'const X509_name_entry_st*'} to 'X509_NAME_ENTRY*' {aka 'X509_name_entry_st*'} [-fpermissive]
+ 2583 |       X509_NAME_ENTRY* entry = X509_NAME_get_entry(subject,i);
+      |                                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
+      |                                                   |
+      |                                                   const X509_NAME_ENTRY* {aka const X509_name_entry_st*}
+
+ssl/Security.cxx:2586:53: error: invalid conversion from 'const ASN1_STRING*' {aka 'const asn1_string_st*'} to 'ASN1_STRING*' {aka 'asn1_string_st*'} [-fpermissive]
+ 2586 |       ASN1_STRING*      s = X509_NAME_ENTRY_get_data(entry);
+      |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
+      |                                                     |
+      |                                                     const ASN1_STRING* {aka const asn1_string_st*}
+
+Fixes https://github.com/resiprocate/resiprocate/issues/489
+
+Upstream: https://github.com/resiprocate/resiprocate/pull/490
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ resip/stack/ssl/Security.cxx | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/resip/stack/ssl/Security.cxx b/resip/stack/ssl/Security.cxx
+index 563700cca..28348c9ce 100644
+--- a/resip/stack/ssl/Security.cxx
++++ b/resip/stack/ssl/Security.cxx
+@@ -2616,10 +2616,10 @@ BaseSecurity::getCertNames(X509 *cert, std::list<PeerName> &peerNames,
+          break;
+       }
+       resip_assert( i != -1 );
+-      X509_NAME_ENTRY* entry = X509_NAME_get_entry(subject,i);
++      const X509_NAME_ENTRY* entry = X509_NAME_get_entry(subject,i);
+       resip_assert( entry );
+       
+-      ASN1_STRING*	s = X509_NAME_ENTRY_get_data(entry);
++      const ASN1_STRING*	s = X509_NAME_ENTRY_get_data(entry);
+       resip_assert( s );
+       
+       int t = ASN1_STRING_type(s);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

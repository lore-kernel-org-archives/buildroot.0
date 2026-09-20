Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9883EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653EA40EEB;
	Sun, 20 Sep 2026 17:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3GQw8hVPxjP; Sun, 20 Sep 2026 17:15:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75ABF40F3A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924503;
	b=O8UCSy0gAw6JD4ge0E3CZXq3wR6uFCfr4YEeSBochUdnmYJbXR0t4Xm4DAdQ8VtB8jDP
	 jr/9/U4wf69F/3JcU5Wnl7H9OzR5kZFfWIKdOugOaZhqyq8j5RjjCYvMw/PNVk3xgNK1m
	 J88MeFd/XSFlOhifTpKC+3UyyDxF6LLLeW2K4Dfp0u8/BN0rRahnpzgFGxbJdxovs6gGL
	 vcHkFeSgeN87U5fROpQhvwscilXbNWU+2IKanmd1dEkNmAdlvduaEf4W3xgKp+6ga1XHw
	 yNv2hcKRjlX7E8hJcuuWcAA8fEcQhP8hIgpF4RZOUMY9CpuEC0gMr+3QxEnw/r7JLKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=JkgN/fbfJcmDZ+o4KHS928IbhuClTwQBUmJpS+x9/vidRf1pz1Vck4HNT28PKI2DivNf
	 8Fu990EoPg+lijm6ssbTNFE0Mt0cgy+MjipzRnNMoFh/bGG01wvMxrzQjtgdPxsfyUyjm
	 CWgXkKD8aU+7TgTDHD4ShqFjYANmgdqs0/eTIs7YrosrWo1Izw0ctRn88Kge2feeFsy7V
	 +lo0dXsCJfrpGX2OMjZumZkjcvvsi8AcwOfdoVT59CX7agRU8QgUWhoUnLbZTjOLngTlS
	 /lYeL9vQ7DsfVDT15Zfy9fIq3G1//wmM2Xd+8Q9khuywExLBJRzl5wxMXXvKWMX1DTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924503;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C78katQ9lw+WcF6EDSTTmxOUSDTxYZ112ufxz/p5tec7XSRxpwzNs7VxBlkacUJvw
	 y5Yj2wxsMidm7GB6Saqx45VA3YdYwvvmhdeCBZIlwWM43cGAA4+gcito8hxBQ7TXf5
	 HsJ63WjKGtZ94hrL482JzmHZ08cDAGPkcUyLMWmiryEMhmSGLxR92CohVfn5d1r7zq
	 x0pAtlJbsfEYrEjjXcWkvowjdUqdjjINtQVDF97Zlu9W7CUD/JbAQtGUswxUXMiq7d
	 0I0tPNxXnVHurp699NIU+MdKMG/AajT6XIIntW3ZyAyk05V6LWMI4XcCNGvV7703Iw
	 b8DrxOT84B6GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75ABF40F3A;
	Sun, 20 Sep 2026 17:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9457337A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8666B80E19
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIwMjOO2JGpY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:15:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 743A980D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924501;
 b=qB/VjVlek+kcsiOtrifwbo3vRqAKjdcvR+uOtYjVYsrSy8Rrx8e8RnkBYnWZuw7m9lb7
 ICmYI3HxqAd0rIR78cuKc2n0qAIU+Tv/0mkLz99Op2MNHi56Lh1nn3ljQL7agMzTzeuyr
 JmBbBlEWvLDVGGJGSDcChs5LRNxPp9bbwOUTG+LqkSFQHdGRbSTM9eoZaUPeGwhsa8vFS
 jY2ir1HhqlnGNF9ieO9iaUkoHO/F+s2tUwBt4FwyWXRpEg1XGrm9n1bZlcwXeSJSoJaI+
 XVvHagbnDlk0ef/Py2AHLp/GBfRPaqrpAMB0aEI0oKcNLH3DxLH0962Oz/+a0gnNp4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924501;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=SGdFDZ5o+1WbvQIcArYKw3vQrxiY0UIfZi8ijG4RGL1M+L4j1a1DpJIsHNSJTa8Q0ghz
 33C7TzUF2JGL5NL/Mkue8ByD5W1+by0z7JiG16ywoTbeDsXIx1vACFQCA61oMSnK87T5t
 t94hfDUa0FSVzHY6m9r6ybxb4/dBP+hlHovZdTa8JHdZhu3KggVl3uremNWvsv7mZarUa
 3Ocaw8aF3GPko2cslULM1J1Ydv2znYRe0KoKpDu+rbvxotJJBaH1+oAEtO9m/BHzP5htE
 19WBEP6Zx5dGJ38cuVnDxPw+HBZXoKoFmhEeN+r4NS+M8beOY5ti5zVVCeLN1ZQ1YtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sJ5cNqI2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sJ5cNqI2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 743A980D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924153;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sJ5cNqI2XJWlhaiudZW02chLxIlIPxEMEz1CuC51JYSwXvmU5nvCpt3P5dJ9z/IdZ
 wzWTGf1ZfO5vKIwx8vTTEOpSK2HyMI/y8wh70ZdMUbpNR6SuQpt0rTVKJ1SLFRE8DJ
 qZjAk80WeLW/KiXf+tkP3IwkUn6XheUmHTDJdeUtxW4Y4Zkb3/dDII+Lr+bk4F1SXf
 WIXNUVlncX96l92gPx8Sw7f8ig7BLV8hCdNQaACJckrYy7Ao/1R3xvAcOTojYO142G
 4yOAB6RNYWUsJpauIbs2eDEhKnM+jEcVF2+BcwWp/IDZoDfmTGNwJSF+d8bx1OZPtE
 ocx/eDzQWeeIQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:1Fq4JXhn7s4Z7aHd3pHZsxDhub5odvTKQ5SxDC8DVxFzrfvLWsz66IMX4cipr8Dh9bzR0Zyz02nGmR4FjPqjXG6mv79g5uPUXut+ASIyyJopn/BO8HS6aPaqQpytV6f0XGG9/M00n8RZeANDj3AWPg9OxJO0lwXCNbTgxpTyjd8CpDeB4uG0R8zPSlKRle1vPKf6hL7jrfIANA9MGAYU0jsy8JBS3dCKNIihXJMIDItUsqBFZrqLGQVt/lgMDa73HVKcyjImHSyIGOPMInb2x7ugtnhJD3rSTw00xaSdyf3549Bymhjao+pwrBima688kdRLz34kp1ES10wyuWm1vsQoiwbSL33ZunThVk7ucwBEqtFn//0lbvRpEAH/ddjJWS65lVLfHBxD6Q988mKTr+SkOlODWUMe9nVfa+MURsEuAD9rtxrpilwoS0yU3Owp2oacDhW+QpBaTsH+YQvqXU1YFyUwZUIcc6qjJT7i0b2KeOiOQcxd6NILu6EiGcmk94rJwiy1o0+kxWLgAaouUL1BR871joOiuZSZSN4J1pDSvV3KHKYPsWiP94VgUs0Q/SYlfWP3rjn4UCRO6h3jlVQkdy8GCqyK09VP65uoKFJlT0
 cWyP/LHVJwmZsjQTMJJaBaPj6S8wpDsSA7Cv9ExkrA6hx+rr7ytI9Pr+MXlWV/4Wu026lRthc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65603A4C4885;
 Sun, 20 Sep 2026 19:09:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-2Pyn;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:28 +0200
Message-ID: <20260920170815.240247-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 21/67] package/snort3: Fix build with OpenSSL
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

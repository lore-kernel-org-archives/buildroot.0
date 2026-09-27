Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A4C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2088A6061D;
	Sun, 27 Sep 2026 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djUK8z5uM38g; Sun, 27 Sep 2026 10:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2BB896062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505939;
	b=hwLnnAoTKf2UbD3hRnK1BNU2SkwIlMttFL0uQhOl8u1MRCubKIkNYsrXf1aahzMNmab/
	 Z8e41CIoX28AkTGZXusQsJekF1YV18UAy3MiEPqGaqIOIPRoP3fo+lJ2FQGoWKjAoom+d
	 4bjwO9ZN9XOAZ7aq1cQa/uY1ZmH/ts9imUwxqqtpSZiRylke3reXvX0OCm6T82ur0NmhA
	 MUJhltpc6tG+A5su9PCKwmeJ41aI4DXk9A2Y/ZY0d/VPxPXSt19C1ovxeHTH5J7KEwmxD
	 omk4ya83TfSdR4blqyEC4IHqbdZz3USVgzOdaXrbQlaDPoXKOzF3gl5hSYWks1ih3gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=YRAZZ0cxBAJyG8aZiQ9mMPxPOSz+GV/XpCIS/pcmkCC0AXcRJkJF8UtVHdWAGL0lgfmo
	 bxfp6KLpfJST58OZvt4hrrMc+AAsb/HFe9bxhKIRHbjGs0mYVEuPuAcYgrLJuN/stB39a
	 ZKIUEv55EPDCSpsZfgufzUdIl+1pw4Y1Vp8PJPdLtRgDaRJPYDGLbLzhmfrEzjWGMiUe/
	 3IGJxFv/XsAd5s60fio7nulHRRA7O1j0S8px/xTfPGXLD3FlDfV2fCkcaemwpZx+wYKH0
	 uQlwbO4v3LMvbr+tCywy5DQs7VATadcl2mYxU29UIoz/vTcuBzluFlYv3SRAZyAwuDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505939;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TooAd/PlKF6EAtUK8qeyzNRSqdW1C6ifBLdx8hngQGwKL7TTNWNvzPJy1Vv535G1l
	 m5dDn2qjB9kutce0Os36XsGcN4gefYjp3/KQRckUF71ouH9w7896BYYc0Fa6K5ceDn
	 sFmbEJtyc7dS21D288ylHoc7ZfjRNFb8ltif++2JdKg1Pf5zqEliQoWJNuUqRP62Qs
	 B+GKf946VJAijf7LRMqBTjunPBlyOOjb25gKywUr37LIEG7rbzotm15UEyoX+x8NY7
	 0LSJdMRboirQ/9D+jiXsvxqzPfFcEJvIXHazOqWZLOitk/d3DoSol82xPk2uWMAb7S
	 jA6u8BfHXk5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB896062C;
	Sun, 27 Sep 2026 10:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7367B334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5921140809
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vX0eDgf-ciFK for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 28F06407F4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505936;
 b=PzcP6QMiroEtOGmfNvmwrVoOFSlm/6K1vNol+wWTShpHo7i2xt65AO/ii5fr3SSl4OV/
 SiPvOuovgzZ0K/H83WOOLt/R2QFzGPS9mD9OYd0l9SQs/IuHZzYsFhADZCfj7l9HynIdV
 LBh6CggO5Y06D4hA1DFjxI0LXon0OUtfCZ32tHZzFmM6/Gai0Yi1X8cSVnMDEaATLS3Eo
 x9DTUUMq+p04rkrBjPu9Unxa39bGh97iaGR1lukBjjWdRiIEQ3TIHbMZIJjryPCNwDK3u
 yYNqTA6PxA+ShFqLnqjmmLYOubQV73NxIRCLR7vTDzlxRvK2dwvdQSuXQ1a2PicGpuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505936;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=IeUy9pIM+p5PY6rb9f+/5ysOoB9RuLDXe4joHMCqhsCYaZcTIEe+0QJHt+8xzDUqpHJC
 39+Lc0AJeGfCtVrsAO0px72pYBy6SUvadCa0IMpzVdXeaXeGCGr8kZ+9jaKvs5+GCCHbp
 6IFwIqPG+W6dpdZZ0mB0CewQG8mqYQ7ZRy51MqV3ZBaisIPrnkN+oB/noM9V9HeBLt2h8
 4pjXCucJU+4oyAkB1/nHbNpqubV5Y79tGNq3iVexTrct6xiS0NJM2XaG49lJFMzCrME1L
 rx+/A1BFomjQrSNHYvMze4iE+ambmEsvtUq0gujb7vjiRRxgheaebGSBwGjFmN+ZNtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ofqyt3aG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ofqyt3aG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28F06407F4
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505822;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ofqyt3aGvVAZfLTmII0+7ZqA+NdC539Qqioe+ESHJD6/6NOwko9PeOZiqbZAQcy1g
 9TsmBwr2l/L8zZn/zJI5b289AILK50SM8A4I64eLOR7OPSeYepn3SiolSI704Q7J8x
 bKmPbVlekOlN6npCxLxUNDho1DCTk+Wje3YhDaFmv7u07/AyGI5A8QQIVSj8227APr
 vBOcOEZ0bVlp9hEU20yCofrVMAcrGW4QyPLpo8U36OFJJOYjie+KtkCg/T3RnUsc6T
 HCmNOMKR4Cq320Q5GfbWG3O1SV1uZmpEn8azgOS67okqmHZRJ+K6SrdlN3f7q4kVP4
 fOuYmaPFZvKAg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 C+53fq9a7yNlnqCubhzFpS0fYlSAFkjaZwvByKGpLnvSYRTd0JJ5zIL1ye/clzDmGs8f7vAeBFx
 GHFV9aZjen0nIVQWBWrRLckc1ilmkonIQ3ZQ7crdKLATUBRhwoHDqWWfzImOFu1Pyhq1gmCtp89
 6CdNsYJAZJOdPCHrKdNKRpLkHiyTMQhkW3YnFPou396liexDSLK58h3eP8zaRO9Q76N032bluJa
 wHWwpEgrdbdzxoWaKBEgERIazbEY6i3H5SMJRHhUMfRd18acO7rfDe5ho9edHFLaTCGDKNSsVmY
 tNLdLzNZH3/ynjYuBS9gB+2GpkXVwIlP5h5c18xQSV/+DWAj7qHA0rAePaKyaXhMkXcqL2T7zvJ
 L4NNw73xUz/zekmuuZnVCzxeqS3MpDyMVcpAsQ7JO2kA4SmfB1fcszq8xYL3vGfuyWqyShuxOZQ
 r7tIZrDkoL5SZrY0JCNMyOL3L1HZroeOVRuv0N6miXwkducGTnt4DqoY6spIpz569D+B0apFDod
 PNp1v/us7HlyS0tzg5tmhLnp7b8zm/s4ScL7JeP6PMVKDjcaigz4D9M0WSW3oAvADtn8T01aKvf
 6k2IDHfvInY8L8YKmlw8Hb2asVOhXr02C0DR/dFUT352b5IrEAOo4u6wdvbcxTWTNH+w3YU5K0C
 dJzPMw7QZs/kCmjJspGAHnN6Gf+VZBpfChYfNwZr4fTk9sJI1olHauooD5CfJhQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95A7AA4C4F66;
 Sun, 27 Sep 2026 12:43:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-3lTY;
 Sun, 27 Sep 2026 10:43:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:38 +0200
Message-ID: <20260927104301.1801638-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 60/82] package/omniorb: Fix build with
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
 package/omniorb/0001-openssl4.patch | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/omniorb/0001-openssl4.patch

diff --git a/package/omniorb/0001-openssl4.patch b/package/omniorb/0001-openssl4.patch
new file mode 100644
index 0000000000..984d5dab25
--- /dev/null
+++ b/package/omniorb/0001-openssl4.patch
@@ -0,0 +1,63 @@
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 1 Jun 2026 11:07:35 +0100
+Subject: OpenSSL 4.0.0 returns const pointers from X509 functions
+
+Origin: upstream, https://sourceforge.net/p/omniorb/svn/6818/
+Bug-Debian: https://bugs.debian.org/1138480
+Last-Update: 2026-06-01
+
+Downloaded from Debian:
+https://sources.debian.org/src/omniorb-dfsg/4.3.4%2Bds1-1/debian/patches/openssl-4.patch
+
+Upstream: https://sourceforge.net/p/omniorb/svn/6818/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/omniORB/orbcore/http/httpConnection.cc | 6 +++---
+ src/lib/omniORB/orbcore/ssl/sslConnection.cc   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/omniORB/orbcore/http/httpConnection.cc b/src/lib/omniORB/orbcore/http/httpConnection.cc
+index 1e70f93..9da18cd 100644
+--- a/src/lib/omniORB/orbcore/http/httpConnection.cc
++++ b/src/lib/omniORB/orbcore/http/httpConnection.cc
+@@ -2554,14 +2554,14 @@ httpConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
+diff --git a/src/lib/omniORB/orbcore/ssl/sslConnection.cc b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+index f02f3f0..d29d2b8 100644
+--- a/src/lib/omniORB/orbcore/ssl/sslConnection.cc
++++ b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+@@ -548,14 +548,14 @@ sslConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

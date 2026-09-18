Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE0C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6760440BE0;
	Fri, 18 Sep 2026 18:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOdGNQJ73zjk; Fri, 18 Sep 2026 18:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8AC0640236
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757840;
	b=tTPSZrLMTe5g560tqQOpwCR/UrKSJh5mzIqDhXdG8k/oo4RcdnUm0NpjB3u153b5HbhT
	 8vwbJzTbq5qm2A8OQEYjK86SwiIr/CBTcrvojALjOcmC5noeTXqyhC2LMNuoa7p75bch/
	 McKdBOp+4cST54H4X6eIimacUmZNzC6QA3KMS5z52Yo4WdMVmKHawMr5DHegZDRgokZ0k
	 EfFABxl52jkCJUIlks4FYqGD3ugs8JcafYImQ60g+xop1YpWhEMZkRIq7UZj+9BOAdhG6
	 bgxpYxCin4VwIfbdiJ1crlCV7t5lWGaf91BOTQcT+RsdjfirKcDd7yQyh91XclmuimA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=QHtV3FR971GS+EOJrR2okC4Eh7xG0Xkf2ZH8tx9iAyArEhku5tMhqtyfyX6Xh02JWVhT
	 /oIzdQAfYkVWcY0yBuDwHXb+6V+DDS8Xj8iI4X24G+clhWqQ0MtSWwEnSx5WIvOSElndl
	 TpiNZXUo5pFMfXscKEwNUe1MHIxKz0GPAzmt7J6VcEb38oaf9JK2eYkAafFSIOPHY2P/v
	 +wNBVznuZe4XyQpQyMYNqFcz+9O0gGreUdVa5uz43q+5ZW0MFlYSc2/1IkbnhlfElpfRW
	 ob2wRchJRKT2+LMeNUG6FPSrkQF1BWkR2v9UTxnBymOZTSXOJvsQT0hFwvfTakyggLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757840;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XZ0yeZDCm/oHFylPHGHuElE2Q3wSdGTjQWngNzKt3zZzLqC+2D0PMGPkx4CM0EGsr
	 IkYT/wDuJ4/XF014W366i6qOnjrZAUF/yya21xkV2KZzA1jOuMwdJ4tDOCBoRIPtQa
	 JrUijWDbkznqwEyLMoRJdqfzuEvEGF23H2xN5ACsvhAlpGZ0tJT/vLhytPhO/3/aZf
	 88jnimKs1HDJK8JW40yQZ24IjUa0YzdzYCUDoNcznLjnShQd+wVJJfhXbdZgcWwwXC
	 KVche4u1DB+obBctnQLtxrDzVwNFA6mXF21h13sV8ZHZfkZB3AgU4J8TXqz24DGZqJ
	 Yjk2qKUVrR0pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC0640236;
	Fri, 18 Sep 2026 18:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA0D513D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BA9281076
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-f3Ui49UGmy for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AB1978101D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757838;
 b=IFNrJeQvbqCmqqZXWZdAwjig+VXHXy8mVVNi1vB0Hsw3Xl5p/zbW7AxZLPULlufYZAil
 /ry7U79f+ntlwcUqh9gKSgn2Fok3QTNbBmIz0ySmOi1aLqKNhWe1M2G/iBNwSbWK93xvs
 5j0JkfH+YPaQFlLASUT1s+7fHDgHRNYjq85biDIw8IEUtxU7U4HylOxZ3k0dNoMy+VLUK
 aLQQsbhLyDmlqaQqo5ArLn3qz7DPuuWJVqDRysnMgQa8iNSxfUnufHrA3iP0/hnOLqS9T
 bTyAa6POCwgEzA9l1lNWdy4p18AH+lIy8AWnNnOJunMPY5XeKhxtmifVNR9h2voxAMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757838;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=b+9De/EtvJrOj1YvXvnju/3axUNbQxvP1nQdFAjzGhoWZf/aYRw3RPW/vd2g+LAS/dit
 v977gTJ7834FBXTsxQXstKPmH1gjbd4O3l5izfrsVGWRan1SwZIvTUt/5Bn5xAauQOc+0
 gCQBV6B7k0/x940jBd2L8p33vFGLb3q462Mcbw8KElLvrafoVcKTubUVsL2nupf5c6BIj
 1CcpAbk5dpf3dYdaMPbFPovKv62CtPoh1lPMxXdwXDMx+Hr6Dq75Boz9ANnvFt27zLjV1
 B5RjornzspOss3nCb50EKyLbFHvfZ4NiTNieZfgbPbfFUmG0ui/O63M+wu5z3K+jelg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S2oj1ruk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=S2oj1ruk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB1978101D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756947;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=S2oj1rukN9TVQxPwK/IGzjaqtPxKCHFtt7Hxa3kdKRjwBh3y1zTbaE776lsRpeJqm
 K3gn4N0AQ2ykJV0pCqrAINDunokpCnEWZwKPcEBzaDnNrgQPAKmjubwv/y4ZwTATy8
 6MK4njoU5bcyN8re8ST1z+4iqcd3JpXwKnsO6llJnKpq8ynWgzDhcB51PKz/uCfgz2
 2gKa2XAxCOjlcxlW2ldWGpWLOWzUnrcrmyHv0ksG8bq6wxWBuf6hdMEeyq5eiG/R0k
 y1s1gulKehLMXCs5aSBR7YDRebitUR0m3fC3EIt7oFcOuW9MDiUwW1cr1q3+fhRmM9
 UWn5iqxT5puKQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:P56VoCRILTRAkbE5FrIiyp+6MhewmEZmMpkLnpNMJDVio9u7jM/kukLDGctL0UXyrpdWxdicnVn5qpjsqwwowKF9HK3/NfGhPzdYRKT90NS8ZOXJHmgxcGoezK4OaOpJOISz/zciq1u91YLYDw0BdyaK6Rc0V2ZB6gb07edDN0v+OPf0Mrr/7vKkHNvItFsLO+vWysi+IIwIVFOb5ehIouaBv9KpVaEsER7j4E8uDGVAa7aFo3Y0Lhdqe17tLgyw2rz+DzxKYO3ZjD3VGerrkJ2PP/mkHmZSSqngQMoiHn7sSHGJa0iQZGSeefCqr0VQsGR10k8B64xtxiGnqM9av/hTWuNHkH+Fbeqi61XobCgaGPodCRh0QGb2EejjqSsF/rH5UPBzd6WX6C65ETowexb2rLpUVX61PvJgtW+ag1sD1I89ADntUS0VXuQBXk2goB79u5dk2kLL4ghk2RF+C1R8C0gtAEQDLC06RJRrNbSA1cgy2kfhlhCXULDSH2IuOdV1Z9KRTyLIkN9UVv2Tspv4dZI+0rHNLQ8Lfgpv681rjaOd/77pH0agvkKkFsR7OFVcfkTqac1OBKRg5k1DPmwsV8V4SeQHRvHI8ZScGa5ggv
 1gcSI7hUhBi0uWlNtQ3Y4IhObLaCyA+9YIbxHRFT8XGS0trkjH5aNLTawQ6BHjzO6U889Kzn5H
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCC57A4C4750;
 Fri, 18 Sep 2026 20:42:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWz-000000007cB-1nB6;
 Fri, 18 Sep 2026 18:41:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:19 +0200
Message-ID: <20260918184140.3631274-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 57/77] package/pkcs11-helper: Add support for
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

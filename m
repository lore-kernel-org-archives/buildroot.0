Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C8C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC40C40AE5;
	Sat, 19 Sep 2026 16:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiyCIEqCPBqr; Sat, 19 Sep 2026 16:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D438B40B3B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833870;
	b=AP6B6s82jDe7HrBr9QjZoJjiCh6cKsna/ArCI/Z+t4ylxT9DCrb/GuC3+B7ZeZppIblF
	 jBq3hf0czExANtnN4eD/mPirv+FFRv8El4mFB/nMgNg/Apw3u0OkHgFS8OfWz9eNrt80i
	 rnyoMlTMvUM49ft308MopMuYzIA54t2C7cezbTeYnGSkZl67JZMmbWc/qpSJT5JHB9lka
	 wnpzu78+HTuk0yBWISUSNDkLD84fXt3Fc6jELTTC0sjS/L5atDHQM+sblnZu2OMYyJnmR
	 XHDLUBj6qbK1d6Pdb0wbtH2PXq+swk7AQApJoc4xCwpACNFCxIkyTbmOw5G0+ScJUUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=A4v+erTIBALJm7Uem9gn1XGD8YT1Qs8jpFeKXEv1YHgcJdI9KrFdIa2As0F8209LMUOD
	 EtCUf42nlsl9oOaR7klov3iL0dHssapkxG+cYZLPF8LR9fL70rp0eNBEUOpYOWhNLwz/P
	 1tzH7eou5Kg4MmgI3VxhQ3zLeykZvgbhR+aNWk17AUp9v79jLX0VqkLuk/NsLS0RyisNP
	 dunCQCYYH64fVsd2/hLELuiPBXIEb7OTvP6jCaddgaRiRsNXY18K/nLusvZYMtUV9EOd9
	 J8HXOJNM1y+UxySFEkQZesvN3waYz1XaqpkA/3AuFWbMOg2fvBZu9vn17a2nH8MvJ5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833869;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dc7tR0tRyIfzJw1WaK40697qDq6y8taawZBY2ZiU5FrUo42nYP7yZsstL7y9i20BS
	 POc+gqtI0jo1X31gzkxzfl1itbQnxT0XEH3Vu33W58Ajc+lFEmegdsNijjtiG6xOCK
	 5QsjLYNlfKMaXrE7Cd1NjrdyTp6WiRinsii4/V+9wFyE+7Z9nN3HGnfeJFnYt4+J4L
	 KPLN+D0rYw5pCP3oME3LBkLj/O9OLWAxOMrSqQPtxGnql/fnA+A0jEbDqck7Bv2HId
	 fQ8b5ammUREfwuC+cAMLQUaJFo94hqRzF2pkaGbrP4flA00RYXAUt+wR6XaPOxnm0C
	 dDMWiKmMfc6Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D438B40B3B;
	Sat, 19 Sep 2026 16:04:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66AA024D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B41400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoCGCJ1r8d-U for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:04:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 673AF40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833867;
 b=BGk4YVhkoxKWDVaGMA/CbffxW/CgqDsWaYetOzAFiXOTNqZelJMBmGGA7mOrShZaG9nD
 edyW9FeLd9UZK9iaHERL35OZGFHTncD+YpApI+Usx0dIqfVZNQFSBDzejZWIpEjsfFYNA
 camI1u9g/WNcb5HFunfOCBHag1M/wWQ0Tk53AO/9V4Vx5EUj7Gj2DD0KE37ZxSMgKUSUV
 uf1LBzdySzgEqR0tPQErSwlMsQ+spQcAEez7RlhSEel5Y9W2TkbAFcf8cX80/3RS60gXC
 xUSlKAl4QL570ObdPDFB5SXJXaBdmRhaAoHuEgW7p9t7z+WfDPHkZfGWxAZXhx23PHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833867;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=E/UEtS9AomhDINC1nRTgx9IdfR4CKhktQPR9p1HAXbKoTKJ9ILfP2i+bnD6Q+xsrg2HO
 dyksIIbw4Hz/YEJlaS3qHb2rCUFXXhe0y1m3aGspzdd6iSt7b1vc0gA9p66pxusQ7VMkN
 fWV8Wmq71NHC/0T9b4k9vo5sqrB93/pAwiJ7y6wogI+4hJoqrdgkMv8Jx7t4DZQlNwpkB
 EjiWSIE6r3xUuxZG785FDxiHp31L5+vgbMwZuuYT4fteint8vWEY6TPqbshiuv7Q4qrz5
 typJ24WtQGVVD3MlY0Dh/2dxeDO7jg2iDk5UvgyIOSUh2M62+frOMws1Rtzn8OGAxxg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BO+Uy616; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BO+Uy616
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 673AF40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833543;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BO+Uy616mi1CW+9reU9Q4qMknaW5uZOrKAjAMEJDPkS4Kp28OeQvL8+OCsiUShDWG
 RfWylHMrWWvm1LvEObdCk0JIk+VNWbz232GH/a6MsgT/hUn9poZ4Kyyfr9a63GBYe3
 jV5yq+xI/n5FpON5SOKzNkC3nEIHrMVw+Cq8RNa2D88Y1BMplKpmB0MYbbg+PpSHFM
 OKA6NFhzWQMBx+4YZvTibMgJ59UUSDO/Rs4M0t/3d4vJofkG9KeQeVPtOUL/utHz4W
 sBWz8kv1KbGmaRZKTaz3vNJG19sQzSfnyfd9VmTFVilMjzpe6SwzyUI7j10fJwPfTo
 +g6zn6uzbWBmw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:YWkBo1WUxjhsMaQBblgzmjeEXogjBxIRPNjeo2WbuYrittHGxmS68e3PIyk7b31DbDD/FEm61tNMgzL94Ab2RPdb5zdLLRGQR7xMxgY7XXSV96WlV/p9L9jLEJl17bjjr9EwkG9i97yOnW4yNlVeb3lniVTYpELerrKxwYiuZrT/cdf04AgEyj1I17k0tiUfoGWZk9NPkJWRYFpxpJXAUMXUgkz1hTfvmIzoOOz8q66voi8UiVQ876WZ51uh6M7n5fiqEaTUHyayrbck2oqDDBCu5zZSn18K+4kgsw2DR9c03G+02kMRMXK08lhmDDqSSjxPRvzqRaAaYVaL4mChx8oe7wjwqmMG8z7xRVdBpaA//w94pr9mYx8oSg/q2OwoboGCE43uiXrWPryDE/cyAsR+u0jinHkEgDn/JsMzQ3BAy4raMrLnr9KDEsXS7JgrqXcp+7n5W5pUQGDFl99AIOwMY3NdqUnpEyOQbzvPUihRmT8fP7cmcbKpe3m8ay4tba6cLvFM/tiCG0H8zqAaNN+2sGCFcf9pv4UQbyRoFBBN7snXQ6ki+lkYGGN7jS3DmbGLGyf+ymZShCpqNDKkBU8K6KfnRsidVJZOFS3SDYPhBA
 e61Xa/7mYxQ7uW2uIMBorZVU+ARfm1qSRh9C/QnvGW87uxYePEHZz6xYsrUuOIZuABjZgBN2whSRlVXKCypXpSgpeRUeWHlO5e/BqVhSZg2k1ODg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CE44A4C47B7;
 Sat, 19 Sep 2026 17:59:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-3d5H;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:37 +0200
Message-ID: <20260919155845.5776-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 72/77] package/trousers: Fix build with
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
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/trousers/0004-openssl4.patch

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

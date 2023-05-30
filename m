Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C66C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 20:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD0860E73;
	Tue, 30 May 2023 20:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD0860E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lltiRxd8EHUU; Tue, 30 May 2023 20:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98A460E65;
	Tue, 30 May 2023 20:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D98A460E65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEA411BF284
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A2582151
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A2582151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ey_alO5jb6np for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 20:07:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FFC8214F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3FFC8214F
 for <buildroot@buildroot.org>; Tue, 30 May 2023 20:07:53 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.2.119])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E7CFD200587;
 Tue, 30 May 2023 22:07:46 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 22:07:27 +0200
Message-Id: <20230530200728.12239-2-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530200728.12239-1-ju.o@free.fr>
References: <20230530200728.12239-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685477271;
 bh=gHhYiW9YBDb4vEVgzumIcjsFox1syW9PT4N06L+Vdmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMXzrQdDq7jSbINRQKupPiXp0caycevuv/GgpDXTkCDPk07uqhpUKDkMXUIUScDYb
 6f8thzFRvNVt/pFMucnYCnm8XcWQACBokXIV+5tXFggU1qTqQaGc5HxDpWutczZNnZ
 J9cLUxQ1f/2XRfn28WC6Abwfg96AHNmYXdiyCraiDrJksS5cc+h2qycqKfzi+fMGDo
 QJ2Z87oPM9vZvXIMIsWWhNuO5k3tWU0DSt5ySmnQFFeKxzgo3yTVFM5pBqIVyzB+TM
 MlfttqZpX3pPc7piA/aaSF7ba0weQxobPbTqQrjS+YIi4/lbHXWwPGstKcrIT+E+cW
 WOchkZERalUjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HMXzrQdD
Subject: [Buildroot] [PATCH 2/3] package/edk2-platforms: bump in sync with
 edk2-stable202305
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0aGUgZWRrMi1wbGF0Zm9ybXMgY29tbWl0IHRvIHRoZSBvbmUgY29ycmVzcG9uZGluZyB0
byB2ZXJzaW9uCmVkazItc3RhYmxlMjAyMzA1IG9mIGVkazIsIGJhc2VkIG9uIHRoZSB0aW1lc3Rh
bXBzLgoKQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KQ2M6IFZpbmNlbnQgU3RlaGzD
qSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4KLS0tCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1z
Lmhhc2ggfCAyICstCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2gg
Yi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2gKaW5kZXggNDA1YTA5
MjQxYy4uYWU4OGI2NzJhNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsy
LXBsYXRmb3Jtcy5oYXNoCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9y
bXMuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDFl
ZDNmMzY5YTI3NDNjYzVhNWZhNDgwNGQwYWYxNTRlMzdiNTc4ZjRlNjhjMmU3ZjY5NzM0NzAxYTli
ODc0ZGIgIGVkazItcGxhdGZvcm1zLTNjM2IxMTY4MDE3MDczYzJiYjJkOTczMzZjNTkyOWViYWU4
MDViZTEudGFyLmd6CitzaGEyNTYgIDMxMjU3MTYwYWM1MWE0YTVmNjNkYjkyZDI2NDgyZDZhMDA1
Mjg2ZWQwNDBkYWZlODlkMDFmMGVlOTA2YjExMWUgIGVkazItcGxhdGZvcm1zLWI3MWYyYmRhOWU0
ZmMxODMwNjhlZWY1ZDFkOTBhNjMxMTgxYTI1MDYudGFyLmd6CiBzaGEyNTYgIDUwY2UyMGM5Y2Zk
YjBlMTllZTM0ZmUwYTUxZmMwYWZlOTYxZjc0MzY5N2IwNjgzNTlhYjJmODYyYjQ5NGRmODAgIExp
Y2Vuc2UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZv
cm1zLm1rIGIvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5tawppbmRleCAy
MGEwNThiYWZmLi45ZThmZjk0MTU2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2VkazItcGxhdGZvcm1z
L2VkazItcGxhdGZvcm1zLm1rCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0
Zm9ybXMubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIEtl
ZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVhc2UgZGF0ZSBmb3Ig
Ym9vdC9lZGsyCi1FREsyX1BMQVRGT1JNU19WRVJTSU9OID0gM2MzYjExNjgwMTcwNzNjMmJiMmQ5
NzMzNmM1OTI5ZWJhZTgwNWJlMQorRURLMl9QTEFURk9STVNfVkVSU0lPTiA9IGI3MWYyYmRhOWU0
ZmMxODMwNjhlZWY1ZDFkOTBhNjMxMTgxYTI1MDYKIEVESzJfUExBVEZPUk1TX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLHRpYW5vY29yZSxlZGsyLXBsYXRmb3JtcywkKEVESzJfUExBVEZPUk1TX1ZFUlNJ
T04pKQogRURLMl9QTEFURk9STVNfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKIEVESzJf
UExBVEZPUk1TX0xJQ0VOU0VfRklMRVMgPSBMaWNlbnNlLnR4dAotLSAKMi40MC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

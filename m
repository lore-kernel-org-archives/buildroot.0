Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 09:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB1260DC2;
	Sat, 19 Feb 2022 09:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NSA30U1yjq7; Sat, 19 Feb 2022 09:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066F860D59;
	Sat, 19 Feb 2022 09:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5734D1BF396
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 09:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5238B40106
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 09:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXqsqLFiXeV0 for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 09:02:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5E1C400EA
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 09:02:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ddb9:3359:b8bf:3c83])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6EFA72003DD;
 Sat, 19 Feb 2022 10:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645261322;
 bh=+UxnGYS1qIdU0TdMz2wuflJIRbPo5tcswVpZOW7DYTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtqcaWKefFJAXjfZGKgE0KndogJ83G8OyrSuA1fy9z6e+5RTiDvU2A3NMC1T32p/t
 C5UZuBdvZ0uEdoXHYWIlh+M1C021v1msL7C5G6yAKwOhSg7es0RYAMDnJSrFBB1IXd
 nqZkTQtUdLG3Ptk9/MxT3DicFb0LVPPr9wSk0Ws6tafzHM4T+L1w+ggKAm8pBME58V
 wd9gLy2C+VO+9RqDu77UcHDZCJhFhZKv6uykrSDK1+cUFkP9pJMAETgHA+EDerxgkW
 6jGaYcvae06NxYBZh623G6w3kTCCWN9D+FG58JVlgCELWbNkqMkeubmnRGd+RLcjDz
 OUp2ArZuZlpjQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Feb 2022 10:01:59 +0100
Date: Sat, 19 Feb 2022 10:01:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220219090159.GA822323@scaer>
References: <CAGrGpJB10RkRQOwkJ6_cVz=qX2qkQPxp5rmf802qOiss+5+3xw@mail.gmail.com>
 <C47D66BF-F38D-4FD2-B36D-E6C3A1F21DF8@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C47D66BF-F38D-4FD2-B36D-E6C3A1F21DF8@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Buildroot Failure 2022-02-16 02:25:21
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBQZXRlciwgQWxsLAoKT24gMjAyMi0wMi0xOCAyMjo0MSArMDEwMCwgR2l1bGlvIEJl
bmV0dGkgc3Bha2UgdGh1c2x5Ogo+ID4gSWwgZ2lvcm5vIDE4IGZlYiAyMDIyLCBhbGxlIG9yZSAy
MDowMywgUGV0ZXIgVGhvbXBzb24gPHBldGVyLm1hY2xlb2QudGhvbXBzb25AZ21haWwuY29tPiBo
YSBzY3JpdHRvOgo+ID4gTXkgYnVtcCBvZiBzZGwyX3R0Zi0yLjAuMTUgdG8gc2RsMl90dGYtMi4w
LjE4ICBjYXVzZWQgYW4gYXV0b2J1aWxkZXIgZmFpbHVyZSAgMjAyMi0wMi0xNiAwMjoyNToyMS4g
ICAgICBUaGUgbG9nIGluZGljYXRlcyB0aGUgcHJvYmxlbSBpcyAgcHRocmVhZC5oIG1pc3Npbmcg
d2hlbiBoYXJmYnV6eiBpcyBzcGVjaWZpZWQuICAgIFNlZSBsb2cgYmVsb3cuLi4KPiA+IE5vdCBz
dXJlIHdoeSBzZGwyX3R0Zi0yLjAuMTUgd29ya2VkIGJlZm9yZS4uLi4uICAKPiBJdCBzZWVtcyBs
aWtlIHRoYXQgYmV0d2VlbiAyLjAuMTUgdG8gMi4wLjE4KG1heWJlKQo+IHNkbDJfdHRmIG9ubHkg
dXNlcyBoYXJmYnV6eiBwcm92aWRlZCBieSBzZGwyX3R0ZiBpdHNlbGYuCj4gVGhpcyBtZWFucyBp
dOKAmXMgc2tpcHBpbmcgdGhlIG9uZSBwcm92aWRlZCBmcm9tIEJ1aWxkcm9vdCB0aGF0IGlzIGFs
cmVhZHkgcGF0Y2hlZCBmb3IgaGFyZmJ1enogcHRocmVhZC5oIGlzc3VlLgpbLS1TTklQLS1dCj4g
SWYgbG9vayBjbG9zZXIgdGhlIGJ1aWxkIGZhaWx1cmUgeW91IHdpbGwgc2VlIHRoYXQgaXTigJlz
IG5vdCBCdWlsZHJvb3QgaGFyZmJ1enogdGhhdCBmYWlscyBidXQgYSBoYXJmYnV6eiBlbWJlZGRl
ZCBpbnRvIHNkbDJfdHRmLiAKPiBTbyB3aGF0IEkgc2hvdWxkIHRvIGlzIHRvIHRyeSB0byBtYWtl
IHNkbDJfdHRmIGRyb3AgaXRzIGludGVybmFsIGhhcmZidXp6IGFuZCB1c2UgdGhlIEJ1aWxkcm9v
dCBvbmUuCgpJIHRoaW5rIHRocyBtaWdodCBoYXZlIGJlZW4gZml4ZWQgd2l0aCBjb21taXQgZTI1
M2U0MWNlMmU1IChwYWNrYWdlL3NkbDJfdHRmOgphZGQgaGFyZmJ1enogb3B0aW9uYWwgZGVwZW5k
ZW5jeSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

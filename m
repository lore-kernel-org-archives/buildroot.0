Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E697FC07E97
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 17:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D4AB41764;
	Tue, 28 Nov 2023 17:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D4AB41764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVFVIw3GMmkC; Tue, 28 Nov 2023 17:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E822141762;
	Tue, 28 Nov 2023 17:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E822141762
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85AF41BF419
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14ED940156
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 17:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14ED940156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kJn6Zygm7-p for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 17:54:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1676940131
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 17:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1676940131
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07ADC1C0004;
 Tue, 28 Nov 2023 17:54:38 +0000 (UTC)
Date: Tue, 28 Nov 2023 18:54:38 +0100
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231128185438.79867282@bootlin.com>
In-Reply-To: <BN0P110MB1673DA4D93BA42393EF18D4BEBBCA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231128164920.75ac695e@bootlin.com>
 <BN0P110MB1673DA4D93BA42393EF18D4BEBBCA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701194079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abigehYN4I0VHlwecGJwF+xwNzL7IdwADpmCdM6/7TE=;
 b=ZR01EOUAFkm+220F/T24OX0YezdzONkLaErXwR4D2DHL1YephgF68O00JYQirKOqlybf3j
 e84L2G31GohGXmBW5Y0UN8qR507XhtoLFKSe3P65pgxwHHIjuO1RjyFh1UoIgpQkpBKeri
 H89IFFCCTXNv5wVqT+yxDtvbbRHBy323pXzLbm/4huYumxy5iheUHCM6/9WOQS+vdQcmlb
 Yn9/DGRYRZpw3qud43Ivn1l11k8yMiar2L2CPdYvUQIL6Ke+E26axH1V0YCR74YRanyWe9
 YzAvHfEmHNenOzVlv2/5sYGY54Z4O0ET4dE97TCNF36SKSUHCqtDh4fVQmlu6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZR01EOUA
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] ppd-merge: speed up
 per-package-rsync
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJhbmRvbiwgWWFubgoKT24gVHVlLCAyOCBOb3YgMjAyMyAxNzoyMToyNSArMDAwMAoiTWFp
ZXIsIEJyYW5kb24gTCAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb2xsaW5zIiA8QnJhbmRv
bi5NYWllckBjb2xsaW5zLmNvbT4gd3JvdGU6CgpbLi4uXQoKPiA+ID4gIGRlZmluZSBwZXItcGFj
a2FnZS1yc3luYwo+ID4gPiAtICAgbWtkaXIgLXAgJCgzKSAgCj4gPgo+ID4gU2hvdWxkbid0IHRo
ZSBta2RpciBiZSBrZXB0IGhlcmUgPyAgCj4gCj4gSSBtb3ZlZCBpdCBpbnRvIHBwZC1tZXJnZS5z
aCBzbyB0aGF0IHRoZSBzY3JpcHQgd291bGQgYmUgaGFuZGxpbmcgYWxsIHRoZSBkZXRhaWxzIG9m
IHBlci1wYWNrYWdlLXJzeW5jLgoKT29wcywgbXkgYmFkIEkgbWlzc2VkIGl0IQoKWy4uLl0KPiA+
ID4gKyAgIFBFUl9QQUNLQUdFX0RJUj0kKFBFUl9QQUNLQUdFX0RJUikgXAo+ID4gPiArICAgICAg
ICAgICAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3BwZC1tZXJnZS5zaCBcCj4gPiA+ICsgICAg
ICAgICAgICQoMikgJCgzKSAkKDQpICQoMSkgIAo+ID4KPiA+IFdoYXQgZG8geW91IHRoaW5rIGFi
b3V0IHBhc3NpbmcgdGhlIFBFUl9QQUNLQUdFX0RJUiBieSBwYXJhbWV0ZXIKPiA+IGluc3RlYWQg
b2YKPiA+IG1peGluZyBlbnZpcm9ubWVudCB2YWx1ZXMgYW5kIHBhcmFtZXRlcnMgPyAgCj4gCj4g
SSB3YXMgdHJ5aW5nIHRvIGNvcHkgdGhlIHN0eWxlIG9mIHN1cHBvcnQvc2NyaXB0cy9maXgtcnBh
dGgsIHdoaWNoIHRha2VzIFBFUl9QQUNLQUdFX0RJUiBmcm9tIHRoZSBlbnZpcm9ubWVudC4gRm9y
IGV4YW1wbGUsIHNlZSAuL01ha2VmaWxlICJwcmVwYXJlLXNkazoiIHRhcmdldC4KPiAKCk1ha2Vz
IHNlbnNlLgpPbiB0aGUgb3RoZXIgaGFuZCwgc3VwcG9ydC9zY3JpcHRzL2NoZWNrLWhvc3QtcnBh
dGggdGFrZXMgUEVSX1BBQ0tBR0VfRElSIGZyb20gcGFyYW1ldGVycy4KICBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9wYWNrYWdlL3BrZy1n
ZW5lcmljLm1rP3JlZl90eXBlPWhlYWRzI0w2MgoKSSBoYXZlIG5vIG9waW5pb24gYWJvdXQgd2hh
dCBpcyB0aGUgYmVzdCB0byBkby4KTWF5YmUgWWFubiA/CgpCZXN0IHJlZ2FyZHMsCkhlcnbDqQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

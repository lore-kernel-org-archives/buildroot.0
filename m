Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0D9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 09:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F524011A;
	Sat, 19 Mar 2022 09:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ui4tBW_Myenh; Sat, 19 Mar 2022 09:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8574240903;
	Sat, 19 Mar 2022 09:17:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A80A1BF842
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 09:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6541D400BF
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 09:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M63Z9vnV5IDN for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 09:17:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABAC3400A6
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 09:17:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70D7640002;
 Sat, 19 Mar 2022 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647681472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOjKTrsaMbjRDIER+mgIi2dLya+Ejgn4SXYRY1vZnrc=;
 b=YFcZvnqSbe2ZZ+Qqyfx9xHrD/BF4ip95V4QlRkYgorE5VQfkAK8UgQHpyEVF6/x2AQVRiS
 lMFMrB9CkI9V3X1DDRKbGuH0UYDTDzy4vBHbNiD+vwTapaeQqG9W00oMkt7HjdewtjOEw7
 xf2IEvrXD7JAOAIVO+iBSY6WwT1ezLAjiACpp/XqLjiJm2BsngpR1AaoAINft2aviKFl30
 Q1Oyx0C3UuEHfWATFSUY/8Ag2f0oRDEPP2nrjIvcBSy4lB1+LbZX3iXDMispF0ILDcnXdo
 ZjsuCNjKwlkaL6exDECF3y00/db7VZXD0wV6ocYbifSHws07FK4EXdyywDQ5cg==
Date: Sat, 19 Mar 2022 10:17:49 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220319101749.265ebceb@windsurf>
In-Reply-To: <20220318223221.GS283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-4-clement.leger@bootlin.com>
 <20220318223221.GS283544@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 3/8] boot/optee-os: add support to build
 with python-cryptography
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxOCBNYXIgMjAyMiAyMzozMjoyMSArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1v
cy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+ID4gaW5kZXggZWExNjU1MGI3
Mi4uMDJiNWQ3Yzg2ZiAxMDA2NDQKPiA+IC0tLSBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4g
PiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+ID4gQEAgLTEsNiArMSw3IEBACj4gPiAg
Y29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1MKPiA+ICAJYm9vbCAib3B0ZWVfb3MiCj4gPiAgCWRl
cGVuZHMgb24gQlIyX0FSTV9DUFVfQVJNVjhBIHx8IEJSMl9BUk1fQ1BVX0FSTVY3QQo+ID4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUyAgCj4gCj4gVGhh
dCdzIHdyb25nOiAzLjE1LjAgc3RpbGwgZG9lcyBub3QgbmVlZCBob3N0LXB5dGhvbi1jcnlwdG9n
cmFwaHkuCj4gCj4gRnVydGhlcm1vcmUsIGV2ZW4gYWZ0ZXIgd2UgYnVtcCB0byAzLjE2LjAsIHNp
bmNlIHdlIGNhbiBjaG9vc2UgYW4KPiBhcmJpdHJhcnkgZ2l0IHRyZWUgYXQgYW4gYXJiaXRyYXJ5
IGNvbW1pdCwgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8KPiBwb2ludCB0byBhIHZlcnNpb24gb2Yg
b3B0ZWUtb3MgdGhhdCBkb2VzIG5vdCByZXF1aXJlIGl0IGVpdGhlci4KPiAKPiBTbywgdGhhdCBk
ZXBlbmRlbmN5IG9ubHkgcmVhbGx5IGJlbG9uZ3MuLi4KPiAKPiA+ICAJaGVscAo+ID4gIAkgIE9Q
LVRFRSBPUyBwcm92aWRlcyB0aGUgc2VjdXJlIHdvcmxkIGJvb3QgaW1hZ2UgYW5kIHRoZSB0cnVz
dAo+ID4gIAkgIGFwcGxpY2F0aW9uIGRldmVsb3BtZW50IGtpdCBvZiB0aGUgT1AtVEVFIHByb2pl
Y3QuIE9QLVRFRSBPUwo+ID4gQEAgLTYxLDYgKzYyLDE0IEBAIGNvbmZpZyBCUjJfVEFSR0VUX09Q
VEVFX09TX05FRURTX0RUQwo+ID4gIAkgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB5b3VyIE9QLVRF
RSBPUyBwbGF0Zm9ybSBjb25maWd1cmF0aW9uCj4gPiAgCSAgcmVxdWlyZXMgdGhlIERldmljZSBU
cmVlIGNvbXBpbGVyIHRvIGJlIGF2YWlsYWJsZS4KPiA+ICAKPiA+ICtjb25maWcgQlIyX1RBUkdF
VF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCj4gPiArCWJvb2wgIk9QLVRFRSBP
UyBuZWVkcyBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkiICAKPiAKPiAuLi4gaGVyZS4KClllcyBh
bmQgbm8uIEJlY2F1c2UgYXMgc29vbiBhcyB0aGUgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1Qg
Z2V0cwpidW1wZWQgdG8gMy4xNi4wLCB0aGVuIG91ciBkZWZhdWx0IHNlbGVjdGlvbiBmb3IgT1At
VEVFICh1bmxlc3MgeW91CmNob3NlIGEgY3VzdG9tIEdpdCB2ZXJzaW9uKSB3aWxsIHJlcXVpcmUg
cHl0aG9uLWNyeXB0b2dyYXBoeS4gU28gdG8Ka2VlcCB0aGluZ3Mgc2ltcGxlLCBJIGFza2VkIENs
w6ltZW50IHRvIGFkZCB0aGlzIGRlcGVuZGVuY3kgdG8gdGhlCndob2xlIHBhY2thZ2UuCgpUaG9t
YXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

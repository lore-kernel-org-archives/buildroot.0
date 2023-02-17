Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED13FC6379F
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 15:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 456078212F;
	Fri, 17 Feb 2023 15:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456078212F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cuutpq8Kqor; Fri, 17 Feb 2023 15:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF73F82131;
	Fri, 17 Feb 2023 15:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF73F82131
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0C181BF311
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 891B441B9E
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891B441B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baENLQsSJxEW for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 15:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BD4A41992
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BD4A41992
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 15:15:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F352EE0005;
 Fri, 17 Feb 2023 15:15:22 +0000 (UTC)
Date: Fri, 17 Feb 2023 16:15:21 +0100
To: Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= <gero@schwaericke.email>
Message-ID: <20230217161521.01f4f2a7@windsurf>
In-Reply-To: <20221105194712.541286-1-gero@schwaericke.email>
References: <20221105194712.541286-1-gero@schwaericke.email>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676646923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjWzXgD++V9SmQlSt0tICyP9NajF+X7ajgk5Za4h2rQ=;
 b=Jbxdn4Fla4vC/br5SzvVGYmCIMmSmmqy6MUTUKuThp+DHBo1KH5n6wHkTuUg5j9uDt016q
 bQOAmxyylNx84xJYANmSj+rkbiEpaA4u3zxeHecU06O5lyt7yaja5vInuQiIlKNOK75569
 UNoBt27ldQLUrTeLqIK2TAF17MASZqOzS6KEzLv9QVFHE+hY0Bc97SvUNKizYthAPFC3qY
 BleqoucX/Bcz4fkhinxmRMQwUqx7wTcovvr52aSpz1vTAdqyjkxajFqm8rCQ3aLk5BJOzh
 6w1BCRnBCqpNBLq5gtrI8Xv5RN1BW8KCrU89QF9ttqnSEVeKs++USL5By1mBQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jbxdn4Fl
Subject: Re: [Buildroot] [PATCH] board/cubietech/cubieboard1: add Cubieboard
 1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2VybywKCk9uIFNhdCwgIDUgTm92IDIwMjIgMTk6NDc6MTIgKzAwMDAKR2VybyBTY2h3
w6RyaWNrZSA8Z2Vyb0BzY2h3YWVyaWNrZS5lbWFpbD4gd3JvdGU6Cgo+IEJvYXJkIHN1cHBvcnQg
Zm9yIHRoZSBDdWJpZWJvYXJkIDEgZnJvbSBDdWJpZXRlY2guIEJhc2VkIHRoZSBjb25maWcgZm9y
Cj4gQ3ViaWVib2FyZCAyIGFuZCB0aGUgT2xpbWV4IEExMC1PTGludVhpbm8tTElNRSB3aGljaCBp
cyBhbHNvIGFuCj4gQWxsd2lubmVyIEExMCBib2FyZCAoc3VueGkga2VybmVsKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvQHNjaHdhZXJpY2tlLmVtYWlsPgoKRmly
c3Qgb2YgYWxsLCB0aGFua3MgYSBsb3QgZm9yIHlvdXIgY29udHJpYnV0aW9uLCBhbmQgc29ycnkg
Zm9yIHRoZQp2ZXJ5IHNsb3cgZmVlZGJhY2suIFNlZSBiZWxvdyBzb21lIGZlZWRiYWNrLgoKRmly
c3Qgb2YgYWxsLCB0aGUgY29tbWl0IHRpdGxlIHNob3VsZCBiZToKCgljb25maWdzL2N1YmllYm9h
cmQxOiBuZXcgZGVmY29uZmlnCgo+IC0tLQo+ICBib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDEv
Ym9vdC5jbWQgICAgIHwgIDcgKysrKysKPiAgYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQxL2dl
bmltYWdlLmNmZyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgY29uZmlncy9jdWJpZWJv
YXJkMV9kZWZjb25maWcgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9ib290LmNtZAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQxL2dlbmltYWdlLmNmZwo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZmlncy9jdWJpZWJvYXJkMV9kZWZjb25maWcKCkNvdWxkIHlvdSBhZGQgYW4g
ZW50cnkgaW4gdGhlIERFVkVMT1BFUlMgZmlsZSwgYm90aCBmb3IgdGhlCmJvYXJkL2N1YmlldGVj
aC9jdWJpZWJvYXJkMS8gZm9sZGVyIGFuZCBmb3IgdGhlCmNvbmZpZ3MvY3ViaWVib2FyZDFfZGVm
Y29uZmlnIGZpbGU/CgpBbm90aGVyIHRoaW5nIHRoYXQgaXMgbWlzc2luZyBpcyBhCmJvYXJkL2N1
YmlldGVjaC9jdWJpZWJvYXJkMS9yZWFkbWUudHh0IHRoYXQgZXhwbGFpbnMgaG93IHRvIHVzZSB0
aGlzCmRlZmNvbmZpZyBvbiB0aGlzIHBhcnRpY3VsYXIgYm9hcmQuCgo+IGRpZmYgLS1naXQgYS9i
b2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDEvYm9vdC5jbWQgYi9ib2FyZC9jdWJpZXRlY2gvY3Vi
aWVib2FyZDEvYm9vdC5jbWQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmVlZmJkYzgxNjkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvY3ViaWV0ZWNoL2N1
YmllYm9hcmQxL2Jvb3QuY21kCj4gQEAgLTAsMCArMSw3IEBACj4gKyMgYmFzZWQgb24gYm9hcmQv
Y3ViaWVib2FyZDIvYm9vdC5jbWQKPiArCj4gK3NldGVudiBmZHRfaGlnaCBmZmZmZmZmZgo+ICtz
ZXRlbnYgYm9vdGFyZ3MgY29uc29sZT10dHlTMCwxMTUyMDAgZWFybHlwcmludGsgcm9vdD0vZGV2
L21tY2JsazBwMiByb290d2FpdAo+ICtmYXRsb2FkIG1tYyAwICRrZXJuZWxfYWRkcl9yIHpJbWFn
ZQo+ICtmYXRsb2FkIG1tYyAwICRmZHRfYWRkcl9yIHN1bjRpLWExMC1jdWJpZWJvYXJkLmR0Ygo+
ICtib290eiAka2VybmVsX2FkZHJfciAtICRmZHRfYWRkcl9yCgpUaGVyZSdzIG5vIHN1cHBvcnQg
Zm9yIGV4dGxpbnV4LmNvbmYgaW4gdGhlIGRlZmF1bHQgVS1Cb290CmNvbmZpZ3VyYXRpb24gZm9y
IHRoaXMgYm9hcmQ/CgpPdGhlcndpc2UsIGl0IGFsbCBsb29rcyBnb29kIHRvIG1lLiBDb3VsZCB5
b3UgYWRkcmVzcyB0aGUgbWlub3IgaXNzdWVzCmxpc3RlZCBoZXJlLCBhbmQgc2VuZCBhIDJuZCB2
ZXJzaW9uIG9mIHlvdXIgcGF0Y2g/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMgUGV0YXp6b25pCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

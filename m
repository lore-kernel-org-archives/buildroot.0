Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB01C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED6C813D5;
	Tue,  7 Feb 2023 13:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED6C813D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-s0VukLb87S; Tue,  7 Feb 2023 13:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E162813C6;
	Tue,  7 Feb 2023 13:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E162813C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59F8A1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B814408D8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B814408D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlJMLnuOuhmw for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:44:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E641A4061D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E641A4061D
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:44:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CECC240009;
 Tue,  7 Feb 2023 13:44:25 +0000 (UTC)
Date: Tue, 7 Feb 2023 14:44:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230207144425.7a9e03fd@windsurf>
In-Reply-To: <20221229164315.424657-1-fontaine.fabrice@gmail.com>
References: <20221229164315.424657-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675777466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMB8FLcPep/MO8V77tE0FpbKd0X9DqoImho0rAdGN7Y=;
 b=OPTD9WuoaLnwv687M/Mx+6HxRDaCyx37Sps15vDGT5BjAWy5zE1wTbO6ym5pNaNYS9AQSw
 ylbnYJJsKAHyZkfF3fWShTl6yV9pkIK/W1Lu3nAM56ILP5kAtRmBpjjE9c+jx+eX2fquh+
 zJXQEVF59+UmF89b9O6w65P1+ZDXhSyvE40/41+3H4jo+DxxVf2AwbiCvaVlenqnqowXiu
 Rd121WTT89pBedUZ5H9tzTBNal5LohCAD070xLTLebMMbmkuf0f2PN7mOdPa/nYa4RKzk2
 tTwCS8HI29o4Fix1e671IT7IqhowiuoFllUMhc1hq+g3FNYTOHXUc02UBpkk4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OPTD9Wuo
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with
 kernel >= 6.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyOSBEZWMgMjAyMiAxNzo0MzoxNSArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgd2l0aCBrZXJuZWwgPj0gNi4xCj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4v
aW5jbHVkZS9saW51eC9zdHJpbmcuaDoyMCwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNs
dWRlL2xpbnV4L2JpdG1hcC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvY3B1bWFzay5oOjEyLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvbW1fdHlwZXNfdGFzay5oOjE0LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvbW1fdHlwZXMuaDo1LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvYnVpbGRpZC5oOjUsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9t
b2R1bGUuaDoxNCwKPiAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvYXV0b2J1aWxkL2F1dG9i
dWlsZC9pbnN0YW5jZS0xMS9vdXRwdXQtMS9idWlsZC9kYWhkaS1saW51eC0zLjIuMC9kcml2ZXJz
L2RhaGRpL3djdGM0eHhwL2Jhc2UuYzoyNDoKPiAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9z
dHJpbmcuaDoyNzoyMjogbm90ZTogZXhwZWN0ZWQg4oCYdm9pZCAq4oCZIGJ1dCBhcmd1bWVudCBp
cyBvZiB0eXBlIOKAmGNvbnN0IHVuc2lnbmVkIGNoYXIgKuKAmQo+ICAgIDI3IHwgZXh0ZXJuIHZv
aWQgKiBtZW1jcHkodm9pZCAqLGNvbnN0IHZvaWQgKixfX2tlcm5lbF9zaXplX3QpOwo+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWls
ZC9pbnN0YW5jZS0xMS9vdXRwdXQtMS9idWlsZC9kYWhkaS1saW51eC0zLjIuMC9kcml2ZXJzL2Rh
aGRpL3djdGM0eHhwL2Jhc2UuYzo2NjE6OTogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBm
dW5jdGlvbiDigJhuZXRpZl9uYXBpX2FkZOKAmQo+ICAgNjYxIHwgICAgICAgICBuZXRpZl9uYXBp
X2FkZChuZXRkZXYsICZ3Yy0+bmFwaSwgJndjdGM0eHhwX3BvbGwsIDY0KTsKPiAgICAgICB8ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL25l
dC9pbmV0X3NvY2suaDoxOSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4
L3VkcC5oOjE2LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1
aWxkL2luc3RhbmNlLTExL291dHB1dC0xL2J1aWxkL2RhaGRpLWxpbnV4LTMuMi4wL2RyaXZlcnMv
ZGFoZGkvd2N0YzR4eHAvYmFzZS5jOjM4Ogo+IC4vaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaDoy
NTYyOjE6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgMjU2MiB8IG5ldGlmX25hcGlfYWRkKHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwKPiAgICAgICB8IF5+
fn5+fn5+fn5+fn5+Cj4gCj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvZDdjZTEwM2E4ODYzMjljNjhjMDRlYmUwNTU3MWJlOGY5NWE4NzNjZQo+IAo+
IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgo+IC0tLQo+ICAuLi4vMDAwNC1uZXh0LWZpeC1rZXJuZWwtNi0xLWJ1aWxkLnBhdGNoICAg
ICAgfCAzMiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2RhaGRpLWxpbnV4LzAwMDQtbmV4
dC1maXgta2VybmVsLTYtMS1idWlsZC5wYXRjaAoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

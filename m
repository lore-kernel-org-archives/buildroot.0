Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C3C433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 20:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15FAA40178;
	Fri, 10 Dec 2021 20:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLJrVg29UaAk; Fri, 10 Dec 2021 20:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C03C4131B;
	Fri, 10 Dec 2021 20:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE44F1BF28E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB04042753
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37AKG7VjbTux for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 20:11:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B36AF42754
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 20:11:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D2085B0051B;
 Fri, 10 Dec 2021 21:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639167092;
 bh=niicF+R/uokU6NgWmp3dQN5hdc8xoTwjtD0mxfH8JO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k3f5L64J7o6NlzlYiP8cKf6EYy034aGhlPDF2B8Ur72WEO+ji2cHymK9T33f6b+64
 joKdkK4aE3EN+hkT1ydbcnsRkWG63wxuY4LuaPt+XMqP7V2+vjjSwp2+lMpr0WD3TW
 zANXPtwF2mXoKpcPDrQDuWZxUYGuL46PUdoMbmv4Q6QjMAG8IkBczPb/svXVBqAWk3
 aRk3P0H5Up2zr4F8q/+q9Zj9yO47K40H6wQmK7AxABLYNwp+G2lhpQamQS87/sJsHH
 KqgYrWDPV0+l2JYsl3OVkc81kBDrqwBwS0zbLt3QMx6b07gW+ihS/sxMX3dSy4jBBC
 dWb6AqWqkybVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 21:11:30 +0100
Date: Fri, 10 Dec 2021 21:11:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211210201130.GL2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMTItMTAgMTY6MTIgKzAyMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5Ogo+IEFkZCBwYWNrYWdlIHRvIGF2b2NhZG8gZnJhbWV3b3JrJ3MgYWV4cGVj
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5A
dW5pa2llLmNvbT4KWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FleHBlY3QvQ29u
ZmlnLmluIGIvcGFja2FnZS9hZXhwZWN0L0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uZWZhMmJlOGI5MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL2FleHBlY3QvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMiBAQAo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfQUVYUEVDVAo+ICsJYm9vbCAiYWV4cGVjdCIKPiArCWRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUyAjIGRsb3BlbigpCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OCgpEbyBu
b3Qgc2VsZWN0IHB5dGhvbiwgZGVwZW5kIG9uIGl0LgoKQWxzbyBweXRob24gaW4gQnVpbGRyb290
IGlzIHB5dGhvbiAyLiBXZSBhcmUgdHJ5aW5nIHRvIGdldCByaWQgb2YgaXQuCklzIGFleHBlY3Qg
cmVhbGx5IG9ubHkgc3VwcG9ydGluZyBweXRob24yPyBJZiBzbywgdGhpcyBpcyBhIGJpdAp1bmZv
cnR1YW50ZS4uLgoKQnV0IHNpbmNlIGl0IHJlcXVpcmUgMnRvNiwgbWF5YmUgaXQgd29ya3Mgd2l0
aCBweXRob24zIHRvbz8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICsJaGVscAo+ICsJICBU
aGlzIG1vZHVsZSBwcm92aWRlcyBzZXJ2aWNlcyBzaW1pbGFyIHRvCj4gKwkgIHRoZSBwZXhwZWN0
IHB5dGhvbiBsaWJyYXJ5LCBzbyB0byBzcGVhaywKPiArCSAgc3Bhd24gYW5kIGNvbnRyb2wgaW50
ZXJhY3RpdmUgYXBwbGljYXRpb25zLAo+ICsJICBzdWNoIGFzIHNzaCwgc2Z0cCBhbmQgb3RoZXJz
Lgo+ICsKPiArY29tbWVudCAiYWV4cGVjdCBuZWVkcyBhIHRvb2xjaGFpbiB3aXRoIGR5bmFtaWMg
bGlicmFyeSBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QuaGFzaCBiL3BhY2thZ2UvYWV4cGVjdC9hZXhw
ZWN0Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRhNDdk
YTQxMjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QuaGFz
aAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIEZyb20gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2QwL2ZhLzViYTE2Y2ExN2E3MDk4MGM3YzA5ZWExYzhkNzQ4YWFjZTFlZTg3
NzJkMDMyYzQ4M2FkZDBlMTdkMGNmNgo+ICtzaGEyNTYgIDU0YWJhZTMxZTdkM2I3YWZiZmI3YTAx
OTc1NjkwN2E4MWQ0MGJlNDQyMjc4OGJjY2YyMGQyZTgyYWQ2ZWY4YzggIGFleHBlY3QtMS42LjMu
dGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYgIDdiZTI2YWJmMzVlNTMxYTIy
NmRjNzQyZDIzNzlkNDJkMzcyY2I2MWYwMjdhNmUyNjQ3N2MwZTJmMWEwM2JmY2IgIExJQ0VOU0UK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsgYi9wYWNrYWdlL2FleHBl
Y3QvYWV4cGVjdC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
Y2EyMDk3MzI4YQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2FleHBlY3QvYWV4cGVj
dC5tawo+IEBAIC0wLDAgKzEsMTMgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+
ICsjIGFleHBlY3QKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArQUVYUEVD
VF9WRVJTSU9OID0gMS42LjMKPiArQUVYUEVDVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2QwL2ZhLzViYTE2Y2ExN2E3MDk4MGM3YzA5ZWExYzhkNzQ4YWFj
ZTFlZTg3NzJkMDMyYzQ4M2FkZDBlMTdkMGNmNgo+ICtBRVhQRUNUX1NFVFVQX1RZUEUgPSBzZXR1
cHRvb2xzCj4gK0FFWFBFQ1RfTElDRU5TRSA9IEdQTC0yLjAKPiArQUVYUEVDVF9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRQo+ICsKPiArJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+IC0tIAo+IDIu
MzAuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK

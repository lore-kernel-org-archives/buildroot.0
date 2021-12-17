Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36533C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6C6240C2B;
	Fri, 17 Dec 2021 21:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDboh4dM4wYP; Fri, 17 Dec 2021 21:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B981D40C26;
	Fri, 17 Dec 2021 21:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF3971BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDDEE40C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKBlqh06LBSx for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:14:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 085A74093B
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:14:09 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id yKYJmmQVZIMuKyKYJm77j8; Fri, 17 Dec 2021 22:14:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639775648; bh=pEPX2PFGu49KGGZlu24d6/1+lhEyxCAK4L8a+hyiDYo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=MjYzL9lbQkOZhJ+3pIaeM+ta2e4VVpBMCSDCm7oMHAHwpd1xCODxfSWarxUbwlyEH
 mI+gUQ70kGwGeEWgzEciuT9H4/yjwD+zam0KBIIblpQP/qLqpb2IIOz9gFX2ccBmVt
 WKatSKXsEzezhaw9r8bT4LhHU4fcHd17qzlgpR2/0lBWCMiBnXGVs8gf+lMdq5H75E
 N0grFeAl3TjJfBcwM9C1ePYDy2KnZiQy5zMDeSflNAsgx6qO29mEwZUauhZ3aKcUJ8
 kvIsXfSd+qWvh37Pvjm4wMxwGE+vIeM8qtul35Obwl7Vp40BQKm+njyh990lRVawob
 VNCBkCNFlbfUA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 17 Dec 2021 22:14:04 +0100
Message-Id: <A83CFAA1-285E-4F64-A448-FF4AE0B874F0@benettiengineering.com>
References: <20211217214940.106e9ed5@windsurf>
In-Reply-To: <20211217214940.106e9ed5@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4wfAc1+JwfS9Hli21bNeDzEG3Ak0zGnnn2o50U13bNh8uicPaw2cPWXhRWpQjWL4kCt8TD0kS2pBoAVcgktGE+6gxLTBNRXjkwxsOvv6NhJ8GqfkzxhooB
 gjkO7nVDmzLk5P1FPRiNS/1X0DiXzh20rUAeMD5G2IyCPHgxy/WBDTPtTuA2XTH4WImJHTspIfE4fyfVSNvLK7/ftmG2zKf5NKlrv9U5G7R48MG7VtxAh4l6
 iKChhGK2NRwI3p5HTK5KYs2pO7XdSwuQLXnIvdVonfYO0k8zdntEaJ5Nt0e4AeRkzd+2CnFLlAHKGrxr3ZQrC7OZp2ScMargpkWwWkD6wHzGCnQy0HBTccHR
 /rW6+mtN
Subject: Re: [Buildroot] [PATCH 1/2] package/erlang-jiffy: fix build failure
 due to lack of -fPIC
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
Cc: Will Newton <will.newton@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKPiBJbCBnaW9ybm8gMTcgZGljIDIwMjEsIGFsbGUgb3JlIDIxOjUwLCBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v09uIE1vbiwgMTggT2N0IDIwMjEgMjI6MTQ6MTUgKzAyMDAKPiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPj4gVGhhbmtzISBI
b3dldmVyLCBkaWQgeW91IHJldmlldyB0aGUgZGlzY3Vzc2lvbiBhdDoKPj4gCj4+ICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMDEyMjQxMDE0NDAuMzQyNzQ3Mi0xLWZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tLwo+PiAKPj4gRXNwZWNpYWxseSB0aGUgZmVlZGJhY2sgZnJv
bSBBcm5vdXQgYXJvdW5kIHRoZSBlbmQgb2YgdGhlIHRocmVhZD8KPiAKPiBQaW5nPwoKWWVzIGFu
ZCBJ4oCZdmUgcmVwcm9kdWNlZCB0aGF0IHByb2JsZW0gY2F1c2VkIGJ5IHJlYmFyLiBJ4oCZdmUg
ZGVhbHQgd2l0aCB0aGF0IHRocmVlIHRpbWVzIGFuZCBJIGNvdWxkbuKAmXQgZmluZCBob3cgdG8g
ZW1pdCB0aGF0IGRhbW4gLWZQSUMgb24gQ0ZMQUdTIHRvbyBhbmQgbm90IG9ubHkgb24gTERGTEFH
Uy4KUmViYXIgaXMgdGhlIHByb2JsZW0sIEkgdG90YWxseSBjb25maXJtLiBEdXJpbmcgdGhpcyB3
ZWVrZW5kIEkgd2lsbCB0cnkgdG8gZ2l2ZSB0aGUgbGFzdCB0cnkgdG8gZml4IHJlYmFyIGFuZCBz
ZW5kIGEgbG9jYWwgcGF0Y2ggZm9yIGl0LgpIb25lc3RseSBpdOKAmXMgc29tZXRoaW5nIEkgY2Fu
4oCZdCBzdGFuZCB0byBub3QgZml4IGl0IGFuZCBJIHdhbnQgdG8uCgpPbmUg4oCcbm90IGdvb2Qg
d2F54oCdIHRvIHdvcmstYXJvdW5kIHRoZSBwcm9ibGVtIGNvdWxkIGJlIGFwcGx5aW5nIHRoaXMg
cGF0Y2ggZm9yIHRoZSBtb21lbnQgYW5kIG9uY2UgSSBmaXggcmViYXIgd2UgcmVtb3ZlIGl0IHdp
dGggdGhlIHJlYmFyIHBhdGNoLgoKQnV0IHNvb24gb3IgbGF0ZSBJIHdhbnQgdG8gZml4IGl0LgpJ
IGFsc28gaGF2ZSB0byB3cml0ZSB0aGUgbOKAmUludGVyIGZvciBnZW5pbWFnZSBhbmQgSeKAmXZl
IG9ubHkgYmVndW4uCgpHaXVsaW8KCj4gCj4gVGhvbWFzCj4gLS0gCj4gVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4844CC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 22:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96CEB402F7;
	Thu, 29 Dec 2022 22:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96CEB402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9alt9oYQyXR; Thu, 29 Dec 2022 22:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA0840227;
	Thu, 29 Dec 2022 22:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA0840227
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 197B31BF287
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E70D6401F9
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70D6401F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TweT_3_MaO9w for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 22:04:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A02401F5
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A02401F5
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 22:04:20 +0000 (UTC)
Received: from smtpclient.apple ([151.18.218.237])
 by Aruba Outgoing Smtp  with ESMTPA
 id B10bpMf6VEkpyB10bpBeSO; Thu, 29 Dec 2022 23:04:18 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 29 Dec 2022 23:04:14 +0100
Message-Id: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
References: <20221229095800.64a5f115@windsurf>
In-Reply-To: <20221229095800.64a5f115@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (20C65)
X-CMAE-Envelope: MS4xfNVjkntPqvPEMPMYNtWRl7zZida6vjOqlaGh6AQurtrh9ajLhHPYF/lL2QNdHRE8/DkEzOLxpWlNY7mckPgOPkKtsA3c4ygi2hQP8Dab+Z3vhnLf5a+5
 VIKKBdocqG89tdTS9n44qPMYEI41HtQ8b6AgGMV9jT59Xm2EVInz9KWsaoTo5xKd4fRVvtowf1rOvDR3cz+3D8gR7O7T9jsdE/pe/q3wdMUhCaAxZdqOYOS+
 8SP0lkyBVz9oYzEG7F3deJ/5y4LQLE4DjSId0I4oEzFJQW26fo1rDHpDPblaatVy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672351458; bh=zyWISEvCEFmoyUT1z6qy+lrt2AIFXziURz9K5uzxL+8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=BVE7nnId04/WPDiRV+lWuPyPkcryA0xO5J4WqhRM8Z9PXDxO8np+j5RKCTE6WILn9
 /geHOj2D+fwY0c8ZS/ow2u0A3Da5UkfgYXm+P+KEKCfEKr8wm2UnvvZ4r3GexlB+y0
 +yHki273xESWE2Rcv7T0HUfsZVb8LMC7OmbI66PGporXeIrn6iBk2PJk1HqdIvFVzK
 MXlvtlAs+PJvzVnfqH87PHjaEEcqFz1LT7ZQqAMuDtSUZMUfeQ2vmWqP9zqlONNphO
 S77W35iGu4vOnRccSmm4a2KN7i2mZMwRaK9bpb5LbPh6STw5YkkJYg/prYvYmusb2B
 3cdVVfmi3zyTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BVE7nnId
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKPiBJbCBnaW9ybm8gMjkgZGljIDIwMjIsIGFsbGUgb3JlIDA5OjU4LCBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v09uIFdlZCwgMjggRGVjIDIwMjIgMjE6NTM6MjMgKzAxMDAKPiBHaXVsaW8gQmVuZXR0
aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gCj4+IEFk
ZCBwYXRjaGVzIHBlbmRpbmcgdXBzdHJlYW1bMF0gdG8gaGFuZGxlIHZhcmlvdXMgZGF0YSB0eXBl
cyBhbmQgYXBpCj4+IGNoYW5nZXMgdXAgdG8gTGludXggNi4xLgo+PiAKPj4gWzBdOiBodHRwczov
L2dpdGh1Yi5jb20vZW1iZWRkZWRUUy93aWxjMzAwMC1leHRlcm5hbC1tb2R1bGUvcHVsbC8yCj4+
IAo+PiBGaXhlczoKPj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNmFh
NzQ3NWEyMWE2MDYwZTlmY2UzNTUyZjczZTZlNzEwMGE4YjJhYQo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Cj4+IC0tLQo+PiAuLi5taXNzaW5nLXByYW5kb21fdTMyLXdpdGgtTGludXgtNi4xLjAucGF0Y2gg
fCAgMzQgKysrCj4+IC4uLmZpeC1idWlsZC1mYWlsdXJlLW9uLXJlbW92ZS1jYWxsYmFjay5wYXRj
aCB8ICA0NCArKysrCj4+IC4uLnVpbGQtZmFpbHVyZS13aXRoLUxpbnV4LTUuMTktYW5kLTYuMS5w
YXRjaCB8ICA5OCArKysrKysrKwo+PiAuLi5vbl9wYXJhbWV0ZXJzLUxpbnV4LTYuMS1idWlsZC1m
YWlsdXIucGF0Y2ggfCAyMTYgKysrKysrKysrKysrKysrKysrCj4+IDQgZmlsZXMgY2hhbmdlZCwg
MzkyIGluc2VydGlvbnMoKykKPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2
ZXIvMDAwMS1jZmc4MDIxMS5jLWZpeC1taXNzaW5nLXByYW5kb21fdTMyLXdpdGgtTGludXgtNi4x
LjAucGF0Y2gKPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAwMi1z
cGkuYy1maXgtYnVpbGQtZmFpbHVyZS1vbi1yZW1vdmUtY2FsbGJhY2sucGF0Y2gKPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAwMy1jZmc4MDIxMS5jLWZpeC1idWls
ZC1mYWlsdXJlLXdpdGgtTGludXgtNS4xOS1hbmQtNi4xLnBhdGNoCj4+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3dpbGMtZHJpdmVyLzAwMDQtRml4LXN0cnVjdC1zdGF0aW9uX3BhcmFtZXRl
cnMtTGludXgtNi4xLWJ1aWxkLWZhaWx1ci5wYXRjaAo+IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuIEhvd2V2ZXIsIGl0IGlzIHdvcnRoIG1lbnRpb25pbmcgdGhhdCB0aGUKPiByZWFsICJ1
cHN0cmVhbSIgZm9yIHRoaXMgZHJpdmVyIGlzIHRoZSBsaW51eDRzYW0gTGludXggdHJlZSBhdAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRzYW0vbGludXgtYXQ5MS4KCkFoLCB5ZXMKCj4gVGhl
eSBhcmUgY3VycmVudGx5IGJhc2VkIG9uCj4gNS4xNSwgYnV0IEkgc3VwcG9zZSB0aGV5IHdpbGwg
cmViYXNlIHNvb24gb24gNi4xLAoKSSB0aGluayBzbyB0b28KCj4gc28gdGhleSBtaWdodCBiZQo+
IGludGVyZXN0ZWQgaW4geW91ciBmaXhlcy4KCkhvdyBjYW4gSSBwb2ludCBteSBmaXhlcz8gRG8g
eW91IHRoaW5rIGl04oCZcyBlbm91Z2ggdG8gb3BlbiBhbiBJc3N1ZSBpbiBsaW51eC1hdDkxIEdp
dEh1Yj8KCj4gSSBkb24ndCBrbm93IGlmL3doZW4gdGhlIG91dC1vZi10cmVlIHZhcmlhbnQKPiBv
ZiB0aGUgV0lMQyBkcml2ZXIgYXQKPiBodHRwczovL2dpdGh1Yi5jb20vZW1iZWRkZWRUUy93aWxj
MzAwMC1leHRlcm5hbC1tb2R1bGUgZ2V0cyBzeW5jZWQgZnJvbQo+IHRoZSBsaW51eDRzYW0gdHJl
ZS4KCknigJl2ZSBjb21wYXJlZCB0aGUgdHdvIGRyaXZlcnMgYW5kIHRoZXkgYXJlIHByZXR0eSB0
aGUgc2FtZSwgbm90IGNvbXBsZXRlbHkgYnV0IHZlcnkgY2xvc2UgZXhjbHVkaW5nIHRoZSB2YXJp
b3VzICNpZmRlZuKAmXMuCkkgZG9u4oCZdCBlaXRoZXIga25vdyBob3cgdGhhdCByZXBvIGlzIGhh
bmRsZWQgYnV0IEkgY2FuIG1vbml0b3IgaXQuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IEJl
c3QgcmVnYXJkcywKPiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9i
b290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

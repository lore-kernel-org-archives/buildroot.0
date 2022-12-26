Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F13C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785EA40291;
	Mon, 26 Dec 2022 21:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785EA40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yv1HW_qSjKao; Mon, 26 Dec 2022 21:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9384940465;
	Mon, 26 Dec 2022 21:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9384940465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 928881BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D21F80A7E
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D21F80A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4M0upHZ9A0u8 for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09203813A9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09203813A9
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 21:14:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 34243780304;
 Mon, 26 Dec 2022 22:14:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:14:07 +0100
Date: Mon, 26 Dec 2022 22:14:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221226211407.GI2893@scaer>
References: <20221226074833.143668-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226074833.143668-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672089250;
 bh=n+OXMxstOcUygMt4q9r4D5wrU63vP1+hOXJI4zwFtBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WjtwDlglQhy7vTBYsVKnzBAPhEJUAPwoQBjSbnKDhn7ePGXmD89PX8a/vO6Km4BRM
 4joXF3icPq0rvsibOz6DmREpOcKuPai1+QZjEgtKLQzg64VklDjTjgfyMshLHmodqj
 LUlBw+MPEXZuaXdmH8vXHxM63MNNz0Fu3Ys+byKHHWEff+kR8oOuXtoHiD4q82STo5
 Xxy4yQCl36ThbHUAinouzBKr47n7P6HF6oruzy1GkstV+sZH/tHeFALUPzEwdOVJ4R
 tM6ZU7crA7WR8Gnayv3nkrpTCs5fMqAdim/Z4ZWlIcrnxbA7aaJuoTCKwIIf+t69JB
 Xrlh2MHS0hU/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WjtwDlgl
Subject: Re: [Buildroot] [PATCH] package/lua-ev: bump to version 1.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTEyLTI2IDA4OjQ4ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YS1ldi9sdWEtZXYuaGFzaCB8IDQg
KystLQo+ICBwYWNrYWdlL2x1YS1ldi9sdWEtZXYubWsgICB8IDQgKystLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sdWEtZXYvbHVhLWV2Lmhhc2ggYi9wYWNrYWdlL2x1YS1ldi9sdWEtZXYuaGFzaAo+
IGluZGV4IGViNGY0Y2Y3NC4uMjc4ZjVmOGY3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhLWV2
L2x1YS1ldi5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWEtZXYvbHVhLWV2Lmhhc2gKPiBAQCAtMSwz
ICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICA0ZTI2ZTA1ODMwOTU1
ZmRkODgyYTFiNDhiNTM1YmU5NDM1NjU4MmVlYTMxMDMyN2Y4MzlmODMwY2Q5MjUwZDNhICBsdWEt
ZXYtMzM5NDI2ZmJlNTI4ZjExY2IzY2QxYWY2OWE4OGYwNmJiYTM2Nzk4MS50YXIuZ3oKPiAtc2hh
MjU2ICBjMjI0Y2MzMWZlZWM1MmUzM2I2MjFjY2RiYzI0NWUyMTMxNmEyMGExMzRhNGNkODcwNjQz
OGEzYjMzODJlOGFjICBSRUFETUUKPiArc2hhMjU2ICAyNmFjMTE2NzIyYTI0MWJmNTlkYWY1MzE1
Y2UwZmZlNzUxYzFiYWJlYTlhMTQ2ZmZjMGEzODlmMWFmM2ZhY2NhICBsdWEtZXYtMS41LnRhci5n
ego+ICtzaGEyNTYgIDNiNmY4YTI1ZTM0NDNjOGJlNjFmYzdhOTFlMWQyN2I1NTE0ZDQ4OWJiM2Vh
NTk4NmVhY2U2ZmUxNTMxYWFiY2MgIFJFQURNRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS1l
di9sdWEtZXYubWsgYi9wYWNrYWdlL2x1YS1ldi9sdWEtZXYubWsKPiBpbmRleCAzOTM5NDg3NWIu
LmVlYzA3ODk0NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YS1ldi9sdWEtZXYubWsKPiArKysg
Yi9wYWNrYWdlL2x1YS1ldi9sdWEtZXYubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTFVBX0VWX1ZFUlNJT04gPSAzMzk0MjZmYmU1Mjhm
MTFjYjNjZDFhZjY5YTg4ZjA2YmJhMzY3OTgxCj4gLUxVQV9FVl9TSVRFID0gJChjYWxsIGdpdGh1
Yixicmltd29ya3MsbHVhLWV2LCQoTFVBX0VWX1ZFUlNJT04pKQo+ICtMVUFfRVZfVkVSU0lPTiA9
IDEuNQo+ICtMVUFfRVZfU0lURSA9ICQoY2FsbCBnaXRodWIsYnJpbXdvcmtzLGx1YS1ldix2JChM
VUFfRVZfVkVSU0lPTikpCj4gIExVQV9FVl9ERVBFTkRFTkNJRVMgPSBsdWFpbnRlcnByZXRlciBs
aWJldgo+ICBMVUFfRVZfTElDRU5TRSA9IE1JVAo+ICBMVUFfRVZfTElDRU5TRV9GSUxFUyA9IFJF
QURNRQo+IC0tIAo+IDIuMzcuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0CAC4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5596A813B9;
	Mon, 26 Dec 2022 21:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5596A813B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czx1IDAXIsE6; Mon, 26 Dec 2022 21:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACE081295;
	Mon, 26 Dec 2022 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ACE081295
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC9DF1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A848F81295
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A848F81295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_boWDr_5Iwr for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB80C8006F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB80C8006F
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 21:18:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8E1E978032A;
 Mon, 26 Dec 2022 22:18:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:18:38 +0100
Date: Mon, 26 Dec 2022 22:18:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221226211838.GK2893@scaer>
References: <20221226074901.143710-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226074901.143710-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672089522;
 bh=4+wcWh7/i3H7T5clyQJefmQ350f/wZoO0e8BEHuQ1wE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NpHUw4Nv9z+zdeLvj8bluwhR5BUnXKYsntS0jGpuWbmTFGMACN77rQOxjtpP5Dfui
 73AGCfbOdDuy+hQwPYgV5ZDIVD/Q+AInCOyIykgmczINNtOI5drmKj2GYvzKgd83B/
 gB1hDrCqwprIarDZS5IxGAKQ0+Eq8vUX1U6lu5kzvuBa/4E9QIMtJqpQl4iifCx/X6
 tWZL0fqfOfyJt8dG9RXGYjFRDoPMV8IdQEZRocQPSy2ljZpdE3YPbRxqreJ6i8mMFd
 PLeN2x5703Xoo/mXlfVi5uobopF1/8L2D3wPLilRWMb9bWho8jXN9ofiQdgWXgVXON
 WeEdKKPBlBEig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NpHUw4Nv
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.4
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTEyLTI2IDA4OjQ5ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL29wZW42MjU0MS9vcGVuNjI1NDEuaGFz
aCB8IDIgKy0KPiAgcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLm1rICAgfCAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL29wZW42MjU0MS9vcGVuNjI1NDEuaGFzaCBiL3BhY2thZ2Uvb3BlbjYy
NTQxL29wZW42MjU0MS5oYXNoCj4gaW5kZXggMjJjMTM4NTFiLi4wOTAwMjQzNmUgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLmhhc2gKPiArKysgYi9wYWNrYWdlL29w
ZW42MjU0MS9vcGVuNjI1NDEuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAo+IC1zaGEyNTYgIDI4MzU0NTk5MWMzZWIzNmIxOGM3NWE2NDYzOGM3YzJhZDhmMTkz
NjU0YzI0MDNiNzZhZWU4NDhhYmY0NTRlMTQgIG9wZW42MjU0MS12MS4zLjMtYnIxLnRhci5nego+
ICtzaGEyNTYgIDlhNzk1NWJhMDFlMTJkYmQzMjdlNTM0YzI1Mjg4ZjQ5MThkMjc1MDMxMzk0Yzgw
NDk0M2E3ZTQ1YmE5MDM2MjEgIG9wZW42MjU0MS12MS4zLjQtYnIxLnRhci5nego+ICBzaGEyNTYg
IGZhYjNkZDZiZGFiMjI2ZjFjMDg2MzBiMWRkOTE3ZTExZmNiNGVjNWUxZTAyMGUyYzE2ZjgzYTBh
MTM4NjNlODUgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYy
NTQxLm1rIGIvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLm1rCj4gaW5kZXggZWRjOTVkY2Yx
Li4yYzBlM2IxN2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLm1r
Cj4gKysrIGIvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLU9QRU42MjU0MV9WRVJTSU9O
ID0gdjEuMy4zCj4gK09QRU42MjU0MV9WRVJTSU9OID0gdjEuMy40Cj4gIE9QRU42MjU0MV9TSVRF
X01FVEhPRCA9IGdpdAo+ICBPUEVONjI1NDFfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
NjI1NDEvb3BlbjYyNTQxLmdpdAo+ICBPUEVONjI1NDFfR0lUX1NVQk1PRFVMRVMgPSBZRVMKPiAt
LSAKPiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==

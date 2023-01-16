Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEABAC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5982C40ACB;
	Mon, 16 Jan 2023 20:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5982C40ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faWgIeT9biTQ; Mon, 16 Jan 2023 20:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87DEF405AC;
	Mon, 16 Jan 2023 20:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87DEF405AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDCC61BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B622581020
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B622581020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oH5uDBDIpxyo for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:23:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD5480FAD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAD5480FAD
 for <buildroot@busybox.net>; Mon, 16 Jan 2023 20:23:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 38BF25FF9A;
 Mon, 16 Jan 2023 21:23:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:23:40 +0100
Date: Mon, 16 Jan 2023 21:23:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230116202340.GD2770@scaer>
References: <20230116112944.5440-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116112944.5440-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673900623;
 bh=LmAr4YpDOAk7N0ALaAhUHiJUEAlg6frvBdDcoY2sqz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgQM61uDQPzqwzFqkGVIjsG92QdCyPusxiOx/fho46Fg3jfABDYJOkvJhEBbx8iZq
 WAATEYBL8+MRTr8aePZF3ugD8BpF8vkWYsh/cuUPfB2Ktpoejmx9DrI45Hy5y0y7Qo
 lq1chiyXYzP7FxwDsiL+j1sdwMB5RBOeb6cm1Qi5+z5MBiT9wJ2J7YM7OIBfMJhQAM
 HHeM5EZFFYxSHms/PZN6IQyLApliWTRX8DTNyfPss3PnVhW96k5jPoMWIGdv8+S/Vr
 AVgTSNP71nLrzER20fUKoD+WTjkK4KVG2x6Dfy4aKe1R44x5HJV6AUy+LOoS5jPEFA
 LPSiv0iFCcYiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TgQM61uD
Subject: Re: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.3
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTAxLTE2IDEyOjI5ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YS1jZmZpL2x1YS1jZmZpLmhhc2gg
fCAyICstCj4gIHBhY2thZ2UvbHVhLWNmZmkvbHVhLWNmZmkubWsgICB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHVhLWNmZmkvbHVhLWNmZmkuaGFzaCBiL3BhY2thZ2UvbHVhLWNmZmkvbHVh
LWNmZmkuaGFzaAo+IGluZGV4IGU3MTAxOTk5My4uMzE4ZjYwZmVmIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbHVhLWNmZmkvbHVhLWNmZmkuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHVhLWNmZmkvbHVh
LWNmZmkuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hh
MjU2ICAzNGZiNGVlYTdhMGFiZWMyMDk1ZjA4NTk2ZjYwNGFjMDFjODFiOTc5YmVhZDdkMmY1Y2Iw
ODRiM2UyYjQ2Y2JjICBsdWEtY2ZmaS0wLjIuMi50YXIuZ3oKPiArc2hhMjU2ICAxZDI1NzdhNjJh
ODQzZTVlNmRiMzVhZjFiNTgzMDBkMjc5YjRkZjU4ZWNjZWY1ZTgyMzQ0MTUwMWY5NjBkMzg4ICBs
dWEtY2ZmaS0wLjIuMy50YXIuZ3oKPiAgc2hhMjU2ICBmNTY1M2E0ZDU4NjRhMzkyMGVhMWUwN2Rh
Y2ZkNjQ2MDY3MzE0YmU2NDc1OThmMGFjYWFmNjg1YmVhYTJlMzk2ICBDT1BZSU5HLm1kCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbHVhLWNmZmkvbHVhLWNmZmkubWsgYi9wYWNrYWdlL2x1YS1jZmZp
L2x1YS1jZmZpLm1rCj4gaW5kZXggYWMzNTFmN2Y5Li4zMDQyN2FjMzQgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9sdWEtY2ZmaS9sdWEtY2ZmaS5tawo+ICsrKyBiL3BhY2thZ2UvbHVhLWNmZmkvbHVh
LWNmZmkubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAtTFVBX0NGRklfVkVSU0lPTiA9IDAuMi4yCj4gK0xVQV9DRkZJX1ZFUlNJT04gPSAw
LjIuMwo+ICBMVUFfQ0ZGSV9TSVRFID0gJChjYWxsIGdpdGh1YixxNjYsY2ZmaS1sdWEsdiQoTFVB
X0NGRklfVkVSU0lPTikpCj4gIExVQV9DRkZJX0xJQ0VOU0UgPSBNSVQKPiAgTFVBX0NGRklfTElD
RU5TRV9GSUxFUyA9IENPUFlJTkcubWQKPiAtLSAKPiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

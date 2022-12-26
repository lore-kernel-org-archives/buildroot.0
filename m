Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A2C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C9581297;
	Mon, 26 Dec 2022 21:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C9581297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwywAKKzSJxN; Mon, 26 Dec 2022 21:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4583E81291;
	Mon, 26 Dec 2022 21:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4583E81291
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5DA1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2882780DA5
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2882780DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ3Q1MsQxL3V for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:14:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C12680D9A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C12680D9A
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 21:14:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 11D947802D7;
 Mon, 26 Dec 2022 22:14:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:14:19 +0100
Date: Mon, 26 Dec 2022 22:14:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221226211419.GJ2893@scaer>
References: <20221226074851.143689-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226074851.143689-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672089262;
 bh=901telR3Rh5DyEEr9Wx3TzzpgNcEvnd1e0prDZCGATg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jpq1E8ErgSkulIUDNw1ZE38MRws3k8mHj+gCvGr4McAO8Btg6DcXCcU87QmciZFhR
 dxnxPVJ8sXXEuVg3myBQy7GCYfTZ8hgyJquLYSf9LEvVq01F2lTFkIum3EGn3Qw19g
 E25dUphEz+omvqbF1IEgwfqwXOW8tPQpYCkkIWCd1WMJdDII6dL6tQX5+iwUD29nSK
 iXgDTtIxRqOoJazqIIYoLsg7YH61E73tIKgLEnUajHQSpYPqkUKU5iEbJqghRjV/VN
 TMo0HC7UNFOwshiz90RGfBxulH32MgNQeNSRbQWPTH3GhstyqbMCtuS4jftrC4zXdc
 vpYDjEi/1ooxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jpq1E8Er
Subject: Re: [Buildroot] [PATCH] package/lua-utf8: bump to version 0.1.5
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
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YS11dGY4L0NvbmZpZy5pbiAgICAg
fCAyICstCj4gIHBhY2thZ2UvbHVhLXV0ZjgvbHVhLXV0ZjguaGFzaCB8IDQgKystLQo+ICBwYWNr
YWdlL2x1YS11dGY4L2x1YS11dGY4Lm1rICAgfCAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1
YS11dGY4L0NvbmZpZy5pbiBiL3BhY2thZ2UvbHVhLXV0ZjgvQ29uZmlnLmluCj4gaW5kZXggMzEz
ZmE0ZTQ1Li41ODE1OTM2ZGYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEtdXRmOC9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL2x1YS11dGY4L0NvbmZpZy5pbgo+IEBAIC00LDQgKzQsNCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfTFVBX1VURjgKPiAgCSAgVGhpcyBtb2R1bGUgYWRkcyBVVEYtOCBz
dXBwb3J0IHRvIEx1YS4KPiAgCSAgSXQncyBjb21wYXRpYmxlIHdpdGggTHVhICJzdHJpbmciIG1v
ZHVsZS4KPiAgCj4gLQkgIGh0dHA6Ly9naXRodWIuY29tL3N0YXJ3aW5nL2x1YXV0ZjgKPiArCSAg
aHR0cHM6Ly9naXRodWIuY29tL3N0YXJ3aW5nL2x1YXV0ZjgKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9sdWEtdXRmOC9sdWEtdXRmOC5oYXNoIGIvcGFja2FnZS9sdWEtdXRmOC9sdWEtdXRmOC5oYXNo
Cj4gaW5kZXggYjY3MjBiMzYwLi5iNGQ0NTVjZWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEt
dXRmOC9sdWEtdXRmOC5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWEtdXRmOC9sdWEtdXRmOC5oYXNo
Cj4gQEAgLTEsMyArMSwzIEBACj4gICMgY29tcHV0ZWQgYnkgbHVhcm9ja3MvYnVpbGRyb290Cj4g
LXNoYTI1NiAgODhjNDU2YmMwZjAwZDI4MjAxYjMzNTUxZDgzZmE2ZTVjM2FlNjAyNWFlYmVjNzkw
YzM3YWZiMzE3MjkwZTRmYSAgbHVhdXRmOC0wLjEuMy0xLnNyYy5yb2NrCj4gLXNoYTI1NiAgNzQ1
MDYyODU5MjNiY2MzZTU4YWFjYTFiNzc0ZGIyNjQ2MTAyMTc4M2QwMmIyZGMyNmJhZmNhYTAyZWY3
YTAwYiAgbHVhdXRmOC0wLjEuMy9MSUNFTlNFCj4gK3NoYTI1NiAgNjhiZDhlM2MzZTIwZjk4ZmNl
YjllMjBkNWE3YTUwMTY4MjAyYzIyZWI0NWI4N2VmZjMyNDdhMDYwOGY0NjVhZSAgbHVhdXRmOC0w
LjEuNS0yLnNyYy5yb2NrCj4gK3NoYTI1NiAgNzQ1MDYyODU5MjNiY2MzZTU4YWFjYTFiNzc0ZGIy
NjQ2MTAyMTc4M2QwMmIyZGMyNmJhZmNhYTAyZWY3YTAwYiAgbHVhdXRmOC0wLjEuNS9MSUNFTlNF
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLXV0ZjgvbHVhLXV0ZjgubWsgYi9wYWNrYWdlL2x1
YS11dGY4L2x1YS11dGY4Lm1rCj4gaW5kZXggNTJhYWY1YzcxLi4zM2MzNGE0ZWIgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9sdWEtdXRmOC9sdWEtdXRmOC5tawo+ICsrKyBiL3BhY2thZ2UvbHVhLXV0
ZjgvbHVhLXV0ZjgubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAKPiAtTFVBX1VURjhfVkVSU0lPTiA9IDAuMS4zLTEKPiArTFVBX1VURjhfVkVS
U0lPTiA9IDAuMS41LTIKPiAgTFVBX1VURjhfTkFNRV9VUFNUUkVBTSA9IGx1YXV0ZjgKPiAgTFVB
X1VURjhfTElDRU5TRSA9IE1JVAo+ICBMVUFfVVRGOF9MSUNFTlNFX0ZJTEVTID0gJChMVUFfVVRG
OF9TVUJESVIpL0xJQ0VOU0UKPiAtLSAKPiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

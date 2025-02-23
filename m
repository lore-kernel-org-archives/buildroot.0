Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D872C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 17:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC168087C;
	Sun, 23 Feb 2025 17:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_oLo4Cffwft; Sun, 23 Feb 2025 17:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C64C810B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C64C810B1;
	Sun, 23 Feb 2025 17:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D98CF943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD3AE6082E
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ1pN9cnIQTn for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 17:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7804A607C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7804A607C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7804A607C9
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:04:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D657513F88F;
 Sun, 23 Feb 2025 18:04:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 18:04:19 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 18:04:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <20250220160014.3376555-1-fiona.klute@gmx.de>
References: <20250220160014.3376555-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <8b684dff2bf5b4a90c16d4aaac9aa11e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740330263;
 bh=4l8Y/tf41NCU6L5LdKSpDx7MaMpAUMDFqBh0Mp6QeZw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GbXPVrGARQXr0L2QzZDriIdi8tMBKLjb69pURsozLlp5HM1tYeIV+NgvgNDCsdM5N
 JGI3j65aF6iyVNQE9meh5uQjzW5hjT4nrKy42bbrWQ27lloyG07QANYBIFY68HHo/q
 QN7KTQP7oMioDfNPZMbuu56KhquZ7vxJ42eG8QxQlLdgppzRlMax4NdnOTguje+Ldi
 KkYctLRT7sIPv8u2ua67IBRJfPOYsTUfok+GThSnfieK1rfUaW7zEohAvSU7YpBtpU
 heMZBKoyHufVdRp7X0cziQUcbUYd0Q8skxRMziX0z+V1Xv86qA5YpcUDB34veIDET5
 XoBXibTIhjZUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GbXPVrGA
Subject: Re: [Buildroot] [PATCH v3 1/1] package/wlr-randr: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsIGFsbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKT24gMjAvMDIvMjAyNSAxNzow
MCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBGcm9tOiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gCj4gVXRpbGl0eSB0
byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+Cj4gW0Zpb25hOiBkZWZpbmUgX0dOVV9TT1VSQ0Ugd2hlbiBidWlsZGluZyB3aXRoIHVDbGli
YyB0byBwcm92aWRlIAo+IHN0cmR1cCgpXQo+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChX
SVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
d2xyLXJhbmRyL3dsci1yYW5kci5tayAKPiBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5t
awo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMTc4Y2E2YjUwNwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIubWsKPiBA
QCAtMCwwICsxLDE5IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyB3bHIt
cmFuZHIKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArV0xSX1JBTkRSX1ZF
UlNJT04gPSAwLjQuMQo+ICtXTFJfUkFORFJfU0lURSA9IAo+IGh0dHBzOi8vZ2l0LnNyLmh0L35l
bWVyc2lvbi93bHItcmFuZHIvcmVmcy9kb3dubG9hZC92JChXTFJfUkFORFJfVkVSU0lPTikKCkl0
IHNlZW1zIHdsci1yYW5kciBtb3ZlZCB0byBmcmVlZGVza3RvcCBnaXRsYWIuIFNlZToKaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9uL3dsci1yYW5kci8tL2NvbW1pdC9iZGE0
ZjQwOWI0NDc1ZjlkZDUxYjFiZWRlZDVmYzYwNTJkODZkNDZlCgpUaGVyZSBpcyBhbHNvIGEgbmV3
IHZlcnNpb24gb2YgdGhlIHBhY2thZ2UuIFNlZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2VtZXJzaW9uL3dsci1yYW5kci8tL3RhZ3MvdjAuNS4wCgpJIHRoaW5rIGl0IHdvdWxkIGJl
IGdvb2QgdG8gc3dpdGNoIHRvIHRoaXMgbmV3IHNlcnZlci4gV2hlbiBJIHRlc3RlZAp0aGUgb3Jp
Z2luYWwgc3VibWlzc2lvbiBmcm9tIFNlYmFzdGllbiwgSSBzYXcgc291cmNlaHV0IHdhcyBibG9j
a2luZwpzb21lIG5ldHdvcmsgdHJhZmZpYy4gSW4gbXkgY2FzZSwgaXQgd2FzIGltcGFjdGluZyB0
aGUgZnJlZSBpbnN0YW5jZXMKaW4gZ2l0bGFiIENJLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9q
b2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMTY1MjEyOTE2NgphbmQKaHR0cHM6Ly9saXN0
cy5zci5odC9+c2lyY21wd24vc3IuaHQtZGlzY3Vzcy8lM0M3NjAyMzFDRi03RkI1LTQzNDEtQUNB
Ny03MURBRUU2MjkwNzRAam9ubXN0ZXJsaW5nLmNvbSUzRQoKVXNpbmcgZnJlZWRlc2t0b3Agd2ls
bCBzb2x2ZSB0aG9zZSBpc3N1ZXMuCgo+ICtXTFJfUkFORFJfTElDRU5TRSA9IE1JVAo+ICtXTFJf
UkFORFJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArIyBob3N0LXdheWxhbmQgaXMgZm9yIHdh
eWxhbmQtc2Nhbm5lcgo+ICtXTFJfUkFORFJfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGhv
c3Qtd2F5bGFuZCB3YXlsYW5kCj4gKwo+ICtpZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJ
QkMpLHkpCj4gKyMgdUNsaWJjIHByb3ZpZGVzIHN0cmR1cCgpIG9ubHkgaWYgX0dOVV9TT1VSQ0Ug
aXMgZGVmaW5lZAo+ICtXTFJfUkFORFJfQ09ORl9PUFRTICs9IC1EY19hcmdzPS1EX0dOVV9TT1VS
Q0UKPiArZW5kaWYKCkFjY29yZGluZyB0byB0aGUgc3RyZHVwIG1hbnVhbCBwYWdlOgpodHRwczov
L21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4zL3N0cmR1cC4zLmh0bWwKClRoZSBmZWF0dXJl
IHRlc3QgbWFjcm8gaXM6CgogICAgc3RyZHVwKCk6CiAgICAgICAgX1hPUEVOX1NPVVJDRSA+PSA1
MDAKICAgICAgICAgICAgfHwgLyogU2luY2UgZ2xpYmMgMi4xMjogKi8gX1BPU0lYX0NfU09VUkNF
ID49IDIwMDgwOUwKICAgICAgICAgICAgfHwgLyogZ2xpYmMgPD0gMi4xOTogKi8gX0JTRF9TT1VS
Q0UgfHwgX1NWSURfU09VUkNFCgp3bHItcmFuZHIgYWxyZWFkeSBkZWZpbmVzIF9QT1NJWF9DX1NP
VVJDRSB0byAyMDA4MDlMLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9lbWVy
c2lvbi93bHItcmFuZHIvLS9ibG9iL3YwLjUuMC9tYWluLmMjTDEKClRoZSB1Y2xpYmMgZmFpbHVy
ZXMgd2Ugc2VlIGFyZSBpbiBmYWN0IGhhcHBlbmluZyB3aXRoIG9sZCB2ZXJzaW9ucywKd2hpY2gg
YXJlIG5vdCBpbmNsdWRpbmcgdGhpcyBjb21taXQ6Cmh0dHBzOi8vY2dpdC51Y2xpYmMtbmcub3Jn
L2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD0wZGFhYjE1MDgzNzllMjNhMDlhYjdm
ZGI0NjkwMTgyMjhkOTUxODk0CndoaWNoIGlzIDwgdjEuMC4zOCAoMjAyMS0wMy0yNykuCgpEZWZp
bmluZyBfR05VX1NPVVJDRSB3b3JrcywgYnV0IGJyaW5ncyBtb3JlIHRoaW5ncyB0aGF0IGFjdHVh
bGx5IG5lZWRlZC4KaHR0cHM6Ly9jZ2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5n
LmdpdC90cmVlL2luY2x1ZGUvZmVhdHVyZXMuaD9oPXYxLjAuNTEjbjE3NAoKU28sIEkgd291bGQg
cmVjb21tZW5kIHRvIHJld29yayB0aGF0IHBhcnQgdG86CgppZmVxICgkKEJSMl9UT09MQ0hBSU5f
VVNFU19VQ0xJQkMpLHkpCiMgdUNsaWJjIDwgMS4wLjM4IGRvZXMgbm90IGV4cG9zZSBzdHJkdXAo
KSB3aGVuIF9QT1NJWF9DX1NPVVJDRSA+PSAKMjAwODA5TAojIFNlZTogCmh0dHBzOi8vY2dpdC51
Y2xpYmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD0wZGFhYjE1MDgz
NzllMjNhMDlhYjdmZGI0NjkwMTgyMjhkOTUxODk0CiMgV2UgZGVmaW5lIF9YT1BFTl9TT1VSQ0U9
NTAwIGFzIGEgd29ya2Fyb3VuZC4KV0xSX1JBTkRSX0NPTkZfT1BUUyArPSAtRGNfYXJncz0tRF9Y
T1BFTl9TT1VSQ0U9NTAwCmVuZGlmCgo+ICsKPiArJChldmFsICQobWVzb24tcGFja2FnZSkpCj4g
LS0KPiAyLjQ3LjIKCkNvdWxkIHlvdSBhbiB1cGRhdGVkIHBhdGNoIHBsZWFzZT8KCkJlc3QgcmVn
YXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B61C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 06:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F418060BDB;
	Thu, 20 Oct 2022 06:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F418060BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfCebyme3z7v; Thu, 20 Oct 2022 06:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 328F660AB9;
	Thu, 20 Oct 2022 06:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328F660AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C29DE1BF95C
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 06:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF1960AB9
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 06:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF1960AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kL4S1ZdLtPjL for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 06:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAE8460A8B
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAE8460A8B
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 06:53:44 +0000 (UTC)
Received: from smtpclient.apple ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPA
 id lPQyofVVsRaNUlPQyoEZId; Thu, 20 Oct 2022 08:53:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 20 Oct 2022 08:53:40 +0200
Message-Id: <A7C2FFDF-A321-49E6-A82C-3DA7C936C65E@benettiengineering.com>
References: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
In-Reply-To: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfKCktYrBQS7JdugRQIXpTE5RMxOyDFJBoK0edI9P6MEcU7017HCGHRqrgxrMgTkIvv0uMIiegqhE4voaG8rwP9oaNJ8X6JMtDbahqilch3+g+7znwwxb
 yVxZyfJBvtDiUupBo+lcJwMit6Ka7gD9wFKtkkqoBn/Qx7Ccr4azSWfVCZCUDB3yPeKFjxcO+ml3VlNyg8Jo1Lo982oJtPZTrU5UO2Q5rArJhlZ8A3vfWCMw
 Qik3uUPVFkEYxDIO/wKt7Q7rwa+mDWeu9TJL40vFpg9iwHsgXJ8f66x7xlO5y5Rv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666248821; bh=NsE3YTnzhwStXitnH3EvPPGI/UE8UWNSmjOp2sBoa0s=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=f7Nb2chxKTBTYowlfWx7iu5dOuLjGz0c8bXUKTL4wy5fyzvRF00HO+J+HTj/zPW61
 caeBFOMS8P3Iy741UEprZcCuh5UBOezPw5xfvKczshhH5ne+/Q0uLZUgdrgtP6wKgy
 K/YUlxwkoYBJzDSnMKZsoSGoeuv+GohN+KvvKTzepKqrlizv0lE2j8YrWNLTURnxjn
 l09e8i97JwmlLQBu+oQTGo73neHK+YjotxC3xrzSl3gEPO69hpYTj311hWtcvDzprT
 ZtXv4WKTXgdTS+V8fkmkGRKZzcGp/tGlz3Gua7foxZdQv5taQacf105CvgN1SUgNpK
 TLR2gkrEOVxQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=f7Nb2chx
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgo+IElsIGdpb3JubyAyMCBvdHQgMjAyMiwgYWxsZSBvcmUgMDI6MjMsIEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7
v09uIFdlZCwgT2N0IDE5LCAyMDIyIGF0IDc6MzYgUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gT24gV2VkLCBPY3QgMTksIDIwMjIg
YXQgMzo1NSBQTSBHaXVsaW8gQmVuZXR0aQo+Pj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+IHdyb3RlOgo+Pj4gCj4+PiBGaXhlczoKPj4+IGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzLzQzMy80MzM1ZDBkODQ1NDAzNWE4Zjc0NjQ1YmE4ZDZjMjMy
OWFiMmU1NDgwLwo+PiAKPj4gSG1tLCB0aGlzIGxvb2tzIGxpa2UgYSBidWcgaW4gdGhlIGxpYm5z
cyBtYWtlZmlsZSwgd2hhdCB3YXMgdGhlIGZhaWx1cmUKPj4gc2VlbiB3aXRoIG1ha2UgNC4zIGhl
cmU6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIyMDEwMTIxMDk1Mi4y
MTQ4MjU2LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KPiAKPiBUaGlz
IHBhdGNoIGFsc28gZG9lcyBub3QgZml4IHRoZSBidWlsZCB3aXRoIG1ha2UgNC40KG1ha2UgZnJv
bSBtYXN0ZXIgYnJhbmNoKQo+IGZyb20gbXkgdGVzdGluZy4KPiAKPiBFdmVuIHdpdGhvdXQgc2h1
ZmZsZSBtb2RlIGVuYWJsZWQgdGhlIGJ1aWxkIGFwcGVhcnMgdG8gYWx3YXlzIGZhaWwuCgpUaGFu
ayB5b3UgZm9yIHRlc3RpbmcsIEkgaGF2ZSBmb3Jnb3R0ZW4gZXhhY3RseSB0byBhc2sgeW91IHRv
IGRvIGl0IDotKSBzaW5jZSBhbG1vc3QgYWxsIHRoZSBmYWlsdXJlcyBjb21lcyBmcm9tIHlvdXIg
YXNhaGktbWluaSB0aGF0IEkgcmVtZW1iZXIgdG8gaGF2ZSBNYWtlIDQuNC4KClNvIEkgdHJ5IHRv
IHJlcHJvZHVjZSB0aGUgYnVnIGhlcmUgYXQgbWUgYW5kIGZpbmQgb3V0IGEgZml4LgoKVGhhbmtz
IGFnYWluCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+PiAKPj4+IAo+Pj4gU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Cj4+PiAtLS0KPj4+IHBhY2thZ2UvbGlibnNzL2xpYm5zcy5tayB8IDQgKystLQo+Pj4gMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+IAo+Pj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tayBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5t
awo+Pj4gaW5kZXggMDQxYjJjZmM1Ni4uYTYxMzAwNmY3MCAxMDA2NDQKPj4+IC0tLSBhL3BhY2th
Z2UvbGlibnNzL2xpYm5zcy5tawo+Pj4gKysrIGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4+
PiBAQCAtMTUsOCArMTUsOCBAQCBMSUJOU1NfTElDRU5TRV9GSUxFUyA9IG5zcy9DT1BZSU5HCj4+
PiBMSUJOU1NfQ1BFX0lEX1ZFTkRPUiA9IG1vemlsbGEKPj4+IExJQk5TU19DUEVfSURfUFJPRFVD
VCA9IG5zcwo+Pj4gCj4+PiAtIyBEb24ndCBwYXJhbGxlbCBidWlsZCBpZiBtYWtlIHZlcnNpb24g
PSA0LjMKPj4+IC1pZm5lcSAoJChmaWx0ZXIgJChSVU5OSU5HX01BS0VfVkVSU0lPTiksNC4zKSwp
Cj4+PiArIyBEb24ndCBwYXJhbGxlbCBidWlsZCBpZiBtYWtlIHZlcnNpb24gPSA0LjMgb3IgNC40
Cj4+PiAraWZuZXEgKCQoZmlsdGVyICQoUlVOTklOR19NQUtFX1ZFUlNJT04pLDQuMyA0LjQpLCkK
Pj4+IExJQk5TU19NQUtFID0gJChNQUtFMSkKPj4+IGVsc2UKPj4+IExJQk5TU19NQUtFID0gJChN
QUtFKQo+Pj4gLS0KPj4+IDIuMzQuMQo+Pj4gCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK

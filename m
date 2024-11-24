Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769F5E6688D
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 11:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 185B9812E5;
	Sun, 24 Nov 2024 11:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meG9gPx0TOUh; Sun, 24 Nov 2024 11:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00748812F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00748812F4;
	Sun, 24 Nov 2024 11:12:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74DFE31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 11:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55E8A40132
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 11:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh5CASvdEUjd for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 11:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0DE1400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0DE1400F6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0DE1400F6
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 11:12:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 405902003D6;
 Sun, 24 Nov 2024 12:12:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52734])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Nov 2024 12:12:07 +0100
MIME-Version: 1.0
Date: Sun, 24 Nov 2024 12:12:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
In-Reply-To: <1935d676f00.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
 <1935d676f00.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <9e64040f339d39ef57ff35a27cde691c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732446729;
 bh=5akIYvdF112fXc224OPmOyO668uZ5Dz9/CyATZLgdJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tat4B9r3LltXFtVmd9pTdIB4flY2mP3+Qr6cB39/T5dlupOwUeW3a/GaPXna0yOCL
 vn5/cxloYY65Z463pR0+0DDU1uKzTysk6bGPUjuHmg2/gC91po4leAnfbVxVRNKRbD
 f8jw1VK6aLoW6CVFeDIZaud0UDUdp+Vyp02vMXUq3vl3G5vzbX5RqVrBP5lTE++ryy
 QwCAsfMxB4Y4fewzPlH/P3PQJYyzBh/1Lpeo0zHbzgHM6WbyYkOqSXliiLgyh7biA0
 YXnE4YiuzNH9UHJvpRu6zxIaJzKl2P5gJmXP2O73W/67BPdWLTpKko6IHKaTISnQ7b
 MSSHIZfAhhbWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tat4B9r3
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDI0LzExLzIwMjQgMTA6MDEsIFZpbmNlbnQgSmFyZGluIHdyb3RlOgo+
IEhpIFBldGVyIGFuZCBKdWxpZW4sCj4gCj4gTGUgMjQgbm92ZW1icmUgMjAyNCAwMTo0MToxNyBK
dWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gCj4+IEhpIFBldGVyLAo+
PiAKPj4gT24gMjMvMTEvMjAyNCAyMzo1MSwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+PiAKPj4+
IEZpeGVzCj4+PiAKPj4gCj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzU0YS81NGExNjU4MjdmNTM2YmU0N2NkNDVjOThkYTM5MzdhMWU5NGE3YzY1Lwo+Pj4gCj4+PiAK
Pj4+IFVwc3RyZWFtIGlzIG5vIGxvbmdlciBhY2Nlc3NpYmxlLCBzbyB1c2Ugcy5iLm4gaW5zdGVh
ZC4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2Fh
cmQuY29tPgo+Pj4gLS0tCj4+PiBwYWNrYWdlL3F1YWdnYS9xdWFnZ2EubWsgfCAzICsrLQo+Pj4g
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4gCj4+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xdWFnZ2EvcXVhZ2dhLm1rIGIvcGFja2FnZS9xdWFnZ2EvcXVh
Z2dhLm1rCj4+PiBpbmRleCA1ZDhkNTIyNjNhLi5kZDkyMTU1MmYxIDEwMDY0NAo+Pj4gLS0tIGEv
cGFja2FnZS9xdWFnZ2EvcXVhZ2dhLm1rCj4+PiArKysgYi9wYWNrYWdlL3F1YWdnYS9xdWFnZ2Eu
bWsKPj4+IEBAIC01LDcgKzUsOCBAQAo+Pj4gCj4+PiAKPj4gCj4gIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPj4+IAo+Pj4gCj4+PiBRVUFHR0FfVkVSU0lPTiA9IDEuMi40Cj4+PiAtUVVBR0dBX1NJ
VEUgPSBodHRwOi8vZG93bmxvYWQuc2F2YW5uYWguZ251Lm9yZy9yZWxlYXNlcy9xdWFnZ2EKPj4+
ICsjIHVwc3RyZWFtIChodHRwOi8vZG93bmxvYWQuc2F2YW5uYWguZ251Lm9yZy9yZWxlYXNlcy9x
dWFnZ2EpCj4+PiBkZWFkCj4+PiArUVVBR0dBX1NJVEUgPSBodHRwOi8vc291cmNlcy5idWlsZHJv
b3QubmV0L3F1YWdnYQo+PiAKPj4gU2hvdWxkIHdlIHVzZSBodHRwcyBpbnN0ZWFkPyBUaGUgZGVm
YXVsdCBCUjJfQkFDS1VQX1NJVEUgdmFsdWUKPj4gaXMgdXNpbmcgaXQ6Cj4+IAo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4xMS1yYzIvQ29u
ZmlnLmluI0wyNjUKPiAKPiBTaG91bGRuJ3Qgd2UgZ2l2ZSB1cCB0aGlzIHBhY2thZ2Ugc2luY2Ug
RlJSIGlzIGEgbWF0dXJlIGFsdGVybmF0aXZlID8KClRoZSBwYWNrYWdlIGhhcyBiZWVuIGRyb3Bw
ZWQgaW4gdGhlIGJyYW5jaCAibmV4dCIuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2MwYTVmY2Y3ODFmNGRjZWI4NWU2YTVjNWE5OGIyZmYz
NzNmZjI0NWYKClRoaXMgcGF0Y2ggaXMgbWVhbnQgdG8gZ28gaW4gdGhlICJtYXN0ZXIiIGJyYW5j
aCwgd2hpY2ggaXMgaW4gInJjIiAKc3RhYmlsaXphdGlvbi4gU2VlOgpodHRwczovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNSRUxFTkcKClNvIEkgdW5kZXJzdGFu
ZCB0aGUgaW50ZW50IGlzIHRvIGtlZXAgdGhpcyBxdWFnZ2EgcGFja2FnZSBmb3Igb25lIGxhc3Qg
CkJ1aWxkcm9vdApyZWxlYXNlLCBhbmQgdGhlIHF1YWdnYSBwYWNrYWdlIHdpbGwgZ28gYXdheSBq
dXN0IGFmdGVyLCB3aGVuIHRoZSAibmV4dCIgCmJyYW5jaAp3aWxsIGJlIG1lcmdlZCBpbiAibWFz
dGVyIi4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK

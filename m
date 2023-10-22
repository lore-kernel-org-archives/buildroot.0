Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCBBC0032E
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 12:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631DB4EC10;
	Sun, 22 Oct 2023 12:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631DB4EC10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id forsMGbUaTwv; Sun, 22 Oct 2023 12:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A400B4EBA4;
	Sun, 22 Oct 2023 12:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A400B4EBA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 537C91BF29D
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 12:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB2B437A5
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 12:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB2B437A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFHcP_Yfl9aW for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 12:06:37 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D17437A4
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 12:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D17437A4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5889E5FFAA;
 Sun, 22 Oct 2023 14:06:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 14:06:31 +0200
Date: Sun, 22 Oct 2023 14:06:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231022120631.GI2607@scaer>
References: <20231020090949.2839604-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020090949.2839604-1-gael.portay@rtone.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697976394;
 bh=wbkhrwP4VRZPvUnnJVBQ5c6Za4dgxBnD+iojl49e3P8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4daVsC1CWxlLfw4N2k9Q9+rPgJpoNchSUQXoQz00sEqBQTaRoUhOtBCASv68JWAg
 GDTwVq+FBa32I8zHCfUL+hk5fR/q15tuVDcC2lutRp6cy8DK9gYQSaDcGEuW4V+OM0
 dqzoG3LXM/sL0lewcGB0gfVCJWABhWAfCx1N0ESjhkBYNaD1RPdD2lclH6d1dZyJDD
 ev0hFlT7AaUZt7JeTl7pLaaBPHX7DVm2rKaG7SFpRDqgYQjUdLFbQY6uZrUlD5GMof
 IE9Yj4uB8KeURTLUcEMODIKpbmHS9VQgMvBb9rvo9Prfhj/GlhAqqX9XFZnLx/E813
 Dxf8QenIMVvhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R4daVsC1
Subject: Re: [Buildroot] [PATCH 1/1] package/libxmlrpc: bump version to
 1.60.00 (code/advanced@r3162)
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTAtMjAgMTE6MDkgKzAyMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9u
ZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9saWJ4bWxycGMvbGlieG1scnBjLmhhc2ggfCAyICstCj4g
IHBhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMuaGFzaCBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnht
bHJwYy5oYXNoCj4gaW5kZXggNjY1ZWUzMTgzNi4uY2FkNGQwZTM3OSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlieG1scnBj
L2xpYnhtbHJwYy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+
IC1zaGEyNTYgIDYyNmUzNjI5NWY0M2IzMjAwODJiYzdiZGQ5NjFiNDZmMzlmYmUyNzE5NTM1YjVh
NDE3OTc1YThlNTBjOGY3ZjMgIGxpYnhtbHJwYy1yMzExOS1icjMudGFyLmd6Cj4gK3NoYTI1NiAg
YWM1ZjVlODNjNmZlYWE1Mjc2ZmQwNjEwYjA1NWM2ZTVkMzUwMDg5NzA0YjYwYzE3ZDVhZjMwYWZi
MDg1MDZjNSAgbGlieG1scnBjLXIzMTYyLWJyMy50YXIuZ3oKPiAgc2hhMjU2ICBkYjdhNmQzZjE4
N2IyMThjMzUzNDAxMGE4MzQyNGM2YmNkZWY4OGU2YTBiNmIxYWEzYTg3NjIyMzhiZDY0MmU2ICBk
b2MvQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsg
Yi9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsKPiBpbmRleCBjMWIwZWFlOGVlLi4yZDNl
ZTY2MDUwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tawo+ICsr
KyBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAj
Cj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC0jIDEuNTguMDIgKGNvZGUvYWR2YW5j
ZWRAcjMxMTkpCj4gLUxJQlhNTFJQQ19WRVJTSU9OID0gcjMxMTkKPiArIyAxLjYwLjAwIChjb2Rl
L2FkdmFuY2VkQHIzMTYyKQo+ICtMSUJYTUxSUENfVkVSU0lPTiA9IHIzMTYyCgpJIGJ1bXBlZCB0
byByMzE3NiB0byBnZXQgMDEuNjAuMDEgdGhhdCBjb250YWlucyBhIGJ1ZyBmaXggd2hlbiBidWls
ZGluZwphZ2FpbnN0IG9wZW5zc2wuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCj4gIExJQlhNTFJQQ19TSVRFID0gaHR0cHM6Ly9zdm4uY29kZS5z
Zi5uZXQvcC94bWxycGMtYy9jb2RlL2FkdmFuY2VkCj4gIExJQlhNTFJQQ19TSVRFX01FVEhPRCA9
IHN2bgo+ICBMSUJYTUxSUENfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSAoeG1sLXJwYyBtYWluIGNv
ZGUgYW5kIGFieXNzIHdlYiBzZXJ2ZXIpLCBCU0QgbGlrZSAobGliL2V4cGF0KSwgUHl0aG9uIDEu
NS4yIGxpY2Vuc2UgKHBhcnRzIG9mIHhtbHJwY19iYXNlNjQuYykKPiAtLSAKPiAyLjQyLjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==

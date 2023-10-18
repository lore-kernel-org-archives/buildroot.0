Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C03FCDB485
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 16:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87EA3418FE;
	Wed, 18 Oct 2023 16:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87EA3418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7Yo816cH_hc; Wed, 18 Oct 2023 16:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C6CC41906;
	Wed, 18 Oct 2023 16:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6CC41906
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA2F71BF5A3
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C372C42144
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C372C42144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXVspmq75_5S for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 16:19:06 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9345340052
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 16:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9345340052
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf0b:51f6:be62:d326])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 965A613F8AD;
 Wed, 18 Oct 2023 18:18:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Oct 2023 18:18:59 +0200
Date: Wed, 18 Oct 2023 18:18:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20231018161859.GB2607@scaer>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
 <20231018105301.495c5899@bootlin.com> <20231018152047.GA2607@scaer>
 <20231018173807.1586a883@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018173807.1586a883@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697645942;
 bh=HdrnAZ496VuV8XJLY5tee40qjL0IXM2F+lzF7pTog10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBYP+G2c6oOZlN5YPBwtKbM2RGV88DdwDuCjdzdYCU+fVMMSvasMwfj97Yj/Cp2mZ
 hy7jAfUSE6CIPfYZJl2PdQr9ySn0e7ayDhH3Je41IQt90ykyPvS7thhyIVhyJPIGm6
 J1859JgXJVrXq0y2LweR3CDVuCKLkM45idZBvZVTsGYFEVaKNhzPhGgjSp8M9DY2yR
 tABDlS8RZUJProijp7zbXEBsW2+PP8hIcoU71rsDISwfgM4yKESTmfvll0D/c+DsxX
 5w7supHRhD5ZH3oRkw5d+JQPrUzKBrBO3CxpQhIEcQTiNrBK3AtIkEu2I4JHvy+5/W
 InFa10Mp3QsMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SBYP+G2c
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVydsOpLCBBbGwsCgpPbiAyMDIzLTEwLTE4IDE3OjM4ICswMjAwLCBIZXJ2ZSBDb2RpbmEgdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gV2VkLCAxOCBPY3QgMjAyMyAxNzoyMDo0NyAr
MDIwMAo+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+
ID4gSGVydsOpLCBBbGwKPiA+ID4gPiAtLS0gYS9wYWNrYWdlL3BrZy11dGlscy5tawo+ID4gPiA+
ICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gPiA+ID4gQEAgLTIxNCwxMCArMjE0LDE5IEBA
IGlmZXEgKCQoQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTKSx5KQo+ID4gPiA+ICAjICQxOiBz
cGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBwYWNrYWdlcyB0byByc3luYyBmcm9tCj4gPiA+ID4gICMg
JDI6ICdob3N0JyBvciAndGFyZ2V0Jwo+ID4gPiA+ICAjICQzOiBkZXN0aW5hdGlvbiBkaXJlY3Rv
cnkKPiA+ID4gPiArIyAkNDogbGl0ZXJhbCAiY29weSIgb3IgImhhcmRsaW5rIiB0byBjb3B5IG9y
IGhhcmRsaW5rIGZpbGVzIGZyb20gc3JjIHRvIGRlc3QKPiA+ID4gPiAgZGVmaW5lIHBlci1wYWNr
YWdlLXJzeW5jCj4gPiA+ID4gIAlta2RpciAtcCAkKDMpCj4gPiA+ID4gIAkkKGZvcmVhY2ggcGtn
LCQoMSksXAo+ID4gPiA+IC0JCXJzeW5jIC1hIC0tbGluay1kZXN0PSQoUEVSX1BBQ0tBR0VfRElS
KS8kKHBrZykvJCgyKS8gXAo+ID4gPiA+ICsJCXJzeW5jIC1hIFwKPiA+ID4gPiArCQkJLS1oYXJk
LWxpbmtzIFwgIAo+ID4gPiBZb3UgcHJlc2VydmUgaGFyZCBsaW5rcyAoLS1oYXJkLWxpbmtzKSBp
biBhbGwgY2FzZXMgKGNvcHkgYW5kIGhhcmRsaW5rKS4KPiA+ID4gSW4gY2FzZSBvZiBjb3B5LCBp
cyBpdCBjb3JyZWN0IHRvIHByZXNlcnZlIGhhcmQgbGlua3MgPyAgCj4gPiBZZXMsIC0taGFyZC1s
aW5rcyBpczoKPiA+IAo+ID4gICAgIFRoaXMgdGVsbHMgcnN5bmMgdG8gbG9vayBmb3IgaGFyZC1s
aW5rZWQgZmlsZXMgaW4gdGhlIHNvdXJjZSBhbmQKPiA+ICAgICBsaW5rIHRvZ2V0aGVyIHRoZSBj
b3JyZXNwb25kaW5nIGZpbGVzIG9uIHRoZSBkZXN0aW5hdGlvbi4KPiBJbiBjYXNlIG9mICdjb3B5
JywgeW91IGtlZXAgaGFyZC1saW5rcyBhbHJlYWR5IHByZXNlbnQgaW4gc291cmNlIGFuZCBzbyB0
aGUKPiBkZXN0aW5hdGlvbiAoZmluYWwgaG9zdC90YXJnZXQgZGlycykgaXMgbm90IGEgZnVsbCBj
b3B5LgoKQWgsIGl0IGRvZXMgbm90IGhhcmQtbGluayBzb21ldGhpbmcgaW4gZGVzdCBpbnRvIHNy
Yy4gVGhlIGhhcmRsaW5rcyBhcmUKb25seSBpbiB0aGUgZGVzdGluYXRpb24uIFNlZSBiZWxvdy4u
LgoKPiBTb21lIGhhcmQtbGlua3MgY2FuIGJlIHByZXNlbnQgYW5kIHBvc3QtYnVpbGQgc2NyaXB0
cyBjYW4gc3RpbGwgY29ycnVwdCBzb21lCj4gcGVyLXBhY2thZ2Ugc291cmNlcy4KPiAKPiBJIGRv
bid0IHVuZGVyc3RhbmQgd2h5IGtlZXBpbmcgaGFyZC1saW5rcyBvbiB0aGlzIGxhc3QgY29weSBp
cyBuZWVkZWQgYW5kIEkKPiBwcm9iYWJseSBtaXNzIHNvbWV0aGluZy4uLgoKVGhhdCBpcyBiZWNh
dXNlIHdlIGNhbiBoYXZlIGhhcmQtbGlua3MgaW4gaG9zdCBvciB0YXJnZXQuIEZvciBleGFtcGxl
LApnaXQgd2lsbCBpbnN0YWxsIGEgbG90IG9mIGhhcmQtbGlua3MgaW4gL3Vzci9saWJleGVjL2dp
dC1jb3JlLwooZXhjZXJwdCk6CgogICAgJCBscyAtbGkgcGVyLXBhY2thZ2UvZ2l0L3RhcmdldC91
c3IvbGliZXhlYy9naXQtY29yZS8KICAgIDk1ODg3NzAgLXJ3eHIteHIteCAxNDEgeW1vcmluIHlt
b3JpbiAzMzE4ODI4IE9jdCAxNiAxNzo0NSBnaXQtdmFyCiAgICA5NTg4NzcwIC1yd3hyLXhyLXgg
MTQxIHltb3JpbiB5bW9yaW4gMzMxODgyOCBPY3QgMTYgMTc6NDUgZ2l0LXZlcmlmeS1jb21taXQK
ICAgIDk1ODg3NzAgLXJ3eHIteHIteCAxNDEgeW1vcmluIHltb3JpbiAzMzE4ODI4IE9jdCAxNiAx
Nzo0NSBnaXQtdmVyaWZ5LXBhY2sKICAgIDk1ODg3NzAgLXJ3eHIteHIteCAxNDEgeW1vcmluIHlt
b3JpbiAzMzE4ODI4IE9jdCAxNiAxNzo0NSBnaXQtdmVyaWZ5LXRhZwogICAgOTU4ODc3MCAtcnd4
ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDMzMTg4MjggT2N0IDE2IDE3OjQ1IGdpdC12ZXJzaW9u
CgogICAgJCBscyAtbGkgdGFyZ2V0L3Vzci9saWJleGVjL2dpdC1jb3JlLwogICAgOTYwMDE5MCAt
cnd4ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDI4MzI4NjAgT2N0IDE2IDE3OjQ1IGdpdC12YXIK
ICAgIDk2MDAxOTAgLXJ3eHIteHIteCAxNDEgeW1vcmluIHltb3JpbiAyODMyODYwIE9jdCAxNiAx
Nzo0NSBnaXQtdmVyaWZ5LWNvbW1pdAogICAgOTYwMDE5MCAtcnd4ci14ci14IDE0MSB5bW9yaW4g
eW1vcmluIDI4MzI4NjAgT2N0IDE2IDE3OjQ1IGdpdC12ZXJpZnktcGFjawogICAgOTYwMDE5MCAt
cnd4ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDI4MzI4NjAgT2N0IDE2IDE3OjQ1IGdpdC12ZXJp
ZnktdGFnCiAgICA5NjAwMTkwIC1yd3hyLXhyLXggMTQxIHltb3JpbiB5bW9yaW4gMjgzMjg2MCBP
Y3QgMTYgMTc6NDUgZ2l0LXZlcnNpb24KCkFzIHlvdSBjYW4gc2VlLCBpbiBnaXQncyBQUEQsIGdp
dCB0b29scyBhcmUgaGFyZC1saW5rcywgYW5kIGluIHRhcmdldC8KdGhleSBhbHNvIGFyZSBoYXJk
LWxpbmtzLiBCdXQgdGhlIGlub2RlIGlzIGRpZmZlcmVudCwgc28gdGhlIGhhcmQtbGlua3MKaW4g
dGFyZ2V0LyBhcmUgZGlmZmVyZW50IGZyb20gdGhlIGhhcmQtbGlua3MgaW4gdGhlIFBQRC4KCkhv
d2V2ZXIsIGluIGFsbCB0aGUgUFBEcyBvZiBwYWNrYWdlcyB0aGF0IGhhdmUgZ2l0IGFzIGEgZGVw
ZW5kZW5jeSwgdGhlCmhhcmQtbGlua3Mgd291bGQgYWxsIGJlIHRvIHRoZSBzYW1lIGlub2RlLCA5
NTg4NzcwLgoKKFRoZSBzaXplIGRlbHRhIGlzIGJlY2F1c2UgdGhlIGZpbGVzIGluIHRhcmdldC8g
YXJlIHN0cmlwcGVkLikKClNvLCBpbiBjYXNlIG9mICJjb3B5IiwgdGhpcyBpcyBhY3R1YWxseSBh
IGNvcHksIHRoYXQga2VlcHMgZXhpc3RpbmcKaGFyZC1saW5rcyBpbiB0aGUgc291cmNlLCBhcyBu
ZXcgaGFyZC1saW5rcyBpbiB0aGUgZGVzdGluYXRpb24uIFdpdGhvdXQKLS1oYXJkLWxpbmtzLCB0
aGUgZmlsZXMgaW4gdGFyZ2V0L3Vzci9saWJleGVjL2dpdC1jb3JlLyB3b3VsZCBhbGwgaGF2ZSBh
CmRpZmZlcmVudCBpbm9kZSwgYXMgdGhleSB3b3VsZCBiZSBkaWZmZXJlbnQgZmlsZXMsIGFuZCB0
aGF0IHdvdWxkCnRyZW1lbmRvdXNseSBpbmNyZWFzZSB0aGUgZmlsZXN5c3RlbSBzaXplIChzcXVh
c2hmcyB3b3VsZCBub3RpY2UsIGFuZAp3b3VsZCBzdG9yZSB0aGUgY29udGVudCBvbmx5IG9uY2Us
IGJ1dCB3b3VsZCBzdGlsbCBjcmVhdGUgYXMgbWFueSBpbm9kZXMKYXMgbmVlZGVkLCB0aG91Z2gp
LgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gUmVnYXJkcywKPiBIZXJ2w6kKPiAKPiA+IAo+
ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPiAKPiA+ID4gPiArCQkJJChpZiAkKGZp
bHRlciBoYXJkbGluaywkKDQpKSwgXAo+ID4gPiA+ICsJCQkJLS1saW5rLWRlc3Q9JChQRVJfUEFD
S0FHRV9ESVIpLyQocGtnKS8kKDIpLywgXAo+ID4gPiA+ICsJCQkJJChpZiAkKGZpbHRlciBjb3B5
LCQoNCkpLCBcCj4gPiA+ID4gKwkJCQkJJChlbXB0eSksIFwKPiA+ID4gPiArCQkJCQkkKGVycm9y
IHBlci1wYWNrYWdlLXJzeW5jIGNhbiBvbmx5ICJjb3B5IiBvciAiaGFyZGxpbmsiLCBub3QgIiQo
NCkiKSBcCj4gPiA+ID4gKwkJCQkpIFwKPiA+ID4gPiArCQkJKSBcCj4gPiA+ID4gIAkJCSQoUEVS
X1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAo+ID4gPiA+ICAJCQkkKDMpJChzZXApKQo+ID4g
PiA+ICBlbmRlZiAgCj4gPiA+IAo+ID4gPiBbLi4uXQo+ID4gPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

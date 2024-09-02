Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBCECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B1ED80EC4;
	Mon,  2 Sep 2024 15:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DF1Vrj-HU_H; Mon,  2 Sep 2024 15:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F52080F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F52080F53;
	Mon,  2 Sep 2024 15:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6E661BF8B4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F38404C3
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhSO9rXq2cIU for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6DE040177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6DE040177
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6DE040177
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:24:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 133C113F8CF;
 Mon,  2 Sep 2024 17:24:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:24:13 +0200
Date: Mon, 2 Sep 2024 17:24:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <ZtXYnRjjvtodARmI@landeda>
References: <20240902132403.177333-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902132403.177333-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725290658;
 bh=hfhr3S0y7pSYw1lla8pi5m6oTyXeBSJfE9FrKD2txm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0y0idmTSCsanP6c0iJskdB4wNEpI2WvIve154aiNqVYi/D56/oIMM3akzUtuyD+N
 hZLMt8kjrp1tPU/3ef1gMN5Ql0nWLLHDEMSBI/jXvn2LQWYwA6T2N/L0IkhQv/spcP
 qIBXCMeSGzCRkQ1etk4e6cfv0TR1TiGhzSv7guwIMUIl5ECPxHtcYQDtmMl0m5tzkS
 XJhHXgtLKeAVlOL2Y7QF+zEgEFVz7byOo3CUU/Er5PX9biPR8OQpdSUtE05z1MvPDG
 l/jbNOKquNA0OkH36YzYdX9u+0e2GB6+3NZAhNGyJmwS251S5k+sVY3a6SMoJE8xM1
 q3G58P/mZiawQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D0y0idmT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build
 issue with setuptools > 69.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wOS0wMiAxMDoyNCAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gUGF0Y2hpbmcgdGhlIHZlcnNpb24gY29uc3RyYWludCBpcyBjb25z
aWRlcmVkIHNhZmUgYnkgaHR0cHM6Ly9naXRodWIuY29tL3NxbGFsY2hlbXkvc3FsYWxjaGVteS9k
aXNjdXNzaW9ucy8xMTgxOAo+IAo+IEZpeGVzOgo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvYzUzMWI2ZTYzYzUxMjExMzhlOGU4YTFjNWQxNTAxZDlkN2UxMzkxZS8K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0
ZXNjLmNvbS5icj4KPiAtLS0KPiAgLi4udG9vbHMtYmVsb3ctNjkuMy1hbmQtcHJlcGFyZS1mb3It
YnVpLnBhdGNoIHwgMzUgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzUg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc3FsYWxj
aGVteS8yLjAuMzIvMDAwMS1SZXZlcnQtcGluLXNldHVwdG9vbHMtYmVsb3ctNjkuMy1hbmQtcHJl
cGFyZS1mb3ItYnVpLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFs
Y2hlbXkvMi4wLjMyLzAwMDEtUmV2ZXJ0LXBpbi1zZXR1cHRvb2xzLWJlbG93LTY5LjMtYW5kLXBy
ZXBhcmUtZm9yLWJ1aS5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4wLjMyLzAw
MDEtUmV2ZXJ0LXBpbi1zZXR1cHRvb2xzLWJlbG93LTY5LjMtYW5kLXByZXBhcmUtZm9yLWJ1aS5w
YXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNzA1MzM0MjFj
Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15LzIuMC4z
Mi8wMDAxLVJldmVydC1waW4tc2V0dXB0b29scy1iZWxvdy02OS4zLWFuZC1wcmVwYXJlLWZvci1i
dWkucGF0Y2gKPiBAQCAtMCwwICsxLDM1IEBACj4gK0Zyb20gOWYzMjFjOWU3M2Y0YzEwOGJhYTFl
ZjYzNTI4OTY1MDc5Y2FiMmY2ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9V
VEYtOD9xP0ZsPUMzPUExdmlvPTIwVGFwYWo9QzM9QjNzPz0gPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPgo+ICtEYXRlOiBNb24sIDIgU2VwIDIwMjQgMTA6MTI6NTYgLTAzMDAKPiArU3Vi
amVjdDogW1BBVENIIDEvMV0gUmV2ZXJ0ICJwaW4gc2V0dXB0b29scyBiZWxvdyA2OS4zIGFuZCBw
cmVwYXJlIGZvciAiYnVpbGQiCj4gKyBmb3IgcmVsZWFzZXMiCj4gKwo+ICtUaGlzIHJldmVydHMg
Y29tbWl0IDk1NTM2MDRmY2M4MGZhMTc1ODMyNDMzZjRlZmY2NTdhYzk1YWUwNTguCgogICAgJCBt
YWtlIGNoZWNrLXBhY2thZ2UKICAgIHBhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4wLjMyLzAw
MDEtUmV2ZXJ0LXBpbi1zZXR1cHRvb2xzLWJlbG93LTY5LjMtYW5kLXByZXBhcmUtZm9yLWJ1aS5w
YXRjaDo0OiBnZW5lcmF0ZSB5b3VyIHBhdGNoZXMgd2l0aCAnZ2l0IGZvcm1hdC1wYXRjaCAtTicK
ICAgIHBhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4wLjMyLzAwMDEtUmV2ZXJ0LXBpbi1zZXR1
cHRvb2xzLWJlbG93LTY5LjMtYW5kLXByZXBhcmUtZm9yLWJ1aS5wYXRjaDowOiBtaXNzaW5nIFNp
Z25lZC1vZmYtYnkgaW4gdGhlIGhlYWRlciAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcv
I19mb3JtYXRfYW5kX2xpY2Vuc2luZ19vZl90aGVfcGFja2FnZV9wYXRjaGVzKQogICAgcGFja2Fn
ZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS1SZXZlcnQtcGluLXNldHVwdG9vbHMtYmVs
b3ctNjkuMy1hbmQtcHJlcGFyZS1mb3ItYnVpLnBhdGNoOjA6IG1pc3NpbmcgVXBzdHJlYW0gaW4g
dGhlIGhlYWRlciAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19hZGRpdGlvbmFsX3Bh
dGNoX2RvY3VtZW50YXRpb24pCgpIb3dldmVyLCB0aHMgcGF0Y2ggaGFzIHplcm8gY2hhbmNlIG9m
IGdldHRpbmcgdXBzdHJlYW0sIHNvIGl0IG1lYW5zIHdlJ2QKaGF2ZSB0byBjYXJyeSBpdCBmb2V2
ZXIgYW5kIGV2ZXIuCgpXZSd2ZSBoYWQgYSBmZXcgcGFja2FnZXMgYWxyZWFkeSB3aXRoIHRoZSBz
YW1lIGlzc3VlLCBhbmQgd2UgY291bGQganVzdApjb3Agb3V0IGJ5IGFkZGluZyAtLXNraXAtZGVw
ZW5kZW5jeS1jaGVjayB0byBfQlVJTERfT1BUUywgc2VlIGZvcgpleGFtcGxlIGNvbW1pdCA0YjRl
YzAzOTk4ZSAocGFja2FnZS9weXRob24tbWwtZHR5cGVzOiBza2lwIGRlcGVuZGVuY3kKY2hlY2sp
LgoKV2hhdCBpcyB0aGUgcmVhc29uIHVwc3RyZWFtIGhhcyBwaW5uZWQgdG8gYW4gb2xkZXIgc2V0
dXB0b29scz8gQ2FuIHdlCmp1c3Qgc2tpcCB0aGUgZGVwZW5kZW5jeSBjaGVjayBpbnN0ZXJhZCBv
ZiByZXZlcnRpbmc/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiArLS0tCj4gKyBweXByb2pl
Y3QudG9tbCB8IDEyICsrKysrLS0tLS0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9weXByb2plY3QudG9tbCBi
L3B5cHJvamVjdC50b21sCj4gK2luZGV4IDBmNTM1OTRkZi4uNzgwYzliZjY4IDEwMDY0NAo+ICst
LS0gYS9weXByb2plY3QudG9tbAo+ICsrKysgYi9weXByb2plY3QudG9tbAo+ICtAQCAtMSwxMSAr
MSw5IEBACj4gKyBbYnVpbGQtc3lzdGVtXQo+ICstYnVpbGQtYmFja2VuZCA9ICJzZXR1cHRvb2xz
LmJ1aWxkX21ldGEiCj4gKy1yZXF1aXJlcyA9IFsKPiArLSAgICAjIGF2b2lkIG1vdmluZyB0byBo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2lzc3Vlcy8zNTkzCj4gKy0gICAgIyB1
bnRpbCB3ZSdyZSByZWFkeQo+ICstICAgICJzZXR1cHRvb2xzPj02MS4wLDw2OS4zIiwKPiArLSAg
ICAiY3l0aG9uPj0wLjI5LjI0OyBwbGF0Zm9ybV9weXRob25faW1wbGVtZW50YXRpb24gPT0gJ0NQ
eXRob24nIiwgIyBTa2lwIGN5dGhvbiB3aGVuIHVzaW5nIHB5cHkKPiArLV0KPiArKyAgICBidWls
ZC1iYWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0YSIKPiArKyAgICByZXF1aXJlcyA9IFsK
PiArKyAgICAgICAgInNldHVwdG9vbHM+PTQ3IiwKPiArKyAgICAgICAgImN5dGhvbj49MC4yOS4y
NDsgcGxhdGZvcm1fcHl0aG9uX2ltcGxlbWVudGF0aW9uID09ICdDUHl0aG9uJyIsICMgU2tpcCBj
eXRob24gd2hlbiB1c2luZyBweXB5Cj4gKysgICAgXQo+ICsgCj4gKyBbdG9vbC5ibGFja10KPiAr
IGxpbmUtbGVuZ3RoID0gNzkKPiArLS0gCj4gKzIuNDYuMAo+ICsKPiAtLSAKPiAyLjQ2LjAKPiAK
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

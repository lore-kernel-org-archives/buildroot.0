Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7CC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E705E4194A;
	Tue, 25 Jul 2023 21:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E705E4194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqoyFFSShqX8; Tue, 25 Jul 2023 21:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B2E44190A;
	Tue, 25 Jul 2023 21:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2E44190A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F941BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2726820A2
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2726820A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ThS024uWoJo for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:12:28 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA5888209B
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5888209B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 259A278033D;
 Tue, 25 Jul 2023 23:12:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:12:23 +0200
Date: Tue, 25 Jul 2023 23:12:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211223.GV3544423@scaer>
References: <20230725103140.941516-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103140.941516-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319546;
 bh=oHJl1Ku+4dn3brJ9ylEU5Hcw0EbnuLkMUu6keidYN4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6vJhutdgIxoNj2oNZpQ0FQRZOoBN66y2AwEqJgHJEIkowMtftkaShv6ZgxS9607w
 dwppL/1y5b7RoinBABeixskENxxlsA35l6NyJlXCrTVe97mDkcPbPHLQvea411vMH5
 RDnexFcExIrPNQxMRSRMygAdrBQk61i4ZH3t+Muuh2h/titEnPlMjVF/Zs+h81esKd
 tfiYttz/G0Iaxj5RClP1vzFWy8e5J/a2N8c0i3GDls1z3cXbkNqPFJd2+BbRDods+m
 xCDMcOzZGuOlBwDz+fEGDwYoyXq78eYopNaX5j1KzOaj6I2gixfWZxlffjGd4fuWIg
 dwIvvhwltDWGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B6vJhutd
Subject: Re: [Buildroot] [PATCH] package/libubootenv: bump to version 0.3.4
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTI1IDEyOjMxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICAuLi5NYWtlTGlzdHMudHh0LWRvLW5vdC1mb3JjZS10
aGUtYnVpbGQtb2YtYS1zaGFyZS5wYXRjaCB8IDkgKysrKy0tLS0tCj4gIHBhY2thZ2UvbGlidWJv
b3RlbnYvbGlidWJvb3RlbnYuaGFzaCAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBwYWNr
YWdlL2xpYnVib290ZW52L2xpYnVib290ZW52Lm1rICAgICAgICAgICAgICAgICAgICAgICB8IDQg
KystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1Ym9vdGVudi8wMDAxLXNyYy1DTWFrZUxpc3Rz
LnR4dC1kby1ub3QtZm9yY2UtdGhlLWJ1aWxkLW9mLWEtc2hhcmUucGF0Y2ggYi9wYWNrYWdlL2xp
YnVib290ZW52LzAwMDEtc3JjLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1mb3JjZS10aGUtYnVpbGQt
b2YtYS1zaGFyZS5wYXRjaAo+IGluZGV4IDkwNDBlMTI2Ny4uOWM1NDM4ZjMwIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbGlidWJvb3RlbnYvMDAwMS1zcmMtQ01ha2VMaXN0cy50eHQtZG8tbm90LWZv
cmNlLXRoZS1idWlsZC1vZi1hLXNoYXJlLnBhdGNoCj4gKysrIGIvcGFja2FnZS9saWJ1Ym9vdGVu
di8wMDAxLXNyYy1DTWFrZUxpc3RzLnR4dC1kby1ub3QtZm9yY2UtdGhlLWJ1aWxkLW9mLWEtc2hh
cmUucGF0Y2gKPiBAQCAtMjksNyArMjksNyBAQCBkaWZmIC0tZ2l0IGEvc3JjL0NNYWtlTGlzdHMu
dHh0IGIvc3JjL0NNYWtlTGlzdHMudHh0Cj4gIGluZGV4IDRiNzFiYzUuLjBiNTE1ZjQgMTAwNjQ0
Cj4gIC0tLSBhL3NyYy9DTWFrZUxpc3RzLnR4dAo+ICArKysgYi9zcmMvQ01ha2VMaXN0cy50eHQK
PiAtQEAgLTEyLDE4ICsxMiwxNiBAQCBTRVQoaW5jbHVkZV9IRUFERVJTCj4gK0BAIC0xNSwxNyAr
MTUsMTUgQEAgU0VUKGluY2x1ZGVfSEVBREVSUwo+ICAgCj4gICBpbmNsdWRlKEdOVUluc3RhbGxE
aXJzKSAjIGZvciB0aGUgQ01BS0VfSU5TVEFMTF9MSUJESVIgdmFyaWFibGUKPiAgIAo+IEBAIC00
MCwxNiArNDAsMTUgQEAgaW5kZXggNGI3MWJjNS4uMGI1MTVmNCAxMDA2NDQKPiAgLUFERF9MSUJS
QVJZKHVib290ZW52X3N0YXRpYyBTVEFUSUMgJHtsaWJ1Ym9vdGVudl9TT1VSQ0VTfSAke2luY2x1
ZGVfSEVBREVSU30pCj4gIC1TRVRfVEFSR0VUX1BST1BFUlRJRVModWJvb3RlbnZfc3RhdGljIFBS
T1BFUlRJRVMgT1VUUFVUX05BTUUgdWJvb3RlbnYpCj4gICBhZGRfZXhlY3V0YWJsZShmd19wcmlu
dGVudiBmd19wcmludGVudi5jKQo+IC0gYWRkX2V4ZWN1dGFibGUoZndfc2V0ZW52IGZ3X3NldGVu
di5jKQo+IC0gdGFyZ2V0X2xpbmtfbGlicmFyaWVzKHVib290ZW52IHopCj4gKyB0YXJnZXRfbGlu
a19saWJyYXJpZXModWJvb3RlbnYgeiB5YW1sKQo+ICAgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKGZ3
X3ByaW50ZW52IHVib290ZW52KQo+IC0gdGFyZ2V0X2xpbmtfbGlicmFyaWVzKGZ3X3NldGVudiB1
Ym9vdGVudikKPiArIGFkZF9jdXN0b21fdGFyZ2V0KGZ3X3NldGVudiBBTEwgJHtDTUFLRV9DT01N
QU5EfSAtRSBjcmVhdGVfc3ltbGluayBmd19wcmludGVudiBmd19zZXRlbnYpCj4gICAKPiAgLWlu
c3RhbGwgKFRBUkdFVFMgdWJvb3RlbnYgdWJvb3RlbnZfc3RhdGljIERFU1RJTkFUSU9OICR7Q01B
S0VfSU5TVEFMTF9MSUJESVJ9KQo+ICAraW5zdGFsbCAoVEFSR0VUUyB1Ym9vdGVudiBERVNUSU5B
VElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfSkKPiAgIGluc3RhbGwgKEZJTEVTIGxpYnVib290
LmggREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0lOQ0xVREVESVJ9KQo+ICAgaW5zdGFsbCAo
VEFSR0VUUyBmd19wcmludGVudiBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfQklORElSfSkK
PiAtIGluc3RhbGwgKFRBUkdFVFMgZndfc2V0ZW52IERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFM
TF9CSU5ESVJ9KQo+ICsgaW5zdGFsbCAoUFJPR1JBTVMgJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9E
SVJ9L2Z3X3NldGVudiBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfQklORElSfSkKPiAgLS0g
Cj4gIDIuMzAuMgo+ICAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1Ym9vdGVudi9saWJ1Ym9v
dGVudi5oYXNoIGIvcGFja2FnZS9saWJ1Ym9vdGVudi9saWJ1Ym9vdGVudi5oYXNoCj4gaW5kZXgg
Njg2M2I3ZmNmLi5iODgxOTk0YmYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ1Ym9vdGVudi9s
aWJ1Ym9vdGVudi5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJ1Ym9vdGVudi9saWJ1Ym9vdGVudi5o
YXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAg
OGZjOTQ5OGI1NTdiYmY0YWU0ZDM5YTJkYmQxNWEyZWY0NGY4ZWE4ZGU0Njg2Y2M5NzFjNjc4OGE2
NWNkMWVjMCAgbGlidWJvb3RlbnYtMC4zLjMudGFyLmd6Cj4gK3NoYTI1NiAgNzhmYWFkY2ZhYzY3
ZTUwMjczZTVkNGU5NWU2Y2Y2ZmVlM2Q0ODZjZTlkYzU2OGQxZmUyNTMxMjI3MWE4ODc2OCAgbGli
dWJvb3RlbnYtMC4zLjQudGFyLmd6Cj4gIHNoYTI1NiAgMDU1ODEwMTk4NDU1MGZhODRkMWQxM2My
YWYxMWQxMTZjMjAwNzlkMmJlNTg3MTFlOGQ5OWNhZGNlNzAwOTE5MiAgTElDRU5TRVMvQ0MwLTEu
MC50eHQKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0
ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBMSUNFTlNFUy9MR1BMLTIuMS1vci1sYXRlci50eHQK
PiAgc2hhMjU2ICA4OTgwN2FjZjIzMDliZDI4NWYwMzM0MDRlZTc4NTgxNjAyZjNjZDliODE5YTE2
YWMyZjBlNWY2MGZmNGE0NzNlICBMSUNFTlNFUy9NSVQudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlidWJvb3RlbnYvbGlidWJvb3RlbnYubWsgYi9wYWNrYWdlL2xpYnVib290ZW52L2xpYnVi
b290ZW52Lm1rCj4gaW5kZXggZTg0MWUwYjg0Li5iNGM5NTg4MTAgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJ1Ym9vdGVudi9saWJ1Ym9vdGVudi5tawo+ICsrKyBiL3BhY2thZ2UvbGlidWJvb3Rl
bnYvbGlidWJvb3RlbnYubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtTElCVUJPT1RFTlZfVkVSU0lPTiA9IDAuMy4zCj4gK0xJQlVCT09U
RU5WX1ZFUlNJT04gPSAwLjMuNAo+ICBMSUJVQk9PVEVOVl9TSVRFID0gJChjYWxsIGdpdGh1Yixz
YmFiaWMsbGlidWJvb3RlbnYsdiQoTElCVUJPT1RFTlZfVkVSU0lPTikpCj4gIExJQlVCT09URU5W
X0xJQ0VOU0UgPSBMR1BMLTIuMSssIE1JVCwgQ0MwLTEuMAo+ICBMSUJVQk9PVEVOVl9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRVMvQ0MwLTEuMC50eHQgXAo+IEBAIC0xMiw2ICsxMiw2IEBAIExJQlVC
T09URU5WX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9DQzAtMS4wLnR4dCBcCj4gIAlMSUNFTlNF
Uy9NSVQudHh0Cj4gIAo+ICBMSUJVQk9PVEVOVl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtTElC
VUJPT1RFTlZfREVQRU5ERU5DSUVTID0gemxpYgo+ICtMSUJVQk9PVEVOVl9ERVBFTkRFTkNJRVMg
PSBsaWJ5YW1sIHpsaWIKPiAgCj4gICQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQo+IC0tIAo+IDIu
MzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK

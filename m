Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA462C47DA9
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50E860F67;
	Sat, 27 Jan 2024 20:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50E860F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmd7bPnoqfFT; Sat, 27 Jan 2024 20:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15EA60F51;
	Sat, 27 Jan 2024 20:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15EA60F51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9FC31BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC83834C7
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC83834C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juYzrXi5X4fD for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:58 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97BB08344C
 for <buildroot@busybox.net>; Sat, 27 Jan 2024 20:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97BB08344C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 91AD013F89C;
 Sat, 27 Jan 2024 21:56:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 21:56:53 +0100
Date: Sat, 27 Jan 2024 21:56:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <ZbVuFccuPFgbE-xZ@landeda>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706389015;
 bh=BTsbZHbm2bzjbd9Hc7YWL4a/tnp7709FsKGSwEpEn7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQpS1qjvdFtYfkLzNSqn9EXoleIfn4pNPgJNCT7x6wxadaJM1NA7A8CbFszuo48aO
 WSiryIWDpS3IXAW4b2NWb6yUt2jSb5WUh5cSkn0iD+lJVI9u9MVB3KxmsyQkLNpT0p
 tSJlXnIuB8wiME2v9W5Cn5umywFvbvIlFHed3YtmcZfNo3km2/oLJpahUbsWRKj5BN
 vzDDfAOC4FLPXm2bMjdRIab1DDOQ2FZwSFeaYWLQRfI1EpNxFLnbddWdrw3CEgdZbi
 3ZUiz/pY6IkadzCe+0NAEZ9T8u3I72P3K36Si1/miEEAd8rLGs6FExyHvp0zc+w+2O
 VDvrLjsI0spmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lQpS1qjv
Subject: Re: [Buildroot] [PATCH 01/10] package/perl-cookie-baker: bump to
 version 0.12
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTAxLTI0IDExOjM0ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKV2hvbGUgc2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9wZXJsLWNvb2tp
ZS1iYWtlci9wZXJsLWNvb2tpZS1iYWtlci5oYXNoIHwgNiArKystLS0KPiAgcGFja2FnZS9wZXJs
LWNvb2tpZS1iYWtlci9wZXJsLWNvb2tpZS1iYWtlci5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wZXJsLWNvb2tpZS1iYWtlci9wZXJsLWNvb2tpZS1iYWtlci5oYXNoIGIvcGFja2Fn
ZS9wZXJsLWNvb2tpZS1iYWtlci9wZXJsLWNvb2tpZS1iYWtlci5oYXNoCj4gaW5kZXggY2MyYTg0
YjE0Li4zNGJiNGIxNDMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXJsLWNvb2tpZS1iYWtlci9w
ZXJsLWNvb2tpZS1iYWtlci5oYXNoCj4gKysrIGIvcGFja2FnZS9wZXJsLWNvb2tpZS1iYWtlci9w
ZXJsLWNvb2tpZS1iYWtlci5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gLSMgcmV0cmlldmVkIGJ5
IHNjYW5jcGFuIGZyb20gaHR0cDovL2NwYW4ubWV0YWNwYW4ub3JnLwo+IC1tZDUgIGJjOGY5NTg5
M2Q2ZWMzMDkzYTYyZDE5NTdlMTkwOGYyICBDb29raWUtQmFrZXItMC4xMS50YXIuZ3oKPiAtc2hh
MjU2ICA1OTI3NWY0NzRlMDdjMGFhMzYxMWUzZTY4NGI4OTRlN2RiOTEzMzMzZDgyMTQ0MjBiZTYz
ZjEyZWMxOGNkN2FiICBDb29raWUtQmFrZXItMC4xMS50YXIuZ3oKPiArIyByZXRyaWV2ZWQgYnkg
c2NhbmNwYW4gZnJvbSBodHRwczovL2NwYW4ubWV0YWNwYW4ub3JnLwo+ICttZDUgIDdhYjYzNjk4
ZDJmMjRhOGNmZTMxYTdlYTI3MGU5ZDJkICBDb29raWUtQmFrZXItMC4xMi50YXIuZ3oKPiArc2hh
MjU2ICA5YjA0ZGY1ZDQ3ZGNkNDVhYzQyOTk2MjZhMTBlYzk5MGZiNDBjOTRlZTVhNjMwMGMzYTg4
YmRmYjM1NzVlYzI5ICBDb29raWUtQmFrZXItMC4xMi50YXIuZ3oKPiAgCj4gICMgY29tcHV0ZWQg
Ynkgc2NhbmNwYW4KPiAgc2hhMjU2ICBiNGNlOTQ2NzFmYTIxOTA3NGQ0ZTkxZTIyNjg2NTJkNmJm
OTc2NGNlYmNjN2E1ZTI3YmZjMTQ4OTc3NDVjYTRjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcGVybC1jb29raWUtYmFrZXIvcGVybC1jb29raWUtYmFrZXIubWsgYi9wYWNrYWdlL3Bl
cmwtY29va2llLWJha2VyL3BlcmwtY29va2llLWJha2VyLm1rCj4gaW5kZXggMjdjODhmM2U1Li5h
ZGQ1ZmNkMGUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXJsLWNvb2tpZS1iYWtlci9wZXJsLWNv
b2tpZS1iYWtlci5tawo+ICsrKyBiL3BhY2thZ2UvcGVybC1jb29raWUtYmFrZXIvcGVybC1jb29r
aWUtYmFrZXIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtUEVSTF9DT09LSUVfQkFLRVJfVkVSU0lPTiA9IDAuMTEKPiArUEVSTF9DT09L
SUVfQkFLRVJfVkVSU0lPTiA9IDAuMTIKPiAgUEVSTF9DT09LSUVfQkFLRVJfU09VUkNFID0gQ29v
a2llLUJha2VyLSQoUEVSTF9DT09LSUVfQkFLRVJfVkVSU0lPTikudGFyLmd6Cj4gIFBFUkxfQ09P
S0lFX0JBS0VSX1NJVEUgPSAkKEJSMl9DUEFOX01JUlJPUikvYXV0aG9ycy9pZC9LL0tBL0tBWkVC
VVJPCj4gIFBFUkxfQ09PS0lFX0JBS0VSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGVybC1tb2R1bGUt
YnVpbGQtdGlueQo+IC0tIAo+IDIuNDAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

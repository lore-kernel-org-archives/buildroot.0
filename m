Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056DEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 09:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E2160BD6;
	Sun, 17 Jul 2022 09:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E2160BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtlBCr7qztDu; Sun, 17 Jul 2022 09:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678F060B04;
	Sun, 17 Jul 2022 09:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 678F060B04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0B981BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB62D83F39
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB62D83F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0641qGmN8_92 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 09:20:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B0383F32
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87B0383F32
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 09:20:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9245A780502;
 Sun, 17 Jul 2022 11:20:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 11:20:20 +0200
Date: Sun, 17 Jul 2022 11:20:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220717092020.GF2543@scaer>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658049627;
 bh=uZONPTa2wt+1zHqgdHBejMoMtP2aB2KPKcuayDmGrNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IPbaenSN/exjumgwa/uGagh7S3PMrUyrhxCbCK3KlsFeHpS9+HmQWD/EsLBrf0U7n
 OHNKDuy7OOgCNTgfi0KZD3E7Fe5l2/Bvja7KmeY7eer7Gz62JdSOMoUVr4Uu6tyRGu
 VfDXEnxW8nucyh7FklO0A+Eo8NWk/tivz5teefq9ap1q9hVtv7JExdpz3GMNrVrWta
 fUPggfmaLCpHU/6DUpGUF+i6SdcOm9o1gpwq9SliPW3Qz+01usHClQdb4y3ieA+B8E
 t1bbHeikVdr4CHa40DSGXhSReTzqtpuiiG5yF/L9wp/hZWhVWcLQLi+EUWWc+Pb3Ry
 n6VRBQbNViXIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IPbaenSN
Subject: Re: [Buildroot] [PATCH] package/python-pillow: fix host package
 build
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
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTA3LTEzIDEzOjU4ICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEluIGNvbW1pdAo+IGQ4YzVkOWI1MzQzNzc0
MWM3OWNkM2Q3NTlkZTFmZTgxYWY5MDU1ZmQgKCJwYWNrYWdlL3B5dGhvbi1waWxsb3c6Cj4gZW5h
YmxlIGhvc3QgdmFyaWFudCIpLCB3aGVuIHN1cHBvcnQgZm9yIHRoZSBob3N0IHZhcmlhbnQgb2YK
PiBweXRob24tcGlsbG93IHdhcyBhZGRlZCwgdGhlIGZhY3QgdGhhdCBweXRob24tcGlsbG93IGhh
cyBvcHRpb25hbAo+IGRlcGVuZGVuY2llcyB3YXMgbm90IGhhbmRsZWQsIGFuZCBsZWZ0IHB5dGhv
bi1waWxsb3cgdG8gYXV0b2RldGVjdCBpdHMKPiBvcHRpb25hbCBkZXBlbmRlbmNpZXMuCj4gCj4g
VW5mb3J0dW5hdGVseSwgd2l0aG91dCBzb21lIGNvbmZpZyBvcHRpb25zLCBzb21lIG9mIGl0cyBk
ZXBlbmRlbmNpZXMKPiBhcmUgbWFkZSBtYW5kYXRvcnksIHN1Y2ggYXMgdGhlIEpQRUcgbGlicmFy
eS4gU2luY2UgZm9yIG5vdyBzdWNoCj4gc3VwcG9ydCBpcyBub3QgbmVlZGVkIGluIHRoZSBob3N0
IHZhcmlhbnQgb2YgcHl0aG9uLXBpbGxvdywgd2Ugc2ltcGx5Cj4gZGlzYWJsZSBhbGwgb3B0aW9u
YWwgZGVwZW5kZW5jaWVzLgoKV2VsbCwgaWYgc29tZSBwYWNrYWdlIG5lZWRzIGhvc3QtcHl0aG9u
LXBpbGxvdywgdGhhdCdzIG1vc3QgcHJvYmFibHkKYmVjYXVzZSB0aGV5IGFyZSBnb2luZyB0byBk
byBzb21lIGltYWdlIG1hbmlwdWxhdGlvbiBhdCBiaXVsZCB0aW1lLgoKRGlzYWJsaW5nIGFsbCBp
bWFnZSBwcm9jZXNzaW5nIG9wdGlvbnMgKHRoYXQgcmVxdWlyZSBhbiBleHRlcm5hbApsaWJyYXJ5
LCBidXQgdGhhdCdzIG1vc3Qgb2YgdGhlbT8pIGlzIG5vdCBzbyBuaWNlLiBJdCB3b3VsZCBtYXli
ZSBtYWtlCnNlbnNlIHRvIGVuYWJsZSBhbGwgdGhlIGltYWdlIG9wdGlvbnMgZm9yIHdoaWNoIHdl
IGhhdmUgaG9zdCBsaWJyYXJpZXMuCgpLw7ZyeSwgd2hhdCBkb2VzIHlvdXIgb3B0ZWUtb3MgbmVl
ZCBmcm9tIHB5dGhvbi1waWxsb3c/IFdvdWxkIHRoaXMgcGF0Y2gKc3RpbGwgd29yayBmb3IgaXQ/
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBUbyBiZSBjb25zaXN0ZW50IHdpdGggdGhlIHRh
cmdldCB2YXJpYW50LCB3ZSBhbHNvIGVuc3VyZSB0byBoYXZlCj4gaG9zdC1wa2djb25mIGFzIGEg
ZGVwZW5kZW5jeSBvZiB0aGUgaG9zdCB2YXJpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rIHwgMTMgKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5tayBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9w
eXRob24tcGlsbG93Lm1rCj4gaW5kZXggOGM5Y2I4Njg2My4uMGQxODlhYzBjYSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5tawo+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCj4gQEAgLTcxLDUgKzcxLDE4IEBAIGVs
c2UKPiAgUFlUSE9OX1BJTExPV19CVUlMRF9PUFRTICs9IC0tZGlzYWJsZS13ZWJwIC0tZGlzYWJs
ZS13ZWJwbXV4Cj4gIGVuZGlmCj4gIAo+ICtIT1NUX1BZVEhPTl9QSUxMT1dfREVQRU5ERU5DSUVT
ID0gaG9zdC1wa2djb25mCj4gK0hPU1RfUFlUSE9OX1BJTExPV19CVUlMRF9PUFRTID0gXAo+ICsJ
YnVpbGRfZXh0IFwKPiArCS0tZGlzYWJsZS1mcmVldHlwZSBcCj4gKwktLWRpc2FibGUtanBlZyBc
Cj4gKwktLWRpc2FibGUtbGNtcyBcCj4gKwktLWRpc2FibGUteGNiIFwKPiArCS0tZGlzYWJsZS1q
cGVnMjAwMCBcCj4gKwktLWRpc2FibGUtdGlmZiBcCj4gKwktLWRpc2FibGUtd2VicCBcCj4gKwkt
LWRpc2FibGUtd2VicG11eAo+ICtIT1NUX1BZVEhPTl9QSUxMT1dfSU5TVEFMTF9PUFRTID0gJChI
T1NUX1BZVEhPTl9QSUxMT1dfQlVJTERfT1BUUykKPiArCj4gICQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKPiAgJChldmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCj4gLS0gCj4gMi4zNi4xCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=

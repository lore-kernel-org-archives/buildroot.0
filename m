Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F92DC48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D480E40482;
	Sun, 18 Feb 2024 21:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVwRYaAWH9IZ; Sun, 18 Feb 2024 21:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 929E44044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 929E44044D;
	Sun, 18 Feb 2024 21:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3DC61BF488
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99E8E820A2
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvg5t15WFWfF for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 21:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61E7682088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E7682088
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E7682088
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 21:03:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2E4BC13F89A;
 Sun, 18 Feb 2024 22:03:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 22:03:19 +0100
Date: Sun, 18 Feb 2024 22:03:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdJwl8BM_z_O0wC1@landeda>
References: <20240218011653.790820-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218011653.790820-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708290206;
 bh=+qneLfYkOb2+DTMagGoukTRpvyzKt/K+P5BCmtAwHOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8yFXArYwJOHWFvqO4kD8/GJgi9CokFDNk5vG75NHTebh3neDZQAOKWn3IZJIx8Jo
 3op8kKjIfCBZW09KEdlnUuBnderNPdgp/X+NyAgqwAjvsyszjbS0cLdCOC3v9+sur6
 Q6p0M3kdRdn/2AYu1m5hYk+MAeFHEOEFi2jWC6iNgOcgIymscPzF1I8B8OHt0CzWGr
 6HzqwpPTyawsRTTp7DFtPQh0qPphMdKlKrIZUCKKMGslQxO+aly3GnKATmkfvA2yLr
 a11XqV3HEdHUXQtCyxkDtD/k38Ql0RTRaOSD3z5g1IE2R4tnplelS/enZmUVwkz1+z
 fSc0CR2uNpHxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F8yFXArY
Subject: Re: [Buildroot] [PATCH 1/1] package/google-breakpad: fix missing
 include error
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Pascal Huerst <pascal.huerst@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S2FkYW1iaW5pLCBBbGwsCgpPbiAyMDI0LTAyLTE3IDE3OjE2IC0wODAwLCBLYWRhbWJpbmkgTmVt
YSBzcGFrZSB0aHVzbHk6Cj4gc3JjL2NvbW1vbi9tb2R1bGUuY2M6IEluIG1lbWJlciBmdW5jdGlv
biDigJhib29sIGdvb2dsZV9icmVha3BhZDo6TW9kdWxlOjpBZGRGdW5jdGlvbihGdW5jdGlvbiop
4oCZOgo+IHNyYy9jb21tb24vbW9kdWxlLmNjOjE5NDo1MjogZXJyb3I6IOKAmGZpbmRfaWbigJkg
aXMgbm90IGEgbWVtYmVyIG9mIOKAmHN0ZOKAmTsgZGlkIHlvdSBtZWFuIOKAmGZpbmTigJk/Cj4g
ICAxOTQgfCAgICAgRnVuY3Rpb25TZXQ6Oml0ZXJhdG9yIGV4aXN0aW5nX2Z1bmN0aW9uID0gc3Rk
OjpmaW5kX2lmKAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmluZAo+IE1ha2VmaWxlOjgzMDk6IHJlY2lwZSBm
b3IgdGFyZ2V0ICdzcmMvY29tbW9uL3Rvb2xzX21hY19kdW1wX3N5bXNfZHVtcF9zeW1zX21hYy1t
b2R1bGUubycgZmFpbGVkCj4gCj4gVGhpcyBlcnJvciBpcyBzZWVuIG9uIGdjYy0xNC4KPiAKPiBy
ZWxhdGVkIGxpbmtzOgo+IGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20v
Yy9icmVha3BhZC9icmVha3BhZC8rLzUxMzc2NTgKPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQu
b3JnL21ldGEtb3BlbmVtYmVkZGVkL3RyZWUvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2JyZWFr
cGFkL2JyZWFrcGFkLzAwMDEtRml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1zdGQtZmluZF9pZi5w
YXRjaAo+IAo+IFNpZ25lZC1vZmYtYnk6IEthZGFtYmluaSBOZW1hIDxrYWRhbWJpbmkubmVtYUBn
bWFpbC5jb20+Cj4gLS0tCj4gIC4uLml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1zdGQtZmluZF9p
Zi5wYXRjaCB8IDI0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFk
LzAwMDEtRml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1zdGQtZmluZF9pZi5wYXRjaAo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAxLUZpeGVkLW1pc3NpbmctaW5j
bHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0Y2ggYi9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAx
LUZpeGVkLW1pc3NpbmctaW5jbHVkZS1mb3Itc3RkLWZpbmRfaWYucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjgwZWFiNzIzYjMKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1
ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCj4gQEAgLTAsMCArMSwyNCBAQAo+ICtGcm9tIDg5OGE5
OTc4NTUxNjhjMGU2YTY4OTA3MmZlZmJhODkyNDYyNzFhNWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IE5hdGhhbiBNb2ludmF6aXJpIDxuYXRoYW5AbmF0aGFubS5jb20+Cj4gK0Rh
dGU6IFR1ZSwgMTkgRGVjIDIwMjMgMTQ6MzU6MDUgLTA4MDAKPiArU3ViamVjdDogW1BBVENIXSBG
aXhlZCBtaXNzaW5nIGluY2x1ZGUgZm9yIHN0ZDo6ZmluZF9pZi4KPiArCj4gK1Rocm93cyBhbiBl
cnJvciB3aGVuIGNvbXBpbGluZyBvbiBXaW5kb3dzLgo+ICsKPiArQ2hhbmdlLUlkOiBJZWIzNGMw
MGNmMTk5YWFhMWI0NWE0NDAwODZjNDhiOGVkMzYzYjNjNwo+ICtSZXZpZXdlZC1vbjogaHR0cHM6
Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2JyZWFrcGFkL2JyZWFrcGFkLysv
NTEzNzY1OAo+ICtSZXZpZXdlZC1ieTogSXZhbiBQZW5rb3YgPGl2YW5wZUBjaHJvbWl1bS5vcmc+
CgogICAgJCAuL3V0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCiAgICBwYWNrYWdl
L2dvb2dsZS1icmVha3BhZC8wMDAxLUZpeGVkLW1pc3NpbmctaW5jbHVkZS1mb3Itc3RkLWZpbmRf
aWYucGF0Y2g6MDogbWlzc2luZyBTaWduZWQtb2ZmLWJ5IGluIHRoZSBoZWFkZXIgKGh0dHBzOi8v
bmlnaHRseS5idWlsZHJvb3Qub3JnLyNfZm9ybWF0X2FuZF9saWNlbnNpbmdfb2ZfdGhlX3BhY2th
Z2VfcGF0Y2hlcykKICAgIHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAwMDEtRml4ZWQtbWlzc2lu
Zy1pbmNsdWRlLWZvci1zdGQtZmluZF9pZi5wYXRjaDowOiBtaXNzaW5nIFVwc3RyZWFtIGluIHRo
ZSBoZWFkZXIgKGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfYWRkaXRpb25hbF9wYXRj
aF9kb2N1bWVudGF0aW9uKQoKQWx0aG91Z2ggSSBjb3VsZCBoYXZlIGZpeGVkIHRoZSBVcHRyZWFt
IHRhZyBpc3N1ZSwgSSBjYW4ndCBhZGQgeW91ciBTb0IKbGluZS4gQ291bGQgeW91IHBsZWFzZSBy
ZXNwaW4gd2l0aDoKCiAgLSB5b3VyIFNpZ25lZC1vZmYtYnk6IHRhZwogIC0gdGhlIFVwc3RyZWFt
OiB0YWcsIHRoYXQgcG9pbnRzIHRvIHRoZSB1cHN0cmVhbSBjb21taXQsIGkuZS46CiAgICBodHRw
czovL2dpdGh1Yi5jb20vZ29vZ2xlL2JyZWFrcGFkL2NvbW1pdC84OThhOTk3ODU1MTY4YzBlNmE2
ODkwNzJmZWZiYTg5MjQ2MjcxYTVkCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiArLS0tCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2NvbW1vbi9tb2R1bGUuY2MgYi9zcmMvY29tbW9uL21vZHVs
ZS5jYwo+ICtpbmRleCAwZWI1YWFkLi5iNmY1ZGE3IDEwMDY0NAo+ICstLS0gYS9zcmMvY29tbW9u
L21vZHVsZS5jYwo+ICsrKysgYi9zcmMvY29tbW9uL21vZHVsZS5jYwo+ICtAQCAtNDIsNiArNDIs
NyBAQAo+ICsgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gKyAjaW5jbHVkZSA8c3RyaW5nLmg+Cj4gKyAK
PiArKyNpbmNsdWRlIDxhbGdvcml0aG0+Cj4gKyAjaW5jbHVkZSA8ZnVuY3Rpb25hbD4KPiArICNp
bmNsdWRlIDxpb3N0cmVhbT4KPiArICNpbmNsdWRlIDxtZW1vcnk+Cj4gLS0gCj4gMi4yNS4xCj4g
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

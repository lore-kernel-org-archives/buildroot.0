Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135EFC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 20:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D61C60D4E;
	Mon,  5 Dec 2022 20:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D61C60D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZV-1L4uzzWL; Mon,  5 Dec 2022 20:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDDE60E7D;
	Mon,  5 Dec 2022 20:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDDE60E7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A03D1BF2B3
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64EA281468
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EA281468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j73YFk2-wDtk for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 20:12:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAEB81461
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAEB81461
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 20:12:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3834:9ccb:80f2:4b42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2502E200406;
 Mon,  5 Dec 2022 21:12:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Dec 2022 21:12:24 +0100
Date: Mon, 5 Dec 2022 21:12:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20221205201224.GG2855@scaer>
References: <b0cf6b84-b0ce-4c51-8ed3-54bcfd1c8ef6@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0cf6b84-b0ce-4c51-8ed3-54bcfd1c8ef6@app.fastmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670271147;
 bh=P74vTDuJJQtgv22Uk79pjfbTO3i6dNM5muCCsUhII9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tahrPMfwOx1dgEQXaQv01SRaJr4nxlP5paj2Gqd0I+3hX7I9/ar6piu69w2Hhb1sV
 t/DrmRRHmsDik97UwvcGCyWacoehuz5DBU070vUrbqjKA3wgudSDUrhRZdAeqMtZ9r
 PB2nk+w8uSEuqAgajWmHrnAKsLmBU4lAeBU1I/Zsa82AFo4ysvj9oqYiHkIt/KEBnT
 X67K3xGedsonMPqZIDrknB4GivES3zx7obEZEqnMPX71wR2DzO+FYjZuEZIZjtPt60
 lYKvlpPjICdXipKi1pT+/cTxIrzMeQbl47G3dsPcI3uMgNND2+CWsvcZlWKvt/JSF3
 YBgjPFjZJt1kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tahrPMfw
Subject: Re: [Buildroot] Excluding certain architectures for a package
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFuaWxsbywgQWxsLAoKT24gMjAyMi0xMi0wNSAwNzo1MiArMDEwMCwgRGFuaWxvIEJhcmdlbiBz
cGFrZSB0aHVzbHk6Cj4gSGkgYWxsCj4gCj4gVGhlIHBhY2thZ2UgYmVsb3cgZG9lcyBub3QgY3Vy
cmVudGx5IGJ1aWxkIG9uIE1JUFMgYmVjYXVzZSBvbmUgb2YKPiBjcnlwdG8gbGlicmFyaWVzIGl0
IGRlcGVuZHMgb24gZG9lc24ndCB5ZXQgZnVsbHkgc3VwcG9ydCB0aGF0Cj4gYXJjaGl0ZWN0dXJl
OiBodHRwczovL2dpdGh1Yi5jb20vYnJpYW5zbWl0aC9yaW5nL2lzc3Vlcy81NjIKPiAKPiBJcyB0
aGVyZSBhIHdheSB0byBleGNsdWRlIGNlcnRhaW4gYXJjaGl0ZWN0dXJlcyBmb3IgYSBwYWNrYWdl
PyBXaGF0Cj4gaXMgdGhlIHByb2Nlc3MgZm9yIHRoaXM/CgpZb3UgY2FuIGFkZCBhIGRlcGVuZGVu
Y3kgb24gYXJjaGl0ZWN0dXJlcyBsaWtlIGFueSBvdGhlciBkZXBlbmRlbmN5OyBzZWUKdGhlIG1h
bnVhbDoKICAgIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5o
dG1sI2RlcGVuZGVuY2llcy10YXJnZXQtdG9vbGNoYWluLW9wdGlvbnMKClF1b3Rpbmc6CgogICAg
KiBUYXJnZXQgYXJjaGl0ZWN0dXJlCiAgICAgIC0gRGVwZW5kZW5jeSBzeW1ib2w6IEJSMl9wb3dl
cnBjLCBCUjJfbWlwcywg4oCmIChzZWUgYXJjaC9Db25maWcuaW4pCiAgICAgIC0gQ29tbWVudCBz
dHJpbmc6IG5vIGNvbW1lbnQgdG8gYmUgYWRkZWQgCgpGb3IgZXhhbXBsZSwgdG8gZXhjbHVkZSBh
bGwgb2YgbWlwcyBhbmQgbWlwczY0OgoKICAgICMgQ3J5cHRvIG9wdCBub3QgYXZhaWxhYmxlIGZv
ciBtaXBzOgogICAgZGVwZW5kcyBvbiAhKEJSMl9taXBzIHx8IEJSMl9taXBzZWwgfHwgQlIyX21p
cHM2NCB8fCBCUjJfbWlwczY0ZWwpCgpBZGFwdCBhcHByb3ByaWF0ZWx5LCBvZiBjb3Vyc2UuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBDaGVlcnMsCj4gRGFuaWxvCj4gCj4gLS0tLS0gT3Jp
Z2luYWwgbWVzc2FnZSAtLS0tLQo+IEJldHJlZmY6IFthdXRvYnVpbGQuYnVpbGRyb290Lm5ldF0g
WW91ciBkYWlseSByZXN1bHRzIGZvciAyMDIyLTExLTAzCj4gRGF0dW06IEZyZWl0YWcsIDA0LiBO
b3ZlbWJlciAyMDIyIDA4OjM5Cj4gCj4gSGVsbG8sCj4gCj4gQXV0b2J1aWxkZXIgZmFpbHVyZXMK
PiA9PT09PT09PT09PT09PT09PT09PQo+IAo+IEJlbG93IGlzIGEgbGlzdCBvZiBidWlsZCBmYWls
dXJlcyByZXBvcnRlZCBieSB0aGUgQnVpbGRyb290IGF1dG9idWlsZGVycwo+IGluIHJlbGF0aW9u
IHRvIHBhY2thZ2VzIG9yIENQVSBhcmNoaXRlY3R1cmVzIHlvdSBhcmUgaW4gY2hhcmdlIG9mLgo+
IFBsZWFzZSBoZWxwIHVzIGltcHJvdmluZyB0aGUgcXVhbGl0eSBvZiBCdWlsZHJvb3QgYnkgaW52
ZXN0aWdhdGluZyB0aG9zZQo+IGJ1aWxkIGZhaWx1cmVzIGFuZCBzZW5kaW5nIHBhdGNoZXMgdG8g
Zml4IHRoZW0uCj4gCj4gUmVzdWx0cyBmb3IgdGhlICdtYXN0ZXInIGJyYW5jaAo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBCdWlsZCBmYWlsdXJlcyByZWxhdGVkIHRvIHlv
dXIgcGFja2FnZXM6Cj4gCj4gICAgIGFyY2ggICAgIHwgICAgICAgICAgICAgcmVhc29uICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgIG1p
cHMgICAgIHwgICAgICAgICB0ZWFsZGVlci0xLjYuMSAgICAgICAgIHwgaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZDQ4NjNmNDc2ZGUyYThiNGM5ZDI4ZWU1MmIxYTQ4ZjVi
MDk0N2M0Ygo+IAo+IAo+IFRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24gdG8gQnVpbGRyb290
IQo+IAo+IC0tIAo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

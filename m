Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6C3C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5ED4096D;
	Tue,  4 Feb 2025 14:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdmwh6rThVzw; Tue,  4 Feb 2025 14:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD584097B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD584097B;
	Tue,  4 Feb 2025 14:46:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3192D12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA9D8109A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLW1sjg1NH2O for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E544881026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E544881026
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E544881026
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:46:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1tBVxG2E1n-00nAYl; Tue, 04
 Feb 2025 15:46:49 +0100
Message-ID: <07211c56-9048-4ed6-9aae-deec6587eef6@gmx.de>
Date: Tue, 4 Feb 2025 15:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, yann.morin@orange.com
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <Z6GzCbcs9k0Rul1a@yd-6wlzhs3> <c3a16cbe-ae5b-4b68-9713-0fe3bf5888d4@gmx.de>
 <ee3662e1-3fbf-4a96-addd-b9d748e2a1c8@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ee3662e1-3fbf-4a96-addd-b9d748e2a1c8@mind.be>
X-Provags-ID: V03:K1:UWhc19ITSeLeu5w6YdqBGyqjVTO66Ncp1ixoLhs8Ww7zvuJXEL7
 BoOsKwa4dS/61BSjRtsQw4ioPX3dftnk6RcMvkG6Rz6t0HvYMo1KEPmY6NWXZ9vr+oQ8hqn
 S/Wb2F4oBw+/PXdtpw09THlkdRhlEAu/nqLaVKvQK3N7ddLgtQwlf0R15MALK9zy/YKCCnb
 RI23efEAYW2znD8Pef4Dg==
UI-OutboundReport: notjunk:1;M01:P0:0yczNGDXefY=;GkoM51rONpDo+8Ux3fCa4SjamkP
 zJbA1ZdZDnCmGEj51fw7mrfMNqas8JiYPoC0yoViWlc9XVJGdJ3/nbzjzK61ZYFLXeM1g94jP
 StWhc8tx0wMzfw2gwYbYht8s6mHlIFp90h429xyX2ySjfI3qsRvXJ4lGunVes4tU+cAFafTVc
 GGu/FrMMTDycSWj8NxpxLsCtme8U5DlD4KtNoF7cQMQQnM7EeF0HyZKI8ZjIKtUQFG2PZO/3Q
 AARBP9M3ijrZgRdL8QInDa/s7OPOb5qlicKTCdIfXAl+qanAP/VOluiLDk6h4/kGIuoQHULd/
 vcPD4lrLWVKeMtegY7GAxqX0CpI4osDffpwq/EV5ldYYasggFRjzou/DW3ofl9nbzPpESSIFR
 TvrlnAa+G7dVkhH2V9hfHpoA0FLp7Y/8JZ6OncJpRyLoONqG5oVFUwfClN+xLtS8heP5deBEl
 oZuUsB4WG2KTHeM2yL+mtVBCEgYsyXv8qRgTfUgUznec1zpMYJcz6WZoArJVHRgDBC/efjNIt
 T+9swC0jUE/+KpykKe4Tg4uUg5ZozLJxW25YDHbAV11ZtdZCGdxj5kGjEnBzV8j86MxV8Zp6S
 J0QxL4h2WhqViiNvjnle4TLX/BJrjsywZqXwYt0YfxRxqz3ICBot28sej1f2EcYS3AK5RYA/1
 FoJPdlL8Aa5Xc04JeX4p+teAFwO/dxcT8xXMFi4X1e+z+n9k5pMtXjHfslXbOOxNNOH0bytxH
 GaqR96Vvdj4NBUXrIGNZh0XOgzUz5RIdA8V689hRNkAljGwGdJh9DWRAmEG8ABee/6fjVGobC
 /Ue6xv5kmA6KeXyGINkrCeeVKo0BW1BmQf/EDPnWfwCIFBS/m8Ac+lmP/kDYEbl+MJbDQWESO
 tz7AxZ0NPiQoG04gl2UfnM8KuLBo9G5CGAwtaPCpsHyG+Wh9WJdmO07311JLDEP+6jUyAAykF
 uQXH5oyrPfSRCHsx2oCmvXyoi7xY7GuVvzkHJ7Vv1rj/ylwwdVQYt58lpO+UbF4/YMkjoPMGR
 6bgN0B9myddeVreA5NpLf7Vc06YpL+N/DPfpOcn10OOsiBdVhoiFe7iqIZQmEgfkGrgzWR+ST
 BFjImUkL75SE7av785erhwFplcYKwA8+0FHJ19ncvqvAU8FJYJi/WQrDJrrEG+Nq3rV7C34dm
 TKUC/zf+EdpMQVaPTwVv/ijRECL2roZS9JQWKBVaFop1HBkXBtd2UqZpdneFd+TVKnsx3x4pq
 aoZe9JgAJO1913oKmuqyBt5R395u6Q09XW8bvEjjNrOCniw/whexD0O4fkmSL2lBMSk8E8WXJ
 ulgKmtuDy1nQwwN7djF1iGpoYjp7nbNjBJOIyBty8Pmq90=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738680409; x=1739285209; i=fiona.klute@gmx.de;
 bh=iU9qExJsPKCWYzlNMa/z7Nss1c23xVys6hZ5b13kCRc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QMtWbo9DjgMRaYW0aS9yt9w63glbct18dRHCMwo40OAqbeki+/XikTnBfQ4d29Wt
 UzgxZMdBtmqVL2csMUIR4mZquvWHhf9q06xSqQFlOFug9nS9aD3fDqgVTIkS53oQz
 ctvK57Lb9qQmFwFAWYlC9myChB7+wxs9bZ/cYOynBiB6b2AHZ71i80LXQHYhr3p3L
 lP8TQcXMw+EPDXmnsjlQbMfSxpP9nLHFbpkUN1oZg1XhdkdpflUT99RvNrLuzdUO5
 lE4IBM5JGLCNut5dOWbfwSzcvN8LGrKBsxr33y3JFZVRmfAKTkDHxon01m/JtmGwA
 w4DrJlOOop4y4mwArA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QMtWbo9D
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0IQoKQW0gMDQuMDIuMjUgdW0gMTI6Mjcgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZToKWy4uLiBzbmlwIC4uLl0KPj4gT25lIHF1ZXN0aW9uIHRob3VnaDogSXMgdGhlcmUgYW4g
ZXhpc3Rpbmcgd2F5IHRvIGNoZWNrIHRoZSBCaW51dGlscwo+PiB2ZXJzaW9uIG9mIGFuIGV4dGVy
bmFsIHRvb2xjaGFpbj8gRm9yIHBlb3BsZSB3aXRoIEJpbnV0aWxzIDwgMi40MSB3aXRoCj4KPiAg
wqBUaGUgY29tbWl0IG1lc3NhZ2Ugb2YgWWFubidzIHBhdGNoIHNheXMgIlRoaXMgaXMgc3VwcG9z
ZWRseSBmaXhlZCBpbgo+IGJpbnV0aWxzIDIuMzYiLiAyLjM2IGlzIHBsZW50eSBvbGQgdGhhdCB3
ZSBjYW4gYWZmb3JkIHRvIHVuY29uZGl0aW9uYWxseQo+IHVzZSBsZC5iZmQuCj4KPiAgwqBIb3dl
dmVyLCBpZiBpdCdzIG9ubHkgX3JlYWxseV8gZml4ZWQgaW4gMi40MTogdGhhdCBvbmUgb25seSBi
ZWNhbWUgdGhlCj4gZGVmYXVsdCBmb3IgQnVpbGRyb290IGluIDIwMjQuMDUuIFNvIEkgZG9uJ3Qg
cmVhbGx5IHRoaW5rIHdlIGNhbiBjb3VudAo+IG9uIGl0IGlmIGl0J3MgcmVhbGx5IG9ubHkgZml4
ZWQgaW4gMi40MS4KPgo+PiBsZC5nb2xkIGZvcmNpbmcgQkZEIG1pZ2h0IGFjdHVhbGx5IGJyZWFr
IHRoaW5ncywgc28gaWRlYWxseSBJJ2Qgd2FudCB0bwo+PiBtYWtlIHRoZSBmbGFnIGNvbmRpdGlv
bmFsIG9uIEJpbnV0aWxzID49IDIuNDEgKGFsbCBCdWlsZHJvb3QtYnVpbHQKPj4gdG9vbGNoYWlu
cyBtZWV0IHRoYXQgYW55d2F5KS4gT3Igd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0byBzaW1wbHkg
c2F5Cj4+IHRoYXQgcGVvcGxlIHdpdGggb2xkIGV4dGVybmFsIHRvb2xjaGFpbnMgYXJlIG9uIHRo
ZWlyIG93bj8KPgo+ICDCoFVzaW5nIGxkLmdvbGQgb25seSBpZiBpdCBpcyBhdmFpbGFibGUgc291
bmRzIGxpa2UgYSBnb29kIGFwcHJvYWNoLCBidXQKPiBJIGRvbid0IGtub3cgaG93IGVhc3kgaXQg
aXMgdG8gZGlzY292ZXIgd2hldGhlciBvciBub3QgaXQgaXMKPiBhdmFpbGFibGUuLi4gTWF5YmUg
dGhpcyB3b3JrczoKPgo+ICQod2lsZGNhcmQgJChzaGVsbCAkKFRBUkdFVF9DQykgLXByaW50LXBy
b2ctbmFtZT1sZC5nb2xkKSkKPgo+Cj4gIMKgQlRXIHJlZ2FyZGluZyBZYW5uJ3MgcGF0Y2g6IEkg
d291bGQgZ2l2ZSB0aGUgdXNlLWxkIGZsYWcKPiB1bmNvbmRpdGlvbmFsbHksIG5vdCBvbiBhIHBl
ci1wYWNrYWdlIGJhc2lzLiBUaGF0IHdheSwgaWYgdGhlcmUgcmVhbGx5Cj4gaXMgYSBwcm9ibGVt
IHdpdGggYmZkLCB3ZSBoYXZlIGEgaGlnaGVyIGNoYW5jZSBvZiBydW5uaW5nIGluIHRvIGl0IGFu
ZAo+IHRoZXJlZm9yZSBmaXhpbmcgaXQuCkknbSBoYXBweSB0byBkbyB0aGF0IGluc3RlYWQgb2Yg
aW4gcGFja2FnZS9jb250YWluZXJkIGlmIHRoYXQncyBjb25zZW5zdXMuCgpXaGljaCBtYWtlcyBt
ZSB3b25kZXI6IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcHJvdmlkZSBhICpnbG9iYWwqIGNvbmZp
Zwpmb3IgRVhUTERGTEFHUyAoQlIyX0dPX0VYVExERkxBR1Mgb3Igc29tZXRoaW5nKSwgd2hpY2gg
d291bGQgZGVmYXVsdCB0bwoiLWZ1c2UtbGQ9YmZkIiAocGx1cyBtYXliZSAiLVdsLC0tbm8tcGll
IiB3aXRoIG11c2wpPyBUaGF0IHdheSBwZW9wbGUKd2hvIGUuZy4gdXNlIGFuIGV4dGVybmFsIHRv
b2xjaGFpbiB3aXRoIG9sZCBCaW51dGlscyBhbmQgR29sZCBsaW5rZXIKYXZhaWxhYmxlIGNvdWxk
IGFkanVzdCBpdC4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC70CC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 16:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AEBA84320;
	Tue,  4 Jun 2024 16:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWP695PILcZP; Tue,  4 Jun 2024 16:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1FB8432B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1FB8432B;
	Tue,  4 Jun 2024 16:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6821BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 16:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB97540132
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 16:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwRoToHFYtuj for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 16:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98D5C400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98D5C400F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98D5C400F8
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 16:18:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 18D1113F86A;
 Tue,  4 Jun 2024 18:18:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 18:18:20 +0200
Date: Tue, 4 Jun 2024 18:18:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zl8-TDOdLCh5dq42@landeda>
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda> <87a5k3ljy8.fsf@dell.be.48ers.dk>
 <874ja8g88f.fsf@dell.be.48ers.dk>
 <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717517905;
 bh=nKyxA9luCb5HG13LCFIexlWSPhtDpuVTe6iZOqv+Zwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BNuTeOj2kZTp3GOMDnHy462kzPRDaXJPCoJKkwow+ktooi+zTiRJoDbROsT5OPmB8
 TOFjqlCosq04z/CGGTWv3C5lQl0eriGFU9InLtRnsOhPZHNNzlKw4DzB7Yi3H0BdVM
 Pu0EzizvINp2OqMpjA/Js6b7DeRnTgdN2nM0LpkkltndpfP9h7jlOdO/7Yy1KK86hP
 SO7NNHxogE8Cp1brPmBEByUadcWM7COFmnmIEufYjDA0ZQJdnuWkOnuT4mcP0g9daV
 7bnMHk769OQsJT56neJQzxMNbJVp5oe/Mmls6kvWf/DK7GAoaJMXRXcanFiuTiBjOx
 NgJGw/LbwS/ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BNuTeOj2
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI0LTA2LTA0IDA4OjQ3IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gSXMgdGhpcyB0aGUgY29ycmVjdCB2ZXJzaW9uPyAoSSdtIG9u
IG15IHBob25lIGFuZCBkb24ndCBoYXZlIGEgY2hhbmNlIHRvIGNoZWNrCj4gcmlnaHQgbm93KS4K
PiBbMTVdaHR0cHM6Ly9taXJyb3Iuc2tpZmZvcy5jb20vZG9ja2VyLWNvbXBvc2UvZG9ja2VyLWNv
bXBvc2UtMi4yNy4wLWdvMi50YXIuZ3oKPiBJdCBzZWVtcyB0byBtZSB0aGF0IHRoZXJlIGlzIGEg
ZGlmZmVyZW5jZSBiZXR3ZWVuIGVpdGhlciBHbyB2ZXJzaW9ucyB2ZW5kb3IvCj4gZm9ybWF0IE9S
IHRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMgKGFtZDY0IG9yIGFy
bSkuwqAKPiBIb3BlZnVsbHkgd2UgY2FuIHRlbGwgdGhlIGRpZmZlcmVuY2UgZnJvbSB0aGUgdGFy
YmFsbCBhYm92ZQoKVGhlIGRlbHRhcyBhcmUgYWxsIG9mIHRoZSBmb3JtIG9mIHRoYXQgb25lOgoK
LS0tIGRvY2tlci1jb21wb3NlLTIuMjcuMC1nbzIudGFyLjQyZTlkMi5oZXggICAgMjAyNC0wNi0w
NCAxODowNzozMy41Mzg1ODg0OTUgKzAyMDAKKysrIGRvY2tlci1jb21wb3NlLTIuMjcuMC1nbzIu
dGFyLjQ0OGVhZi5oZXggICAgMjAyNC0wNi0wNCAxODowNzozOS43Mzc0MzcwNDMgKzAyMDAKQEAg
LTcsNyArNyw3IEBACiAwMDAwMDA2MCAgMDAgMDAgMDAgMDAgMzAgMzAgMzAgMzAgIDM2IDM0IDM0
IDAwIDMwIDMwIDMwIDMwIHwuLi4uMDAwMDY0NC4wMDAwfAogMDAwMDAwNzAgIDMwIDMwIDMwIDAw
IDMwIDMwIDMwIDMwICAzMCAzMCAzMCAwMCAzMCAzMCAzMCAzMCB8MDAwLjAwMDAwMDAuMDAwMHwK
IDAwMDAwMDgwICAzMCAzMCAzMCAzMCAzMCAzMCAzNSAwMCAgMzEgMzQgMzYgMzEgMzIgMzIgMzUg
MzMgfDAwMDAwMDUuMTQ2MTIyNTN8Ci0wMDAwMDA5MCAgMzIgMzMgMzYgMDAgMzAgMzEgMzQgMzEg
IDMxIDM1IDAwIDIwIDMwIDAwIDAwIDAwIHwyMzYuMDE0MTE1LiAwLi4ufAorMDAwMDAwOTAgIDMy
IDMzIDM2IDAwIDMwIDMxIDM1IDMzICAzNSAzNSAwMCAyMCAzMCAwMCAwMCAwMCB8MjM2LjAxNTM1
NS4gMC4uLnwKIDAwMDAwMGEwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgfC4uLi4uLi4uLi4uLi4uLi58CiAwMDAwMDBiMCAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIHwuLi4uLi4uLi4uLi4uLi4ufAogMDAw
MDAwYzAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCB8
Li4uLi4uLi4uLi4uLi4uLnwKQEAgLTE4LDggKzE4LDggQEAKIDAwMDAwMTEwICAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgfC4uLi4uLi4uLi4uLi4uLi58
CiAwMDAwMDEyMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIHwuLi4uLi4uLi4uLi4uLi4ufAogMDAwMDAxMzAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
ICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCB8Li4uLi4uLi4uLi4uLi4uLnwKLTAwMDAwMTQwICAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgfC4uLi4uLi4u
Li4uLi4uLi58Ci0wMDAwMDE1MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIHwuLi4uLi4uLi4uLi4uLi4ufAorMDAwMDAxNDAgIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICAwMCAzMCAzMCAzMCAzMCAzMCAzMCAzMCB8Li4uLi4uLi4uMDAwMDAwMHwKKzAw
MDAwMTUwICAwMCAzMCAzMCAzMCAzMCAzMCAzMCAzMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
fC4wMDAwMDAwLi4uLi4uLi58CiAwMDAwMDE2MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIHwuLi4uLi4uLi4uLi4uLi4ufAogMDAwMDAxNzAgIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCB8Li4uLi4uLi4uLi4u
Li4uLnwKIDAwMDAwMTgwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgfC4uLi4uLi4uLi4uLi4uLi58CgpUaGUgLS0tIGlzIHRoZSBhcmNoaXZlIFBldGVy
IGFuZCBJIGdlbmVyYXRlZCwgdGhlICsrKyBpcyB5b3Vycy4KCldoYXQgdGhpcyBzaG93cywgaXMg
dGhhdCB0aGUgZGV2IG1ham9yL21pbm9yIGZpZWxkcyBhcmUgTlVMcyBmb3IgdXMsCndoaWxlIHRo
ZXkgYXJlIDAgKHplcm8pLCBBU0NJSSAweDMwKSBpbiB5b3VyIGNhc2UuCgpUaGlzIGlzIGV4YWN0
bHkgdGhlIGNoYW5nZSB0aGF0IHdlbnQgaW4gaW4gdGFyIDEuMzU6IG91ciBhcmNoaXZlcyB3ZXJl
CmdlbmVyYXRlZCB3aXRoIHRhciAxLjM1LCB5b3VycyB3aXRoIGFuIG9sZGVyIHRhciAocHJlc3Vt
YWJseSwgMS4zNCkuCgpQZXRlciBoYWQgYSBzaW1pbGFyIGlzc3VlLCBhcyBoZSB1c2VkIHRvIHNl
dCB0aGUgVEFSIGVudmlyb25tZW50CnZhcmlhYmxlIHRvIHBvaW50IHRvIGEgcHJlLWJ1aWx0IHRh
ciAxLjM1LCBsaWtlIHNvOgoKICAgICQgVEFSPXRhci0xLjM1IG1ha2Ugc291cmNlCgpBcmUgeW91
IGRvaW5nIHNvbWV0aGluZyBzaW1pbGFyIGJ5IGNoYW5jZT8KCkluIGFueSBjYXNlLCB0aGUgaGFz
aCBQZXRlciBhbmQgSSBnZXQgaXMgdGhlIGNvcnJlY3Qgb25lLCB5b3VycyBoYWQgYQpmbHVrZS4u
LgoKVGhhbmtzIGZvciBwcm92aWRpbmcgeW91ciB0YXJiYWxsLCBpdCBoZWxwZWQgcmlnaHQgYXdh
eSEg8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C87CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE051607C1;
	Tue,  3 Sep 2024 21:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlwmISeJAiEF; Tue,  3 Sep 2024 21:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F94F607C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F94F607C3;
	Tue,  3 Sep 2024 21:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0A381BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE5E180F75
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP__L9jyYHG5 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77C9480EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C9480EB9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77C9480EB9
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:43:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 09C6F13F861;
 Tue,  3 Sep 2024 23:43:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 23:43:42 +0200
Date: Tue, 3 Sep 2024 23:43:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZteDDiXI7HIKpLP4@landeda>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
 <20240901-rgbmatrix-v2-1-3a10c3c367e4@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901-rgbmatrix-v2-1-3a10c3c367e4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725399829;
 bh=OScJmDvGAsfNCT62xc/qlbApQAmVSkZs1tQgDw46PHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkg1qMusd7Nhyw1d9jSQ7Tl3cm4tECIU74B7aEQLMaV0zz8ti9wm+8HKVUMLFjLew
 Kdb/ziDv2og9i7y9wTTnig/jKlYYsnto1MvN03GtoUI306/18pfY1hNCt76Cokyp9R
 2FovzpeFlTI+W8bVxcH1U1TTP/1+ZSYQF2iQuzxy7NG2bnnEkK6xYHkBMJt94LOdI3
 z81zjugxLopW1P0ShpPQS20M00zT7thYpfyDK29SuwaJTaiaOR3QueNnB13+PCGZMO
 MXe2r3xa0Z1u4MJD/gLU5ieBmsCt1S8W4FxVcCUClUDfta+wf0blRUuTGsad26cvW2
 oqhcOFG6IBgKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bkg1qMus
Subject: Re: [Buildroot] [PATCH v2 1/3] package/rpi-rgb-led-matrix: update
 to latest commit
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cApKLiwgQWxsLAoKT24gMjAyNC0wOS0wMSAxNjoyOSArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhlIHJwaS1yZ2ItbGVkLW1hdHJpeCBwcm9qZWN0
IGRvZXNuJ3QgaGF2ZSB0YWdnZWQgcmVsZWFzZXMsIHNvIHRoaXMKPiBwYXRjaCB1cGRhdGVzIHRo
ZSBwYWNrYWdlIHRvIHRoZSBsYXRlc3QgY29tbWl0IG9uIHRoZSBtYXN0ZXIgYnJhbmNoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4g
LS0tCj4gIHBhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5oYXNo
IHwgMiArLQo+ICBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgu
bWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1y
Z2ItbGVkLW1hdHJpeC5oYXNoIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1s
ZWQtbWF0cml4Lmhhc2gKPiBpbmRleCAyNjVlNGM0MjQ5Li5lZTZjNTBkZWUwIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5oYXNoCj4g
KysrIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lmhhc2gK
PiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+IC1zaGEyNTYgIDQ5MGNh
NmZhMGM4MTQ1MWYyNDcyYjRhYTg1Nzk2YTg3Njc5MGYyZTIxMmJmMDg4MmUzYmI3Y2FmNWM0N2Uy
YzMgIHJwaS1yZ2ItbGVkLW1hdHJpeC1hNTYzMzhkYjBmMDAzZDUyMzZmMmNlOThjNzNhNTkxZDY0
YTcwODUyLnRhci5nego+ICtzaGEyNTYgIDlhNmRhNWIwYWQ3MzA4ODNhNWZhMThhZmM1OWIxMjk3
YjRiMDVlYjU4MWMyYzE0YWU1MGEzNTgzMjk2YTRiZWQgIHJwaS1yZ2ItbGVkLW1hdHJpeC1mNTU3
MzZmNzU5NWJjMDI4NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJjLnRhci5nego+ICBzaGEyNTYgIDgx
NzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4
ODA2NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgv
cnBpLXJnYi1sZWQtbWF0cml4Lm1rIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJn
Yi1sZWQtbWF0cml4Lm1rCj4gaW5kZXggNDk5ZmI0MDhjMi4uNTM0MDg5OTZhMyAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsKPiAr
KysgYi9wYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IAo+IC1SUElf
UkdCX0xFRF9NQVRSSVhfVkVSU0lPTiA9IGE1NjMzOGRiMGYwMDNkNTIzNmYyY2U5OGM3M2E1OTFk
NjRhNzA4NTIKPiArUlBJX1JHQl9MRURfTUFUUklYX1ZFUlNJT04gPSBmNTU3MzZmNzU5NWJjMDI4
NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJjICAjIDIwMjQtMDgtMTgKCkRvbid0IGFkZCBhIGNvbW1l
bnQgYXQgdGhlIGVuZCBvZiBhbiBhc3NpZ25tZW50LCBpdCBjYXVzZXMgYWxsIHNvcnRzIG9mCnRy
b3VibGU7IHNlZSBjb21taXQgMzc1NzI4ZDA1MTNiIChtYW51YWw6IGRvbid0IHVzZSBhIGNvbW1l
bnQgYXQgdGhlIGVuZApvZiB0aGUgdmVyc2lvbiB2YXJpYWJsZSBhc3NpZ25tZW50KS4KCkkndmUg
ZHJvcHBlZCB0aGF0LCBhbmQgQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKPiAgUlBJX1JHQl9MRURfTUFUUklYX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGh6
ZWxsZXIscnBpLXJnYi1sZWQtbWF0cml4LCQoUlBJX1JHQl9MRURfTUFUUklYX1ZFUlNJT04pKQo+
ICBSUElfUkdCX0xFRF9NQVRSSVhfTElDRU5TRSA9IEdQTC0yLjAKPiAgUlBJX1JHQl9MRURfTUFU
UklYX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gCj4gLS0KPiAyLjQ1LjIKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

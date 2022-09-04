Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7CECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9835F4056D;
	Sun,  4 Sep 2022 07:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9835F4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_00v1EUAUZt; Sun,  4 Sep 2022 07:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B1F240569;
	Sun,  4 Sep 2022 07:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1F240569
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66EDB1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F64F80CE0
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F64F80CE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQqJ8DeAjX83 for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247EE80C58
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 247EE80C58
 for <buildroot@busybox.net>; Sun,  4 Sep 2022 07:43:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4ec6:5d03:99e:22c7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7904413F8B3;
 Sun,  4 Sep 2022 09:43:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 09:43:01 +0200
Date: Sun, 4 Sep 2022 09:43:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220904074301.GS68979@scaer>
References: <20220903135851.2001980-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903135851.2001980-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662277383;
 bh=+qijKlfC7SBMyAu9/foOFXchtbxdD0j869KO1LD+Smw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I7h7y6/HbcK/f9r6nWZ0yQlLrEPJ1K3JK5w33aWgVWKhBqBG3ZrPz3SVrzhv40b4l
 cJ1dZrdG1CcCHyzt+1iUPPYJZb7TFYMgJVXRfscigJG/nhr732D+slfFjj3eePZdZM
 EB0VrPPk7MR8GhSjeGnmgrsbteXoeXYkTnLod6bG6CSn+NpPCt0fA8rMWQm4HTznXB
 0MfNBpaOMJcHrGslqhyHJKClSrIRPyU9i5s4D2dPln46PqfUEN1NWlVD9AAsv3VWXw
 BCbz7ZbeHzJc0FXcCDlDUYDpYcTwgQWtsgN1nglH1X/WEKxEugeQbMZDMtmLbApz6R
 DP86un6VEqFGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I7h7y6/H
Subject: Re: [Buildroot] [PATCH] package/luasec: bump to version 1.2.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA5LTAzIDE1OjU4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGRpZmYgTElDRU5TRToKPiAtTHVhU2VjIDEuMC4yIGxpY2Vuc2UK
PiAtQ29weXJpZ2h0IChDKSAyMDA2LTIwMjEgQnJ1bm8gU2lsdmVzdHJlLCBVRkcKPiArTHVhU2Vj
IDEuMi4wIGxpY2Vuc2UKPiArQ29weXJpZ2h0IChDKSAyMDA2LTIwMjIgQnJ1bm8gU2lsdmVzdHJl
LCBVRkcKClRoaXMgZGlmLWxpa2UgZ290IHBhdGNod29yayBjb25mdXNlZDoKICAgIGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA5MDMxMzU4
NTEuMjAwMTk4MC0xLWZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZy8KCkZvcnR1YXRlbHkgaXQgc2Vl
bXMgZ2l0LWFtIG1hbmFnZWQgYmV0dGVyLiA6LSkKCkFwcGxpZWQgdG8gbmV4dCwgYWZ0ZXIgcmV3
cml0aW5nIHRoZSBjb21taXQgbG9nIHRvIG5vdCBpbmNsdWRlIGEKZGlmZi1saWtlIGJsdXJiLCB0
aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29p
cyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiAtLS0KPiAgcGFja2FnZS9sdWFz
ZWMvbHVhc2VjLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9sdWFzZWMvbHVhc2VjLm1rICAgfCAy
ICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YXNlYy9sdWFzZWMuaGFzaCBiL3BhY2thZ2UvbHVh
c2VjL2x1YXNlYy5oYXNoCj4gaW5kZXggMWUzODE2MTJiLi4zYzJiN2Q4MDMgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9sdWFzZWMvbHVhc2VjLmhhc2gKPiArKysgYi9wYWNrYWdlL2x1YXNlYy9sdWFz
ZWMuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIGNvbXB1dGVkIGJ5IGx1YXJvY2tzL2J1aWxk
cm9vdAo+IC1zaGEyNTYgIDdlZDVkMDhhYWQ4ZjBlODY1OWFiYjNmNDNjOTM1ZGExYzg5ODQ3NGQ0
ZGMxMjFlOWVkZmJlYWU1YzRjNjdmYjAgIGx1YXNlYy0xLjAuMi0xLnNyYy5yb2NrCj4gLXNoYTI1
NiAgODQzNzZiYWYzM2NlZmJjYzFlOWFkYmNhMjNmY2Y4N2Y1MWMxMTA3OTU2NjYwY2RhMjg4MGZl
YWVmODZkNjA3NSAgbHVhc2VjL0xJQ0VOU0UKPiArc2hhMjU2ICA4MmQ5ZWE3ZDExNjg4YTJiMTFm
YzFjNDU0OWEyZTdiMGFjYTAwNzkwYjQ5ZTY3YTQxZGFjMGM4MWYyODkwZjFjICBsdWFzZWMtMS4y
LjAtMS5zcmMucm9jawo+ICtzaGEyNTYgIGJiZjczZTIzZWFlN2RmNTdhNGM0ZmYzM2JjMjNjNDFh
MmRjNGY4NzA3YmEzMzIzNWMyMDI2ZDIwYjQxNDA1YTcgIGx1YXNlYy9MSUNFTlNFCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbHVhc2VjL2x1YXNlYy5tayBiL3BhY2thZ2UvbHVhc2VjL2x1YXNlYy5t
awo+IGluZGV4IDRhY2U5NGQxNi4uYzdmM2E5NGQ5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVh
c2VjL2x1YXNlYy5tawo+ICsrKyBiL3BhY2thZ2UvbHVhc2VjL2x1YXNlYy5tawo+IEBAIC00LDcg
KzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MVUFTRUNfVkVS
U0lPTiA9IDEuMC4yLTEKPiArTFVBU0VDX1ZFUlNJT04gPSAxLjIuMC0xCj4gIExVQVNFQ19TVUJE
SVIgPSBsdWFzZWMKPiAgTFVBU0VDX0xJQ0VOU0UgPSBNSVQKPiAgTFVBU0VDX0xJQ0VOU0VfRklM
RVMgPSAkKExVQVNFQ19TVUJESVIpL0xJQ0VOU0UKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19f
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

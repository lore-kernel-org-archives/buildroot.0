Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8965BEE499C
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C1A41979;
	Wed, 11 Sep 2024 19:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUp-YOIx_YLz; Wed, 11 Sep 2024 19:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36DE41971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36DE41971;
	Wed, 11 Sep 2024 19:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF81E1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEC2360B3A
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaE4hrTwb2n9 for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73D406068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D406068F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D406068F
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:14:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 471E96013A;
 Wed, 11 Sep 2024 21:14:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 11 Sep 2024 21:14:10 +0200
Date: Wed, 11 Sep 2024 21:14:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZuHsAuNMmEMyrVjy@landeda>
References: <20240910193641.1711056-1-james.hilliard1@gmail.com>
 <ZuHJBtCNOIRW68wi@landeda>
 <CADvTj4oQkSEWKbpMg6fy7QtRHS8AXioxezxX_FcfxMpOcNbtBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oQkSEWKbpMg6fy7QtRHS8AXioxezxX_FcfxMpOcNbtBg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726082054;
 bh=CIGF3ayTXlif46qjWwCqO9+/ssmPlZwvQas0JcLq6L4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UeFjtJoetTSGu3p29zk8q8R6kUSoB66IyYO7HOva64+jspa2YyA5Jf7Q9dDcXsEcq
 vWX+7C0OnIDbtUpMY8NS+gWY3+HHr0LId4OrhaKTsp7TS0qqq0woObf0r5TMZMpX9F
 p4+odxEejPzyjtvZqLjlj3lD++FXjoONxsF92D2aYtsOr+ZtLMXWWnch+ARrh4WtO9
 YVaIr9yCieZqm+w+tSN0KJHYU5kRE2SNqox7f7vn+/10spLcAFHGcrIlsGmby3yKjH
 np98OLMIwMeXCypiHwGeHKgdpthj7Zvx486rWotYIBVie9UARGPrCGEgtl62j+MD7v
 lEXoAe4gI6ITw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UeFjtJoe
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: link host systemd
 utilities statically
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDktMTEgMTE6MDcgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAxMDo0NOKAr0FNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjQtMDktMTAg
MTM6MzYgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+ID4gVGhpcyBtYWtl
cyBpdCBsZXNzIGxpa2VseSB0aGF0IHdlIHdpbGwgcnVuIGludG8gbWlzc2luZyBsaWJyYXJ5Cj4g
PiA+IGVycm9ycyB3aGVuIHJ1bm5pbmcgaG9zdCBzeXN0ZW1kIHV0aWxpdGllcwo+ID4gV2hhdCBl
cnJvciBleGFjdGx5IGFyZSB5b3UgdHJ5aW5nIHRvIGZpeCBoZXJlPwpbLS1TTklQLS1dCj4gPiBM
ZXQgbWUgZ3Vlc3MuIFlvdSBhcmUgaGl0dGluZyB0aGUgc2FtZSBpc3N1ZSBhcyByZXBvcnRlZCB0
aGVyZToKPiA+ICAgICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9pc3N1ZXMvMzkKPiBZZWFoLCBsb29rcyBsaWtlIHRoZSBzYW1lIGlzc3VlLCBJIGhhZG4ndCBy
ZWFsbHkgaXNvbGF0ZWQgaXQgZnVsbHkKPiBidXQgaGFkIHNlZW4gaXNzdWVzIHJlbGF0ZWQgdG8g
dGhpcyBpbiB0aGUgcGFzdCB3aGVuIHdvcmtpbmcKPiBvbiBhIGRpZmZlcmVudCBwYXRjaCBzZXJp
ZXMgaW52b2x2aW5nIHVzaW5nIG1lc29uJ3MgbmF0aXZlIGluc3RhbGwuCgpJdCB3b3VsZCBiZSBn
b29kIGluZGVlZCBpZiBhdCBzb21lIHBvaW50IHdlIGNvdWxkIGdldCByaWQgb2Ygb3VyIFJQQVRI
CmhhY2sgaW4gaG9zdC1zeXN0ZW1kLiBIb3dldmVyLCBwbGVhc2UgcmV2aWV3IHRoZSBjb21taXQg
bG9nIGZvcgozNWMxMWEwMjdjODggKHBhY2thZ2Uvc3lzdGVtZDogYWRkIGhvc3QgdmFyaWFudCkg
dGhhdCBleHBsYWlucyBhdCBsZW5ndGgKd2h5IHdlIGFyZSBkb2luZyBpdC4KCj4gPiBJZiBzbywg
dGhlbiBJIHRoaW5rIHlvdXIgcGF0Y2ggaXMganVzdCBoaWRkaW5nIHRoZSBkdXN0IHVuZGVyIHRo
ZSBydWcuCj4gPiBJbmRlZWQsIGl0IGlzIHBvc3NpYmxlIHRoYXQgb3RoZXIgcGFja2FnZXMgc3Vm
ZmVyIGZyb20gdGhlIHNhbWUgaXNzdWUsCj4gPiBhbmQgd2UgY2VydGFpbmx5IGRvIG5vdCB3YW50
IHRvIGJ1aWxkIGFsbCBzdWNoIHBhY2thZ2VzIHN0YXRpY2FsbHkuCj4gSSB0aG91Z2h0IHRoaXMg
d2FzIGdlbmVyYWxseSBvbmx5IGFmZmVjdGluZyBzeXN0ZW1kLgoKRXZlbiBpZiBjdXJyZW50bHkg
YWZmZWN0cyBvbmx5IHN5c3RlbWQsIHRoZSBpc3N1ZSBpcyByZWFsbHkgZ2VuZXJpYyxhbmQKSSBo
YXZlIHNlbnQgYSBwYXRjaCB0byBhY3R1YWxseSBmaXggdGhlIHJvb3QgY2F1c2U7CgogICAgaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDkx
MTE5MDkwMC45ODI0NjEtMS15YW5uLm1vcmluLjE5OThAZnJlZS5mci8KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK

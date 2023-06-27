Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD56EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 20:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C64A540BBC;
	Tue, 27 Jun 2023 20:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64A540BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH_Y_HY3X7Qu; Tue, 27 Jun 2023 20:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB4040BA7;
	Tue, 27 Jun 2023 20:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB4040BA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F14D51BF33F
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 20:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7E9C60B24
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 20:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E9C60B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Y4DxFeAiZTV for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 20:39:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8985B60A9A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8985B60A9A
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 20:39:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:18c3:b0f7:15f8:b6d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6F17DB0052C;
 Tue, 27 Jun 2023 22:39:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Jun 2023 22:39:36 +0200
Date: Tue, 27 Jun 2023 22:39:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230627203936.GJ646621@scaer>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-7-bmeng.cn@gmail.com>
 <20230626171047.GE646621@scaer>
 <CAEUhbmW47WVOM+Zhxa4=T4tgumKU+koEcf+QfivjsUGsUZj2Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEUhbmW47WVOM+Zhxa4=T4tgumKU+koEcf+QfivjsUGsUZj2Dw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687898382;
 bh=eOCdS9IkeAg11HNBu10Lg1a+XKDo0phFc9XEZk+S9KY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AYolsIPSPgouS2W86NnlH/fiq0MFIoEMdKCG6sfB7Ir9g6NAlPXxeqtirkiVk05IM
 91Fy67t6Z/7I3FGV82Bjv90FidH01e2NY7YgKDGzJQkgiROnlGvr/ubaxVweNgUkpz
 PA9+4uN+4+MVuCVSfUXuGj5OGJX2+VH21PIAr2V6dWLXi/UPJZOyuHL264BqRkvTRo
 UGQVS8kTC5VDNzqjC7y8v+nefPb18LsU5XwsBGtd2ohXa8yfxdMdLdHo44zGqFT/SI
 DWVTwwlYSwW+kEwWTsxMstVPqD3au8DtPLrFn774LEGbfOcZfwsGK+fUmIPTr/+VdH
 oCUwsdiew/NFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AYolsIPS
Subject: Re: [Buildroot] [PATCH 06/10] configs: riscv: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmluLCBBbGwsCgpPbiAyMDIzLTA2LTI3IDEwOjExICswODAwLCBCaW4gTWVuZyBzcGFrZSB0aHVz
bHk6Cj4gT24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMToxMOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjMtMDYtMjcgMDA6MDAgKzA4
MDAsIEJpbiBNZW5nIHNwYWtlIHRodXNseToKPiA+ID4gRnJvbTogQmluIE1lbmcgPGJtZW5nQHRp
bnlsYWIub3JnPgo+ID4gPiBTaW5jZSBjb21taXQgNjRmMWY4MjM4NWIyICgiYm9vdC9vcGVuc2Jp
OiBCdW1wIHRvIHZlcnNpb24gMS4yIiksCj4gPiA+IHRoZSBkZWZhdWx0IE9wZW5TQkkgdmVyc2lv
biBoYXMgYmVlbiBidW1wZWQgdXAgdG8gMS4yLiBXaXRoIHRoYXQsCj4gPiA+IHRoZXJlIGlzIG5v
IG5lZWQgdG8gZGVmaW5lIGEgY3VzdG9tIHZlcnNpb24gaW4gZWFjaCBSSVNDLVYgYm9hcmQncwo+
ID4gPiBkZWZjb25maWcgZmlsZXMuCj4gPiBJbiBmYWN0LCBubywgYmVjYXVzZSBvcGVuc2JpIGlz
IGEgImNyaXRpY2FsIiBjb21wb25lbnQgcGFydCBvZiB0aGUgYm9vdAo+ID4gY2hhaW4gYW5kLCBs
aWtlIHVib290IG9yIHRoZSBrZXJuZWwsIHdlIHdhbnQgdG8gcGluIHRoZSB2ZXJzaW9uIHdlIHVz
ZQo+ID4gaW4gZGVmY29uZmlnIGZpbGVzLiBXZSBvbmx5IHdhbnQgdGhlIHYgZXJzaW9uIHRvIGJl
IGJ1bXBlZCBpbiBkZWZjb25maWcsCj4gPiB3aGVuIHNvbWVvbmUgYWN0dWFsbHkgdGVzdGVkIHRo
ZSBkZWZjb25maWcgc3RpbGwgZ2VuZXJhdGVzIGEgYm9vdGFibGUKPiA+IHN5c3RlbS4KPiBNYWtl
cyBzZW5zZSB0byBtZS4KPiBCdXQgSSB3b3VsZCBhcmd1ZSBhdCBsZWFzdCB3ZSBzaG91bGQgdXBk
YXRlCj4gcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmlnIGFuZCBxZW11X3Jpc2N2NjRfdmlydF9k
ZWZjb25maWcgdG8gdXNlIHRoZQo+IGxhdGVzdCBPcGVuU0JJIGR1ZSB0byB0aGUgcmVhc29uIHRo
YXQ6Cj4gMS4gdGhleSBhcmUgdGhlIG1haW4gcGxhdGZvcm1zIHRvIGRldmVsb3AgYW5kIHRlc3Qg
T3BlblNCSQo+IDIuIGxhdGVzdCBPcGVuU0JJIGJpbmFyaWVzIHdpbGwgYWx3YXlzIGJlIGludGVn
cmF0ZWQgaW50byBRRU1VIGFzIHRoZQo+IGRlZmF1bHQgYmlvcwo+IHRob3VnaHRzPwoKRm9yIHRo
ZSBxZW11IGRlZmNvbmZpZ3MsIEkgd291aWxkIGluZGVlZCB1bmRlcnN0YW5kIHRoYXQgd2UgdXNl
IHRoZQpsYXRlc3QgdmVyc2lvbjsgdGhlIHJhdGlvbmFsZSBsb29rcyBzb3VuZC4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
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

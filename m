Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1901CE748FC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B074A415A2;
	Mon,  2 Oct 2023 17:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B074A415A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qz_mX4Gl4Irg; Mon,  2 Oct 2023 17:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDC1341590;
	Mon,  2 Oct 2023 17:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC1341590
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98731BF3B9
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34E541588
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34E541588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ir0Ne-hl8tow for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 17:33:23 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A65040531
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 17:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A65040531
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:71b1:17da:abc1:f019])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 08BFE60142;
 Mon,  2 Oct 2023 19:33:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Oct 2023 19:33:10 +0200
Date: Mon, 2 Oct 2023 19:33:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20231002173310.GA2957@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230806141506.GS421096@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806141506.GS421096@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696268000;
 bh=R6ku3V3vlD+BLG8AHwznShmJmERNFfauFIMXyzCJhms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2ioIdUaD8XzLDzCNjnvSMXRFsdRgbIAjqqvWiT386BBZiigvtE3j/8USGgX+3I5c
 R55yKcIzLc67VV7zddIJ5+NuX1rZj+bGo1XFk3/h4FJ5WG0dL8wHsSWLQNBbJKa6T3
 SlSs7KKgzW7qPx1eLQL/iH6/sRagkb/rMl10rU0RYeV1wzd2XEdRAZ45HksN+wtmYN
 hp/k63BOnzqwHPeKKCmGHTommO8ldLn7r1f98487PzaFASjmtKiRWhUeilWSDApMYL
 MGhOHXjulpgKxDLYnrAqZatqIcmg/lD9zk+XQmMzCmNQOHMxtJ+TD6txphpjcldKXP
 6M9hA5GgQJQcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l2ioIdUa
Subject: Re: [Buildroot] [PATCH v6 1/4] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTA4LTA2IDE2OjE1ICswMjAwLCBZYW5uIEUuIE1PUklOIHNw
YWtlIHRodXNseToKPiBPbiAyMDIzLTA4LTAyIDEzOjE0ICswMjAwLCBUaG9tYXMgRGV2b29nZHQg
c3Bha2UgdGh1c2x5Ogo+ID4gRnJvbTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRA
YmFyY28uY29tPgo+ID4gQ21ha2Ugc3VwcG9ydHMgbXVsdGlwbGUgZ2VuZXJhdG9ycy4gTmluamEg
aXMgYSBzbWFsbCBidWlsZCBzeXN0ZW0gd2l0aCBhCj4gPiBmb2N1cyBvbiBzcGVlZC4gSXQgaXMg
bWFpbmx5IHVzZWQgd2l0aCB0aGUgbWVzb24gYnVpbGQgc3lzdGVtLCBidXQgYWxzbwo+ID4gY21h
a2UgaGFzIHZlcnkgZ29vZCBzdXBwb3J0IGZvciBpdC4gVGhpcyBhZGRzIG9wdGlvbmFsIHN1cHBv
cnQgZm9yIHRoZQo+ID4gTmluamEgYnVpbGQgc3lzdGVtLgpbLS1TTklQLS1dCj4gUGxlYXNlIHJl
dmlldyB0aGUgbmV3IGNvZGUuIElmIEkgYnJva2Ugc29tZXRoaW5nLCBwbGVhc2Ugc2VuZCBmb2xs
b3d1cAo+IGZpeHVwIHBhdGNoZXMgd2l0aCBhcHByb3ByaWF0ZSBleHBsYW5hdGlvbnMgKHRoZXJl
J3MgYSBraW5kIG9mIGTDqWrDoC12dQo+IGhlcmUuLi4pCgpXaGlsZSByZXZpZXdpbmcgYW5vdGhl
ciBwYXRjaCwgSSBub3cgbm90aWNlZCB0aGF0IHdlIGRpZCBsb3NlIHNvbWV0aGluZwp3aXRoIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgdGhpcyBuaW5qYSBiYWNrZW5kLiB0aGF0IEkgdG90YWxseSBtaXNz
ZWQgd2hlbgpJIGFwcGxpZWQgaXQuCgpJbmRlZWQsIHByZXZpb3VzbHksIHRoZSBpbnN0YWxsIHN0
ZXAgd2FzIGRvbmUgd2l0aCB0aGUgaW5zdGFsbC9mYXN0CnJ1bGU6CgogICAgJCgyKV9JTlNUQUxM
X1NUQUdJTkdfT1BUUyAgICAgID89IERFU1RESVI9JCQoU1RBR0lOR19ESVIpIGluc3RhbGwvZmFz
dAogICAgJCgyKV9JTlNUQUxMX1RBUkdFVF9PUFRTICAgICAgID89IERFU1RESVI9JCQoVEFSR0VU
X0RJUikgaW5zdGFsbC9mYXN0CgpCdXQgdGhpcyBnb3QgcmVtb3ZlZCB3aXRoIHlvdXIgcGF0Y2gs
IHdpdGggbm90aGluZyB0byByZXBsYWNlIGl0LgoKU2VlIGNvbW1pdCBkZmNjMThmODRiMGQgKHBr
Zy1jbWFrZTogU2tpcCBjb21waWxhdGlvbiBpbiBpbnN0YWxsYXRpb24Kc3RlcCkgZm9yIHRoZSBy
YXRpb25hbGUgb2YgdXNpbmcgaW5zdGFsbC9mYXN0LgoKQ291bGQgeW91IGxvb2sgaW50byByZXN0
b3JpbmcgdGhpcywgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0t
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

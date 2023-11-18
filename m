Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ACFC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4953417A8;
	Sat, 18 Nov 2023 14:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4953417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiciCdnF5_V0; Sat, 18 Nov 2023 14:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1329841685;
	Sat, 18 Nov 2023 14:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1329841685
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1C991BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D870181F88
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D870181F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6D7M4Ph-1dXR for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:23:03 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6E481F31
 for <buildroot@busybox.net>; Sat, 18 Nov 2023 14:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6E481F31
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0041E780506;
 Sat, 18 Nov 2023 15:22:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:22:59 +0100
Date: Sat, 18 Nov 2023 15:22:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231118142259.GX996011@scaer>
References: <20231115163903.445858-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115163903.445858-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700317382;
 bh=nV/tjqb0iQG/a5LwGTeGpqTeNjuxJRAjqbC9vppfpcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQUBQVGVBnDz290Tncps9+nh70rTN8eW3It0c99G2Ol3mOyfDUwRa5oHmZ2A2ww3X
 z9Dh2sCSEOGv0jPfiZo3SuTGnEzaKI74eT+lKEB0TWB2nWqENTamGwvgj5u5YENADy
 iFZsqokU/MnOuGbkzux5ZLc+iNwwKffD416pciY0bHhYofqTUi03pUMb4MrZa/S1Yl
 TJsEsm+KEjJMvnFVfLe8s4dD6AMSWL7cBQWa/f0AwGRSNuXRJja4IKPgvSEOXkQJoh
 gT9Ep80UPDlQdk4ZFfFSgNhNtbxf8G8HSNlSENPNUX94Z2VjvwUykm8xMspGEwANdl
 3DAw40w3mhecg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IQUBQVGV
Subject: Re: [Buildroot] [PATCH 1/2] package/lualdap: bump to version 1.4.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTExLTE1IDE3OjM5ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQm90aCBhcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YWxkYXAvbHVhbGRhcC5oYXNo
IHwgMiArLQo+ICBwYWNrYWdlL2x1YWxkYXAvbHVhbGRhcC5tayAgIHwgMiArLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9sdWFsZGFwL2x1YWxkYXAuaGFzaCBiL3BhY2thZ2UvbHVhbGRhcC9sdWFsZGFw
Lmhhc2gKPiBpbmRleCA5N2FhM2I1NzAuLjYyZDhkMjBhYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2x1YWxkYXAvbHVhbGRhcC5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWFsZGFwL2x1YWxkYXAuaGFz
aAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIGNvbXB1dGVkIGJ5IGx1YXJvY2tzL2J1aWxkcm9vdAo+
IC1zaGEyNTYgIGMxNzcyMDc3ZWJmZDAyZTA4MmU4OTU4MzcwMWVmMjdkZDM0OGRjNzZhZTAxNTI0
N2YyMWEyNzU2ZjVmYWMwYWUgIGx1YWxkYXAtMS4zLjEtMS5zcmMucm9jawo+ICtzaGEyNTYgIDg2
NWI5MTVhM2ZmMTZiOTY2M2I3NmE3N2U4OWVjNTRhNTAyOGNjZmU5NWU4NWFkNzA0ZWZiYWExNDRh
NjA4ZjggIGx1YWxkYXAtMS40LjAtMS5zcmMucm9jawo+ICBzaGEyNTYgIGI5Yjc1ZGExOGQxZTEx
NDdlYzQ3YmZmNTA4ZmZkY2U4MzFkYTA3ZGMzNzE4OTFiOTA1N2NmMWM0MjI2NjBhZjQgIGx1YWxk
YXAvZG9jcy9saWNlbnNlLm1kCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhbGRhcC9sdWFsZGFw
Lm1rIGIvcGFja2FnZS9sdWFsZGFwL2x1YWxkYXAubWsKPiBpbmRleCAzNzU3NTQxODAuLmE2ZmM2
MTJiNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YWxkYXAvbHVhbGRhcC5tawo+ICsrKyBiL3Bh
Y2thZ2UvbHVhbGRhcC9sdWFsZGFwLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxVQUxEQVBfVkVSU0lPTiA9IDEuMy4xLTEKPiArTFVB
TERBUF9WRVJTSU9OID0gMS40LjAtMQo+ICBMVUFMREFQX1NVQkRJUiA9IGx1YWxkYXAKPiAgTFVB
TERBUF9MSUNFTlNFID0gTUlUCj4gIExVQUxEQVBfTElDRU5TRV9GSUxFUyA9ICQoTFVBTERBUF9T
VUJESVIpL2RvY3MvbGljZW5zZS5tZAo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

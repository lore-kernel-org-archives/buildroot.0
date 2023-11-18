Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402DC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC5440238;
	Sat, 18 Nov 2023 14:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC5440238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Dih2ofMhHkc; Sat, 18 Nov 2023 14:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E3C40201;
	Sat, 18 Nov 2023 14:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E3C40201
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC5FA1BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A605C80C58
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A605C80C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QS7BnIEgY_8 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:19:52 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B72EF80BB1
 for <buildroot@busybox.net>; Sat, 18 Nov 2023 14:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72EF80BB1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 60E24780375;
 Sat, 18 Nov 2023 15:19:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:19:47 +0100
Date: Sat, 18 Nov 2023 15:19:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231118141947.GV996011@scaer>
References: <20231116193311.449783-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231116193311.449783-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700317189;
 bh=40/KwhHLiW3oJ94FSPDGtiKxLAZ482U9rGq8X/AHgYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HO4JmsnJMVbznp4/P0Jwa7EKj0xoVQHAyj0c7Ch5Q0Hqe6dRf4yoKwYJaVetjBCIS
 rHi+b1Wmtjxw31Sz1bD8gZ4LVZYNzsvceDadnQxeTQEG1lRy9bFAWKvKeAzyMz/ynD
 KsZPQiRQAWRaoT6ytWcaaiLjirMaScoBmoLzqkaaxg+fNcStTIEdxQwSah/WCFroBn
 nhQAm19ZJw3UXeDGE4Av2JN/7nqm5OIQN27IKHFNdhbL8naBEFN8nMaijJqS9jJ3i8
 pvhDXJGa4V23Cw8k2VS1gyaczMZ83MvI2iLQVNvPh6pbUSSmm+cbiV+nelrWgX3zcG
 CCjDy9gM2iY6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HO4JmsnJ
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.8
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTExLTE2IDIwOjMzICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLmhhc2gg
fCAyICstCj4gIHBhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0MS5tayAgIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLmhhc2ggYi9wYWNrYWdlL29wZW42MjU0
MS9vcGVuNjI1NDEuaGFzaAo+IGluZGV4IDk0MWFhZGY0ZS4uMzUwOGNiYjE0IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0MS5oYXNoCj4gKysrIGIvcGFja2FnZS9vcGVu
NjI1NDEvb3BlbjYyNTQxLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKPiAtc2hhMjU2ICA0MTA2MDNiMGU1Njc5NzBkNzE0OGM2ZTljOTFjY2FiZWVkZWI0ZjMy
NzgwYmU4NTljZDJhNGFhYzA4Y2I1YjllICBvcGVuNjI1NDEtdjEuMy43LWJyMS50YXIuZ3oKPiAr
c2hhMjU2ICA0MWU4MmQ4MWQyZmM5NDQ5MDI4ZGFiMzFmZDQ2MGRmMWRhMjkxMzBiY2I3Mzg4MjIy
ODQyZTc3OGNmMzQ2MjVjICBvcGVuNjI1NDEtdjEuMy44LWJyMS50YXIuZ3oKPiAgc2hhMjU2ICBm
YWIzZGQ2YmRhYjIyNmYxYzA4NjMwYjFkZDkxN2UxMWZjYjRlYzVlMWUwMjBlMmMxNmY4M2EwYTEz
ODYzZTg1ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0
MS5tayBiL3BhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0MS5tawo+IGluZGV4IDQzZTFhZDZiNi4u
MTZlZjUxZWQzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0MS5tawo+
ICsrKyBiL3BhY2thZ2Uvb3BlbjYyNTQxL29wZW42MjU0MS5tawo+IEBAIC00LDcgKzQsNyBAQAo+
ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1PUEVONjI1NDFfVkVSU0lPTiA9
IHYxLjMuNwo+ICtPUEVONjI1NDFfVkVSU0lPTiA9IHYxLjMuOAo+ICBPUEVONjI1NDFfU0lURV9N
RVRIT0QgPSBnaXQKPiAgT1BFTjYyNTQxX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3BlbjYy
NTQxL29wZW42MjU0MS5naXQKPiAgT1BFTjYyNTQxX0dJVF9TVUJNT0RVTEVTID0gWUVTCj4gLS0g
Cj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=

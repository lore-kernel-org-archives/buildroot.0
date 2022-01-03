Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B37C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A72060E4B;
	Mon,  3 Jan 2022 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0crlJnfd6w5; Mon,  3 Jan 2022 20:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B1260E51;
	Mon,  3 Jan 2022 20:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F40F71BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E134E8135F
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7RYhdqk90ya for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0D1081344
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 20:46:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1BE7D13F88E;
 Mon,  3 Jan 2022 21:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641242817;
 bh=7A/WBb9af22TBHxWocrZWxIEE2ISkxCLTOlhBaN/FmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CY1To9IIvKour+B8XkCMcjks0OjYd4svaEku4P8BSRpAe61PZQt+P49Lpvb9ZH6IY
 miyp97ZF2mu4yhNbZsc/peyowSP3H+GXNG6manRIOS08SazRrEhvS8D6r7Enh3Dcdu
 oC1lgGd0YAbMP0DJQNA+hqTcSHMpoHcg0RD5kU+Abzo7HUeqPXPsWvWVhfkUf7t+Yz
 s57Zn3HBhRXkIOSZ/8xdDwrmeam/GsMoNtOa+QsmZvu++NUaNY/kg9nmBd9w3eyhyt
 17KSkv/i5S1IcueaLXnG3qSRxvxfe1lgupXd/0BB9pmqXLBLv/NYbKvDgYSCKnFr5+
 RkFBe3DAkLGkw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:46:52 +0100
Date: Mon, 3 Jan 2022 21:46:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220103204652.GM69135@scaer>
References: <20220103104407.16085-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103104407.16085-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump to version 3.37.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTAzIDExOjQ0ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3NxbGl0ZS9zcWxpdGUuaGFzaCB8IDIg
Ky0KPiAgcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoIGIvcGFja2FnZS9zcWxpdGUvc3FsaXRlLmhhc2gKPiBp
bmRleCA5NGYwMTI3ZDEuLjYwNDI3NWViZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NxbGl0ZS9z
cWxpdGUuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoCj4gQEAgLTEsMyAr
MSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDczMWE0NjUxZDRkNGIzNmZj
N2QyMWRiNTg2YjJkZTRkZDAwYWYzMWZkNTRmYjVhOWE0YjdmNDkyMDU3NDc5ZjcgIHNxbGl0ZS1h
dXRvY29uZi0zMzcwMDAwLnRhci5nego+ICtzaGEyNTYgIDQwZjIyYTEzYmYzOGJiY2Q0YzdhYzc5
YmNmYjQyYTcyZDVhYTQwOTMwYzFmM2Y4MjJlMzBjY2NlMjk1ZjBmMmUgIHNxbGl0ZS1hdXRvY29u
Zi0zMzcwMTAwLnRhci5nego+ICBzaGEyNTYgIDY2ZTA1NmI2ZTg2ODdmMzJhZjMwZDUxODc2MTFi
OThiMTJhOGY0NmYwN2FhZjYyZjQzNTg1ZjI3NmU4ZjBhYzkgIHRlYS9saWNlbnNlLnRlcm1zCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayBiL3BhY2thZ2Uvc3FsaXRlL3Nx
bGl0ZS5tawo+IGluZGV4IGJlMDYwYzMxMS4uNTliNzZjZTE2IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvc3FsaXRlL3NxbGl0ZS5tawo+ICsrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tawo+IEBA
IC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1TUUxJ
VEVfVkVSU0lPTiA9IDMuMzcuMAo+IC1TUUxJVEVfVEFSX1ZFUlNJT04gPSAzMzcwMDAwCj4gK1NR
TElURV9WRVJTSU9OID0gMy4zNy4xCj4gK1NRTElURV9UQVJfVkVSU0lPTiA9IDMzNzAxMDAKPiAg
U1FMSVRFX1NPVVJDRSA9IHNxbGl0ZS1hdXRvY29uZi0kKFNRTElURV9UQVJfVkVSU0lPTikudGFy
Lmd6Cj4gIFNRTElURV9TSVRFID0gaHR0cHM6Ly93d3cuc3FsaXRlLm9yZy8yMDIxCj4gIFNRTElU
RV9MSUNFTlNFID0gUHVibGljIGRvbWFpbgo+IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

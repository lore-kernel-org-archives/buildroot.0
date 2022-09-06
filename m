Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A11ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 14:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF034168F;
	Tue,  6 Sep 2022 14:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF034168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGOsAySGw8Oy; Tue,  6 Sep 2022 14:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6869641674;
	Tue,  6 Sep 2022 14:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6869641674
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEF481BF990
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE9BC82B81
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE9BC82B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 989W94Eu7-1h for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 14:58:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13AA82D45
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E13AA82D45
 for <buildroot@busybox.net>; Tue,  6 Sep 2022 14:58:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A5AE3B0053F;
 Tue,  6 Sep 2022 16:58:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 16:58:52 +0200
Date: Tue, 6 Sep 2022 16:58:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220906145852.GB1585594@scaer>
References: <20220901105819.1825795-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901105819.1825795-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662476334;
 bh=Q1vZxlysjes9EPxabBmOJjx+SsF6GHWMsH7+7rULLvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQhHkj/uCOdiFK+jKGFVGYY5s3uiNVfcyFf5Z22xSfyVFNSWPKtlBrEddoiRW5wlS
 lWCvH9RZjwb1Nlv0eQ1vwi0zBUjI4F8TXi0Sw/agFmT6SIzxabneD2pwoN1CsxvUZu
 u22Fdd9HsZDMHbyIPLgjx/D/bCZ3wDfJPvkL+zztIozOye9/AfiADATMdAwNPHiuU0
 Intmjoi/WPu7DFb4ewSmUaYYXDq2xDTyuS9qYmWQJLR2UIIO5gV39CJJmZKi/hmUYq
 YCEHjJ1BX8f+p9KWF/fMdJ96dlXI894pxmzDHQXPAbze68F0jL9oE/2HPa/8Uusal3
 QBlsJthLSaSpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dQhHkj/u
Subject: Re: [Buildroot] [PATCH] package/luaexpat: bump to version 1.5.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA5LTAxIDEyOjU4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9sdWFleHBhdC9sdWFleHBhdC5oYXNoIHwg
MiArLQo+ICBwYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lmhhc2ggYi9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4
cGF0Lmhhc2gKPiBpbmRleCBmYmZiNjIzZmMuLmJlNjdlOWJlNiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2x1YWV4cGF0L2x1YWV4cGF0Lmhhc2gKPiArKysgYi9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4
cGF0Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBjb21wdXRlZCBieSBsdWFyb2Nrcy9idWls
ZHJvb3QKPiAtc2hhMjU2ICBiZWU4OGRkYzEwNjNmNDljNTY4NWI3NWI2Njk2ZThkZjA2MDdhMzg4
NDMyY2JjYjE4OWNkMGI4MjkxZDk1NmFhICBsdWFleHBhdC0xLjQuMC0xLnNyYy5yb2NrCj4gK3No
YTI1NiAgNTM2YTVlZGEwOWJiMDcwZDJkZThlY2RkMTU1NjZkM2E1NWUyYWZhNWRlZDJlZjE4M2Nk
NDUzYmFjOGM0MWU5OCAgbHVhZXhwYXQtMS41LjAtMS5zcmMucm9jawo+ICBzaGEyNTYgIDdlNmE3
MjdlNWI1N2NjYTcxM2EyZjI2MzNmMDVkN2UwY2MxZTI2MWNjNmE3NjEzYmJlMjY2ZTYyNWIyZjE0
ZGEgIGx1YWV4cGF0L0xJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWFleHBhdC9sdWFl
eHBhdC5tayBiL3BhY2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQubWsKPiBpbmRleCBjMTc2ZmI4YzEu
LmY1NmJmNjA0YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rCj4g
KysrIGIvcGFja2FnZS9sdWFleHBhdC9sdWFleHBhdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAj
Cj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MVUFFWFBBVF9WRVJTSU9OID0gMS40
LjAtMQo+ICtMVUFFWFBBVF9WRVJTSU9OID0gMS41LjAtMQo+ICBMVUFFWFBBVF9TVUJESVIgPSBs
dWFleHBhdAo+ICBMVUFFWFBBVF9MSUNFTlNFID0gTUlUCj4gIExVQUVYUEFUX0xJQ0VOU0VfRklM
RVMgPSAkKExVQUVYUEFUX1NVQkRJUikvTElDRU5TRQo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

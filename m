Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6FFC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 19:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72FC61004
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 19:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E72FC61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB1181A99;
	Fri, 20 Aug 2021 19:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IgyiySMOVPZF; Fri, 20 Aug 2021 19:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A702F81AA7;
	Fri, 20 Aug 2021 19:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1A641BF84C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 19:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C11C240487
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 19:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWSJfzJIWM2m for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 19:15:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C07A040405
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 19:15:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fd65:b012:ebca:84c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 638265FFA1;
 Fri, 20 Aug 2021 21:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629486946;
 bh=8HwJr4ojq+2rILr2GigdqMGs/nw8PkQVVGN5udEc+yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmDk53cm3zGI8hij/UGsjbjf0CN4VWdIjVD7B3kCTam11btlx9PZlv+yT8sKXsD7E
 F91dyIDdEQfWkzlAccSG4i5MAVFNtZ4H/23b7LhuAewFju45jzCUHrw8r4QV7VSSL6
 ywCK9dggkMtETLNxSGgI4BSsfvxx9n5qsNuU+yjsdsT11P3glQrQmujk3mTGEVmY+n
 1ka4mrfvnh3jwSqxtjo6658URm09B/XTTanlNhmkkCieZlbMH5uClFftOwNWnDytUF
 FawwQ097rRNIxD+nXpFdfyBRaSxdqjmiO9/EnhSCyTl8YMubOVsfLTsoRJmZOChUBq
 /7gOGeE2XS1jg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 21:15:42 +0200
Date: Fri, 20 Aug 2021 21:15:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210820191541.GR27036@scaer>
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sm9zw6ksIEFsbCwKCitNYXR0aGV3ICtBZGFtLCBvdXIgcmVzaWRlbnQgU0VMaW51eCBleHBlcnRz
OiBxdWVzdGlvbnMgZm9yIHlvdSB0b3dhcmQKdGhlIGVuZC4uLgoKT24gMjAyMS0wOC0yMCAxNTox
OSArMDMwMCwgSm9zw6kgUGVra2FyaW5lbiBzcGFrZSB0aHVzbHk6Cj4gT24gRnJpLCBBdWcgMjAs
IDIwMjEgYXQgMTI6MDUgQU0gWWFubiBFLiBNT1JJTiA8IFsxXXlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiA+IE9uIDIwMjEtMDgtMTkgMTI6MjkgKzAzMDAsIEpvc8OpIFBla2thcmlu
ZW4gc3Bha2UgdGh1c2x5Ogo+ID4gPiBDdXJyZW50bHkgYnVpbGRyb290IHNoaXAgbGlic2VsaW51
eCB3aXRob3V0IHRyaWdnZXJpbmcKPiA+ID4gdGhpcyBvcHRpb24sIHdoaWNoIG9mdGVuIHNob3dz
IGluY29uc2lzdGVuY2llcyBiZXR3ZWVuCj4gPiA+IHdoYXQgdGhlIHJlZnBvbGljeSBkZWZpbmVz
IGFzIGEgbGFiZWwgZm9yIGEgZmlsZSBhbmQKPiA+ID4gd2hhdCB0aGUgYWN0dWFsIGZpbGUgaGFz
LiBUcmlnZ2VyaW5nIGFuIGluaXRpYWwgcmVsYWJlbAo+ID4gPiB3b3VsZCBoZWxwIGFjdGl2YXRp
bmcgZW5mb3JjaW5nIHN0YXRlIHJpZ2h0IGF3YXkgd2l0aG91dAo+ID4gPiByZXF1aXJpbmcgdG8g
ZW50ZXIgaXQgb25jZSBpbiBwZXJtaXNzaXZlIGFuZCB0d2VhayB0aGUKPiA+ID4gbGFiZWxzLgpb
LS1TTklQLS1dCj4gPiBJc24ndCB0aGlzIGdvaW5nIHRvIGZhaWwgb24gcmVhZC1vbmx5IGZpbGVz
eXN0ZW1zPyBSZWxhYmVsbGluZyBzdXBvc2VkbHkKPiA+IHJlcXVpcmVzIHRoYXQgZXh0ZW5kZWQg
YXR0cmlidXRlcyBiZSBhZGRlZC91cGRhdGVkL3JlbW92ZWQsIGFuZCB0aGF0Cj4gPiByZXF1aXJl
cyBhIHJlYWQtd3JpdGUgZmlsZXN5c3RlbS4uLgo+ID4gQ2FuJ3Qgd2UgZG8gdGhlIHJlLWxhYmVs
bGluZyBhdCB0aGUgdGltZSB3ZSBjcmVhdGUgdGhlIGZpbGVzeXN0ZW0sIGkuZS4KPiA+IGluIGZz
L2NvbW1vbi5taz8KPiA+IEFuZCBpdCBzZWVtcyB3ZSBhbHJlYWR5IGhhdmUgdGhhdDoKWy0tU05J
UC0tXQo+ID4gU28gd2h5IGlzIHRoZSBsYWJlbGxpbmcgd3Jvbmc/IENhbid0IHdlIGZpeCBpdCBy
aWdodCB0aGVyZSByYXRoZXIgdGhhbgo+ID4gYXQgcnVudGltZT8KPiBJdCdzIGlzIG5vdCB3cm9u
ZywgaXQgd2FzIGp1c3QgdW5ub3RpY2VkIGJ5IG15IGV5ZWJhbGxzLAoKOi0pCgo+IGhvd2V2ZXIs
IHRoZXJlIGlzIGEgY2FzZSB0aGlzIGlzIG5vdCBjb3ZlcmluZyBwcm9wZXJseSBhbmQgcHJldmVu
dGluZwo+IHRoZSB1c2Vyc3BhY2UgdG8gcnVuIHJpZ2h0IGF3YXkgaW4gZW5mb3JjaW5nIG1vZGUs
IGJlY2F1c2UgYXQKPiB0aGlzIHRpbWUgbm90IGFsbCBmaWxlcyBpbiAvZGV2IGFyZSBwb3B1bGF0
ZWQsIGFuZCBydW5uaW5nIGl0IGluCj4gcGVybWlzc2l2ZSBtb2RlIG11bHRpcGxlIGNvbXBsYWlu
cyBmcm9tIHNlbGludXggdG8gdGhlIHNlcmlhbAo+IGRldmljZXMgdHVybiB1cC4gSWYgeW91IGhh
dmUgc29tZSBzdWdnZXN0aW9ucyBob3cgd2UgY2FuCj4gaW1wcm92ZSB0aGlzIGNhc2UsIEknbSBo
YXBweSB0byBicmluZyBtb3JlIGNoYW5nZXMuCgpXaGF0IEkgdW5kZXJzdGFuZCBmcm9tIHlvdXIg
ZXhwbGFuYXRpb25zLCBhYm92ZSwgaXMgdGhhdCB3ZSBoYXZlIHRvIGhhdmUKc29tZSBsYWJlbHMg
KGkuZS4gZXh0ZW5kZWQgYXR0cmlidXRlcykgc2V0IG9uIGZpbGVzIGluIC9kZXYsIG9yIHRoZQpw
b2xpY3kgbWF5IHJlZmVyZW5jZSBvYmplY3RzIHRoYXQgYXJlIG5vdCBwcm9wZXJseSBsYWJlbGVk
LgoKT0ssIHNvIHRoaXMgaGl0IHRoZSB0aGljayB3YWxsIGNpcmNsaW5nIGFyb3VuZCBteSB2ZXJ5
IGxpbWl0ZWQga25vd2xlZGdlCm9mIGhvdyBTRUxpbnV4IHdvcmtzLgoKTWF0dGhldywgQWRhbSwg
YW55IGhlbHAvZXhwbGFuYXRpb25zL2RldGFpbHMvcmV2aWV3IHdvdWxkIGJlIG11Y2ggd2VsY29t
ZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

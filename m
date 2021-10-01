Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC95C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C49D61A05
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C49D61A05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 578368457B;
	Fri,  1 Oct 2021 18:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLdAdKwDSYLp; Fri,  1 Oct 2021 18:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984FD8457D;
	Fri,  1 Oct 2021 18:03:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7FEB1BF47E
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41F74261B
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPWct1FWHsEY for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 18:03:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F45B4261A
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 18:03:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d50:f2f3:e895:2016])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C1D045FFBA;
 Fri,  1 Oct 2021 20:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633111391;
 bh=xvYttGqE3FtnT98fdKcuYVRBrG4rCKvd2eonVhutDB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P4cDtNkotyk2zwC/3khxiPaJl0UkPWE32fgdYGs4cWWu0AS9B1ZhJW3z6QEB771LU
 ehqxs2wFTrhXrzdSWO9/QIrxiaFFOf8dQijnreYQfqs2ddp0qlw3EIvBvzapcJF/5f
 Qdu/LNNazAcmVDroqzgYXJRJPkzuPeSUMNqyab4zm+QUuMO0nvO7Vu8AdCW3Ziori0
 aLibheB0E1wX/IMHEQDAOWUk9d4t9aWv4VgM6bZltHeNjyC/avW51up1q+XDAHiwX0
 fE2/x4B4lSIZNSPKZbuf/vGfSqfw7qslbtHyeqPZVaSrkRZ2q0QVLIcGyd+INGvt//
 XeyyVienaaFmQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Oct 2021 20:03:04 +0200
Date: Fri, 1 Oct 2021 20:03:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20211001180304.GV1504958@scaer>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
 <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
 <20210930200402.GO1504958@scaer> <YVYbAxgEomvMo5IQ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVYbAxgEomvMo5IQ@pevik>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ciwgQXJub3V0LCBBbGwsCgpPbiAyMDIxLTA5LTMwIDIyOjE2ICswMjAwLCBQZXRyIFZvcmVs
IHNwYWtlIHRodXNseToKPiA+IE9uIDIwMjEtMDktMjYgMjM6MzIgKzAyMDAsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIHNwYWtlIHRodXNseToKPiA+ID4gT24gMjEvMDkvMjAyMSAyMjo1MSwgUGV0ciBW
b3JlbCB3cm90ZToKPiA+IFRoaXMgaXMgY2F1c2luZyBxdWl0ZSBzb21lIGlzc3Vlcy4KWy0tU05J
UC0tXQo+ID4gU2Vjb25kLCB0aGlzIGlzIGNhdXNpbmcgYSBsb3Qgb2YgZXJyb3IgbWVzc2FnZXM6
Cj4gPiAgICAgJCBtYWtlIGRlZmNvbmZpZwo+ID4gICAgIFsuLi5dCj4gPiAgICAgJCBtYWtlIGhl
bHAKPiA+ICAgICBtYWtlWzFdOiBjb21tYW5kOiBDb21tYW5kIG5vdCBmb3VuZAo+ID4gICAgIFsu
Li5dCj4gTmV3IGVycm9yLiBCdXQgSSB3YXMgbm90IGFibGUgdG8gcmVwcm9kdWNlIGl0IG9uIHg4
Nl82NCBvbiBjdXJyZW50IG1hc3Rlcgo+ICg1OTE2Y2M1MDExKS4gV2hhdCBhbSBJIG1pc3Npbmcg
dG8gcmVwcm9kdWNlIGl0PwoKV2UndmUgaW52ZXN0aWdhdGVkIHdpdGggQXJub3V0LCB3aG8gd2Fz
IGFsc28gdW5hYmxlIHRvIHJlcHJvZHVjZSwgYW5kIHdlCmV2ZW50dWFsbHkgZm91bmQgdGhlIGNh
dXNlIGZvciB0aGlzIGlzc3VlLCB3aGljaCBpcyB0d28gZm9sZC4KCkZpcnN0LCBtYWtlLCBhdCBs
ZWFzdCBpbiBzb21lIHZlcnNpb25zIG9mIG1ha2UsIHdpbGwgcnVuIGNvbW1hbmRzIHRoYXQKaXQg
YmVsaWV2ZXMgYXJlICJzaW1wbGUiLCBkaXJlY3RseSB3aXRoIGV4ZWN2ZSgpIChvciBhbnkgb3Ro
ZXIgZXhlYyooKQp3cmFwcGVyKSwgaW5zdGVhZCBvZiBydW5uaW5nIGl0IHRocm91Z2ggYSBzaGVs
bCB2aWEgc3lzdGVtKCkuCgpUaGlzIGlzIHdoYXQgaGFwcGVucyB3aGVuIGl0IHNlZSBhIGNvbW1h
bmQgbGlrZSB0aGlzOgoKICAgIGV4cG9ydCBQRVJMPSQoc2hlbGwgY29tbWFuZCAtdiBwZXJsKQoK
d2hpY2ggd2UgaGF2ZSBpbiBwYWNrYWdlL01ha2VmaWxlLmluQDI0MC4gSW4gdGhpcyBjYXNlLCBt
YWtlIHdpbGwgdHJ5IHRvCnJ1biB0aGUgY29tbWFuZCAoc3BsaXQgw6AtbGEgcHl0aG9uKSwgYXMg
Y2FuIGJlIHNlZW4gd2l0aCBzdHJhY2U6CgogICAgWydjb21tYW5kJywgJy12JywgJ3BlcmwnXQoK
U2Vjb25kLCB0aGUgaXNzdWUgd2FzIGludmlzaWJsZSB0byBBcm5vdXQsIGJlY2F1c2UgdGhlIGRp
c3RyaWJ1dGlvbiBoZQp1c2VzLCBGZWRvcmEsIHByb3ZpZGVzIC91c3IvYmluL2NvbW1hbmQsIHdo
aWNoIGlzIGEgc2ltcGxlIHNoZWxsIHNjcmlwdAp0aGF0IGp1c3QgYmFzaWNhbGx5IGRvZXM6Cgog
ICAgIyEvYmluL3NoCiAgICBidWlsdGluIGNvbW1hbmQgIiR7QH0iCgpIb3dldmVyLCB0aGlzIGlz
IHByb3ZpZGVkIGJ5IG5vIHBhY2thZ2UgaW4gdGhlIGRpc3RyaWJ1dGlvbiBJIHVzZSwKVWJ1bnR1
IDIwLjA0LjEgTFRTIChmaWx0ZXJpbmcgdG8gaWdub3JlIC91c3IvYmluL2NvbW1hbmRlciBldCBh
bC4pOgoKICAgICQgYXB0LWZpbGUgc2VhcmNoIGJpbi9jb21tYW5kIHxncmVwIC1FICdiaW4vY29t
bWFuZCQnCiAgICBbbm90aGluZ10KClNvLCBwcm9iYWJseSB5b3UgZGlkIG5vdCBzZWUgdGhlIGVy
cm9yIGVpdGhlciwgYmVjYXVzZSB5b3VyIGRpc3RyaWJ1dGlvbgphbHNvIHByb3ZpZGVzIGNvbW1h
bmQgYXMgYW4gYWN0dWFsIGV4ZWN1dGFibGUuIENvdWxkIHlvdSBjaGVjayB0aGF0IGJ5CnJ1bm5p
bmc6ICAgIHdoaWNoIGNvbW1hbmQgICAgIChBaGFoYSEgOi1dKQoKTm90ZTogaWYgd2UgY2hhbmdl
IHRoZSBsaW5lIGFib3ZlIHRvCgogICAgZXhwb3J0IFBFUkw9JChzaGVsbCBjb21tYW5kIC12IHBl
cmwgMj4vZGV2L251bGwpCgp0aGVuIG1ha2Ugbm8gbG9uZ2VyIGJlbGlldmVzIHRoaXMgaXMgYSBz
aW1wbGUgY29tbWFuZCwgYW5kIHdpbGwgZXhlY3V0ZQp3aXRoIHN5c3RlbSgpIGFuZCB0aGUgd2Fy
bmluZyBnb2VzIGF3YXkuCgpTbywgYm90dG9tIGxpbmUsIHRoZXJlIGFyZSBtb3JlIGltcGFjdHMg
dGhhbiBwcmV2aW91c2x5IGV4cGVjdGVkLCBhbmQgd2UKbmVlZCB0byB0aGluayB0aGUgdHJhbnNp
dGlvbiBtb3JlIGNhcmVmdWxseS4KCkFuZCB0byBiZSBleHRyYSBjbGVhcjogSSBhbSBPSyB3aXRo
IHRyYW5zaXRpb25uaW5nIGF3YXkgZnJvbSB3aGljaCwgb3IKYXQgbGVhc3QgZnJvbSByZWx5aW5n
IG9uIHdoaWNoIGJlaW5nIHByb3ZpZGVkIGJ5IHRoZSBkaXN0cm8uCgo+ID4gU28sIEkgc3VnZ2Vz
dCB0aGF0IHdlIGRvIHJldmVydCB0aGlzIHBhdGNoLCBhbmQgd29yayBvbiBhIGJldHRlcgo+ID4g
dHJhbnNpdGlvbiBhd2F5IGZyb20gd2hpY2gsIGlmIGF0IGFsbC4gT25lIHZlcnkgcXVpY2sgc29s
dXRpb24gd291bGQgYmUKPiA+IHRvIGJ1bmRsZSBvdXIgb3duIHdoaWNoIGluIEJ1aWxkcm9vdCBh
bmQgdGhlbiB3ZSdkIGhhdmUgYSBxdWljayB3YXkgb3V0Cj4gPiBvZiB0aGF0IERlYmlhbidzIG1l
c3MuLi4KPiBTdXJlLCBpZiBpdCBjYXVzZXMgcHJvYmxlbXMgd2hpY2ggYXJlIG5vdCBlYXNpbHkg
Zml4ZWQsIEknbSBub3QgYWdhaW5zdAo+IHJldmVydGluZyBpdC4gQnV0IEkgZG9uJ3QgdGhpbmsg
dGhhdCBwcm9ibGVtIGlzIHRoYXQgY29tcGxleCwgdGhhdCB3ZSdkIG5lZWQgdG8KPiBjb21waWxl
IHdoaWNoLiBCdXQgSSBhcG9sb2dpemUgZm9yIGNhdXNpbmcgdHJvdWJsZXMuCgpBbmQgYWdhaW4s
IEkgd2FudCB0byByZWl0ZXJhdGUgdGhhdDogeW91IGhhdmUgbm8gcmVhc29uIHRvIGFwb2xvZ2lz
ZS4gOi0pCllvdXIgcGF0Y2ggd2FzIHJldmlld2VkIGFuZCBhcHBsaWVkLCBhbmQgdGhlcmUgd2Fz
IG5vIHdheSB3ZSBjb3VsZCBoYXZlCmZvdW5kIHRoZSBpc3N1ZXMgYWJvdmUgd2l0aG91dCB0cnlp
bmcgaW4gdGhlIGZpcnN0IHBsYWNlLgoKQnV0IG5vdywgd2UgY2FuJ3Qga2VlcCB0aGlzIGluIHRo
ZSBjdXJyZW50IHN0YXRlIHNvLCBhZnRlciBkaXNjdXNzaW5nCnRoaXMgd2l0aCBBcm5vdXQsIEkg
YW0gZ29pbmcgdG8gcmV2ZXJ0IHRoZSBwYXRjaC4KCldlIGNhbiBsb29rIGF0IGEgYmV0dGVyIHdh
eSB0byBzb2x2ZSB0aGUgRGViaWFuIHVuc3RhYmxlIGlzc3VlIGFib3V0CndoaWNoLCBwcm9iYWJs
eSB0aGUgZmlyc3QgYmVpbmcgdG8gb3BlbiBhIGJ1ZyB3aXRoIHRoZW0sIHNvIHRoYXQgdGhleQpy
ZXZlcnQgdGhlIHdhcm5pbmcsIGFuZCBzZWNvbmQgdG8gZmluZCBhIHdheSB0byBubyBsb25nZXIg
cmVseSBvbiB3aGljaApmcm9tIHRoZSBkaXN0cm8gKGVpdGhlciBieSB0cmFuc2l0aW9ubmluZyB0
byBzb21ldGhpbmcgZWxzZSwgb3IgYnkKYnVuZGxpbmcgb3VyIG93bj8pLgoKVGhhbmtzIGZvciB5
b3VyIHdvcmsgb24gQnVpbGRyb290ISA6LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE8C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 18:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4AD6405EB;
	Wed, 11 Jan 2023 18:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4AD6405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9eaMFMZIQH1; Wed, 11 Jan 2023 18:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D0640549;
	Wed, 11 Jan 2023 18:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D0640549
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10BFC1BF331
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 18:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFAAC81F7B
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 18:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFAAC81F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPRXALVrMbuy for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 18:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51A081F4D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B51A081F4D
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 18:36:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1F8695FFAD;
 Wed, 11 Jan 2023 19:36:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 19:36:08 +0100
Date: Wed, 11 Jan 2023 19:36:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230111183608.GS151997@scaer>
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
 <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
 <20230111164416.GQ151997@scaer>
 <7e325d8a-4717-bb45-58b8-73a5d632ddc0@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e325d8a-4717-bb45-58b8-73a5d632ddc0@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673462175;
 bh=CR8chTDBf7wNbJa9qXLAYuJ9WPrjGTKgiYO80GegAtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCsQ0nVXsv3fZqLc8l5LoNM/t1/MimY0VnF2LF+l8CrWJviQvIguKuxQEb1Basf+4
 GIMs8EQZJY652Huz+0cUjbkO10mOh8k5zUwMdS0NTZ/qpXoe9/KRlFiiH1Tg0SHc//
 tkA9+lp/DgsGsdpgUQPjd1cEoz27w7jeVMQ/5wRDxvnGgLRWp++PDF4eH8ImIvA7Dv
 aSieBM/6OSsIT+lO/d4kQLmCOh0ICYUvV4P4Gl3sEZb8J+t0BYKrCFy0Mn/Eo0SdEC
 7FQjb0bHPOdNH02ptiGMPI6FDDttJz7Memt3gXtes7Fs8IdTwdV9dXUjamtv/+rRUb
 P+Jn3Y1ytS9Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OCsQ0nVX
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
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
 Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tmljb2xhcywgSmFtZXMsIEFsbCwKCk9uIDIwMjMtMDEtMTEgMTg6MzUgKzAxMDAsIE5pY29sYXMg
Q2F2YWxsYXJpIHNwYWtlIHRodXNseToKPiBPbiAxMS8wMS8yMDIzIDE3OjQ0LCBZYW5uIEUuIE1P
UklOIHdyb3RlOgo+ID5PbiAyMDIzLTAxLTExIDE3OjAxICswMTAwLCBOaWNvbGFzIENhdmFsbGFy
aSBzcGFrZSB0aHVzbHk6Cj4gPj5PbiAxMS8wMS8yMDIzIDE2OjE5LCBSb21haW4gTmFvdXIgd3Jv
dGU6Cj4gPj4+TGUgMjgvMDcvMjAyMiDDoCAwMzo0NCwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTC
oDoKPiA+Pj4+VGhlc2UgYXBwZWFyIHRvIG5vdCBiZSBnZXR0aW5nIHNldCBjb3JyZWN0bHkgYW5k
IGFyZSBuZWVkZWQgd2hlbiB1c2luZwo+ID4+Pj5tZXNvbidzIHJlbG9jYXRhYmxlIHBrZ2NvbmZp
ZyBmb3JtYXQuCj4gPj4+SG93IHRoaXMgY21ha2UgZmlsZSAodG9vbGNoYWluZmlsZS5jbWFrZS5p
bikgaXMgdXNlZCBieSBhIG1lc29uIHBhY2thZ2UgPwo+ID4+SSB1bmRlcnN0YW5kIGl0IGFzICJh
IGNtYWtlIHBhY2thZ2UgbmVlZHMgdGhpcyB0byB1c2UgYSBwa2djb25maWcgZmlsZQo+ID4+Z2Vu
ZXJhdGVkIGJ5IGEgbWVzb24gcGFja2FnZSB3aGVuIG1lc29uIGlzIGNvbmZpZ3VyZWQgdG8gZ2Vu
ZXJhdGUKPiA+PnJlbG9jYXRhYmxlIHBrZ2NvbmZpZyBmaWxlcyIuCj4gPgo+ID5PSywgYnV0IHRo
ZW4gSSBoYXZlIGEgZmV3IHF1ZXN0aW9uczoKPiA+Cj4gPiAgIC0gd2hhdCBhcmUgInJlbG9jYXRh
YmxlIHBrZ2NvbmZpZyBmaWxlcyIsIGFuZCBob3cgZG8gdGhleSBmaXQgaW4gdGhlCj4gPiAgICAg
cGtnY29uZmlnIHNwZWM/ID4KPiA+ICAgLSBob3cgZG8gdGhleSBkaWZmZXIgZnJvbSBzdGFuZGFy
ZCBwa2djb25maWcgZmlsZXM/IEJ5ICJzdGFuZGFyZCIsIEkKPiA+ICAgICBtZWFuIGFsbCB0aGUg
cGtnY29uZmlnIGZpbGVzIHdlIGN1cnJlbnRseSBpbnN0YWxsIGFuZCB1c2UgZnJvbSB0aGUKPiA+
ICAgICBodW5kcmVkcywgaWYgbm90IHRob3VzYW5kcywgb2YgcGFja2FnZXMgdGhhdCBwcm92aWRl
ZCB0aGVtLgo+IAo+IFJlYWRpbmcgdGhlIG1lc29uJ3Mgc291cmNlLCB0aGV5IGFyZSBtZXJlbHkg
c3RhbmRhcmQgcGtnY29uZmlnIGZpbGVzIHRoYXQKPiB1c2UgdGhlICR7cGNmaWxlZGlyfSB2YXJp
YWJsZSB0byBkZWZpbmUgcGF0aHMgaW5zdGVhZCBvZiBoYXJkY29kaW5nIGEKPiBwcmVmaXguIFRo
ZXNlIGFyZSBub3Qgc3BlY2lmaWMgdG8gbWVzb24gYW5kIGFyZSBzdXBwb3J0ZWQgYnkgcGtnLWNv
bmZpZy4gKEl0Cj4gaGFwcGVuIHRoYXQgc29tZSBvZiBvdXIgcHJpdmF0ZSBwYWNrYWdlcyB1c2Vz
IHRoYXQgdHJpY2sgdG9vLCBhbmQgdGhleSBhcmUKPiBub3QgbWVzb24gcGFja2FnZXMpCgpUaGF0
LiBJdCBoYXMgbm90aGluZyBtZXNvbiBzcGVjaWZpYywgaW4gZmFjdC4gSXQganVzdCBoYXBwZW5z
IHRoYXQgbWVzb24KaXMgdGhlIG9ubHkgdG9vbCB0aGF0IGdlbmVyYXRlcyAucGMgZmlsZXMgd2l0
aCBwY2ZpbGVkaXIsIGFuZCBwY2ZpbGVkaXIKaXMgbm90IHdpZGVseSB1c2VkIGVpdGhlciAod2Un
dmUgbmV2ZXIgaGFkIGEgcmVsYXRlZCBpc3N1ZSBzbyBmYXIsIGhhdmUKd2U/KSAoYW5kIG5vLCBw
cml2YXRlIHRvb2xzIGFuZCBwYWNrYWdlcyBkbyBub3QgY291bnQhIDstXSApCgo+ID4gICAtIHdo
eSBpcyBtZXNvbiBnZW5lcmF0aW5nIHRob3NlIHBrZ2NvbmZpZyBmaWxlcywgcmF0aGVyIHRoYW4g
c3RhbmRhcmQKPiA+ICAgICBvbmVzPwo+IEJlY2F1c2UgcGF0Y2ggMi8yIHRlbGxzIGl0IHRvLgoK
QWgsIHllcywgSSBqdXN0IHJlcGxpZWQgdG8gdGhhdCBzZWNvbmQgcGF0Y2ggdG9vLCBub3cuIElm
IGEgY2hhbmdlIGlzCm5lZWRlZCBpbiBwcmVwYXJhdGlvbiBvZiBhbm90aGVyIG9uZSwgdGhlbiBp
dCBzaG91bGQgYmUgbWVudGlvbmVkICh3aXRoCmFuIGFicmlkZ2VkIGV4cGxhbmF0aW9uIG9mIHRo
ZSBwcm9ibGVtIHRoYXQgd2lsbCBiZSBmaXhlZCBpbiB0aGF0IGxhdGVyCmNoYW5nZSwgaWYgcG9z
c2libGUpLiBBbmQgYSBjb3ZlciBsZXR0ZXIgdGhhdCBleHBsYWlucyB0aGUgd2hvbGUgcGljdHVy
ZQppcyBtb3JlIHRoYW4gd2VsY29tZSwgdG9vLgoKPiA+ICAgLSBhbmQgZmluYWxseSwgaWYgdGhl
ICJyZWxvY2F0YWJsZSBwa2djb25maWcgZmlsZXMiIGdlbmVyYXRlZCBieSBtZXNvbgo+ID4gICAg
IGFyZSBpbmNvcnJlY3Qgd3J0IHRoZSBwa2djb25maWcgc3BlYywgY2FuIHdlIHRlbGwgbWVzb24g
bm90IHRvIGRvCj4gPiAgICAgdGhhdD8KPiBUaGV5IGFyZSBub3QgaW5jb3JyZWN0LiAgRnJvbSBl
eHBlcmllbmNlLCBhdXRvdG9vbHMgYW5kIG1lc29uIHBhY2thZ2VzCj4gaGFuZGxlcyB0aGVtIGZp
bmUuIGNtYWtlIGhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGUgY29tbWl0IG1lc3NhZ2UsIGRvZXMg
bm90Cj4gYW5kIG5lZWRzIHNvbWUgZXh0cmEgdmFyaWFibGVzLgoKWWVzLCB0aGlzIG1ha2VzIHNv
IG11Y2ggbW9yZSBzZW5zZSBub3c6IGl0IGlzIGEgY21ha2UgaXNzdWUgZmlyc3QgYW5kCmZvcmVt
b3N0LCB0aGF0IGlzIGV4cG9zZWQgYnkgLnBjIGZpbGVzIGdlbmVyYXRlZCBieSBtZXNvbi4gVGhh
bmtzIGZvcgp0aGUgZXhwbGFuYXRpb25zIQoKSmFtZXMsIGNhbiB5b3UgcmVzcGluIHRoaXMgb25l
IHBhdGNoIHdpdGggYWxsIHRoaXMgZGlzY3Vzc2lvbiBuaWNlbHkKYWdncmVnYXRlZCBhbmQgcmVm
b3JtYXR0ZWQgYXMgYSBwcm9wZXIgY29tbWl0IGxvZywgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

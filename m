Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B767C636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C74F1408BC;
	Thu,  9 Feb 2023 20:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C74F1408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy1xTL-TPgvC; Thu,  9 Feb 2023 20:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E1184063C;
	Thu,  9 Feb 2023 20:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1184063C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC8C41BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6E634063C
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E634063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aU-BJofUG9nG for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:54:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D294940549
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D294940549
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:54:44 +0000 (UTC)
Received: from [192.168.50.169] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QDwHpZBwjdrjsQDwHpCprw; Thu, 09 Feb 2023 21:54:42 +0100
Message-ID: <46cf956e-29d9-c0ce-5963-f3fc3543a476@benettiengineering.com>
Date: Thu, 9 Feb 2023 21:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
 <4acd3e35f6bce28f5f2e6cca8e57789c@free.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4acd3e35f6bce28f5f2e6cca8e57789c@free.fr>
X-CMAE-Envelope: MS4xfIKjo8xq7uttfTIZrRo6/zi9yn9VWFc27uSx+/AZ4kPyOOebtQNrWDCu18w2b5JrHjC8RD+fxPOB6Sp/WvFS40RRfR0qUmTyzGpe6G5tQwBxcySGSpvM
 m7g1ByT+5402lYjWe29KsonQFZifSkfJy6pWz0xcRXTJBqtUGH8LQ+7L/2vxPyCB+3EPzY7OpqJXjO3r+NeYbdJMhCenEOssqnfOHITpwNCZyV2BBFlgGVep
 BNfRbjY3WH3ld9doRn3fMNsmKIcrJa9pYfL/ykrBFZks6qvdHCZQ9JetMEWFVlu5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675976082; bh=H6w1DAYHp2oZxswyWn0L1QD89xnrAkG19fxXxT33S30=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CST6iZ1DGm+i4P6lbYG7KkRPqfEE9H+zKR0A3tWHm/PlkYBvEhZ6Trn9oSFefZN7L
 OL/YNKaT1RWxNUn+4nv1gUHRGMP0gxke7x1HDx5kwE1yVW+uKfojyXd0Chkoh5lY6r
 bKbrOYhi3fs77aA0dDvmR735uS1In5yeHcVO/ptSRuiw0X8nm5+yGkw/nIgGU4A2I6
 H5vIDLgmNI0A/VPfLA4wJy8o2Umx6oygrdpCpO7TNxxiImQ+m4gUmue4ZMSgBWmnjA
 BxgIVUMCmp8jGZeufZcSTgDdEEsV99o2Mpgz+Y2ZuTn1v+Ano+JM14Mvn0bUwVrHJg
 fQkEc1vjGorxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CST6iZ1D
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gMDkvMDIvMjMgMjA6MzYsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IAo+
ICDCoCBIaSBHaXVsaW8sCj4gCj4gT24gMDkvMDIvMjAyMyAwMTo0OCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4+IFBhY2thZ2UgcXVpY2tqcyBmYWlscyB0byBidWlsZCBvbiBhcmNoaXRlY3R1cmVz
IHRoYXQgZG9uJ3Qgc3VwcG9ydCBmdWxsCj4+IGZsb2F0IHJvdW5kaW5nLiBUbyBzdXBwb3J0IGFs
bCBraW5kIG9mIGZsb2F0IHJvdW5kaW5nIEZFX0RPV05XQVJELAo+PiBGRV9UT05FQVJFU1QsIEZF
X1RPV0FSRFpFUk8sIEZFX1VQV0FSRCBtdXN0IGJlIGRlZmluZWQgaW4gZmVudi5oLgo+PiBTaW5j
ZSBwYWNrYWdlIHozIGxvY2FsbHkgaW1wbGVtZW50cyB0aGlzIGNoZWNrIGxldCdzIG1ha2UgaXQg
Z2xvYmFsLAo+PiByZW5hbWUgaXQgdG8gYmUgZ2VuZXJpYyBhbmQgdXNlIGl0IGZvciBib3RoIHBh
Y2thZ2UgcXVpY2tqcyBhbmQgejMuCj4+Cj4+IEZpeGVzOgo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy8wYjYvMGI2NzM4MWUzNjQzYzEzNGM5MmNiY2QxYzVkYzI1OGZk
NzYwY2Q3ZS8KPj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvY2YyL2Nm
MjQ5YTgyYzgzZDNjODUwMzIwNWY0YzNjNTg1OWRkOWQ1MmFmZGYvCj4+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzliMy85YjM3YzZjNTVhNWI0Njg2NTdhZjI2ZWY5YjU3
ZDRmZTI0ZDhmZGUyLwo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80
ZjEvNGYxM2NmN2QzNTMyNjBjNmI4OTM0ZGJkY2YyNjdiZWE4ODRiMzU2Yi8KPj4KPj4gU2lnbmVk
LW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+Cj4gCj4gVG8gY29tbWVudCBhIGJpdCBvbiB0aGF0LCB0aGUgY29tcGxldGUgY29uZGl0
aW9uIGlzIGEgYml0IG1vcmUgdHJpY2t5Ogo+IC0gdGhlIENQVSBhcmNoIEZQVSBIVyBtdXN0IGhh
dmUgYWxsIDQgcm91bmRpbmcgbW9kZXMsCj4gLSB0aGUgbGliYyBtdXN0IGV4cG9zZSBhIGZlbnYu
aCBoZWFkZXIsCj4gLSB0aGUgbGliYyBtdXN0IGFsc28gZXhwb3NlIGFsbCA0IHJvdWRpbmcgbW9k
ZXMuCgp0aGFuayB5b3UgZm9yIHRoZSBtb3JlIHByZWNpc2UgZXhwbGFuYXRpb24sIGV2ZXJ5dGhp
bmcgaXMgbW9yZSBjbGVhciBub3cKCj4gZ2xpYmMgZ2VuZXJhbGx5IGV4cG9zZXMgYWxsIHRoZSBI
VyBzdXBwb3J0ZWQgcm91bmRpbmcgbW9kZXMuwqAgSQo+IGluaXRpYWxseSBleGNsdWRlZCB1Y2xp
YmMtbmcsIGJlY2F1c2UgaW4gaXRzIEJ1aWxkcm9vdCBkZWZhdWx0Cj4gY29uZmlndXJhdGlvbiwg
ZmVudi5oIGlzIG5vdCBlbmFibGVkIFsxXS4gSSBiZWxpZXZlIGl0J3MgcG9zc2libGUgdG8KPiBo
YXZlIHNvbWUgdWNsaWJjLW5nIGNvbmZpZ3VyYXRpb24gdGhhdCBhcmUgZW5hYmxlIGFuZCBleHBv
c2luZyB0aG9zZQo+IHJvdW5kaW5nIG1vZGVzLiBTZWUgWzJdLgo+IAo+IFNvIHRoaXMgcHJvcG9z
YWwgaXMgY29ycmVjdCBidXQgcG9zc2libHkgZGlzY2FyZCB0aGUgY2FzZSBpbiB3aGljaCBsaWJj
IGlzCj4gdWNsaWJjLW5nIGFuZCBpdHMgKGN1c3RvbSkgY29uZmlndXJhdGlvbiBleHBvc2VzIGFs
bCBGRSByb3VuZGluZyBtb2Rlcy4KCk1heWJlIHdlIGNhbiBlbmFibGUgVUNMSUJDX0hBU19GRU5W
IG9uIHVjbGliYy1uZyBieSBkZWZhdWx0LCBzbyBhbGwKYXJjaGl0ZWN0dXJlcyB0aGF0IFVDTElC
Q19IQVNfRkxPQVQgdGhleSBoYXZlIGl0LiBPdGhlcndpc2UgdGhhdCAKVUNMSUJDX0hBU19GRU5W
IGdldHMgZGlzY2FyZGVkIGlmIEknbSBjb3JyZWN0LgoKPiBJIGFtIG5vdCBzdXJlIGlmIGl0J3Mg
cmVhbGx5IGFuIGlzc3VlLCBhcyBwYWNrYWdlcyB3aXRoIHN1Y2gKPiByZXF1aXJlbWVudHMgYXJl
IG1vc3RseSB0ZXN0ZWQgd2l0aCBnbGliYyBhbnl3YXkuLi4KClNhbWUgaGVyZSBmb3IgdGhlIGFy
Y2hpdGVjdHVyZS4KClNvIHdlJ2QgbmVlZCBhIHZhbGlkIGNvbmRpdGlvbiB0aGF0IGlzIHRydWUg
Zm9yIHRoZSAzIHBvaW50cyB5b3UndmUKbGlzdGVkIGFib3ZlIGV4YWN0bHkgaW4gdGhlIG9yZGVy
IHlvdSd2ZSBsaXN0ZWQgdGhlbSBpZiBJJ20gY29ycmVjdC4KCk1heWJlIHdlIGNhbiBkbyBhbiBp
bnRlcm1lZGlhdGUgc3RlcCB3aXRoIHRoaXMgcGF0Y2ggYW5kIGxhdGVyIGRlYWwgd2l0aAp0aGlz
IG1hdHJpeCB2YWxpZGl0eSBjaGVjawoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpC
ZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gSnVsaWVuLgo+IAo+
IFsxXSBodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idWlsZHJvb3QvdHJlZS9wYWNrYWdlL3VjbGli
Yy91Q2xpYmMtbmcuY29uZmlnCj4gWzJdIAo+IGh0dHBzOi8vY2dpdC51Y2xpYmMtbmcub3JnL2Nn
aS9jZ2l0L3VjbGliYy1uZy5naXQvdHJlZS9leHRyYS9Db25maWdzL0NvbmZpZy5pbi5hcmNoP2g9
djEuMC40MiNuMTgwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

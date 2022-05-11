Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BEA8340C;
	Wed, 11 May 2022 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqbyHufm7ct9; Wed, 11 May 2022 20:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4381E83367;
	Wed, 11 May 2022 20:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11C601BF3A1
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F369860AA0
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 20:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfOhjGev8cvi for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 20:04:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FF6160A83
 for <buildroot@buildroot.org>; Wed, 11 May 2022 20:04:12 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4Kz5TQ5m2Nz10fg; 
 Wed, 11 May 2022 22:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652299450;
 bh=/4TctvX7mOiYfw1lxJPDTAa2ISMYBxZTMJ2glpH5xf0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=q1PWXD6Hl9048Af/6kGIjYCUIo5wrSrLAUpX+NaPZ+S1fL00xfGMvlt5W/f5UADGG
 3vak4JBOkE8nErZuJpYedH1CYZ4qVxhYIcxup+iinQ85/d5qjRWo2WJ2kUBt3Mk8jS
 q26BL2310wZqLXGZYA8ZZd53awY+yj0bm+BkZQpc9zdMuo60m2F+M1qNXRqc9gYc9b
 djlhVzJLIBS2DRdkcOEdQGCkNAuJuxLhkwV6mMn+s7Obpvc147EAKmbHmOxYRVxfET
 EyT2OBdVtr6Yrlt7BFIIfQOlYKVGWoEjDK9gLhG/mZXxa94YHp4fJeHmv1fP2wIpl3
 zmLtQK3jpnSFA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 11 May 2022 22:04:06 +0200
Date: Wed, 11 May 2022 22:04:06 +0200
From: <yann.morin@orange.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <4719_1652299450_627C16BA_4719_69_1_20220511200406.GA1110715@tl-lnx-nyma7486>
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
 <1e866bf0-454c-81a8-7194-19a5b22a1605@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e866bf0-454c-81a8-7194-19a5b22a1605@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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

QXJub3V0LCBBbGwsCgpPbiAyMDIyLTA1LTExIDE5OjE1ICswMjAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBzcGFrZSB0aHVzbHk6Cj4gT24gMTEvMDUvMjAyMiAwODoyMywgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIHdyb3RlOgo+ID5Gcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3Jhbmdl
LmNvbT4KWy0tU05JUC0tXQo+ID5TbywgcmV2ZXJ0IHRvIHRoZSBiZWhhdmlvdXIgZnJvbSBiZWZv
cmUgZjBjN2NiMDFhOTYwLCB3aGVyZSBubyBkb3dubG9hZAo+ID5pcyBhdHRlbXB0ZWQgZm9yIGEg
cGFja2FnZSB3aXRob3V0IGEgc291cmNlIChyZWFsbHksIHdpdGhvdXQgYSBtYWluCj4gPmRvd25s
b2FkLCBub3cpLgo+ID4KPiA+U2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bkBvcmFuZ2UuY29tPgo+ID5DYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5k
KSA8YXJub3V0QG1pbmQuYmU+Cj4gPi0tLQo+ID4gIHBhY2thZ2UvcGtnLWdlbmVyaWMubWsgfCAy
ICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID5kaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5tayBiL3BhY2thZ2UvcGtnLWdl
bmVyaWMubWsKPiA+aW5kZXggMzgyMTljZTA4OC4uYjIzM2IwNzU0OCAxMDA2NDQKPiA+LS0tIGEv
cGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+ID4rKysgYi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCj4g
PkBAIC0xOTIsNyArMTkyLDcgQEAgJChCVUlMRF9ESVIpLyUvLnN0YW1wX2Rvd25sb2FkZWQ6Cj4g
PiAgCQkJYnJlYWsgOyBcCj4gPiAgCQlmaSA7IFwKPiA+ICAJZG9uZQo+ID4tCSQoY2FsbCBET1dO
TE9BRCwkKCQoUEtHKV9NQUlOX0RPV05MT0FEKSwkKFBLRyksJChwYXRzdWJzdCAlLC1wICclJywk
KCQoUEtHKV9ET1dOTE9BRF9QT1NUX1BST0NFU1MpKSkKPiA+KwkkKGlmICQoJChQS0cpX01BSU5f
RE9XTkxPQUQpLCQoY2FsbCBET1dOTE9BRCwkKCQoUEtHKV9NQUlOX0RPV05MT0FEKSwkKFBLRyks
JChwYXRzdWJzdCAlLC1wICclJywkKCQoUEtHKV9ET1dOTE9BRF9QT1NUX1BST0NFU1MpKSkpCj4g
Cj4gIFBlcmZlY3Rpb24gaXMgdGhlIGVuZW15IG9mIHRoZSBnb29kIGFuZCBhbGwgdGhhdCwgYnV0
IGEgZmV3IGxpbmVzIGJlbG93LCB3ZQo+IGFjdHVhbGx5IGhhdmUgdGhlIHNhbWUgaXNzdWUgZm9y
IEFDVFVBTF9TT1VSQ0UuCgpOb3BlLCBiZWNhdXNlIHRoaXMgaXMgb25seSBldmVyIGF0dGVtcHRl
ZCBpZiB0aGUgYWN0dWFsIHNvdXJjZSBpcyBub3QKdGhlIHNhbWUgYXMgdGhlIG1haW4gc291cmNl
IGFuZCBpZiBBQ1RVQUxfU09VUkNFIGlzIG5vdCBlbXB0eToKCiAgIDg1MiAkKDIpX1RBUkdFVF9B
Q1RVQUxfU09VUkNFID3CuyQkKCQoMilfRElSKS8uc3RhbXBfYWN0dWFsX2Rvd25sb2FkZWQKICAg
Li4uCiAgIDk3NCAjIE9ubHkgZG93bmxvYWQgdGhlIGFjdHVhbCBzb3VyY2UgaWYgaXQgZGlmZmVy
cyBmcm9tIHRoZSAnbWFpbicgYXJjaGl2ZQogICA5NzUgaWZuZXEgKCQkKCQoMilfQUNUVUFMX1NP
VVJDRV9UQVJCQUxMKSwpCiAgIDk3NiBpZm5lcSAoJCQoJCgyKV9BQ1RVQUxfU09VUkNFX1RBUkJB
TEwpLCQkKCQoMilfU09VUkNFKSkKICAgOTc3ICQoMSktbGVnYWwtc291cmNlOsK7ICQkKCQoMilf
VEFSR0VUX0FDVFVBTF9TT1VSQ0UpCiAgIDk3OCBlbmRpZiAjIGFjdHVhbCBzb3VyY2VzICE9IHNv
dXJjZXMKICAgOTc5IGVuZGlmICMgYWN0dWFsIHNvdXJjZXMgIT0gIiIKClNvIEkgYmVsaWV2ZSB0
aGF0IHdlIGRvIG5vdCBoYXZlIHRoZSBpc3N1ZSB3aXRoIEFDVFVBTF9TT1VSQ0UuCgo+ICBTbyBt
YXliZSBpbnN0ZWFkIHRoZSBjb25kaXRpb24gc2hvdWxkIGJlIG1vdmVkIGluc2lkZSB0aGUgRE9X
TkxPQUQgbWFjcm8sCj4gYW5kIGl0IHNob3VsZCBjaGVjayAkKG5vdGRpciAkKDEpKS4KCkkgZG9u
J3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0LiBJZiB0aGUgZGwtd3JhcHBlciB3ZXJlIHRvIGJlIGNo
YW5nZWQsCnRoZW4gaXQgc2hvdWxkIGJlIGNoYW5nZWQgdG8gbm90IGFjY2VwdCB0byBiZSBjYWxs
ZWQgd2l0aG91dCBhbnkgVVJJLgoKQWZ0ZXJhbCwgaWYgd2UgY2FsbCB0aGUgZGwtd3JhcHBlciwg
dGhhdCdzIGV4YWN0bHkgYmVjYXVzZSB3ZSB3YW50IHRvCmRvd25sb2FkIHNvbWV0aGluZywgc28g
aXQgZG9lcyBub3QgbWFrZSBzZW5zZSB0byBjYWxsIGl0IGluIGEgd2F5IHRoYXQKd2lsbCBub3Qg
dHJpZ2dlciBhbnkgZG93bmxvYWQuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkg
ICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICszMyA1MzQuNTQxLjE3OSB8IFNvZnR3YXJlICBEZXNp
Z25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUg
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8Cnwg
ICAgICB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBI
VE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19f
X19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpDZSBtZXNzYWdlIGV0IHNl
cyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlk
ZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMKcGFzIGV0cmUgZGlm
ZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZl
eiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXIKYSBsJ2V4
cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVz
IG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwK
T3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBh
bHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLgoKVGhpcyBtZXNzYWdlIGFuZCBpdHMg
YXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3Jt
YXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsKdGhleSBzaG91bGQgbm90IGJlIGRp
c3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uCklmIHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLgpBcyBlbWFpbHMg
bWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhh
dmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuClRoYW5rIHlvdS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

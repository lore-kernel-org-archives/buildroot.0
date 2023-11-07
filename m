Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC02C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 10:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E77417D1;
	Tue,  7 Nov 2023 10:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E77417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7pvwoU8WaR3; Tue,  7 Nov 2023 10:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB130417E8;
	Tue,  7 Nov 2023 10:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB130417E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3722C1BF289
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BE05417E6
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE05417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JC_I_x-vKdtU for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 10:17:03 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 563BA417D1
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 10:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 563BA417D1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D38F419F57B;
 Tue,  7 Nov 2023 11:16:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 11:16:52 +0100
Date: Tue, 7 Nov 2023 11:16:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231107101652.GB229059@scaer>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <6d9e618d-0cfa-4f13-9cfa-bb677fb9c29b@mind.be>
 <CAHDQB6Opc5ZwVXu=iXFHTj3J-2xJAjSq14fkJ23kv597R3tkSQ@mail.gmail.com>
 <1ad60088-4e13-41ee-bb74-b1ef96ccb153@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ad60088-4e13-41ee-bb74-b1ef96ccb153@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699352220;
 bh=EubeuSYWqkr9ckcntPwXUtZMiiQWfpweHNM/PNm8hNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LLY2NJPVaadZbs3ruzgrgU2mQG+oPiVT5qQKJaOAYsHEGhM4FOFi5qxh8hOE53epD
 fSWZ3sndYGjrFK13SmdIo7h0ZDlChaSkjrI2vaBlv0Tbfo8bOQOnfZcvHFwR6ULKrC
 mWFbY+Ql5TE2hITimS0jcMISu/sh9avLjz7PziN3qOzTVvwryiM0kVD7WqC/Vv2Yel
 M7Ku/DTBNIyM56Qg9Vp0HgJ6W8zDUDRtnhyKZe/VrAtjS3lqUXrTvvX14wLAPK8RA6
 phzkNf6+pxIytmoiAuz73PQt35fq4EwBjwO3Wd2hUybefc+xtCN4SN80mH5lvHJlBR
 tXepT7IuHTm2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LLY2NJPV
Subject: Re: [Buildroot] [PATCH v2 01/24] package/python3: use upstream
 build system to disable berkeleydb module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBZGFtLCBBbGwsCgpPbiAyMDIzLTExLTA3IDA5OjUwICswMTAwLCBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSBzcGFrZSB0aHVzbHk6Cj4gT24gMDYvMTEvMjAyMyAyMToyMCwgQWRhbSBEdXNr
ZXR0IHdyb3RlOgo+ID5BaCwgSSBtaXNzZWQgdGhhdCBjb21tZW50Lgo+ID4KPiA+VGhpcyB3b3Vs
ZCBiZSB1cCB0byB5b3UgYW5kIFlhbm4gdG8gZGVsaWJlcmF0ZSBvbi4gSSB3YXMgdG9sZCBieSBZ
YW5uIHRvCj4gPnJ1biBhIGBnaXQgYW1gIG9uIEJlcm5kcyBwYXRjaAo+ID5zZXJpZXMgYW5kIGFw
cGx5IGl0IHRvIHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlcmllcy4gSXQncyBhIGdvb2QgaWRlYSBh
cyBpdAo+ID5tYWtlcyBtaWdyYXRpbmcgdG8gUHl0aG9uIDMuMTIuMAo+ID5lYXNpZXIgaW4gdGhl
IGNhc2Ugd2UgbmVlZCB0byByZXZlcnQsIGFzIHRoZSBzZXJpZXMgaGFzIGJlZW4KPiA+dGhvcm91
Z2hsecKgdGVzdGVkIG9uIDMuMTEgYXMgd2VsbC4KPiAKPiAgSW4gdGhhdCBjYXNlLCBJIGRpc2Fn
cmVlIHdpdGggWWFubiBvbiB0aGlzIHBvaW50IDotKQo+IAo+ICBUaGUgInVzZSB1cHN0cmVhbSBi
dWlsZCBzeXN0ZW0iIHBhdGNoZXMgaGF2ZSBsaXR0bGUgdmFsdWUgYnkgdGhlbXNlbHZlczsKPiB0
aGV5J3JlIG9ubHkgdXNlZnVsIHRvIG1ha2UgdXBkYXRpbmcgdGhlIHBhY2thZ2UgZWFzaWVyLiBT
byBpdCdzIHRvdGFsbHkgT0sKPiB0byBhbHNvIHJldmVydCBhbGwgb2YgdGhvc2UgaWYgd2UgZGVj
aWRlIHRvIHJldmVydCB0aGUgdmVyc2lvbiBidW1wLgoKV2hlbiBJIHN1Z2dlc3RlZCBBZGFtIGdy
YWIgdGhlIHNlcmllcyBmcm9tIEJlcm5kLCB0aGF0IHNlcmllcyB3YXMgbm90CnJldmlld2VkOyBp
dCB3YXMgbm90IGFuIGVuZG9yc2VtZW50IG9mIHRoYXQgc2VyaWVzLiBTb3JyeSBpZiBJIGRpZCBu
b3QKbWFrZSB0aGF0IGNsZWFyIGVub3VnaC4uLgoKQnV0IHNpbmNlIEFkYW0gd2FzIGRvaW5nIHRo
ZSB2ZXJzaW9uIGJ1bXAsIGFuZCB0aGUgdmVyc2lvbiBidW1wIHJlcXVpcmVzCnRoZSBtaWdyYXRp
b24sIGl0IG1hZGUgc2Vuc2UgZm9yIHRoZSBtaWdyYXRpb24gdG8gYmUgcGFydCBvZiB0aGUgc2Vy
aWVzCmZyb20gQWRhbS4gVGhlbiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhvc2UgcHJlcGFyYXRv
cnkgcGF0Y2hlcyB0byBiZQpyZXdvcmtlZCBpZiBuZWVkZWQsIGkuZS4gd2l0aCBhIHByb3BlciBy
ZXZpZXcgb2Ygc2FpZCBwYXRjaGVzIHdoaWxlIHRoZXkKd2VyZSBpbmNsdWRlZCBpbiB0aGUgc2Vy
aWVzLCByYXRoZXIgdGhhbiBhIG1lcmUgZ2l0LWFtLgoKTXkgaG9wZSB3YXMgdGhhdCBpdCB3b3Vs
ZCBtYWtlIHRoZSBpbmNyZW1lbnRhbCBtaWdyYXRpb24gZWFzaWVyIHRvCnJldmlldywgYW5kIHRo
ZSBhY3R1YWwsIGZpbmFsIHZlcnNpb24gYnVtcCBhbHNvIGVhc2llciB0byBkaWdlc3QuCgo+ICBT
byB0aGUgb3ZlcnJpZGluZyBjb25jZXJuIGluIHRoYXQgY2FzZSBzaG91bGQgYmUgZWFzZSBvZiBy
ZXZpZXcsIEkgdGhpbmsuCj4gQW5kIEkgZXhwZWN0IHRoYXQgaXQgd2lsbCBiZSBhIF9sb3RfIGVh
c2llciB0byByZXZpZXcgaWYgaXQncyBwYXJ0IG9mIHRoZQo+IHZlcnNpb24gYnVtcCwgYmVjYXVz
ZSB0aGVuIGl0J3MganVzdCAidXNlIHRoZSB1cHN0cmVhbSB3YXkgb2Ygc3BlY2lmeWluZwo+IGZl
YXR1cmVzIHRvIGRpc2FibGUsIGFuZCBkcm9wIHRoZSBub3ctcmVkdW5kYW50IHBhdGNoZXMiLiBX
aXRoIHRoZQo+IGluZGl2aWR1YWwgInVzZSB1cHN0cmVhbSBidWlsZCBzeXN0ZW0iIHBhdGNoZXMg
d2UgaGF2ZSB0byBjaGVjayBmb3IgZXZlcnkKPiBwYXRjaCBpZiBpdCByZWFsbHkgZG9lcyB3aGF0
IGl0IGlzIHN1cHBvc2VkIHRvIGRvLgo+IAo+ICBOb3csIHRoaXMgaXNuJ3Qgc3VmZmljaWVudCBy
ZWFzb24gdG8gYXNrIHlvdSB0byBzcGluIGEgdjMsIGl0IHNob3VsZCBiZQo+IGVhc3kgZW5vdWdo
IHRvIGRvIHRoZSBzcXVhc2hpbmcgd2hpbGUgYXBwbHlpbmcuIFRoYXQgc2FpZCwgaXQncyBzdGls
bCBhIGJpdAo+IG9mIHdvcmssIHNvIHdlIGRlZmluaXRlbHkgd29uJ3QgY29tcGxhaW4gaWYgeW91
IHNwaW4gYSB2MyA6LSkKPiAKPiAgQnV0IGxldCdzIGZpcnN0IHdhaXQgaWYgWWFubiBoYXMgYSBj
b3VudGVyLWFyZ3VtZW50IHRvIG1lLgoKTm93IHRoYXQgSSBicmllZmx5IGxvb2tlZCBhdCB0aGUg
cGF0Y2hlcywgSSBiYXNpY2FsbHkgYWdyZWUgd2l0aCBBcm5vdXQsCmJ1dC4uLgoKTm90IGFsbCBw
YXRjaGVzIG1pZ3JhdGluZyB0byB0aGUgdXBzdHJlYW0gYnVpbGQgc3lzdGVtIG5lZWQgYmFja3Bv
cnRzOwpzdWNoIHBhdGNoZXMgdGhhdCBkbyB0aGUgbWlncmF0aW9uICp3aXRob3V0IGJhY2twb3J0
cyogYXJlIGludGVyZXN0aW5nCnRvIGhhdmUgYmVmb3JlIHRoZSBidW1waTsgc29tZSBldmVuIGFs
bG93IHVzIHRvIGRyb3Agb3VyIHBhdGNoZXMsIHdoaWNoCmlzIGEgdmVyeSBnb29kIHRoaW5nLiBU
aGUgb3RoZXJzLCB3aGljaCByZXF1aXJlIGJhY2twb3J0cywgc2hvdWxkIGluZGVlZApiZSBkb25l
IHdpdGggdGhlIHZlcnNpb24gYnVtcC4KCipVbmxlc3MqIG9uZSBvZiB0aGUgbm8tYmFja3BvcnQg
b3B0aW9ucyBkZXBlbmRzIG9uIGFub3RoZXIgdGhhdCByZXF1aXJlcwphIGJhY2twb3J0LCBvZiBj
b3Vyc2UuIEkgdW5kZXJzdGFuZCB0aGF0IG1pZ2h0IGJlIGEgYml0IGRpZmZpY3VsdCB0bwphc3Nl
c3MsIHRob3VnaC4KClNvLCBnaXZlbiBBcm5vdXQncyBwb3NpdGlvbiwgYW5kIHRoZSBhYm92ZSBw
b2ludCwgSSBoYXZlIG5vdCBzdHJvbmcKb3BpbmlvbiBhYm91dCB0aGF0OyBzcXVhc2hpbmcgYWxs
IGludG8gdGhlIHZlcnNpb24gYnVtcCBtaWdodCBpbmRlZWQgYmUKdGhlIGVhc2llc3QgYWZ0ZXIg
YWxsLi4uIEluIGFueSBjYXNlLCBzcXVhc2hpbmcgYXQgdGhlIHNlbmRlcidzIG9yIHRoZQpyZWNl
aXZlcidzIGVuZCBpcyBlYXN5IGVub3VnaC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1BFC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 398C6847EC;
	Fri,  1 Dec 2023 10:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 398C6847EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZHRBQPsFoas; Fri,  1 Dec 2023 10:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B089847EE;
	Fri,  1 Dec 2023 10:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B089847EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE3F1BF344
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24021847EC
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24021847EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBUB-VHldmIs for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:33:05 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A258847DF
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A258847DF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0628F200412;
 Fri,  1 Dec 2023 11:32:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 11:32:58 +0100
Date: Fri, 1 Dec 2023 11:32:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20231201103258.GO3177259@scaer>
References: <20231201073304.1599298-2-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231201073304.1599298-2-salvador.joseluis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701426782;
 bh=DghvhWIRVBZ6eOGCbmnOduHl7wgAwCLDMocTa+C5MBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DtHMb6LNPmZhejXVLqtBKNlNmPyIV1yxdq6p4YE0JjywdqYNhwTNOYVkGRIkZb/zl
 vztvevLNpkJdARsmI9hv5aOFsQzfdVWian+H6XqFjSkYPwACmxDv2E3x4omYU30Znx
 W0wIsGpsgnbtnyMpByon35GkdpwqTc9Iy83POdoXQCEt71vyFefWPCGG9shZJE/+lL
 H1ZvKj0+irYedOjfx7yL62gUqFxqaEnFFEUnSEMoG2mVLzMzH+HbriQIHFpceF54Jd
 PvPt7m4WDMYbC1XHOEsJQiBNrk0jhBEOM9xnGXgjF9ZQqLrjwUYbAROins42HsFxz8
 mplEmCmWCe4eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DtHMb6LN
Subject: Re: [Buildroot] [PATCH] package/zfs: bump version to 2.2.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjMtMTItMDEgMDg6MzMgKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gVGhpcyByZWxlYXNlIGNvbnRhaW5zIGFuIGltcG9ydGFu
dCBmaXggZm9yIGEgZGF0YSBjb3JydXB0aW9uCj4gYnVnLiBGdWxsIGRldGFpbHMgYXJlIGluIHRo
ZSBpc3N1ZSBbMV0gYW5kIGJ1ZyBmaXggWzJdLgo+IAo+IDEuIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9pc3N1ZXMvMTU1MjYKPiAyLiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96
ZnMvcHVsbC8xNTU3MQo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVm
byA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKU2luY2UgdGhpcyBpcyBhIGRhdGEtY29y
cnVwdGlvbiBmaXgsIEkndmUgYXBwbGllZCB0byBtYXN0ZXIsIGFmdGVyCmJhY2twb3J0aW5nIHRo
ZSAyLjIuMCBidW1wIGZyb20gdGhlIG5leHQgYnJhbmNoLiBUaGFua3MhCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS96ZnMvemZzLmhhc2ggfCA0ICsrLS0KPiAgcGFj
a2FnZS96ZnMvemZzLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMuaGFz
aCBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCj4gaW5kZXggYjAyYzQ5MjM0YS4uMDFjODZmMmJkNiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvemZzL3pm
cy5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gLSMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYg
IDQyMDM1ZmQwNTlmYWEyNWEwOWNkNTExYjI0YTU3YjhhZDEyODVjYjY5MTI3ZjJhMDA0M2I5ODU2
MmM1ZWM2OTAgIHpmcy0yLjIuMC50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4yLjIvemZzLTIuMi4yLnNoYTI1Ni5h
c2MKPiArc2hhMjU2ICA3NmJjMDU0N2Q5YmEzMWQ0YjAxNDJlNDE3YWFhZjlmOTY5MDcyYzNjYjNj
MWE1YjEwYzg3MzhmMzllZDEyZmM5ICB6ZnMtMi4yLjIudGFyLmd6Cj4gIAo+ICAjIEhhc2ggZm9y
IGxpY2Vuc2UgZmlsZXM6Cj4gIHNoYTI1NiAgMWZmYjcwYzMzYzRmNzlmMDRlOTQ3ZmFjYzVjNzg1
MWYyODk2MDkyNTZhYWNiNDdmYzExNWY3MDA0MjdkOTUyMCAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKPiBpbmRleCBkODU5NTZj
OThiLi5hMmM3YjUzNTFkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pmcy5tawo+ICsrKyBi
L3BhY2thZ2UvemZzL3pmcy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gIAo+IC1aRlNfVkVSU0lPTiA9IDIuMi4wCj4gK1pGU19WRVJTSU9OID0g
Mi4yLjIKPiAgWkZTX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFz
ZXMvZG93bmxvYWQvemZzLSQoWkZTX1ZFUlNJT04pCj4gIFpGU19TRUxJTlVYX01PRFVMRVMgPSB6
ZnMKPiAgWkZTX0xJQ0VOU0UgPSBDRERMCj4gLS0gCj4gMi40My4wCj4gCgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

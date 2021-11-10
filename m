Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:12:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C895610CF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C895610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8FD18100B;
	Wed, 10 Nov 2021 09:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z72dQsDoEMJ3; Wed, 10 Nov 2021 09:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B9B8101A;
	Wed, 10 Nov 2021 09:12:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3701BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BA978101A
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmNW3T-xU0kC for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:12:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0B28100B
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:12:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D10545FFA0;
 Wed, 10 Nov 2021 10:12:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636535532;
 bh=dPXAxFYHENy1kuxni9JQ5GfwpXUNht4HXnNECAgUyc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uwz7DiW87/bDnn5M5L6RFBlar+q7u37RmfQAaemgny52s68ja/EswrKaq3P/uCyzH
 0PM7YLv/NU5Npf3DvP8UuJY6mR7U6qPSyqGoS/vCz3H/GqSDdLHBEK7zUPU6g8RcdL
 RK1xkQAlhClif0mufiAnbm0m8UyruirbJYuQKtM+iXsQXWScbl6PP3cNtOVOhcZU9g
 WmvBeg3bAhDU++XrWWRdeEOxKmA0Tjpa2ZbghlrncQOWtFxoEXgW7lWN0Z112zTh8Q
 CfOlWHYpDoztjOwOd5o2L9ToQhK5PBy6X4W1kMFQd7fK07CPheGryRTosXt7buK9He
 qf6eoaNUtfhzQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:12:03 +0100
Date: Wed, 10 Nov 2021 10:12:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110091203.GD2084998@scaer>
References: <20211030214734.2154583-1-fontaine.fabrice@gmail.com>
 <20211101094752.4f0e6943@windsurf>
 <8aa1132c-43c5-93bc-718b-5199c9936c0d@mind.be>
 <20211109222551.GB2084998@scaer>
 <CAPi7W82g-5Bs1gxUOqXwgqnx8EgBgENYwGLbAX6XvVfCd5+s5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W82g-5Bs1gxUOqXwgqnx8EgBgENYwGLbAX6XvVfCd5+s5Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: needs zlib
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0xMS0wOSAyMzozNyArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgbWFyLiA5IG5vdi4gMjAyMSDDoCAyMzoyNiwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+IE9uIDIwMjEtMTEt
MDkgMjI6NDAgKzAxMDAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHNwYWtlIHRodXNseToKPiA+ID4g
T24gMDEvMTEvMjAyMSAwOTo0NywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiA+ID4gPk9uIFNh
dCwgMzAgT2N0IDIwMjEgMjM6NDc6MzQgKzAyMDAKPiA+ID4gPkZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPj5vcHJvZmlsZSBuZWVkcyB6
bGliIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aGljaCBpcywgZm9yCj4g
PiA+ID4+YW4gdW5rbm93biByZWFzb24sIG9ubHkgcmFpc2VkIHNpbmNlIEF1Z3VzdCAyMDIxOgo+
ID4gPiA+SSBkb24ndCByZWFsbHkgbGlrZSBjaGFuZ2VzIHRoYXQgYXJlIG1hZGUgImZvciBhbiB1
bmtub3duIHJlYXNvbiIuCj4gPiA+ICBOb3RlIHRoYXQgaW4gdGhpcyBjb25maWd1cmF0aW9uLCB6
bGliIGlzIG5vdCBzZWxlY3RlZCAoKiksIGJ1dCBhcHBhcmVudGx5Cj4gPiA+IGxpYmJmZCBpcyBz
dGlsbCBidWlsdCB3aXRoIHpsaWIgc3VwcG9ydC4uLgo+ID4gVGhhdCdzIGJlY2F1c2UgYmludXRp
bHMgKGF0IGxlYXN0IDIuMzYuMSkgc2hpcHMgd2l0aCBhIGJ1bmRsZWQgY29weQo+ID4gdGhhdCBp
dCBidWlsZHM6Cj4gPgo+ID4gICAgID4+PiBiaW51dGlscyAyLjM2LjEgQnVpbGRpbmcKPiA+ICAg
ICBbLi4uXSAvdXNyL2Jpbi9tYWtlIC1qOSBMSUJTPSBNQUtFSU5GTz10cnVlIC1DIC9ob21lL3lt
b3Jpbi9kZXYvYnVpbGRyb290L08vYnVpbGQvYmludXRpbHMtMi4zNi4xLwo+ID4gICAgIG1ha2Vb
M106IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2FsbC10YXJnZXQnLgo+ID4gICAgIENvbmZpZ3Vy
aW5nIGluIC4vZXRjCj4gPiAgICAgY29uZmlndXJlOiBjcmVhdGluZyBjYWNoZSAuL2NvbmZpZy5j
YWNoZQo+ID4gICAgIGNoZWNraW5nIGZvciBhIEJTRC1jb21wYXRpYmxlIGluc3RhbGwuLi4gL3Vz
ci9iaW4vaW5zdGFsbCAtYwo+ID4gICAgIGNvbmZpZ3VyZTogdXBkYXRpbmcgY2FjaGUgLi9jb25m
aWcuY2FjaGUKPiA+ICAgICBjb25maWd1cmU6IGNyZWF0aW5nIC4vY29uZmlnLnN0YXR1cwo+ID4g
ICAgIGNvbmZpZy5zdGF0dXM6IGNyZWF0aW5nIE1ha2VmaWxlCj4gPiAgICAgbWFrZVs0XTogTm90
aGluZyB0byBiZSBkb25lIGZvciAnYWxsJy4KPiA+ICAgICBDb25maWd1cmluZyBpbiAuL3psaWIK
PiA+ICAgICBbLi4uXQo+ID4KPiA+IEFuZCBoZW5jZSBsaWJiZmQgaXMgYnVpbHQgYWdhaW5zdCB0
aGUgYnVuZGxlZCBsaWJ6LCB3aGljaCBiZWluZyB3aGF0Cj4gPiBhdXRvdG9vbHMgY2FsbCBhIGNv
bnZlbmllbmNlIGxpYnJhcnksIGlzIG5vdCBpc250YWxsZWQuCgouLi4gYW5kIGl0IGlzIGFsc28g
bm90IGluc3RhbGxlZCBiZWNhdXNlIHdlIGFueXdheSBvbmx5IGRvIGEgcGFydGlhbAppbnN0YWxs
IG9mIHNlbGVjdCBsaWJyYXJpZXMuCgo+ID4gQW5kIHRoaXMgYnVuZGxlZCBjb3B5IGlzIGFsd2F5
cyBidWlsdCwgZXZlbiBpZiBvbmUgaXMgYWxyZWFkeSBwcmVzZW50IGluCj4gPiB0aGUgc3lzdGVt
IChpLmUuIHdpdGggemxpYiBlbmFibGVkIGluIHRoZSBjb25maWd1cmF0aW9uKS4KPiBGcm9tIG15
IHVuZGVyc3RhbmRpbmcgb2YgYmludXRpbHMncyBjb25maWd1cmUuYWMsIHdlIHNob3VsZCBiZSBh
YmxlIHRvCj4gZGlzYWJsZSB0aGUgYnVuZGxlZCBjb3B5IHRocm91Z2ggLS13aXRoLXN5c3RlbS1s
aWIgd2hpY2ggaXMgYXZhaWxhYmxlCj4gc2luY2UgdmVyc2lvbiAyLjI2IGFuZAo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9ibWlub3IvYmludXRpbHMtZ2RiL2NvbW1pdC9jZjM5Y2ZjNTJlYmQ2ODNkNTVm
YzM5NmE3NzM1NWYzNGI1MDk0YzA0OgoKT2ggeWVzLCBJIGZvcmdvdCB0byBtZW50aW9uIHRoYXQg
eWVzdGVyZGF5LiBZZXMsIHRoaXMgaXMgSSBiZWxpZXZlIHRoZQpiZXN0IHNvbHV0aW9uOiBiaW51
dGlscyBzaG91bGQgYWx3YXlzIGRlcGVuZCBvbiB6bGliIChpdCBjdXJyZW50bHkgb25seQpjb25k
aXRpb25hbGx5IGRlcGVuZHMgb24gaXQpLgoKQ2FyZSB0byBzZW5kIHRoZSBwYXRjaCwgcGxlYXNl
PwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

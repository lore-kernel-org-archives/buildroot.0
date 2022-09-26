Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC96C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F2460E8D;
	Mon, 26 Sep 2022 07:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F2460E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTju7GqwHapB; Mon, 26 Sep 2022 07:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E126860E83;
	Mon, 26 Sep 2022 07:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E126860E83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3751BF424
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 07:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DF68408EC
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 07:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF68408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcW5tz-BBf2J for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 07:05:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84676408E9
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84676408E9
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 07:05:50 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4MbYgc0Y39z7v2l; 
 Mon, 26 Sep 2022 09:05:48 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 09:05:45 +0200
Date: Mon, 26 Sep 2022 09:05:45 +0200
From: <yann.morin@orange.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <19776_1664175947_63314F4B_19776_212_2_20220926070545.GA3010@tl-lnx-nyma7486>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de> <Yy3e9fTSv19Zxq9T@oscomms1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy3e9fTSv19Zxq9T@oscomms1>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1664175948;
 bh=veVVFVFpACDCfEt1p+hsLUXFvVf+Z4SSbZH8RxDAJig=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=JtTB0C+w0LD0NgnVZNsqHnOjByWnfIrVwXU6J2ISlVUTX2BzsaYxrvsofz1O2Qs12
 FClwsuJ73TXSRZXGS+6b8TMaZ4HZ0F5f2H8UGf5e/BfMhP0Wk3YJzftUPsicgTPLO9
 OqOwQHHm+B+JtgVKA/KdbnstKcosGgS3+w1JowXgW4sJXD+2y7TCgptsKvsxy0MSYY
 wc4AmFNaHjruVpJ5tgLsXnMEsENdZ6+BerFn3PcWrZZmx8nCLk/PnClsBsF7monDtm
 4oKULBiPM5v3SS98oxuhGocxs/qDiYDT9O1Wtoh/d/0qZO2QEaU04lsUtXdV43WogM
 A6T9gIC5eL10A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=JtTB0C+w
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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

U3RmZm9yZCwgV2FsZGVtYXIsIEFsbCwKCk9uIDIwMjItMDktMjMgMTY6MjkgKzAwMDAsIFN0YWZm
b3JkIEhvcm5lIHNwYWtlIHRodXNseToKPiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAwNToyMzox
MVBNICswMjAwLCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPiA+ID4gT24gMjAyMi0wOS0yMyAx
NDoxMyArMDIwMCwgTU9SSU4gWWFubiBJTk5PVi9JVC1TIHNwYWtlIHRodXNseToKPiA+ID4gPiBP
biAyMDIyLTA5LTIzIDA1OjMwICswMDAwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qg
c3Bha2UgdGh1c2x5Ogo+ID4gPiA+ID4gICAgIG9yMWsgICAgIHwgICAgICAgICAgIGdwc2QtMy4y
NCAgICAgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3Vs
dHMvN2FkYzEyNWU4NDNiMjFiNTU5ZjFlODgxMzA1OWQ2NWFmNThmZWI4ZCB8ICAgICAKPiA+ID4g
PiBUaGlzIGlzIGFuIG9yMWssIHNoYXJlZC1vbmx5LCB1Q2xpYmMtbmcsIExUIChub3QgTlBUTCkg
c28gbm8gVExTLCBidWlsZC4KPiA+ID4gPiAgICAgLi4uLi9vcjFrLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMtZ2NjIC1vIGdwc2QtMy4yNC9ncHNjdGwgLi4uLiAtbHVzYi0xLjAgLWxtIC1scnQgLWxu
c2wKPiA+ID4gPiAgICAgLi4uLi9sZDogLi4uLi9zeXNyb290L3Vzci9saWIvbGlidXNiLTEuMC5z
bzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX190bHNfZ2V0X2FkZHInCgpTbywgSSBtYWRlIHNv
bWUgcHJvZ3Jlc3MgaW4gbG9va2luZyBhdCB0aGlzLgoKX190bHNfZ2V0X2FkZHIgYXBwZWFycyBp
biBsaWJ1c2Ivb3MvLmxpYnMvdGhyZWFkc19wb3NpeC5vCgpTbywgbG9va2luZyBhdCB0aGUgY29k
ZSwgd2UgY2FuIHNlZToKCiAgIDg0IHVuc2lnbmVkIGludCB1c2JpX2dldF90aWQodm9pZCkKICAg
ODUgewogICA4NiDCuyAgIHN0YXRpYyBfVGhyZWFkX2xvY2FsIHVuc2lnbmVkIGludCB0bF90aWQ7
CgpIb3dldmVyLCBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCBfVGhyZWFkX2xvY2FsIGlzIGFuIGF0
dHJpYnV0ZSwgc28gYQpjb21waWxlciBmZWF0dXJlICh0aGF0IHBhZ2UgZGlzY3Vzc2VzIF9fdGhy
ZWFkLCBidXQgSSB1bmRlcnN0YW5kIHRoYXQKX1RocmVhZF9sb2NhbCBpcyBlcXVpdmFsZW50KToK
ICAgIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvVGhyZWFkLUxvY2FsLmh0bWwK
ClNvLCBpZiBJIHJlbW92ZSB0aGF0IGF0dHJpYnV0ZSAoaXQgaXMgb2J2aW91c2x5IGluY29ycmVj
dCB0byBkbyBzbyksIHRoZQpnZW5lcmF0ZWQgbGlidXNiIG5vIGxvbmdlciBoYXMgYW55IHJlZmVy
ZW5jZSB0byBfX3Rsc19nZXRfYWRkci4gSWYgSQpyZXBsYWNlIGl0IHdpdGggX190aHJlYWQsIHRo
ZW4gX190bHNfZ2V0X2FkZHIgaXMgc3RpbGwgY2FsbGVkLgoKSG93ZXZlciwgd2UgZG8gY29uZmln
dXJlIGdjYyB3aXRob3V0IFRMUzogLS1kaXNhYmxlLXRscwoKTm90ZSB0aGF0LCBmb3IgYW4gb3Ro
ZXIgYXJjaGl0ZWN0dXJlLCBsaWtlIGFybSwgX1RocmVhZF9sb2NhbCBkb2VzIG5vdApnZW5lcmF0
ZSBhIGNhbGwgdG8gX190bHNfZ2V0X2FkZHIgd2l0aCBsaW51eHRocmVhZHMuCgpTbywgdGhpcyBo
aW50cyBhdCBhIGNvbXBpbGVyIGVycm9yLi4uCgpOb3RlIHRoYXQgbGlidXNiIHVzZWQgdG8gaGF2
ZSBhbiBleHBsaWNpdCBjaGVjayBmb3IgX1RocmVhZF9sb2NhbCwgYnV0CnRoZXkgcmVtb3ZlZCBp
dCBpbiA5YTFiYzhjYWZiOTAgWzBdIGluIE1hcmNoIDIwMjAsIHNvIGl0J3MgYmVlbiBpbgpsaWJ1
c2Igc2luY2UgMS4wLjI0LiBUaGF0IGNoZWNrIHdhcyBkb2luZyBhbiBBQ19UUllfTElOSywgc28g
aXQgd291bGQKY2F0Y2ggY29tcGlsZXIgdGhhdCBkaWQgbm90IGhhdmUgKHByb3BlcikgX1RocmVh
ZF9sb2NhbCwgYnV0IHdoZW4gdGhleQpzd2l0Y2hlZCB0byByZXF1aXJpbmcgQzExLCB0aGUgbmV3
IGNoZWNrIGlzIHdpdGggQUNfQ09NUElMRV9JRkVMU0UsCndoaWNoIGRvZXMgbm90IGNhdGNoIG91
ciBzaXR1YXRpb24uCgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL2xpYnVzYi9saWJ1c2IvY29tbWl0
LzlhMWJjOGNhZmI5MAoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwg
QVNDSUkgUklCQk9OIHwKfCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAg
Xy8gLSAvJyAgIHwgXCAvIENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0t
LS0tLS0tLS0tLS0tLTogKF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9y
aW4gKGF0KSBvcmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlM
ICAgIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19f
XzotLS0tLS0tLS0tLS0tLS0tLS0nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQ2UgbWVzc2FnZSBldCBzZXMgcGllY2Vz
IGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxl
cyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jCnBhcyBldHJlIGRpZmZ1c2VzLCBl
eHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBj
ZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyCmEgbCdleHBlZGl0ZXVy
IGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdl
cyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sCk9yYW5nZSBk
ZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBk
ZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4KClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1l
bnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRo
YXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7CnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRl
ZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLgpJZiB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRl
bGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4KQXMgZW1haWxzIG1heSBiZSBh
bHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4g
bW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLgpUaGFuayB5b3UuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEBA610DB;
	Thu,  6 Oct 2022 20:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AEBA610DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-agt64SuF1H; Thu,  6 Oct 2022 20:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C73A610D3;
	Thu,  6 Oct 2022 20:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C73A610D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14BAD1BF310
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2AAF4186B
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AAF4186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Esi0wciwowXQ for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:21:32 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B50141820
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B50141820
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:21:31 +0000 (UTC)
Received: from [192.168.50.20] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gXG6oqr87Dv1egXG8o4Hnj; Thu, 06 Oct 2022 22:14:23 +0200
Message-ID: <e6ddbdfb-7f8b-4eb2-e25d-24fe0c82e981@benettiengineering.com>
Date: Thu, 6 Oct 2022 22:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Wolfgang Grandegger <wg@grandegger.com>, buildroot@buildroot.org
References: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
X-CMAE-Envelope: MS4xfN8cIc0E6OsBL3Y3n4QFTi3UrCP7Cen05PrMNo4ulxarV73Vjkxwg/5e2oQZCr4UjMgbOV/eBiIkIGPt9qLYX9G5d+pyzdjKLMRowUNzEUEfUXzEVjY0
 cED1vINEdOoE53atA+mW6aZfb7lAf7HjQYuWOKLO6WPMMkfpVgzJkHp2+xX/1J2UUsga/WCZ38K1HsJIZS019yKkOZ7k4eOgZuqmQzGTHPcBhPnbACjrjeFO
 3e97ITWCIUjwyzwyWo9WneuIlux8mTIP8y4ddMAnsj6GikP7oCGVC77Ag8OZd54e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665087264; bh=qDlrP+AAjTOfnZSWKJ59WtysLZ+lVLOvJq1dUa7dzQk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=G3s0ZMgw2tOrOjPAY0cw52tOIuvvIMmwCkZo3Ov6ju6Nz+ZBP7E97cLKFKh5LjH7D
 me2FzQ8d9K5CzoPsMVxIgvHGXslmV113OXReW/u/s+ZsOr2Jza3AQzvdbR9r6jrMMU
 NwoSsJdMhq5p/dFtuPpkjL4Kb3AUlguNp2WJxu01VV5/EXnjWsly2cHixDrBX6EatX
 SmG5Cefjqc/CwdR9V6SfJ9UXLufZE6jROwqrj5bblWQKPi4JFpAqqCtC9cyj464U7q
 qfimTjHiPxEzvwfxssgjJv6WUR7U976zcjzSYeTuJaWyqDJhe3ZoUldFS7BDtP4ZqC
 xxVtMP7/c8SxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=G3s0ZMgw
Subject: Re: [Buildroot] [PATCH] package/udisks: install to staging
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgV29sZ2FuZywKCnRoYW5rcyBmb3IgY29udHJpYnV0aW5nIQoKU29tZXRoaW5nIHRvIGRlYWwg
d2l0aC4KQmVmb3JlICdnaXQgc2VuZC1lbWFpbC4uLicgZG8geW91IHVzZSBidWlsZHJvb3QvZ2V0
LWRldmVsb3BlcnMgc2NyaXB0PwoKSSBhc2sgdGhpcyBiZWNhdXNlIEknbSBub3QgaW4gQ2MgYnV0
IEkgbWFpbnRhaW4gdGhpcyBwYWNrYWdlIGFzIHdlbGwgYXMKb3RoZXIgMiBwZW9wbGUuCgpJbCAw
Ni8xMC8yMDIyIDIxOjUyLCBXb2xmZ2FuZyBHcmFuZGVnZ2VyIGhhIHNjcml0dG86Cj4gVURpc2tz
MiBwcm92aWRlcyBhbiBMaWJyYXJ5IEFQSSBbMV0gZm9yIGFjY2Vzc2luZyB0aGUgVURpc2tzMiBz
ZXJ2aWNlIHZpYQo+ICJsaWJ1ZGlza3MyLnNvIi4gRm9yIGRldmVsb3BtZW50IG9mIFVEaXNrczIg
Y2xpZW50cywgaW5zdGFsbCB0byBzdGFnaW5nCj4gYXMgd2VsbCEgVGhpcyBpc3N1ZSBoYXMgYmVl
biByZXBvcnRlZCBhcyBidWcgWzJdIGFzIHdlbGwuCgpJdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdGhh
dCB0aGlzIGhhcyBiZWVuIHJlcG9ydGVkIGFzIGEgYnVnIHNpbmNlIGl0J3MKbm90IGEgYnVnIGJ1
dCBhbiBhZGRpbmcuIFNvIHBsZWFzZSByZW1vdmUgbGFzdCBzZW50ZW5jZS4KCj4gWzFdIGh0dHA6
Ly9zdG9yYWdlZC5vcmcvZG9jL3VkaXNrczItYXBpLzIuOS40L3JlZi1saWJyYXJ5Lmh0bWxbMV0K
PiBbMl0gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTAyNgoKQW5k
IHRoaXMgbGluZSBeXl4gdG9vLgoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8v
Q1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdvbGZnYW5n
IEdyYW5kZWdnZXIgPHdnQGdyYW5kZWdnZXIuY29tPgo+IC0tLQo+ICDCoHBhY2thZ2UvdWRpc2tz
L3VkaXNrcy5tayB8IDEgKwo+ICDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3VkaXNrcy91ZGlza3MubWsgYi9wYWNrYWdlL3VkaXNrcy91
ZGlza3MubWsKPiBpbmRleCAyYmY1MTlhMmNjLi45NTkzMzNkMDFmIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvdWRpc2tzL3VkaXNrcy5tawo+ICsrKyBiL3BhY2thZ2UvdWRpc2tzL3VkaXNrcy5tawo+
IEBAIC0xMCw2ICsxMCw3IEBAIFVESVNLU19TSVRFID0gCj4gaHR0cHM6Ly9naXRodWIuY29tL3N0
b3JhZ2VkLXByb2plY3QvdWRpc2tzL3JlbGVhc2VzL2Rvd25sb2FkL3VkaXNrCj4gIMKgVURJU0tT
X0xJQ0VOU0UgPSBHUEwtMi4wKwo+ICDCoFVESVNLU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+
ICDCoFVESVNLU19DUEVfSURfVkVORE9SID0gZnJlZWRlc2t0b3AKPiArVURJU0tTX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+IAo+ICDCoFVESVNLU19ERVBFTkRFTkNJRVMgPSBcCj4gIMKgwqDCoMKg
IGhvc3QtcGtnY29uZiBcCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

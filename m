Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95569C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CF960D07
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3CF960D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92416084B;
	Mon, 26 Jul 2021 09:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFN51kXibRA5; Mon, 26 Jul 2021 09:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBE46078E;
	Mon, 26 Jul 2021 09:05:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3EE01BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3568401C0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fV-762h8TECT for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:05:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CE24400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:05:22 +0000 (UTC)
Received: from smtpclient.apple ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPA
 id 7wY3mJ6cmeISt7wY3mQfgW; Mon, 26 Jul 2021 11:05:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627290320; bh=UyDw+jKmSHX2Ba6zp6xZSNunIBTZwYIedaIji0+1qTc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=hYoHn1+01cUS96DiEvIGmrOrijxJe6cA+fBXGn+TsQSAUjf7XzraT98KSdlYcKPNY
 kR8Y1DOW2H9Se4T7unvXmc0aGI8SDYzWQyD52YG3nji1VASrLdyGPg8bL/lPXslzVt
 qK+DZia789NTkajtsG8xparsymRZdOv+UbqNt8VPAaNxMRoy3066OLsRx5BWmCZ+7h
 9djkdzYCDj94IMIpSWl6gd03KPsGxLAorHXg08iV9gnwZSNu9tLPa9XYZaOs8PMJJ7
 2NOVvLr0+37TrxUy8VA23q/XNmq5E/h5UJJmWhXAVaG+Af+5zH2Lut70duWc6mQ5/A
 m95z5MLZCc9Pw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 26 Jul 2021 11:05:18 +0200
Message-Id: <2205272C-6615-48C2-B87E-C8312AC8B2E1@benettiengineering.com>
References: <20210726100722.222b235b@windsurf>
In-Reply-To: <20210726100722.222b235b@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfFx5KpIg/qMVM13zyQhNFZBicsNfGvAJG0vQcjntW1g2RXD7NWM/Dm0/PqHDxNUtgBP1wW/UXL46z3+pjffAN52vmYI2dOqrMVHipV1b05FQfiMQo5c/
 wnErkwvzCi1588VnJULWdJ6EisuXPKiKaaIPvCEkiTLN0+z1PJJXuq3MZgFCL1KhhKeP4J6W0Ho8iPMy0e0GLa37u4QZW/0fyr12JbmasvFmWBTLV0QR5dcC
 JI8GBKW1kXV8d0MzA97j4oy+PrcBfYhWCk0EbLoO8HJFPH17frVvQV0oDSPktfJBvHJw/GPckXxjSAZeFTUoXW35WZmxV1f+PE85RiyIZ4M=
Subject: Re: [Buildroot] [PATCH] toolchain: update gcc bug 99140
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDI2IGx1ZyAyMDIxLCBhbGxlIG9yZSAxMDowNywgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBN
b24sIDI2IEp1bCAyMDIxIDEwOjAxOjU5ICswMjAwCj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+IAo+PiBHY2MgYnVnIDk5MTQw
IGlzIHN0aWxsIG5vdCBmaXhlZCBvbiBnY2MgdmVyc2lvbiA4Lnggc28gd2UgbmVlZCB0byBtb3Zl
IGdjYwo+PiB2ZXJzaW9uIHVwIHRvIDkueCB0byBoYXZlIGl0IGNvcnJlY3RseSB3b3JraW5nLgo+
IAo+IEFuZCBzbyB5b3UncmUgcG9zaXRpdmUgaW4gaGFzIGJlZW4gZml4ZWQgaW4gZ2NjIDkueCBh
bmQgbGF0ZXIgdmVyc2lvbnMgPwoKWWVzLCBJ4oCZdmUgcmV0ZXN0ZWQgd2l0aCB0aGUgY29tYmlu
YXRpb24gb2YgYWxsIGJpbnV0aWxzOgoyLjMyLCAyLjM0LCAyLjM1LjIgYW5kIDIuMzYsMSBhZ2Fp
bnN0OgpnY2M5LDEwIGFuZCB0aGV5IHdvcmtlZCBjb3JyZWN0bHkgb24gZ2NjMTAgd2l0aCBhbnkg
YmludXRpbHMuIEkgaGF2ZW7igJl0IGRpZyB0aGUgcmVhc29uIGluc2lkZSBnY2MgYnV0IHRoYXQg
aXMgd2hhdCBJ4oCZdmUgc2Vlbi4KCkhvbmVzdGx5IHRoaXMgc2hvd2VkIHVwIG9ubHkgd2l0aCBn
Y2M4IGFzIEkgcmVtZW1iZXIgYW5kIGl0IHN0aWxsIGRvZXMgaXQgd2l0aCBCb290bGluIHRvb2xj
aGFpbgpvbiBhdXRvYnVpbGRlcihnY2M5K2JpbnV0aWxzIDIuMzMuMSkuCgpHaXVsaW8KCj4gCj4g
VGhhbmtzIQo+IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFu
ZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQK
aHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

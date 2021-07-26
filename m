Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCE1C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8156A60E09
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8156A60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402ED82F4F;
	Mon, 26 Jul 2021 09:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kue2E5e6nL5G; Mon, 26 Jul 2021 09:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CBF82C5E;
	Mon, 26 Jul 2021 09:17:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 915F81BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8120E60848
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62vJe7In_cRf for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:17:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68F5F6062E
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:17:31 +0000 (UTC)
Received: from smtpclient.apple ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPA
 id 7wjpmJQ8beISt7wjpmQozS; Mon, 26 Jul 2021 11:17:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627291049; bh=ArI195uMHBbJ0E4D2VwEC+SWvWmgDz7OmvAuOXOprdo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=c00zvKPvMtaqmQv2I+3oOEPKcX07e8+SVj8pUEpBg9YbL0/L7T0WU1Hfs+lWWhjOP
 FsD+bgEVGgxdiUoZLS2uRlHDNGRiqP3q76P7jm4PkAomxvwa/QXlflXqXSp5/kxzOo
 5YXhjW2iJhWn6BEgcg7DS5S8iuIulV+te9COEXBaUj4zNW4eyU27U0XLh8sg/QQZdl
 neaWXGivhw2xfXzgVuS2XQ23rK8X5vrVBy4hRli79RjIe/OgxdozU2bt+QV/OkU7C8
 wPac4dOZRbLRuC7bihs1PebOf/9YQO2gaIqEWT/Y8qClNaObMyqYCzVVylLm3+WbK1
 CE+vJet80LAKw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 26 Jul 2021 11:17:28 +0200
Message-Id: <CA04665D-1E5D-400A-9CA1-860F8579C01A@benettiengineering.com>
References: <2205272C-6615-48C2-B87E-C8312AC8B2E1@benettiengineering.com>
In-Reply-To: <2205272C-6615-48C2-B87E-C8312AC8B2E1@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfOCRshscDH2vbc/sDkIQ7PSbUAG/xLkGqOuEfw33lpynW5M60k8D0DBT7XGudwQcOZVo4ek5b/0OXRxpG5bKOZGjpS2UlIKEJjWpijmImUyqaymZ35i4
 SKv2lNNlLrtlQmZ62/A7ph4mxoB0hH0cDhhtwwfVwBYnA/Tyfppa1YSq84WF/MoKD3M87mDifIMZhnm0gNwjeWd9Jch5MoYthsPQJnBfEFe8K/AaUpDpyS2q
 6099xaHZ2s/PhR59gn28iur4EAzZMtj8hj9fQCbQFIXgC0mSvZfei2+01mzORE8jOnuXAUVW12v++jOYmYYM1eufobOHcpYamX+wjxmENLk=
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

Cj4gSWwgZ2lvcm5vIDI2IGx1ZyAyMDIxLCBhbGxlIG9yZSAxMTowNSwgR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0dG86Cj4gCj4g
77u/Cj4+IElsIGdpb3JubyAyNiBsdWcgMjAyMSwgYWxsZSBvcmUgMTA6MDcsIFRob21hcyBQZXRh
enpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGhhIHNjcml0dG86Cj4+IAo+PiDv
u79PbiBNb24sIDI2IEp1bCAyMDIxIDEwOjAxOjU5ICswMjAwCj4+IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4gCj4+PiBHY2Mg
YnVnIDk5MTQwIGlzIHN0aWxsIG5vdCBmaXhlZCBvbiBnY2MgdmVyc2lvbiA4Lnggc28gd2UgbmVl
ZCB0byBtb3ZlIGdjYwo+Pj4gdmVyc2lvbiB1cCB0byA5LnggdG8gaGF2ZSBpdCBjb3JyZWN0bHkg
d29ya2luZy4KPj4gCj4+IEFuZCBzbyB5b3UncmUgcG9zaXRpdmUgaW4gaGFzIGJlZW4gZml4ZWQg
aW4gZ2NjIDkueCBhbmQgbGF0ZXIgdmVyc2lvbnMgPwo+IAo+IFllcywgSeKAmXZlIHJldGVzdGVk
IHdpdGggdGhlIGNvbWJpbmF0aW9uIG9mIGFsbCBiaW51dGlsczoKPiAyLjMyLCAyLjM0LCAyLjM1
LjIgYW5kIDIuMzYsMSBhZ2FpbnN0Ogo+IGdjYzksMTAgYW5kIHRoZXkgd29ya2VkIGNvcnJlY3Rs
eSBvbiBnY2MxMCB3aXRoIGFueSBiaW51dGlscy4gSSBoYXZlbuKAmXQgZGlnIHRoZSByZWFzb24g
aW5zaWRlIGdjYyBidXQgdGhhdCBpcyB3aGF0IEnigJl2ZSBzZWVuLgo+IAo+IEhvbmVzdGx5IHRo
aXMgc2hvd2VkIHVwIG9ubHkgd2l0aCBnY2M4IGFzIEkgcmVtZW1iZXIgYW5kIGl0IHN0aWxsIGRv
ZXMgaXQgd2l0aCBCb290bGluIHRvb2xjaGFpbgo+IG9uIGF1dG9idWlsZGVyKGdjYzkrYmludXRp
bHMgMi4zMy4xKS4KCk9vcHMsIHNvcnJ5IGl0IG11c3QgYmUgbW92ZWQgdG8gMTAueCBub3QgOS54
Ck5lZWQgdG8gcmV0ZXN0IGFsbCB0aGVuLiBJ4oCZdmUgbWFkZSBjb25mdXNpb24gb24gdGhpcy4g
U29ycnkgZm9yIHRoZSBub2lzZS4KCkdpdWxpbwoKPiAKPiBHaXVsaW8KPiAKPj4gCj4+IFRoYW5r
cyEKPj4gCj4+IFRob21hcwo+PiAtLSAKPj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgo+PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4+
IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D6EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F275C40370;
	Mon, 24 Jan 2022 09:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rtkQSXDRRzI; Mon, 24 Jan 2022 09:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B3A40273;
	Mon, 24 Jan 2022 09:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF321BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB4A404CF
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3yTgJ4hwrjF for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 464F64049C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:06:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 706A9B80ED4;
 Mon, 24 Jan 2022 09:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6A7C340E1;
 Mon, 24 Jan 2022 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643015213;
 bh=7KHF2e1/H7IbJ6VlS6tWiIStUYa2wJ9lRMmaIw22mb8=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=JvobSI9igQ09MdZYSv7gKb2HGoSd7qhXKDbNU3ifK8ZhtiomtxMISMI6Nw+lFlOYa
 BjhVOxM9724IO/PW/L80PzyIfCTSB3cokFNrG+PIxt8XzjrSlgiKIgMhu1rrGa08nq
 1fPO0zNLqkHM+Nzy/yd/GBuljBKDZjeZxrZ8Te7mFwRGoa/WuHK6nQNEBfLePgYRPR
 O4xW6+Da1LaAHA8EWD9jvm3Gb781HyQBvk1g+U+P9l/ZYg0sdzga4Id3UYMzKdQFmo
 IN44wwarCmexfDns6XAvQ+dZ75so5f6x5mj4M0yxf8PAKzqX5MoeucAg0cpIhKu/Ns
 lGhr/WgAbpMOA==
MIME-Version: 1.0
In-Reply-To: <0FCF99B5-6DEF-4CEB-9686-033655A6802E@benettiengineering.com>
References: <164301384246.4708.15294151281235312059@kwain>
 <0FCF99B5-6DEF-4CEB-9686-033655A6802E@benettiengineering.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <164301520937.4708.9842501306400984658@kwain>
Date: Mon, 24 Jan 2022 10:06:49 +0100
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXVvdGluZyBHaXVsaW8gQmVuZXR0aSAoMjAyMi0wMS0yNCAwOTo1OTo0NSkKPiAKPiA+IElsIGdp
b3JubyAyNCBnZW4gMjAyMiwgYWxsZSBvcmUgMDk6NDUsIEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0
QGtlcm5lbC5vcmc+IGhhIHNjcml0dG86Cj4gPiAKPiA+IO+7v1F1b3RpbmcgR2l1bGlvIEJlbmV0
dGkgKDIwMjItMDEtMjMgMjM6MjE6NTApCj4gPj4gCj4gPj4gUmUtcmVhZGluZyB0aGlzIGFmdGVy
IHNvbWUgZGF5IGl0IGxvb2tzIHRvIG1lIGxpa2UgdGhlIHNpbXBsZQo+ID4+IEJSMl9QQUNLQUdF
X1JFRlBPTElDWV9FTkFCTEVBVURJVCBpcyBjb3JyZWN0LiBCZWNhdXNlIGl0ICJSZW1vdmVzIGFs
bCAKPiA+PiBkb250YXVkaXQgcnVsZXMgZnJvbSBwb2xpY3kuY29uZiIsIHNvIGl0J3MgdHJ1ZSB0
aGF0IGl0IGVuYWJsZXMgYXVkaXQgCj4gPj4gbG9ncyBpbiB0aGUgZW5kLiBJdCdzIGEgdmVyeSBz
cGVjaWZpYyBvcHRpb25zIGFuZCB0aGUgb25lIHdobyB3aWxsIHVzZSAKPiA+PiBpdCB3aWxsIGtu
b3cgd2hhdCBoZSB3aWxsIGVuYWJsZSBhbmQgbW9zdCBvZiBhbGwgd2UgY2FuIHNwZWNpZnkgaW4g
dGhlIAo+ID4+IGhlbHAgc2VjdGlvbiB0aGF0Ogo+ID4+ICJSZW1vdmVzIGFsbCBkb250YXVkaXQg
cnVsZXMgZnJvbSBwb2xpY3kuY29uZiIKPiA+IAo+ID4+IERvZXMgaXQgd29yayBmb3IgeW91Pwo+
ID4gCj4gPiBBcyBsb25nIGFzIHRoZSBoZWxwIHRleHQgaXMgY2xlYXIgZW5vdWdoIGZvciB0aGUg
dXNlciwgZWl0aGVyIGNvbmZpZwo+ID4gb3B0aW9uIG5hbWUgc2hvdWxkIGJlIGFjY2VwdGFibGUu
IFVzaW5nIHRoZSBhYm92ZSBpcyBnb29kIHRvIGhhdmUgYW4gMToxCj4gPiBtYXBwaW5nIHdpdGgg
dGhlIHRhcmdldCBuYW1lLCBhdCB0aGUgZXhwZW5zZSBvZiBoYXZpbmcgdGhlIGhlbHAgdGV4dCBu
b3QKPiA+IG1hdGNoaW5nIGl0IGFuZCBhbiB1bmNsZWFyIG9wdGlvbiBuYW1lIGZyb20gdGhlIHVz
ZXIgcGVyc3BlY3RpdmUgKGl0J3MgYQo+ID4gYml0IHdlaXJkIG5vdCB0byBlbmFibGUgaXQsIGF0
IGZpcnN0KS4gRm9yIF9XSVRIX0RPTlRBVURJVF8sIHRoZQo+ID4gb3Bwb3NpdGUgaXMgdHJ1ZS4g
SSdkIHNheSB0aGVyZSBpcyBubyBwZXJmZWN0IHNvbHV0aW9uLCB3ZSBjYW4gZWl0aGVyCj4gPiBz
dGF5IGNsb3NlIHRvIHRoZSByZWZwb2xpY3kgaW50ZXJuYWxzIG9yIGhhdmUgdGhlIEJ1aWxkcm9v
dCBzcGVjaWZpY3MKPiA+IG1vcmUgY29uc2lzdGVudDsgbm90IHN1cmUgd2hpY2ggaXMgYmV0dGVy
Lgo+IAo+IEnigJlkIGdvIGZvciBCdWlsZHJvb3QgY29uc2lzdGVuY3kgc2luY2Ugd2XigJlyZSBp
biBCdWlsZHJvb3QuCgpTbyBfV0lUSF9ET05UQVVESVRfPwoKPiBJZiBzb21lb25lIGVuYWJsZXMg
cmVmcG9saWN5IHBhY2thZ2UgYW5kIGVuYWJsZXMg4oCcRW5hYmxlIGF1ZGl04oCdLCBJCj4gZXhw
ZWN0IHRvIHNlZSBhdWRpdCBsb2cuIFJpZ2h0PwoKRXh0cmEgYXVkaXQgbG9nKgoKSXQncyBub3Qg
YWJvdXQgZW5hYmxpbmcgYXVkaXQgbG9ncywgaXQncyBhYm91dCBoYXZpbmcgc29tZSBrbm93biBy
dWxlcwp0byBub3QgYmUgc2lsZW5jZWQgaW4gdGhlIGF1ZGl0IGxvZ3MgYXMgdGhleSdyZSBrbm93
biB0byBiZSBwcm9ibGVtYXRpYy4KCj4gVGhpcyBpcyBtZSBhdCBsZWFzdCB0aGF0IEnigJl2ZSBu
ZXZlciB1c2VkIHJlZnBvbGljeSBzbyBJ4oCZbSBhZ25vc3RpYyBpbgo+IHRoZSB0b3BpYywgc28g
bWF5YmUgYSBuZXV0cmFsIOKAnHVzZSBjYXNl4oCcIDotKQoKSSBkb24ndCByZWFsbHkgaGF2ZSBh
IHByZWZlcmVuY2UgZm9yIGVpdGhlciBzb2x1dGlvbiB0YmguCgpBbnRvaW5lCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE20FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 10:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8B884365;
	Fri, 22 Apr 2022 10:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTzMd1Zm2wGv; Fri, 22 Apr 2022 10:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F0C84356;
	Fri, 22 Apr 2022 10:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 591AD1BF281
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E8884356
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qONv68V07KaJ for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 10:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C76F8427F
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 10:16:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C559D60005;
 Fri, 22 Apr 2022 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650622605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFgUWkJlhtbr8hBNkxOWhWO7cpXsshNVGMK4hOZ4jDM=;
 b=Oq+tSQXDK+/+959YHu8ddnVhHXpdiAwat7oE0F1gHDQ+SwS8ZNrDC2AnPtEWAb2SobCtuH
 Oc7Q2PJpvaNQDgmzwiSZnHvPc4BJTLY349qQluJZdG8mXIjWD19v/c7xpe55UDVTMrXVI3
 yldWdDXsbVG87vUWqWT8bH/G6AKSWPbFkHzDLV2snh/Vib9BsURVGgnWBHeh3uPH6Wsq1G
 b/NEwQ2j6yU5bw/Fa694lMUQ+G/wtzLx6SyX0fHxU6eM5imULTlca1Kr9F2AQXIHf4NcWG
 BV/2xTLcXim1RtUNUo/TzwPo+3FVRo0ilWn2RZTSl+1Q7aOnOvCz0TxoZpg4Qw==
Date: Fri, 22 Apr 2022 12:16:43 +0200
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220422121639.5118cd38@windsurf>
In-Reply-To: <13e22a566019cfbb7f9a6de52a485dad687e1217.camel@bootlin.com>
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
 <20220420083923.3875405-2-thomas.perrot@bootlin.com>
 <87pmlbr70w.fsf@tarshish>
 <13e22a566019cfbb7f9a6de52a485dad687e1217.camel@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDIyIEFwciAyMDIyIDEyOjA5OjAwICswMjAwClRob21hcyBQZXJyb3Qg
PHRob21hcy5wZXJyb3RAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiA+IEl0IGxvb2tzIGxpa2UgdGhl
IG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIDY0IGFuZCAzMiBpcyBpbiBvcGVuc3NsCj4gPiBidWls
ZAo+ID4gcnVsZSwgYW5kIGZvciB4ODYgKGhvc3QpIHRhcmdldHMgb25seS4gV2UgZG9uJ3QgdXNl
IHRoaXMgb3BlbnNzbCBydWxlCj4gPiBzaW5jZSB3ZSBidWlsZCBob3N0LW9wZW5zc2wgd2l0aCBv
dXIgb3duIHJ1bGVzLiBTbyBtYXliZSB3ZSBjYW4ganVzdAo+ID4gYXJiaXRyYXJpbHkgY2hvb3Nl
IGhhcmQgY29kZWQgJ2xpbnV4NjQnLiBJdCBzZWVtcyB0aGF0Cj4gPiBkZWJpYW4vTWFrZWZpbGUK
PiA+IGRvZXMgdGhhdC4gIAo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcsIEnigJltIHN1Ym1p
dHRpbmcgYSB2MyB3aXRoIHRoZSBPU1RZUEUgdmFyaWFibGUKPiBoYXJkY29kZWQgdG8gbGludXg2
NC4KCk5vLCBwbGVhc2UgZG9uJ3QuIFdlJ3JlIGRvaW5nIHRoZSBidWlsZCBsaWtlIHRoaXM6Cgpi
dWlsZDoKICAgICAgICAkKE1BS0UpIC1DICQoQ1NUX0NPREVfUEFUSCkvb2JqLiQoT1NUWVBFKSBi
dWlsZAoKQW5kIGNvZGUvY3N0L2NvZGUvb2JqLmxpbnV4MzIvTWFrZWZpbGUgY29udGFpbnM6CgpD
T1BUSU9OUyArPSAtbTMyCkxET1BUSU9OUyArPSAtbTMyCgp3aGlsZSBjb2RlL2NzdC9jb2RlL29i
ai5saW51eDY0L01ha2VmaWxlIGNvbnRhaW5zCgpDT1BUSU9OUyArPSAtbTY0CkxET1BUSU9OUyAr
PSAtbTY0CgpBbmQgSSBjYW4gZGVmaW5pdGVseSBzZWUgdGhlIC1tNjQgYmVpbmcgYWRkZWQgaW4g
dGhlIGNvbXBpbGVyIGZsYWdzCndoZW4gZG9pbmcgYSBidWlsZCBvbiBhIHg4Ni02NCBob3N0IChy
dW4gdGhlIGJ1aWxkIHdpdGggVkVSQk9TRT0xLCB5b3UKd2lsbCBzZWUpLgoKU28gaWYgeW91IHVz
ZSBsaW51eDY0IHVuY29uZGl0aW9uYWxseSwgdGhlIENTVCBiaW5hcmllcyB3aWxsIGJlIGJ1aWx0
CndpdGggLW02NCwgZXZlbiBvbiAzMi1iaXQgaG9zdCBtYWNoaW5lcyA9PiBiYWQuCgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

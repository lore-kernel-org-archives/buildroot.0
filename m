Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC88C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D146761163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D146761163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5EC83EBE;
	Wed,  6 Oct 2021 20:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlI_sUBSMr1b; Wed,  6 Oct 2021 20:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2201D83D22;
	Wed,  6 Oct 2021 20:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 088B01BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECAC360F56
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtGToByyMRll for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:44:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9047260F3E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:44:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 60EF440008;
 Wed,  6 Oct 2021 20:44:14 +0000 (UTC)
Date: Wed, 6 Oct 2021 22:44:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211006224413.31235052@windsurf>
In-Reply-To: <20211006203823.2740442-1-yann.morin.1998@free.fr>
References: <20211006203823.2740442-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: fix
 python_flask_expect_python
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgNiBPY3QgMjAyMSAyMjozODoyMyArMDIwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gQ29tbWl0IGU2ZWUwN2Y0MWEyYiAocGFja2Fn
ZS9weXRob24tZmxhc2stZXhwZWN0cy1qc29uOiBuZXcgcGFja2FnZSkKPiBhZGRlZCBhIG5vbi1m
dW5jdGlvbmFsIHRlc3QgY2FzZSB0aGF0LCBhcyBub3RpY2VkIGJ5IEVkZ2FyLCBmYWlscyB3aXRo
Ogo+IAo+ICAgICBBc3NlcnRpb25FcnJvcjogJyV7aHR0cF9jb2RlfScgIT0gJzIwMCcKPiAKPiBU
aGF0J3MgYmVjYXVzZSB0aGUgJSBzaWduIGlzIHNlbGYtZXNjYXBlZCwgw6AtbGEgQywgaW4gdGhl
IGZpcnN0IHBhcnQKPiBvZiB0aGUgY29tbWFuZCwgcHJvYmFibHkgdG8gYXZvaWQgaXRzIGJlaW5n
ICUtZm9ybWF0dGVkLiBCdXQgb25seSB0aGUKPiBzZWNvbmQgcGFydCBvZiB0aGUgY29tbWFuZCBp
cyAlLWZvcm1hdHRlZCwgc28gd2UgZG8gbm90IG5lZWQgdG8KPiBzZWxmLWVzY2FwZSAlIGluIHRo
ZSBmaXJzdCBwYXJ0LgoKR2FhaCwgc2VlbWluZ2x5IGlubm9jZW50LWxvb2tpbmcgbGFzdCBtaW51
dGUgKHVudGVzdGVkKSByZWZhY3RvcmluZyBpcwpBTFdBWVMgd3JvbmcuIFNvcnJ5IGFib3V0IHRo
aXMgYW5kIHRoYW5rcyBmb3IgZml4aW5nIG15IGNyYXAuCgo+IEFkZGl0aW9uYWxseSwgc2luY2Ug
ZWIzZWUzMDc4YTc2IChzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHk6Cj4gcHJldmVu
dCB0aGUgY29tbWFuZHMgZnJvbSB3cmFwcGluZyksIHdlIG5vIGxvbmdlciBuZWVkIHRvIHBsYXkg
dHJpY2tzCj4gd2l0aCBjb21tYW5kcyB0aGF0IGFyZSB0b28gbG9uZyB0byBmaXQgb24gdGhlIGZp
cnN0IGxpbmUgb2YgdGhlIHNoZWxsCj4gcHJvbXB0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IENjOiBFZGdhciBCb25ldCA8Ym9uZXRA
Z3Jlbm9ibGUuY25ycy5mcj4KCkxvb2tzIGdvb2Q6CgpSZXZpZXdlZC1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

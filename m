Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18DAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B038D41CE1;
	Fri, 17 Dec 2021 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EdDWMF_WswVW; Fri, 17 Dec 2021 22:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A5241C94;
	Fri, 17 Dec 2021 22:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 328431BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2186684DAA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StiZL34aHNmO for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:00:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27E0284DA7
 for <buildroot@busybox.net>; Fri, 17 Dec 2021 22:00:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E5E3B1C0002;
 Fri, 17 Dec 2021 22:00:47 +0000 (UTC)
Date: Fri, 17 Dec 2021 23:00:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211217230047.16353bdf@windsurf>
In-Reply-To: <20211211080949.206284-1-francois.perrad@gadz.org>
References: <20211211080949.206284-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] board/olimex/stmp1_olinuxino: add
 STMP157-OLinuXino-LIME2 board support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gU2F0LCAxMSBEZWMgMjAyMSAwOTowOTo0OSArMDEwMApGcmFu
Y29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4ga2VybmVsOgo+IC0gdGhl
IGRldmljZSB0cmVlIGlzIG5vdCB5ZXQgbWFpbmxpbmUKPiAtIElURSBJVDY2MTIxIChIRE1JKSBp
cyBtYWlubGluZSBvbmx5IHNpbmNlIDUuMTQKPiAKPiB1LWJvb3Q6Cj4gLSB0aGUgZGV2aWNlIHRy
ZWUgaXMgbm90IHlldCBtYWlubGluZQo+IC0gdGhpcyBib2FyZCB1c2VzIEFYUDIwOSBhcyBQTUlD
IGluc3RlYWQgb2YgdGhlIFNUUE1JQzEsCj4gICB0aGlzIHVzZSBjYXNlIG9mIEFYUDIwOSBpcyBu
b3QgbWFpbmxpbmUKPiAKPiBhcm0tdHJ1c3RlZC1maXJtd2FyZToKPiBhdCB0aGlzIHRpbWUsIHRo
ZXJlIGlzIG5vIHBhdGNoIGZvciB0aGlzIGJvYXJkLAo+IHNvIHUtYm9vdC1zcGwgaXMgdXNlZCBh
cyBGU0JMIChiYXNpYyBib290IGNoYWluKQoKQ291bGQgd2UgdXNlIHRoZSBjb2RlIGZyb20gdGhl
IE9saW1leCBHaXRodWIgcmVwb3MgaW5zdGVhZD8gWW91ciBjb21taXQKcmVhbGx5IGFkZHMgdHdv
IG1hbnkgbGFyZ2UgYm9hcmQtc3BlY2lmaWMgcGF0Y2hlcy4gV2UgdHJ5IGhhcmQgdG8gYXZvaWQK
dGhpcyBraW5kIG9mIHN0dWZmIGluIEJ1aWxkcm9vdC4KCkFsc28sIEkgdGhpbmsgdGhlIGtlcm5l
bCBjb25maWcgZmlsZSBzaG91bGRuJ3QgaGF2ZSBjb21tZW50cy4gV2UgcHJldHR5Cm11Y2ggbmV2
ZXIgZG8gdGhhdCB3aXRoIGtlcm5lbCBjb25maWd1cmF0aW9uIGZpbGVzIGFzIGl0J3MgdG9vIGFu
bm95aW5nCnRvIG1haW50YWluLgoKRmluYWxseSwgeW91ciBTb0IgbGluZSBpcyBtaXNzaW5nLgoK
Q291bGQgeW91IHJld29yayB0aGlzPwoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMg
UGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

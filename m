Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A6DC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D1384568;
	Thu, 30 Nov 2023 22:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D1384568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asQrrnBautud; Thu, 30 Nov 2023 22:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB317845A0;
	Thu, 30 Nov 2023 22:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB317845A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5D11BF355
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 621D241DED
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621D241DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCRKXhLcfxaJ for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:16:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 152D741DCE
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152D741DCE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 228E360006;
 Thu, 30 Nov 2023 22:15:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8pKA-003Qco-1P;
 Thu, 30 Nov 2023 23:15:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20231130083340.16983-1-sebastien.szymanski@armadeus.com>
Date: Thu, 30 Nov 2023 23:15:58 +0100
In-Reply-To: <20231130083340.16983-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Thu, 30 Nov 2023
 09:33:40 +0100")
Message-ID: <878r6e99b5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb-compat: fix hash
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gVXBzdHJlYW0gcmUtcmVsZWFzZWQgdGhl
IHYwLjEuOCB0YXJiYWxscyB3aXRoIGF1dG90b29scyByZWxhdGVkIHN0dWZmLiBbMV0KID4gVGhh
dCBtYWtlcyB0aGUgaGFzaCB0ZXN0IHRvIGZhaWw6CgogPiBFUlJPUjogd2hpbGUgY2hlY2tpbmcg
aGFzaGVzIGZyb20gcGFja2FnZS9saWJ1c2ItY29tcGF0Ly9saWJ1c2ItY29tcGF0Lmhhc2gKID4g
RVJST1I6IGxpYnVzYi1jb21wYXQtMC4xLjgudGFyLmJ6MiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6
CiA+IEVSUk9SOiBleHBlY3RlZDogNjk4Yzc2NDg0ZjNkZWMxZTAxNzUwNjdjYmQxNTU2YzMwMjFl
OTRlN2YyMzEzYWUzZWE2YTY2ZDkwMGUwMDgyNwogPiBFUlJPUjogZ290ICAgICA6IGI2OTJkY2Y2
NzRjMDcwYzhjMGJlZTNjODIzMGNlNGVlNTkwM2Y5MjZkNzdkYzhiOTY4YTRkZDFiNzBmOWIwNWMK
ID4gRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxlIChNSVRN
KSBhdHRhY2sKCiA+IFVwZGF0ZSB0aGUgaGFzaCBhbmQgZHJvcCBMSUJVU0JfQ09NUEFUX0FVVE9S
RUNPTkYuCgogPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpYnVzYi9saWJ1c2ItY29tcGF0LTAu
MS9pc3N1ZXMvMjgjaXNzdWVjb21tZW50LTE3NTk0MDA1NDgKCiA+IFNpZ25lZC1vZmYtYnk6IFPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCkFy
Z2gsIHRoYXQgaXMgYSBhbm5veWluZywgYXMgdGhlbiBvdXIgY2FjaGVkIGNvcHkgb24Kc291cmNl
cy5idWlsZHJvb3Qub3JnIHdpbGwgbm90IGhhdmUgdGhlIGNvcnJlY3QgaGFzaCA6LwoKSSd2ZSBj
aGFuZ2VkIGl0IHRvIHVzZSAudGFyLmd6IGluc3RlYWQgdG8gbm90IGNvbmZsaWN0IHdpdGggdGhl
IGNhY2hlZAoudGFyLmJ6MiBhbmQgY29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

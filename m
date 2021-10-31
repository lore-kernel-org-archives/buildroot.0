Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D1CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 20:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E85360F45
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 20:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E85360F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF4524021E;
	Sun, 31 Oct 2021 20:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pwCm1II6sRr; Sun, 31 Oct 2021 20:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF15B4021C;
	Sun, 31 Oct 2021 20:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 444B11BF327
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 20:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340D380C9F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 20:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjD_M_QcIjdi for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 20:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD2D80C01
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 20:09:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0659540006;
 Sun, 31 Oct 2021 20:09:35 +0000 (UTC)
Date: Sun, 31 Oct 2021 21:09:34 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
Message-ID: <20211031210934.66975334@windsurf>
In-Reply-To: <SY4P282MB30149F3F7DB7C987B84AE139CB899@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
References: <SY4P282MB30149F3F7DB7C987B84AE139CB899@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] autoconf Makefile in sub-directory
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIDMxIE9jdCAyMDIxIDA1OjM5OjI3ICswMDAwCkJhc3NlbSBGYWhteSA8
dF9mYWhteV9iYXNzZW1AaG90bWFpbC5jb20+IHdyb3RlOgoKPiBIaSBBbGwsCj4gCj4gSSBoYXZl
IGJlZW4gZ2l2ZW4gYSBwYWNrYWdlIHRoYXQgaXMgYnVpbHQgdXNpbmcgYXV0b2NvbmYgdG9vbHMu
IFRoZQo+IHBhY2thZ2UgYnVpbGRzIGZpbmUgdW5kZXIgbmF0aXZlIGNvbXBpbGF0aW9uLsKgIFRo
ZSBwYWNrYWdlIGhvd2V2ZXIKPiBwcm9kdWNlcyB0aGUgbWFpbiBNYWtlZmlsZSB1bmRlciBhIGxp
bnV4IHN1YmRpcmVjdG9yeQo+IAo+IENGTEFHUz0iJENGTEFHUwo+IC1JL2hvbWUvYmFzc2VtL3By
b2plY3RzL21vcnNlX2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdu
dWVhYmloZi9zeXNyb290L3Vzci9pbmNsdWRlL2xpYm5sMyIKPiBBQ19DT05GSUdfRklMRVMoW2xp
bnV4L01ha2VmaWxlCj4gXSkKPiA7OwoKU28gdGhlIGNvbmZpZ3VyZSBzY3JpcHQgaXMgYXQgdGhl
IHJvb3Qgb2YgdGhlIHNvdXJjZSB0cmVlLCBidXQgdGhlIG1haW4KTWFrZWZpbGUgaXMgaW4gYSBz
dWItZGlyZWN0b3J5ID8KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==

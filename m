Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E493FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C1D4162C;
	Sun, 17 Jul 2022 16:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C1D4162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kiOG06RNYyJ; Sun, 17 Jul 2022 16:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C06E24161C;
	Sun, 17 Jul 2022 16:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C06E24161C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3237F1BF387
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBB5A60F45
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 16:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB5A60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVK70ctxz1Yt for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 16:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C9A60F2F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36C9A60F2F
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 16:26:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 147281BF20B;
 Sun, 17 Jul 2022 16:26:33 +0000 (UTC)
Date: Sun, 17 Jul 2022 18:26:32 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220717182632.32e8d732@windsurf>
In-Reply-To: <20220717092020.GF2543@scaer>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
 <20220717092020.GF2543@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0git41 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658075195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhwulhaUnVnW7tIrjok68gzE3pPWQIbzy1vB6HaI7HQ=;
 b=kBuVBNZKyn/cnehGLVAbta5uZL61RpNAfHSRHJImKgb0bSvzcLkZfSBe3YtERm4l4PUzPs
 cbL6g8D/HxR2FKGvwVCbv3jZdyl1/3XsBdrb5rteUjRZRCcsmhFkqUZS3NQI1iFduBu9HO
 HlZ0mDUsJ6wN1xfP9d/Pen4Fo1KSU/QhTcHGubZtCN/JyfSdaibsMhaUFPX7mqF0sO1/aG
 5UUbpvMk9S+59GYldFTNj6/cPjaCdpcFMclCps9/yCGnkTxaSWs/nUviFv/1WWLMRpbsTf
 OOQJcanpLanK+OFz8Zd7zlB3fPxEH6GjUGQhnGNRfuswzuw2KxMoSeVEcsQfcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kBuVBNZK
Subject: Re: [Buildroot] [PATCH] package/python-pillow: fix host package
 build
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
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxNyBKdWwgMjAyMiAxMToyMDoyMCArMDIwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gV2VsbCwgaWYgc29tZSBwYWNrYWdlIG5lZWRz
IGhvc3QtcHl0aG9uLXBpbGxvdywgdGhhdCdzIG1vc3QgcHJvYmFibHkKPiBiZWNhdXNlIHRoZXkg
YXJlIGdvaW5nIHRvIGRvIHNvbWUgaW1hZ2UgbWFuaXB1bGF0aW9uIGF0IGJpdWxkIHRpbWUuCj4g
Cj4gRGlzYWJsaW5nIGFsbCBpbWFnZSBwcm9jZXNzaW5nIG9wdGlvbnMgKHRoYXQgcmVxdWlyZSBh
biBleHRlcm5hbAo+IGxpYnJhcnksIGJ1dCB0aGF0J3MgbW9zdCBvZiB0aGVtPykgaXMgbm90IHNv
IG5pY2UuIEl0IHdvdWxkIG1heWJlIG1ha2UKPiBzZW5zZSB0byBlbmFibGUgYWxsIHRoZSBpbWFn
ZSBvcHRpb25zIGZvciB3aGljaCB3ZSBoYXZlIGhvc3QgbGlicmFyaWVzLgo+IAo+IEvDtnJ5LCB3
aGF0IGRvZXMgeW91ciBvcHRlZS1vcyBuZWVkIGZyb20gcHl0aG9uLXBpbGxvdz8gV291bGQgdGhp
cyBwYXRjaAo+IHN0aWxsIHdvcmsgZm9yIGl0PwoKQmVmb3JlIHN1Ym1pdHRpbmcsIEkgZGlkIHRl
c3QgdGhlIG9wdGVlLW9zIGJ1aWxkIGluIHRoZSBjb25maWd1cmF0aW9uCnVzZWQgYnkgS8O2cnkg
dG8gdmFsaWRhdGUgdGhhdCB0aGUgbWluaW1hbCBob3N0LXB5dGhvbi1waWxsb3cgdGhhdCBJCnBy
b3Bvc2VkIHdhcyBzdWZmaWNpZW50LCBhbmQgaXQgd2FzLgoKVGhhdCBiZWluZyBzYWlkLCBncmVw
cGluZyB0aHJvdWdoIHRoZSBvcHRlZV9vcyBjb2RlIGZyb20gU1QsIEkgbm8KbG9uZ2VyIHNlZSB3
aGVyZSBweXRob24tcGlsbG93IGlzIHVzZWQuIEkndmUgc3RhcnRlZCBhIHRlc3QgYnVpbGQgdG8K
Y2hlY2sgdGhpcyAoYnV0IEknbSBwcmV0dHkgc3VyZSBpdCB3YXMgbmVlZGVkIGF0IHNvbWUgcG9p
bnQsIGFzIEkKbG9va2VkIGludG8gdGhpcyB3aXRoIEvDtnJ5KS4KClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

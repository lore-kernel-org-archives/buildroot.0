Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1E2C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:43:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E104061A4F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E104061A4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D1B82F77;
	Tue, 27 Jul 2021 12:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5vLPrKRvS9N; Tue, 27 Jul 2021 12:43:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E37282F32;
	Tue, 27 Jul 2021 12:43:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7484E1BF42C
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716FA82F32
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEaAfxg9aPsn for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 12:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45F3082A87
 for <buildroot@uclibc.org>; Tue, 27 Jul 2021 12:43:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2292824000E;
 Tue, 27 Jul 2021 12:43:41 +0000 (UTC)
Date: Tue, 27 Jul 2021 14:43:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210727144340.7fecf359@windsurf>
In-Reply-To: <CAJPV9MpuxCHXRAf2zTeuZnHB1FjiwtJHA6-UxEvHFFJ8WWg4gw@mail.gmail.com>
References: <20210723095113.26189-1-jose.pekkarinen@unikie.com>
 <20210724233820.75126717@windsurf>
 <CAJPV9MpuxCHXRAf2zTeuZnHB1FjiwtJHA6-UxEvHFFJ8WWg4gw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Remove deprecated matchpathcon calls
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gSm9zw6ksCgpPbiBUdWUsIDI3IEp1bCAyMDIxIDE1OjIxOjIxICswMzAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhhbmtzIGZv
ciBxdWlja2x5IGFkZHJlc3NpbmcgdGhpcyBUaG9tYXMuIElmIEkgbWF5LCBhcyB0aGlzIGlzIGEK
PiBmaXgsIGlzIHRoZXJlIGFueSBwcm9jZXNzIHRvIGJhY2twb3J0IGl0IHRvIHRoZSBzdGFibGUg
dmVyc2lvbnM/IFBlcmhhcHMKPiBJIGhhdmUgdG8gcmVzZW5kIGl0IHRvIHRoZSBtYWlsaW5nIGxp
c3Qgd2l0aCBhbm90aGVyIGxhYmVsPyBNeSBjdXN0b21lcgo+IHdvdWxkIGJlIGdsYWQgdG8gdGFr
ZSBpdCBmcm9tIHRoZXJlLgoKT3VyIHByb2Nlc3MgdG8gYmFja3BvcnQgdG8gc3RhYmxlIHZlcnNp
b25zIGlzIHRoYXQgUGV0ZXIgS29yc2dhYXJkIChvbmUKb2YgdGhlIEJ1aWxkcm9vdCBjby1tYWlu
dGFpbmVycykgcmV2aWV3cyB0aGUgZW50aXJlIHNldCBvZiBjb21taXRzIHRoYXQKZ28gaW50byBt
YXN0ZXIsIGFuZCB3aGVuZXZlciBhIGNvbW1pdCBpcyBhIHNlY3VyaXR5IGJ1bXAgb3IgYSBmaXgs
IGl0CmdldHMgYmFja3BvcnRlZCB0byAyMDIxLjAyLnguCgpJIGhhdmUgQ2MnZWQgUGV0ZXIgb24g
eW91ciByZXF1ZXN0IHRvIG1ha2Ugc3VyZSBpdCBpcyBjbGVhciB0byBoaW0gdGhhdApjb21taXQg
OTBkZDFkNjE3OGIwMWY2ZGEzZTU5ZTQzZDBjN2VmZGY5ODRhNzJkOCBpcyBhIGZpeCB0aGF0IHNo
b3VsZCBiZQpiYWNrcG9ydGVkIHRvIDIwMjEuMDIueC4KCkJlc3QgcmVnYXJkcywKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==

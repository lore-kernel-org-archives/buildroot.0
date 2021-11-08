Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28402C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C1861075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79C1861075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CD180E05;
	Mon,  8 Nov 2021 07:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qJhLlTCj3ia; Mon,  8 Nov 2021 07:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2C480DFF;
	Mon,  8 Nov 2021 07:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12F7C1BF995
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0110360786
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg0DMtnJsplW for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 07:45:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D52356077E
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 07:45:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id ED5EC1C0004;
 Mon,  8 Nov 2021 07:45:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mjzLL-0000Hj-91; Mon, 08 Nov 2021 08:45:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211106190057.2487641-1-romain.naour@gmail.com>
 <CAB0FRsschq6bcfjimC1FCce+TrRx2_sJYBpwP+ZtgJNNWuFbfQ@mail.gmail.com>
 <89f9350d-63a6-4953-a212-3e2f17aa5a5f@gmail.com>
 <CAB0FRsuJ-37rquRvLsq+n5sg8gJo0PJU2-aRDqGn-kRkUju=Ug@mail.gmail.com>
 <4eb0d55eb4e537aaa4ce604127038b43212d8de2.camel@embedded.rocks>
 <5f72ced4-6f2a-9f24-6bac-c7fde6700e1e@gmail.com>
 <39214aefcc2ab923909f01873e41af39b8205c0b.camel@embedded.rocks>
 <cf0d9f73-0982-5782-7aa2-b2b0ee27639c@gmail.com>
Date: Mon, 08 Nov 2021 08:45:27 +0100
In-Reply-To: <cf0d9f73-0982-5782-7aa2-b2b0ee27639c@gmail.com> (Romain Naour's
 message of "Sun, 7 Nov 2021 23:27:09 +0100")
Message-ID: <87bl2v850o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Revert "package/luajit: back to mainline
 and bump to 05f1984e"
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
Cc: =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIaSBKw7ZyZzsKID4gTGUgMDcvMTEvMjAyMSDDoCAyMTowOCwgSsO2cmcgS3Jh
dXNlIGEgw6ljcml0wqA6CiA+PiBIZWxsbywKID4+IAogPj4ganVzdCBub3RpY2VkIEkgbWlzc2Vk
IHRoZSBzZWNvbmQgcGF0Y2ggWzJdIG9mIHRoZSBzZXJpZXMuIEkgd2lsbCByZS1ydW4KID4+IHRo
ZSB0ZXN0IHdpdGggdGhlIHBhdGNoIGFwcGxpZWQuCgogPiBnaXQgYmlzZWN0IHNheXMgdGhhdCBs
dXZpIGRvZXNuJ3Qgd29yayB3aXRoIGx1YWppdCBzaW5jZSB0aGlzIGNvbW1pdCBbMV0uCgogPiBB
ZGRpbmcgLURMVUFKSVRfRElTQUJMRV9HQzY0IHRvIGx1YWppdC5tayBhbGxvdyB0byB1c2UgbHV2
aSAtdiBvbiB0aGUgdGFyZ2V0IGJ1dAogPiBJIGdldCBhIHN0cmFuZ2UgYmVoYXZpb3IuIFRoZSBs
aXN0IHJldHVybmVkIGJ5IGx1dmkgLXYgaXMgbm90IGFsd2F5cyBpbiB0aGUgc2FtZQogPiBvcmRl
cjoKCkZ1bmt5LiBUaGUgY29tbWl0IHNheXMgdGhhdCB0aGlzIG9ubHkgYXBwbGllcyB0byA2NGJp
dCB0YXJnZXQsIGJ1dCB0aGUKdGVzdCB1c2VzIGFybXY3LCBzbyBwZXJoYXBzIGl0IGlzIGluZGVl
ZCBzb21ldGhpbmcgcmVsYXRlZCB0bwpob3N0L3RhcmdldCBjb25mdXNpb24/CgogPiBJJ20gbm90
IHN1cmUgaWYgdXNpbmcgbHVhaml0IGlzIHJlYWxseSBzYWZlIGZvciB0aGUgdXBjb21pbmcgQnVp
bGRyb290IHJlbGVhc2UuCgpIbW0sIG5vIHBlcmhhcHMgbm90LiBTdGlsbCwgaWYgbW9vbmppdCBp
cyB1bm1haW50YWluZWQgd2Ugd2lsbCBuZWVkIHRvCm1vdmUgYXdheSBmcm9tIGl0IChFLkcuIGJl
Zm9yZSAyMDIyLjAyKSBzbyBpdCB3b3VsZCBiZSBnb29kIHRvIGdldCB0bwp0aGUgYm90dG9tIG9m
IHRoaXMgaXNzdWUuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK

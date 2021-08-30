Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE57C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595E560F12
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 595E560F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1510B60746;
	Mon, 30 Aug 2021 21:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdYt_WHoKHYb; Mon, 30 Aug 2021 21:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E1E607AD;
	Mon, 30 Aug 2021 21:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA8B1BF86C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C9CA40298
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNKnLzJa3I56 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:14:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 194D4400DD
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:14:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4F2BE1C0003;
 Mon, 30 Aug 2021 21:14:11 +0000 (UTC)
Date: Mon, 30 Aug 2021 23:14:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210830231410.7071d092@windsurf>
In-Reply-To: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>, atenart@kernel.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpPbiBNb24sIDMwIEF1ZyAyMDIxIDE0OjQ1OjMxICswMzAwCkpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhlIGN1cnJlbnQgcHJv
Y2Vzc2luZyBvZiB0aGUgbW9kdWxlcyBkb2Vzbid0IHdvcmsgZm9yCj4gY3VzdG9tIG1hZGUgcG9s
aWNpZXMgYXBwZW5kZWQgdGhyb3VnaCB0aGUgZXh0cmEgZGlyIG1lY2hhbmlzbSwKPiBzaW5jZSBz
ZWQgd29uJ3QgZmluZCBhIG1hdGNoIGZvciBjdXN0b20gbW9kdWxlcywgaXQgd2lsbAo+IGNvbnRp
bnVlIHdpdGhvdXQgdHJpZ2dlcmluZyBhbmQgZXJyb3IuIFRoaXMgcGF0Y2ggcmVtb3Zlcwo+IGFs
bCB0aGUgbW9kdWxlcyBmcm9tIG1vZHVsZXMuY29uZiBhbmQgYWRkIHRoZW0gb25lIGJ5Cj4gb25l
IHVzaW5nIFJFRlBPTElDWV9NT0RVTEVTIHZhbHVlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpJJ3ZlIGFkZGVkIEFudG9pbmUgVMOpbmFydCwg
TWF4aW1lIENoZXZhbGxpZXIgYW5kIE1hdHQgV2ViZXIgaW4gQ2MgZm9yIGEKcmV2aWV3IG9mIHRo
aXMgcGF0Y2guCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMgUGV0YXp6b25pCgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsgYi9wYWNrYWdlL3JlZnBvbGljeS9yZWZw
b2xpY3kubWsKPiBpbmRleCAwMTk0NzA4YjM3Li4xYzBhMmMzMzg1IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawo+ICsrKyBiL3BhY2thZ2UvcmVmcG9saWN5L3Jl
ZnBvbGljeS5tawo+IEBAIC04NSw5ICs4NSw5IEBAIGVuZGVmCj4gICMgSW4gdGhlIGNvbnRleHQg
b2YgYSBtb25vbGl0aGljIHBvbGljeSBlbmFibGluZyBhIHBpZWNlIG9mIHRoZSBwb2xpY3kgYXMK
PiAgIyAnYmFzZScgb3IgJ21vZHVsZScgaXMgZXF1aXZhbGVudCwgc28gd2UgZW5hYmxlIHRoZW0g
YXMgJ2Jhc2UnLgo+ICBkZWZpbmUgUkVGUE9MSUNZX0NPTkZJR1VSRV9NT0RVTEVTCj4gLQkkKFNF
RCkgInMvID0gbW9kdWxlLyA9IG5vL2ciICQoQEQpL3BvbGljeS9tb2R1bGVzLmNvbmYKPiArCSQo
U0VEKSAiLyA9IG1vZHVsZS9kIiAkKEBEKS9wb2xpY3kvbW9kdWxlcy5jb25mCj4gIAkkKGZvcmVh
Y2ggbSwkKHNvcnQgJChSRUZQT0xJQ1lfTU9EVUxFUykpLAo+IC0JCSQoU0VEKSAiL14kKG0pID0v
Y1wkKG0pID0gYmFzZSIgJChARCkvcG9saWN5L21vZHVsZXMuY29uZgo+ICsJCSQoU0VEKSAiL14j
IE1vZHVsZTogJChtKS9hXCQobSkgPSBiYXNlIiAkKEBEKS9wb2xpY3kvbW9kdWxlcy5jb25mCj4g
IAkpCj4gIGVuZGVmCj4gIAoKCgotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

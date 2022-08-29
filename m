Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D51ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 09:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB9082FA5;
	Mon, 29 Aug 2022 09:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB9082FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjJFB3zh0_9M; Mon, 29 Aug 2022 09:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBFE82C33;
	Mon, 29 Aug 2022 09:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DBFE82C33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41DBA1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5343408E1
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5343408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8aCXUE9Swj5 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 09:07:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15642408C7
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15642408C7
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 09:07:54 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7B0D10000C;
 Mon, 29 Aug 2022 09:07:51 +0000 (UTC)
Date: Mon, 29 Aug 2022 11:07:50 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220829110750.081952fc@kmaincent-XPS-13-7390>
In-Reply-To: <87fsi4p8u6.fsf@dell.be.48ers.dk>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
 <20220717092020.GF2543@scaer> <20220717182632.32e8d732@windsurf>
 <20220717184749.13a817bf@windsurf> <20220717180544.GU2249625@scaer>
 <87fsi4p8u6.fsf@dell.be.48ers.dk>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661764072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvspyIoRHfsekgU3HAr8+lSZwQh2qHZikg2iZuk7vzc=;
 b=TG6fbaVAs4+LrM9Syniy/6+/qFMfbZGhkgI8Im5vURB7A3jfxy4BkF4YtCpbPeQKais0Sa
 IENvTFV4Oc2SL9+UPMNS7WTIareRdmN2nwAuy2ZRDV6K5Q7L6xlY/dk/8sKjLR8tH5dM8I
 YGvKRr1CnOPHhsZUDVcklx7Ytc4Cqa/DLVePjYFJefBUiHU9PVKqP7W4t6TyNKrTsV/eB6
 q0g/lnxovMkyhNuyAX2D6lAlyEF+ZwpBSKLRpbxBpH0VC9Q9q7ufktkzJ5Do+/DmximEk8
 TcH4RP65Dhb7fq7XfU7zJzFC89gMuuXR6q8/aFy+64QB3rNar4MAqAVP1xyW5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TG6fbaVA
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBXZWQsIDEwIEF1ZyAyMDIyIDE0OjQzOjQ1ICswMjAwClBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cgo+ID4+Pj4+ICJZYW5uIiA9PSBZYW5uIEUg
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cml0ZXM6ICAKPiAKPiAgPiBUaG9tYXMs
IEFsbCwKPiAgPiBPbiAyMDIyLTA3LTE3IDE4OjQ3ICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5OiAgCj4gID4+IE9uIFN1biwgMTcgSnVsIDIwMjIgMTg6
MjY6MzIgKzAyMDAKPiAgPj4gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JvdGU6ICAKPiAgPj4gPiBUaGF0IGJlaW5nIHNhaWQsIGdyZXBwaW5nIHRocm91
Z2ggdGhlIG9wdGVlX29zIGNvZGUgZnJvbSBTVCwgSSBubwo+ICA+PiA+IGxvbmdlciBzZWUgd2hl
cmUgcHl0aG9uLXBpbGxvdyBpcyB1c2VkLiBJJ3ZlIHN0YXJ0ZWQgYSB0ZXN0IGJ1aWxkIHRvCj4g
ID4+ID4gY2hlY2sgdGhpcyAoYnV0IEknbSBwcmV0dHkgc3VyZSBpdCB3YXMgbmVlZGVkIGF0IHNv
bWUgcG9pbnQsIGFzIEkKPiAgPj4gPiBsb29rZWQgaW50byB0aGlzIHdpdGggS8O2cnkpLiAgCj4g
ID4+IFNlZW1zIGxpa2UgdGhpcyB3aG9sZSBweXRob24tcGlsbG93IGRhbmNlIGlzIGluIGZhY3Qg
bm8gbG9uZ2VyCj4gID4+IG5lZWRlZC4uLiBhdCBsZWFzdCBJIGNhbiBidWlsZCB0aGUgbGF0ZXN0
IE9QVEVFLU9TIGZyb20gU1Qgd2l0aG91dAo+ICA+PiBob3N0LXB5dGhvbi1waWxsb3cgaW5zdGFs
bGVkIChpbiBhIGNsZWFuLCBtaW5pbWFsIFVidW50dSBEb2NrZXIKPiAgPj4gY29udGFpbmVyKS4g
IAo+IAo+ICA+IE9LLCBzbzogYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gIAo+IAo+IElmIHRo
aXMgd2FzIG9ubHkgbmVlZGVkIGZvciBzb21lIG9sZGVyIHZlcnNpb24gb2YgYSBTVCB2ZW5kb3Ig
Zm9yayBvZgo+IG9wdGVlLCBwZXJoYXBzIHdlIHNob3VsZCBqdXN0IHJlbW92ZSBpdCBhZ2FpbiBi
ZWZvcmUgaXQgZW5kcyB1cCBpbiBhCj4gQnVpbGRyb290IHJlbGVhc2U/Cgp5ZXMgaW5kZWVkLgpM
ZXQgbWUgY29uZmlybSB0aGF0LCBJIHdpbGwgc2VuZCBhIHBhdGNoIGFmdGVyd2FyZHMuCgpSZWdh
cmQsCgpLw7ZyeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

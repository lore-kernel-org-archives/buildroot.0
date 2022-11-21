Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC1AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 22:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A611681E64;
	Mon, 21 Nov 2022 22:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A611681E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd7jSKT7Tpej; Mon, 21 Nov 2022 22:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE71281E15;
	Mon, 21 Nov 2022 22:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE71281E15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29FC41BF86D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E458660F54
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E458660F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaNcX37RuBrD for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 22:50:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D368360E82
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D368360E82
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:50:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 407685C0131;
 Mon, 21 Nov 2022 17:44:09 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute1.internal (MEProxy); Mon, 21 Nov 2022 17:44:09 -0500
X-ME-Sender: <xms:Of97Y6prCZ1oS3_GA-WUCbRNCiF99N9uIQRblIVpGZGjo0Yh5CL0NA>
 <xme:Of97Y4qva0hkt0cWY2Tva5CixyGHLbtmkAcCvGckdA2LqpnZfFeS4o305fKSHW7Lh
 rnfG2rQ3_8SD4C033Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ihhsshgvucetshhtihgvrhdfuceorghnihhsshgvsegrshhtihgvrhdrvghuqeenucggtf
 frrghtthgvrhhnpefhvdeiudeviedvffdutdeugeejieeihfduheelveeikeetffeijefh
 geelgeffhfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnihhsshgvsegrshhtihgvrhdr
 vghu
X-ME-Proxy: <xmx:Of97Y_MRKAzKQLpFOrDA1xDZ3hPnb0qW8KVJ8m7cP8VjzKnTchTwkQ>
 <xmx:Of97Y55iF7iOQRQTkSzF3r7GP_qIhn4ylonZHM-AdWpzOK-duMrO4Q>
 <xmx:Of97Y561eo50ocn5tYn_1ne0Ok4mWOzNnEhCnjXU3XOkHXifhpHVvg>
 <xmx:Of97Y6WJnryAbaMYjnwiYqedJ3WsOZ9MSLDzur9tvLu1vtGwbEfVqQ>
Feedback-ID: iccec46d4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 087181700407; Mon, 21 Nov 2022 17:44:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <949afd87-f2d5-42bd-89f2-d4169b14a854@app.fastmail.com>
In-Reply-To: <20221121211707.GN2516@scaer>
References: <20221120181955.851456-1-anisse@astier.eu>
 <20221121211707.GN2516@scaer>
Date: Mon, 21 Nov 2022 23:43:41 +0100
From: "Anisse Astier" <anisse@astier.eu>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier.eu; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1669070649; x=
 1669157049; bh=XD7WnK9dOF0ICg5ge6hEWoPYokG1sPJXwGSPR+RWfaM=; b=Y
 mO/KyIlfqWeni1EyjAUwgpOohc1jBH52luZ8G4J2dM5ENSzxspi0fdW46jIKyWE+
 0tkPvEa45egfAm+pEMkunWdSsERJ+YE55NuWJyiH8slw5N6OXcsffvq1w6QDJbnH
 PAnvRy3uU1BJNKsV91IP9tUflgA3bnSyLD1VM3v5pwRiMEP6x8rkQIx8ydu02B3S
 Iyaat2QZ0revUDAwXbrkPQveFVYbrttidrXpEyHRsgtBFuo052xL8ZJeNv4c0WKN
 3OIkxwSj2hNyvzQ+YU/zZdp9AFI3/uj6ioQir/yHVFKP7BWCnQkZccObCqdJAJ0D
 ZRBhxjLbXqtT9V4NwssYA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669070649; x=
 1669157049; bh=XD7WnK9dOF0ICg5ge6hEWoPYokG1sPJXwGSPR+RWfaM=; b=r
 0WxoncgZBStDzZ6btLX+1DnM1sGzeDqCgnLRVosj9Zky1DqlHO73xR6y55pw/Fa/
 rWSCYqIWSUKoW95aFO9XVjrETMjHe6r00jvPMe3LPLgLq32rRhBi8mg9ud4kH/XD
 ZjbFygS3OdVn5H37HvXh1Pw2k72PhzyEm9uBv63KunJyjCl+5t5Uae8QkJ5pSzXG
 AqLYgNh/89R9jd1P3usnMEG21iTjdAX2zB7aNt3ItI24NK8Obp7FqRpeLTYLVSTD
 2SXSqIfJ41rW1y1UJNizrLEc5sibMCwg/BdWdgbfG/P8EGBtF4qBhM/USXRoKlbT
 ReP5itMv38vPMSNtpI6Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=astier.eu header.i=@astier.eu
 header.a=rsa-sha256 header.s=fm1 header.b=YmO/KyIl; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=r0Wxoncg
Subject: Re: [Buildroot] [PATCH RFC] package/go: disable cgo support with
 static libs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkx1biAyMSBub3YgMjAyMiwgw6AgMjI6MTcsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTigK86Cj4gQW5pc3NlLCBBbGwsCj4gCj4gSW4gYWRkaXRpb24gdG8gdGhlIGZlZWRiYWNrIGZy
b20gQmFydWNoLCBzZWUgYmVsb3cuLi4KPiAKPiBPbiAyMDIyLTExLTIwIDE5OjE5ICswMTAwLCBB
bmlzc2UgQXN0aWVyIHNwYWtlIHRodXNseToKPiA+IFRoZSBnbyBzdGRsaWIgInBsdWdpbiLigK9w
YWNrYWdlIHJlbGllcyBvbiBkbGZjbi5oIHdoaWNoIGlzbid0IGF2YWlsYWJsZQo+ID4gd2hlbiB3
ZSBoYXZlIEJSMl9TVEFUSUNfTElCUz15Lgo+ID4gCj4gPiBUaGlzIHNob3VsZCBmaXggdGhpcyBi
dWlsZCBlcnJvciBmcm9tIGF1dG9idWlsZGVyczoKPiA+IAo+ID4gL2J1aWxkcm9vdC9pNjg2LWhv
c3Rnby1mYWlsL2J1aWxkL2hvc3QtZ28tMS4xOS4zL3NyYy9wbHVnaW4vcGx1Z2luX2Rsb3Blbi5n
bzoxMToxMDogZmF0YWwgZXJyb3I6IGRsZmNuLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
PiA+ICAgIDExIHwgI2luY2x1ZGUgPGRsZmNuLmg+Cj4gPiAKPiA+IFRoZSBtb3JlIGxvbmd0ZXJt
IGFwcHJvYWNoIHdvdWxkIGJlIHRvIGFzayB1cHN0cmVhbSBmb3IgYSBidWlsZCB0YWcgdG8KPiA+
IGRpc2FibGUgdGhlIHBsdWdpbiBwYWNrYWdlLCBha2luIHRvIHRoZSBvc3VzZXJnbyBvciBuZXRn
byB0YWdzOgo+ID4gCj4gPiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMzI2
NQo+ID4gCj4gPiBXaGlsZSBpdCB3b3VsZCBiZSBxdWl0ZSBzaW1wbGUsIEkgZG9uJ3QgdGhpbmsg
YSBidWlsZHJvb3QgcGF0Y2ggZm9yIHRoaXMKPiA+IHdpdGhvdXQgdXBzdHJlYW0gc3VwcG9ydCB3
b3VsZCBiZSBpZGVhbC4KPiAKPiBObyBmaXJzdC1wZXJzb24gc2VudGVuY2VzIGluIGNvbW1pdCBs
b2cuIEluc3RlYWQ6Cj4gCj4gICAgIFdoaWxlIGl0IHdvdWxkIGJlIHF1aXRlIHNpbXBsZSwgd2Ug
ZG8gbm90IHdhbnQgdG8gY2Fycnkgc3VjaCBhCj4gICAgIGZlYXR1cmUgcGF0Y2ggaW4gQnVpbGRy
b290LCBlc3BlY2lhbGx5IHNpbmNlIG5vbmUgaGFzIHlldCBiZWVuCj4gICAgIHN1Ym1pdHRlZCB1
cHN0cmVhbS4KPiAKPiBCdXQgYXMgeW91IHN0YXRlIHRoYXQgaXQgc2hvdWxkIGJlIHJsYXRpdmVs
eSBlYXN5LCBtYXliZSB5b3UgY2FuIHB1c2gKPiBzdWNoIGEgcGF0Y2ggdXBzdHJlYW0/IFRoZW4s
IGRlcGVuZGluZyBvbiB1cHN0cmVhbSdzIGZlZWRiYWNrLCB3ZSBjb3VsZAo+IGJhY2twb3J0IGl0
Li4uCgpJIHRob3VnaHQgaXQgd291bGQgYmUgc2ltcGxlLCBidXQgaXQgaXMgbm90LCBiZWNhdXNl
IHdoZW4gYnVpbGRpbmcgdGhlIGdvIHRvb2xjaGFpbiwgSSBkb24ndCBrbm93IGhvdyB0byBwYXNz
IGJ1aWxkIHRhZ3MgZm9yIHRoZSBzdGRsaWIgcGFja2FnZXMgKEkgaGF2ZSB0cmllZCB1c2luZyBH
T19HQ0ZMQUdTIGFuZCBHT19ESVNURkxBR1MsIGJ1dCBuZWl0aGVyIGZpdCB0aGUgYmlsbCkuIEkn
bGwgcmVtb3ZlIHRoaXMgY29tbWVudCBmcm9tIHYyLgoKSSBtb3N0bHkgd2FudGVkIHRvIGdldCB0
aGUgZGlzY3Vzc2lvbiBnb2luZyBvbiB0aGlzIHBhcnRpY3VsYXIgaXNzdWUsIGJ1dCBtYXliZSBp
dCdzIG5vdCB0aGF0IGltcG9ydGFudC4gSSBjaGVja2VkIHRoZSBhdXRvLWJ1aWxkZXJzIGVycm9y
LCBhbmQgdGhlcmUgaXMgb25seSBvbmUgb2NjdXJyZW5jZS4KClJlZ2FyZHMsCgpBbmlzc2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

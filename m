Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FFFC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D777F60596;
	Sun, 25 Aug 2024 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2xAyJZ-uo3w; Sun, 25 Aug 2024 13:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9414605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9414605D4;
	Sun, 25 Aug 2024 13:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 145D61BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01F8E60596
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxR9GtczdPzJ for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A448600CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A448600CB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A448600CB
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:43:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1slmAh3DKV-007g3w; Sun, 25
 Aug 2024 15:43:40 +0200
Date: Sun, 25 Aug 2024 15:43:40 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <Zss1DFpqZyja3B2v@probook>
References: <20240824-frotz-v1-1-05b86b9e6038@gmx.net>
 <20240825074940.6de3b82b@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825074940.6de3b82b@fedora>
X-Provags-ID: V03:K1:jX5M/ggQTW5lNOBt3lWiMItw4Az9t9aGiCsTixPZFkshhS6rZYP
 xi5V86uhLbepXxF67S0zjnK+aeJpoCxIUkFInwSf8r8inJG5M/iSh6QqDFy0J4Lkjv5TrXX
 5887HdG72E6nrJJPfIx5t2tr7lQR77aSD/dqiOVh1bhB14JqJZrWehIMz6Q6gmCxKq6SYvL
 xU+nlQiMqiupTWvasncMQ==
UI-OutboundReport: notjunk:1;M01:P0:ofywMB4eWXY=;r5R9FrTpYFZQG8zTr4ds0MpoGs1
 uocNLaXFxmr7/lhN0qPIuazMNBO/4vXD2FI52tUqU2HKnf7yvTGI+gJM1JxUOWSzE09/XcFvP
 9a88DN9R984FuK+eVxS5P8jlgAP299cxhSiwit0ZirkJtZaX+KkWU4+MdsUO6fvD3+YkXmPBE
 sCiShcUDYvQ2TG7GElbeO396qstz5/mxladNfiJLcTJeASPYkYetEWILkpGYLKsbqldZ9YJt0
 y3W7bGQdd6OvZwaklKGIqoL1e95rnpMDhZ6BvBEZOoHKGGtGIM+Xrk4YwBdPG/TvrmzmcucC/
 Ld7ymP61S+zMEZwMYUV09ok8fLuFS/HEHc6SV82LbTltNzt6116dlIIljnCrhJjUvKCLscVMT
 rHZxEWRcV0qWaq4nDJ2ck9/pNO33wrleO+i0I8zYDlJEZx/COfmZTPuC19VXeib+P+V9Jwg/e
 /jgw3gJSwxTj7SU+nK+w+Pxv8PGe/uEMzlFKTlY7EI8n3Utwehp5sOSSa7xReiUKLUlconWhS
 runaMm6MO6+jDLG6zaYImfVXTQgbErJyI1TnDbLtV0K0Lg0vBP53AFb7bhY0VtOZ58fOuIrlM
 gv5EAyWKWwr26e02RXD7NYAR0c9ffspDABJHQJULLR5MjjhkkxvsC9ZqnHT3luWMNWKiwC4aC
 M9tDYV+5kV1K6i+GJQuKxS/mWi5vawDQFfNmh9M2yOkfwLO5++oVVK9BfcKXOWYJSw5Pzfteg
 AaN3amSEWr0ieGxTKC48S6vWtyT/9MBUtfi1A2bzc5DpKOCz66IyGLn9cFxuXhYNZsG7yHDCe
 AMPJP/CEoU0Pc9+/J0/wYrzA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724593420; x=1725198220; i=j.neuschaefer@gmx.net;
 bh=ofaaEyOelZq6aiG8HGomzfcETgdBS+QiPgPvrFmxHPI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JAazLMXzh40f/vOIO+Wgp6m0YGK9lWAHg8TlZ0ipay5MF+j488mkeMn1Hi/9e3gI
 sMRNl0IdFYJZMtQaIymPYdSgQXaoufjSZmjOQWFpKnm2zoaUVtQzuz7sA1vWoH2lz
 lY8V3f1G0TnSynKdkeD4069j/JIRnXH+fw+TC7cXlGf4tNeUlotH1+e+6GyiatF0k
 wt+KNmiqQDr4EExzirJtomO7NEhYkASuveN/jlxG8mJ8Zdma+Zg6F2sA1vor1ep7c
 NTPTALnLbdSbemxZRw6wxYfhOJu8hk7Cdau41zxBoctvSF2JGgrhftWSHgVXWGOPT
 ZG+hctLY+Ii7ThSwpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=JAazLMXz
Subject: Re: [Buildroot] [PATCH] package/frotz: update package hash for
 verion 2.54
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMjUsIDIwMjQgYXQgMDc6NDk6NDBBTSArMDIwMCwgVGhvbWFzIEh1dGggd3Jv
dGU6Cj4gQW0gU2F0LCAyNCBBdWcgMjAyNCAyMzoxMToyOSArMDIwMAo+IHNjaHJpZWIgSi4gTmV1
c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD46Cj4KPiA+IFJlY2VudGx5LCBoYXNoIGNo
ZWNrcyBoYXZlIGJlZW4gZmFpbGluZyBmb3IgZnJvdHotMi41NC50YXIuYnoyLgo+ID4gRm9ydHVu
YXRlbHksIHRoZSBvbGQgdmVyc2lvbiBjYW4gc3RpbGwgYmUgZG93bmxvYWRlZCBmcm9tCj4gPiBz
b3VyY2VzLmJ1aWxkcm9vdC5vcmc6Cj4gPgo+ID4gJCB3Z2V0IC1xIGh0dHBzOi8vc291cmNlcy5i
dWlsZHJvb3QubmV0L2Zyb3R6L2Zyb3R6LTIuNTQudGFyLmJ6Mgo+ID4gJCBzaGEyNTZzdW0gZnJv
dHotMi41NC50YXIuYnoyCj4gPiBiZGY5MTMxZTZkZTQ5MTA4YzlmMDMyMjAwY2VhM2NiNDAxMWU1
Y2EwYzlmYmRiZjViMGMwNWY3YzU2YzgxMzk1ICBmcm90ei0yLjU0LnRhci5iejIKPiA+Cj4gPiBE
aWZmaW5nIHRoZSBvbGQgYW5kIGN1cnJlbnQgdW5wYWNrZWQgdGFyYmFsbHMgc2hvd3MgdGhhdCB0
aGUgY2hhbmdlIGlzIGJlbmlnbgo+ID4gYW5kIGFwcGVhcnMgdG8gYmUgZHVlIHRvIGEgY2hhbmdl
IGluIEdpdExhYidzIHRhcmJhbGwgZ2VuZXJhdGlvbjoKPiA+Cj4gPiAJZGlmZiAtcnUgZnJvdHot
Mi41NC9NYWtlZmlsZSBmcm90ei0yLjU0LW5ldy9NYWtlZmlsZQo+ID4gCS0tLSBmcm90ei0yLjU0
L01ha2VmaWxlIDIwMjItMDQtMTQgMDg6NDc6NDEuMDAwMDAwMDAwICswMjAwCj4gPiAJKysrIGZy
b3R6LTIuNTQtbmV3L01ha2VmaWxlICAgICAyMDIyLTA0LTE0IDA4OjQ3OjQxLjAwMDAwMDAwMCAr
MDIwMAo+ID4gCUBAIC0yNjEsNyArMjYxLDcgQEAKPiA+IAkgR0lUX0RBVEUgPSAkKHNoZWxsIGdp
dCBzaG93IC1zIC0tZm9ybWF0PSVjaSkKPiA+IAkgZWxzZQo+ID4gCSBHSVRfSEFTSCA9IDVhODZk
ZTJmMDc5OWJkZTEyNjk5YTAxODllYTEyYmU4Yzk2MTk0YTUKPiA+IAktR0lUX0hBU0hfU0hPUlQg
PSA1YTg2ZGUyCj4gPiAJK0dJVF9IQVNIX1NIT1JUID0gNWE4NmRlMmYKPiA+IAkgR0lUX0RBVEUg
PSAyMDIyLTA0LTEzIDIzOjQ3OjQxIC0wNzAwCj4gPiAJIGVuZGlmCj4gPiAJIGV4cG9ydCBDRkxB
R1MKPgo+ICBIaSEKPgo+IFRoYW5rcyBmb3IgeW91ciBpbnZlc3RpZ2F0aW9uISBCdXQgc2luY2Ug
bGlrZWx5IG5vYm9keSBiZXNpZGUgbWUgd2FzIHVzaW5nCj4gdGhpcyBwYWNrYWdlLCBhbmQgSSBh
bHNvIGRvbid0IG5lZWQgaXQgYW55bW9yZSwgSSBhbHJlYWR5IHN1Z2dlc3RlZCBhbm90aGVyCj4g
d2F5IG9mICJmaXhpbmciIHRoaXMgcHJvYmxlbToKPgo+ICBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZWQyZDQ0MGEwOGFiYTEyOWE3Mzc3MDViMmFj
NDIzMWQKCkFoLCB0aGF0J3MgZmluZSB0b28uCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB43EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6010881E6F;
	Mon, 21 Aug 2023 11:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6010881E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfzGiffJhDTf; Mon, 21 Aug 2023 11:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB62881E58;
	Mon, 21 Aug 2023 11:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB62881E58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 925D91BF361
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C7881E6D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C7881E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjAeV1WSb6Pu for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:12:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E604981D46
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E604981D46
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05AB40003;
 Mon, 21 Aug 2023 11:12:00 +0000 (UTC)
Date: Mon, 21 Aug 2023 13:11:59 +0200
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230821131159.46c0a6ff@windsurf>
In-Reply-To: <20230820095833.602364-2-bigunclemax@gmail.com>
References: <20230820095833.602364-1-bigunclemax@gmail.com>
 <20230820095833.602364-2-bigunclemax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692616321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvA6+2IZUHcAOfGACzX9ikKXAbbuIwykUCoRp1wRktU=;
 b=YXp5lRQqWaXRstH91ab/v8oKvRxD0OvcxOXIEJYiUDgO4K4YCHx2DpGdtolTbYTm4+q91U
 or5VclvVZB5n0ZYkN13ibkngJZOwQ9R7p7Iy2AlPfdkDKBDtKHqBv/69cSwzepBgNzHtM9
 WZ+vghMeqgBWb4cZCYNzIyeD46QAofnxNGqrLVLPgYQ/dRl8bG/gtiy0tlzLIsj81buDG2
 MHJq1kxSoIQ+fqtXMJT094JAEpnyBMQWEOpOwuNhTq7ZVC5+EtbOVA82r/ZL+UgndKiE7h
 lkVKw5cbCANGDLwF6mTJRYdKrErUhi7MA5FnU1LsUQjBYC80yQhzvrFW7bYbAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YXp5lRQq
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ledmon: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFrc2ltLAoKT24gU3VuLCAyMCBBdWcgMjAyMyAxMjo1ODozMyArMDMwMApNYWtzaW0g
S2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPiB3cm90ZToKCj4gRW5jbG9zdXJlIExFRCBV
dGlsaXRpZXMKPiAKPiBsZWRtb24gYW5kIGxlZGN0bCBhcmUgdXNlcnNwYWNlIHRvb2xzIGRlc2ln
bmVkIHRvIGNvbnRyb2wgc3RvcmFnZQo+IGVuY2xvc3VyZSBMRURzLiBUaGUgdXNlciBtdXN0IGhh
dmUgcm9vdCBwcml2aWxlZ2VzIHRvIHVzZSB0aGVzZSB0b29scy4KPiAKPiBUaGVzZSB0b29scyB1
c2UgdGhlIFNHUElPIGFuZCBTRVMtMiBwcm90b2NvbHMgdG8gbW9uaXRvciBhbmQgY29udHJvbCBM
RURzLgo+IFRoZXkgYmVlbiB2ZXJpZmllZCB0byB3b3JrIHdpdGggSW50ZWwoUikgc3RvcmFnZSBj
b250cm9sbGVycyAoaS5lLiB0aGUKPiBJbnRlbChSKSBBSENJIGNvbnRyb2xsZXIpIGFuZCBoYXZl
IG5vdCBiZWVuIHRlc3RlZCB3aXRoIHN0b3JhZ2UgY29udHJvbGxlcnMgb2YKPiBvdGhlciB2ZW5k
b3JzIChlc3BlY2lhbGx5IFNBUy9TQ1NJIGNvbnRyb2xsZXJzKS4KPiAKPiBGb3IgYmFja3BsYW5l
IGVuY2xvc3VyZXMgYXR0YWNoZWQgdG8gSVNDSSBjb250cm9sbGVycywgc3VwcG9ydCBpcyBsaW1p
dGVkIHRvCj4gSW50ZWwoUikgSW50ZWxsaWdlbnQgQmFja3BsYW5lcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgoKVGhhbmtzLCBJJ3Zl
IGFwcGxpZWQgdG8gb3VyIG5leHQgYnJhbmNoLCB3aXRoIHNvbWUgdmVyeSBzbWFsbCBjaGFuZ2Vz
LiBTZWUgYmVsb3cuCgo+ICtEYXRlOiBNb24sIDE1IE1heSAyMDIzIDE0OjQ2OjU2ICswMzAwCj4g
K1N1YmplY3Q6IFtQQVRDSCAxLzJdIFJlcGxhY2Ugbm9uc3RhbmRhcmQgb25fZXhpdCgpIGZ1bmN0
aW9uIGJ5IGF0ZXhpdCgpCj4gKwo+ICtEYXRlOiBNb24sIDE1IE1heSAyMDIzIDE5OjI5OjQ1ICsw
MzAwCj4gK1N1YmplY3Q6IFtQQVRDSCAyLzJdIEZpeCB1bmtub3duIHR5cGUgbmFtZSDigJhzc2l6
ZV904oCZIGVycm9yCgpUaGUgcGF0Y2hlcyBpbiBCdWlsZHJvb3Qgc2hvdWxkIG5vdCBoYXZlIDEv
MiwgMi8yLCBiZWNhdXNlIHRoaXMgZ2V0cwpxdWlja2x5IG91dCBvZiBzeW5jLiBBbmQgaW5kZWVk
OiB5b3UgaGF2ZSAzIHBhdGNoZXMgZm9yIHRoaXMgcGFja2FnZSwKYW5kIHRoZXNlIDEvMiBhbmQg
Mi8yIGFyZSBhbHJlYWR5IHdyb25nLiBTbyB3ZSBhc2sgcGVvcGxlIHRvIGdlbmVyYXRlCnBhdGNo
ZXMgd2l0aCAiZ2l0IGZvcm1hdC1wYXRjaCAtTiIuIE5vdGUgdGhhdCB5b3UgY2FuIHJ1biAibWFr
ZQpjaGVjay1wYWNrYWdlIiB3aGljaCB2YWxpZGF0ZXMgdGhpcyBraW5kIG9mIGNvZGluZyBzdHls
ZSBpc3N1ZXMuCgo+ICtMRURNT05fVkVSU0lPTiA9IDAuOTcKPiArTEVETU9OX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLGludGVsLGxlZG1vbix2JChMRURNT05fVkVSU0lPTikpCj4gK0xFRE1PTl9ERVBF
TkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgcGNpdXRpbHMgc2czX3V0aWxzIHVkZXYKPiArTEVETU9O
X0xJQ0VOU0UgPSBHUEwtMi4wCj4gK0xFRE1PTl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICsj
IFRoZSBjb2RlIGJhc2UgYWxzbyBpbmNsdWRlIGEgQ09QWUlORy5MSUIgZmlsZSB3aXRoIHRoZSBM
R1BMLTIuMSB0ZXh0LAo+ICsjIGFuZCBzb21lIHNvdXJjZSBmaWxlcyBhcmUgcHVibGlzaGVkIHVu
ZGVyIExHUEwtMi4xLCBidXQgYWxsIG9mIHRoZW0gYXJlCj4gKyMgYXQgc29tZSBwb2ludCBsaW5r
ZWQgd2l0aCBHUEwtMi4wIGNvZGUsIG1ha2luZyB0aGUgcmVzdWx0aW5nIGJpbmFyaWVzCj4gKyMg
R1BMLTIuMCBsaWNlbnNlZAoKSSd2ZSBtb3ZlZCB0aGlzIGNvbW1lbnQgYWJvdmUgTEVETU9OX0xJ
Q0VOU0UsIGFzIHdlIGFsd2F5cyBwdXQgY29tbWVudHMKKmJlZm9yZSogdGhlIGNvZGUgdGhleSBj
b3JyZXNwb25kIHRvLgoKPiArTEVETU9OX0FVVE9SRUNPTkYgPSBZRVMKCkkndmUgYWRkZWQgYSBj
b21tZW50IGFib3ZlIHRoaXMgbGluZSB0aGF0IGV4cGxhaW5zIHdoeSBpdCBpcyBuZWVkZWQuCgpU
aGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK

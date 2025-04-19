Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE8C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC2860733;
	Sat, 19 Apr 2025 14:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POGlU2_j8IvS; Sat, 19 Apr 2025 14:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0273B606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0273B606BE;
	Sat, 19 Apr 2025 14:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B01DC22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A188E403A7
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZWVHBXtTNDc for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8837740353
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8837740353
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8837740353
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:07:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ADC21FCEF;
 Sat, 19 Apr 2025 14:07:11 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:07:09 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20250419160709.57df2ad9@windsurf>
In-Reply-To: <20250414104614.973244-1-raphael.melotte@mind.be>
References: <20250414104614.973244-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopegug
 hhouhgrrhhinhesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745071631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRpP5h/oXGeZOTj9n2YchUZvjABN1TrIruRcCwLkqJk=;
 b=pFpIhMDhWUWlyjgoG7mnjoQf2ErjuTnF3cFajCEf3+7mihBb7aogIeonIc9QkvnozLZZAb
 opTVrv3c4OAaZ5iETW7zHCL5GyB2pjBn0QM40m0mbWQhUbO76sbjHJSJ+/yo72j/e0hrDY
 3pBHs3XG3ppl62QoGNLrl0Fmwsukp2JI7/PO07N5SnVMlcvDe4L0gIVRt1XhfGUE7cYKNZ
 7rZEd0qsVpHwZtwrC1Ubl9AA2SjZr1tTZgTV4mwbg2tI8iRTYi0cjTUptGb2iy66vannzZ
 EihSTJrJC6m5lPekslYlNIh/0wKhmPSj++6UoX5TvC4VBru+JDkZB4/PVtiPZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pFpIhMDh
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: ignore
 CVE-2002-0318 and CVE-2011-4966
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiBNb24sIDE0IEFwciAyMDI1IDEyOjQ2OjEyICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKCj4gQ1ZFLTIwMDItMDMxOCBoYXMgYmVlbiBtaXRpZ2F0ZWQgYnkgYWRkaW5nIGEgbmV3IGNv
bmZpZyBvcHRpb24gaW4KPiBmcmVlcmFkaXVzLXNlcnZlciBjb21taXQgZjBmNzYyZDE0MzkzMzZm
ZmY5YzhiOTAyOTEzNjRkZGZmNTgzZjY5OCwKPiB3aGljaCBpcyBwYXJ0IG9mIHJlbGVhc2VfMF81
XzAgb253YXJkcy4KPiBTZWUgYWxzbyB0aGUgb3JpZ2luYWwgcmVwb3J0IChbMV0pLgo+IFRoZSBO
VkQgZGF0YWJhc2UncyBDUEUgY29uZmlndXJhdGlvbiBkb2Vzbid0IGhhdmUgYW4gYXNzb2NpYXRl
ZAo+IHZlcnNpb24gbnVtYmVyLCB3aGljaCBpcyB3aHkgb3VyIENWRSBjaGVjayBzdGlsbCByZXBv
cnRzIGl0Lgo+IAo+IEZvciBDVkUtMjAxMS00OTY2LCB0aGUgQ1ZFIGRlc2NyaXB0aW9uIChzZWUg
WzJdKSBtZW50aW9ucyB0aGUgaXNzdWUgaXMKPiBmaXhlZCBpbiB2ZXJzaW9uIDIuMi4wIG9ud2Fy
ZHMsIGJ1dCB0aGUgQ1BFIGFnYWluIGRvZXNuJ3QgdXNlIGEKPiB2ZXJzaW9uIG51bWJlci4KPiAK
PiBUbyByZWR1Y2UgdGhlIG5vaXNlIGluIHRoZSBsaXN0IG9mIENWRXMgdGhhdCBwa2ctc3RhdHMg
cmVwb3J0cywgaWdub3JlCj4gdGhlbS4KCkRpZCB5b3UgcmVwb3J0IHRoZXNlIHRvIHVwc3RyZWFt
IE5WRCwgdG8gZ2V0IHRoZSBkYXRhYmFzZSB1cGRhdGVkL2ZpeGVkPwoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

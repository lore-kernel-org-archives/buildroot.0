Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4541EC83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 08:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A9C4101D;
	Tue, 29 Jul 2025 08:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNFtH7JED0ko; Tue, 29 Jul 2025 08:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD6240FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD6240FA8;
	Tue, 29 Jul 2025 08:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 265CA15C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 177328119F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uZj_SxfhArQ for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 08:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0B1D80DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B1D80DB5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B1D80DB5
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:56:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 662761F68D;
 Tue, 29 Jul 2025 08:56:50 +0000 (UTC)
Date: Tue, 29 Jul 2025 10:56:49 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250729105649.1c5fbd69@windsurf>
In-Reply-To: <20250729083312.39534-1-shirokovalexs@gmail.com>
References: <20250728224414.6d0833d2@windsurf>
 <20250729083312.39534-1-shirokovalexs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueeludeiffetudekudekvdetteeuteeitdejleeigfefueefieetveefhfeiheenucffohhmrghinhepughotghsrdhrshdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshhhihhrohhkohhvrghlvgigshesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753779410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+kXisE20o2fJTYRYlke4NFGuUB8CypYqAXpYgY4Wn8=;
 b=FuoOPFcxhTX87LhX1UzVYIyZNIvagyjbkcbt9FqlT63w5pn6VNboYH+3L2lI7soLYWriwf
 CppfMUO6aNPLi7O/OHqC7F+HOk1Q06zNFucn5+1DLb4LhDynpgm8/erejIfoLo5ZFIbDrc
 VxxbNidTPgn9mVoAdlVWccvQic3/aiu/lTPv+8bOBgvLSxbjRF4PpClxjYRTo0IYwiZgnh
 +URbon4Tw5mGnRlbjZeMqYrytMo4GL4T6Cjlf/iGGUrLgpwlEvJGriZgjrN/0VbVqntynl
 SunJygE77jzzqbHdmoX7AfS08nkZnr6ba4HTApwM3Lf+1RvrNMrqCailTcDdwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FuoOPFcx
Subject: Re: [Buildroot] [v1,1/1] package/zellij: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLAoKT24gVHVlLCAyOSBKdWwgMjAyNSAxMDozMzowMCArMDIwMApBbGV4
YW5kZXIgU2hpcm9rb3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPiB3cm90ZToKCj4gPiA+ICsJ
ZGVwZW5kcyBvbiBCUjJfeDg2XzY0IHx8IEJSMl94ODZfaTY4NiB8fCBCUjJfYWFyY2g2NCAgCj4g
PiAKPiA+IElzIHRoZXJlIHJlYWxseSBzb21ldGhpbmcgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGlu
IHplbGxpaj8gIAo+IAo+IFVuZm9ydHVuYXRlbHksIHllcy4gVW5kZXIgdGhlIGhvb2QsIFplbGxp
aiByZWxpZXMgb24gdGhlIGNyYW5lbGlmdCBjcmF0ZSBbMV0sCj4gd2hpY2ggaXMgcmVzdHJpY3Rp
dmUgaW4gdGVybXMgb2Ygc3VwcG9ydGVkIHBsYXRmb3Jtcy4gSeKAmXZlIG9ic2VydmVkIGNvbXBp
bGF0aW9uCj4gaXNzdWVzIGR1cmluZyBidWlsZHMgZm9yIFJQSTMsIFFFTVUgYW5kIG90aGVycy4g
RWFjaCB0aW1lIGNhdXNlZCBieSB0aGlzIGNyYXRlCj4gZHVlIHRvIHVuc3VwcG9ydGVkIHBsYXRm
b3Jtcy4gU28sIEkgZGVjaWRlZCB0byB0YWtlIGEgY29uc2VydmF0aXZlIGFwcHJvYWNoCj4gaGVy
ZS4gUG9zc2libHksIHdlIGNhbiBleHBhbmQgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHBsYXRmb3Jt
cyBvdmVyIHRpbWUuCj4gCj4gWzFdIGh0dHBzOi8vZG9jcy5ycy9jcmFuZWxpZnQtY29kZWdlbi8w
LjEyMi4wL2NyYW5lbGlmdF9jb2RlZ2VuLwoKU291bmRzIGdvb2QuIFRoZW4gY291bGQgeW91IHBs
ZWFzZSBzdW1tYXJpemUgdGhpcyBpbiBhIGNvbW1lbnQgYWJvdmUKdGhlIGRlcGVuZGVuY3k/CgoJ
IyB6ZWxsaWogdXNlcyB0aGUgY3JhbmVsaWZ0IGNyZWF0ZSwgd2hpY2ggaGFzIHNvbWUgYXJjaGl0
ZWN0dXJlCgkjIGRlcGVuZGVuY2llcywgc2VlCgkjIGh0dHBzOi8vZG9jcy5ycy9jcmFuZWxpZnQt
Y29kZWdlbi8wLjEyMi4wL2NyYW5lbGlmdF9jb2RlZ2VuLwoJZGVwZW5kcyBvbiAuLi4KClRoYW5r
cyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B8C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9168E608F3;
	Mon,  8 Jul 2024 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNc3WI3_9ZoJ; Mon,  8 Jul 2024 20:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A38B460902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A38B460902;
	Mon,  8 Jul 2024 20:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4CAA1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2288404D1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZhk1hA5CfFt for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6194A403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6194A403CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6194A403CC
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:29:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F9FB40002;
 Mon,  8 Jul 2024 20:29:34 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:29:33 +0200
To: DongdongZhang <zhangdongdong@eswincomputing.com>
Message-ID: <20240708222933.5a0fd505@windsurf>
In-Reply-To: <1a197586.4af8.1909028b645.Coremail.zhangdongdong@eswincomputing.com>
References: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
 <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
 <CADvTj4r-1xVwmr+W=Lyj2Ff4KZMR8znZyuAgguCt24Y46oYhkg@mail.gmail.com>
 <1a197586.4af8.1909028b645.Coremail.zhangdongdong@eswincomputing.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVltF+IreNGq2ApFmxXfeqwoOHh0rEoK9pLLbaQtXjA=;
 b=Zmg9l/L1tHZdleGXfSJPhS5LYl25XuC5J18qqVH3ONnjEoASaY2y0BFHSBaIcXovyH06Rr
 haO821w+Vzr39Lx8dyC0bYNPc2lQ+cAOA4eMGDU1uHm85pU3mswjs+QCkOCZg6Kggpvw20
 ZEJXK8cGqcc2/bztPJ618bDjfCG1HkYbZB01gkR9oNFByVylNXwLMik1I6rIL30C/OAL7l
 8xEzKIvd98U2wtddnfyrdPFnfjgPQ437LhnZuXI473p7hIGEv/wEopGIsB6CoxPRa/ccCe
 uRPLVPDVjpv9HK8tcqBCzXyprT9n1RBxH4z9gohuvhdhiHCVHa3lmGVO200Kzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zmg9l/L1
Subject: Re: [Buildroot] [PATCH v2 1/1] .github: add github action to
 automate PR handling
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
Cc: James Hilliard <james.hilliard1@gmail.com>, bonet@grenoble.cnrs.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIDggSnVsIDIwMjQgMTA6MjU6MDUgKzA4MDAgKEdNVCswODowMCkKRG9u
Z2RvbmdaaGFuZyA8emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgoKPiA+
IENhbiBwcm9iYWJseSBqdXN0IHVzZSBhIGdpdGh1YiBzY3JpcHQgYWxvbmcgdGhlc2UgbGluZXMg
b3Igc29tZXRoaW5nOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NiYWJpYy9zd3VwZGF0ZS9ibG9i
LzIwMjQuMDUuMi8uZ2l0aHViL3dvcmtmbG93cy9jb250cmlidXRpbmcueW1sCj4gPiAKPiA+IHBy
b2JhYmx5IGFsc28gbmVlZHMgYSBjb25kaXRpb25hbCBzbyBpdCBvbmx5IHJ1bnMgb24gdGhlIG9u
ZSBnaXRodWIgcmVwbzoKPiA+IGlmOiBnaXRodWIucmVwb3NpdG9yeSA9PSDigJhidWlsZHJvb3Qv
YnVpbGRyb2904oCZCj4gPiAgIAo+IAo+IEhpLCBKYW1lcywKPiBJbiB0aGlzIHNjZW5hcmlvLCBJ
IGJlbGlldmUgdGhhdCB1c2luZyBgZGVzc2FudC9yZXBvLWxvY2tkb3duQHY0YCBpcyBtb3JlIHN1
aXRhYmxlIAo+IHRoYW4gYGFjdGlvbnMvZ2l0aHViLXNjcmlwdEB2NWAuIGBkZXNzYW50L3JlcG8t
bG9ja2Rvd25AdjRgIGlzIHNwZWNpZmljYWxseSBmb2N1c2VkIAo+IG9uIHJlcG9zaXRvcnkgbG9j
a2Rvd24gZnVuY3Rpb25hbGl0eSBhbmQgaGFzIGJlZW4gd2lkZWx5IHVzZWQgYW5kIHZhbGlkYXRl
ZC4gCj4gSW4gY29udHJhc3QsIHdoaWxlIGBhY3Rpb25zL2dpdGh1Yi1zY3JpcHRAdjVgIGlzIGZs
ZXhpYmxlLCBpdCByZXF1aXJlcyBtb3JlIAo+IGN1c3RvbWl6YXRpb24gYW5kIG1haW50ZW5hbmNl
IHdvcmsgYW5kIGEgc3Ryb25nIGZhbWlsaWFyaXR5IHdpdGggSmF2YVNjcmlwdC4gCj4gVG8ga2Vl
cCB0aGUgcHJvY2VzcyBzaW1wbGUgYW5kIHN0YWJsZSwgSSBoYXZlIGRlY2lkZWQgdG8gY29udGlu
dWUgCj4gdXNpbmcgYGRlc3NhbnQvcmVwby1sb2NrZG93bkB2NGAuCgpJIGRvIGFncmVlIHdpdGgg
eW91IG9uIHRoaXMuIEhvd2V2ZXIsIHlvdSBkaWRuJ3QgcmVwbHkgdG8gdGhlIHNlY29uZApjb21t
ZW50IGZyb20gSmFtZXMsIG9uIGNoZWNraW5nIHRoYXQgdGhlIGFjdGlvbiBvbmx5IHJ1bnMgb24g
dGhlIG1haW4KYnVpbGRyb290IHJlcG8sIGFuZCBub3Qgb3RoZXJzLiBJbmRlZWQsIHdlIGRvbid0
IHdhbnQgcGVvcGxlL2NvbXBhbmllcwpmb3JraW5nIG91ciByZXBvIHRvIGhhdmUgdGhpcyBQUiBs
b2NrZG93biBhY3Rpb24gdHJpZ2dlcmVkLgoKQ291bGQgeW91IGNoZWNrIHRoaXMsIGFuZCBzZW5k
IGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB5b3VyIHBhdGNoPwoKVGhhbmtzIGEgbG90IQoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

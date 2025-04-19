Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ACDC369CF
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED15C6067D;
	Sat, 19 Apr 2025 21:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZPgLn4QW1JI; Sat, 19 Apr 2025 21:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAEC6067E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAEC6067E;
	Sat, 19 Apr 2025 21:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 636CF22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5459F6067D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80vGNhsASyQ5 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF7446067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7446067E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF7446067E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:25:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41C8343B7B;
 Sat, 19 Apr 2025 21:25:30 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:25:29 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419232529.0f2de3d8@windsurf>
In-Reply-To: <20250410-fix_lmbench_dependency_discovery-v1-1-c86c22674010@rivosinc.com>
References: <20250410-fix_lmbench_dependency_discovery-v1-1-c86c22674010@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745097930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiheKQ/mXy3WA9xBoF8+DY820rzk91PcXxhLoG0rSAI=;
 b=pfIxWrgeQko/uYDMb/R+CH0vTvsiYesFBa5Ud3WrGJfZ0vG45YWBOgZeDOy/RfAlxWZvBg
 nErOjNkdrkZZTK/pidbY7SWXr+T4Mtr3mD39a2oqFO+CAzX+oVh2b2AvXnaBC7UM2GbJo7
 AjEueT3tVjWEV8MF2uXCX3rDpuNz4kXhl7Md0+Rx7w32WFjnXXb9HUIuglW4OTRhZBDC5f
 x18h2mAvLVgTpMQBd5YEMA0iboC4yVO9nWxZ4EUs3OwTZvpzRrx4k9bKRoOXiF+l66gn4g
 28Li1fLmsHshA4XOC83jkKx0FK2GzoPXaotRwiAr6JvDIwwhgEnhCuu19wLtGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pfIxWrge
Subject: Re: [Buildroot] [PATCH] package/lmbench: Fix dependency discovery
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

T24gVGh1LCAxMCBBcHIgMjAyNSAxMzozODozOCAtMDcwMApDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKCj4gbG1iZW5jaCBkZXBlbmRlbmN5IGRpc2NvdmVyeSBy
ZWxpZXMgb24gaW1wbGljaXQgcmV0dXJuIHR5cGVzIGZvciBtYWluKCkuCj4gVGhpcyBjYXVzZXMg
Y29tcGlsZXIgZXJyb3JzIHdoZW4gLVdpbXBsaWNpdC1pbnQgaXMgZW5hYmxlZC4gVGhlIGZhaWx1
cmUKPiBvZiB0aGUgZGVwZW5kY3kgZGlzY292ZXJ5IGNhdXNlcyBsbWJlbmNoIHRvIHJlZGlmaW5l
IHR5cGVkZWZzIHRoZQo+IGNvbXBpbGVyIGFscmVhZHkgaGFzIGluIGFuIGluY29tcGF0aWJsZSBt
YW5uZXIuIEFkZCBhIHBhdGNoIHRvIGZpeCB0aGUKPiBkaXNjb3ZlcnkuCj4gCj4gRml4ZXM6Cj4g
YmVuY2guaDo4MToxMzogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhzb2NrbGVuX3Ti
gJk7IGhhdmUg4oCYaW504oCZCj4gICAgODEgfCB0eXBlZGVmIGludCBzb2NrbGVuX3Q7Cj4gCj4g
YmVuY2guaDo4NToxNTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhvZmY2NF904oCZ
OyBoYXZlIOKAmGludDY04oCZIHtha2Eg4oCYbG9uZyBsb25nIGludOKAmX0KPiAgICA4NSB8IHR5
cGVkZWYgaW50NjQgb2ZmNjRfdDsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMg
PGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAuLi4vMDAwNi1zY3JpcHRzLWJ1aWxkLWlu
dC1yZXR1cm4tdHlwZS1tYWluLnBhdGNoICB8IDIwMyArKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIwMyBpbnNlcnRpb25zKCspCgpBcHBsaWVkIHRvIG1hc3RlciBhZnRl
ciBhZGRpbmcgYW4gVXBzdHJlYW06IHRhZy4gVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1225C87FD2
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 04:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F79408CD;
	Fri,  1 Aug 2025 04:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjzJFKz7pflI; Fri,  1 Aug 2025 04:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C40A40F1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C40A40F1D;
	Fri,  1 Aug 2025 04:14:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B33C8160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A504140F1E
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRJCUa-CATkD for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 04:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.147;
 helo=fout-b4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE1C6408CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE1C6408CD
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE1C6408CD
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:14:10 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id A36391D00790;
 Fri,  1 Aug 2025 00:14:09 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Fri, 01 Aug 2025 00:14:09 -0400
X-ME-Sender: <xms:ET-MaMfgUxOufaukOOwGw6PvO3e2vmo5u_8XMN8WNWtrait5fuyvsw>
 <xme:ET-MaOOaE6iuP1mClZGgGVF2y_brHLCJtyVTyg35WMbbWkx88xEGDI97gDUabUhcY
 pFaYW23BM0jbQnfFR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddvjedtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedflfhirgig
 uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepgeeuhfejkefhtdfgteevieegleffuddtledtleeuleeujefg
 heejudekgffhueegnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhoth
 hlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpth
 htohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhpvght
 rgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhoth
 essghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-ME-Proxy: <xmx:ET-MaJnKT5bbNYv7ghwW2cy5q6Ojyt3yU0OQwffStRIbtvZSscaq3g>
 <xmx:ET-MaIHBiFcpMGk0MertmjKqiZGrzlwWIMNnP6otDclRGyHIs_PHhg>
 <xmx:ET-MaJHNykw9F82WpLlF9U3jVs3-kBdidsVUPpsc5PDadR1GNHoPRA>
 <xmx:ET-MaFNIF5FBFc557d-GVFSLWQe9jkX_zqzv4Iv6mWKFkfFG41I2RQ>
 <xmx:ET-MaJYbRBnBY8LeWX6fJe4d3mbttYjvhytxrz5gExTQ0CnZyc_DsilE>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 1DABE2CE0071; Fri,  1 Aug 2025 00:14:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7720d562e5b180da
Date: Fri, 01 Aug 2025 12:13:48 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, "Julien Olivain" <ju.o@free.fr>
Message-Id: <d2ee394a-1efe-492b-b89b-c81c4d1f92f5@app.fastmail.com>
In-Reply-To: <20250730223753.2f400524@windsurf>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250730223753.2f400524@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1754021649;
 x=1754108049; bh=FD1Uuf517rnunyLqtDA8MqMs6Xph7wIf7vWSnQGDWlY=; b=
 J4wZ47LNlf3jBrx4zrjgSIZwfjraKf+qdq7+zdef6QEq1/eOtWGUQUlm9NVcZMkC
 AN0ZcNtL446/Vy+j7IeQhweuk1c4KToflAQwXLwCe5CmLn2IMeBd2YmMTF8TIEW7
 SPIqV9KUqbH6AWmnbfBVOJea/GI38esTvJdxlATI+W6CbUjDfwbc9+GvyOWsZn69
 6/FhCHoCWvEM/Tll1F32yt8G6069Txy0zxiAPcvQJWUYyAXH09gRtDWxrmm2b5/u
 Inl8cd1b3HOV6Ag+anSils5ObjQt6XXeK4TQS8duP14Gk1qKSGDCaj8KtCpotyko
 WJqsYj73zBpunPZyBGtJLQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754021649; x=
 1754108049; bh=FD1Uuf517rnunyLqtDA8MqMs6Xph7wIf7vWSnQGDWlY=; b=W
 aPk4ywUa4an//x/yRo7Wqi10FmbB875OU3mMlrrxLoHerVrCMTD4Q9SuKvCoTyiC
 cB5KTgApt1NDWX/rSaib+Fl/qfPBkNFpmVXPQY6exKfz9G1+XK6onnf8i72pesjB
 BUhpmMkeHY7PK9aWH0AtNEXmZ1TyJBt5M2xHSLkgVF2hTyyUdHs40EcD9o6XiKAX
 y3rwyO3cZ/S2qQjVbcEU5kdt6Z5C7OH5ZwrWutkbvKktfGrbo/g2nPLS4HbxrEww
 frZtQKlrzcPd5rwxLg+CJBoNv/tXzOUwLpZWBHmK9YyRIAQTU6vBDqwo4e/F2Kub
 xCwuI6o535OP0KR4U54GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm1 header.b=J4wZ47LN; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WaPk4ywU
Subject: Re: [Buildroot] [PATCH v2 0/3] arch/loongarch: Fix a couple of
 toolchain options
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgrlnKgyMDI15bm0N+aciDMx5pel5ZGo5ZubIOS4iuWNiDQ6MzfvvIxUaG9tYXMgUGV0YXp6b25p
5YaZ6YGT77yaCj4gSGVsbG8gSmlheHVuLAo+Cj4gT24gVGh1LCAxMCBKdWwgMjAyNSAxMTo0MTo1
NSArMDEwMAo+IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4gd3JvdGU6Cj4K
Pj4gVGhpcyBzZXJpZXMgZml4ZWQgYSBjb3VwbGUgb2YgdG9vbGNoYWluIG9wdGlvbnMuIG1hbnkg
dGhhbmtzIHRvCj4+IEp1bGllbiBhbmQgVGhvbWFzIGZvciByZXBvcnRzIGFuZCBzdWdnZXN0aW9u
cyEKPgo+IFRoYW5rcyBmb3IgdGhvc2UgZml4ZXMuIEhvd2V2ZXIsIHdlIHN0aWxsIGEgY29uc2lk
ZXJhYmxlIGFtb3VudCBvZgo+IGZhaWx1cmVzIG9mIEdDQyBvbiBsb29uZ2FyY2g2NCBpbiBvdXIg
YXV0b2J1aWxkZXJzOgo+Cj4gICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFz
b249JWdjYyUmYXJjaD1sb29uZ2FyY2g2NAo+Cj4gTm9ybWFsbHksIHlvdSBzaG91bGQgYmUgcmVj
ZWl2aW5nIGFuIGUtbWFpbCBldmVyeSBkYXkgd2l0aCBidWlsZAo+IGZhaWx1cmVzIG9jY3Vycmlu
ZyBvbiBsb29uZ2FyY2g2NCwgYW5kIGFzIHlvdSd2ZSBpbnRyb2R1Y2VkIHN1cHBvcnQgZm9yCj4g
dGhpcyBhcmNoaXRlY3R1cmUsIHdlIGV4cGVjdCBzb21lIGxldmVsIG9mIHN1cHBvcnQgZnJvbSB5
b3VyIHNpZGUgdG8KPiByZXNvbHZlIHRob3NlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBpc3N1ZXMu
IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhCj4gdGhvc2UgYnVpbGQgZmFpbHVyZXMgdGhhdCBhcmUg
bG9vbmdhcmNoNjQgc3BlY2lmaWMgYW5kIHByb3ZpZGUgc29tZQo+IGZpeGVzPwoKU3VyZSwgc29y
cnkgdGhvc2UgZW1haWxzIHNsaXBwZWQgYWNyb3NzIG15IGVtYWlsIGZpbHRlci4KCkknbSBhY3R1
YWxseSBsb29raW5nIGludG8gZml4IExQNjRTIGFuZCBMUDY0RCBBQkkgaW4gR0NDIGFuZCBvdGhl
cgpsaWJyYXJpZXMgYnV0IHRyYXBwZWQgYnkgdmFyaW91cyBmYWlsdXJlcy4gSWYgSSdtIHVuYWJs
ZSB0byBnZXQgdGhlbQpmaXhlZCB3ZSBtYXkgbmVlZCB0byBkcm9wIHRoZW0gaW4gQnVpbGRyb290
LgoKVGhhbmtzIQoKPgo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBzdXBwb3J0LAo+Cj4gVGhvbWFz
Cj4gLS0gCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6
Ly9ib290bGluLmNvbQoKLS0gCi0gSmlheHVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==

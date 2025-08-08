Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F9C87FD2
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 11:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0524760A9E;
	Fri,  8 Aug 2025 11:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSxy1D_Oihiu; Fri,  8 Aug 2025 11:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1705660B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1705660B5E;
	Fri,  8 Aug 2025 11:21:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 750CA10A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 11:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CC560A9E
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 11:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWpL8ekC-Vm3 for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 11:21:12 +0000 (UTC)
X-Greylist: delayed 404 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 08 Aug 2025 11:21:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3C9D60712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3C9D60712
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.150;
 helo=fout-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3C9D60712
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 11:21:11 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id C2B111D0009E;
 Fri,  8 Aug 2025 07:14:26 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Fri, 08 Aug 2025 07:14:26 -0400
X-ME-Sender: <xms:EtyVaEhVOdqu0tj3HRljF6fXi_lV2HNWzJpI4Xtch67A9UNo5SIDoQ>
 <xme:EtyVaNAbXsP_-8AfCIR-KEI01Vzo-Jbl6KR4GbpJ12iZ8XVKPf0eQMre6jGR91srw
 uFZvHzcVUtGTB-s6AE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefieeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthhqre
 dtredtjeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefggfelfeelveevtd
 eiheekveeludejvedtfeehleelffefjeehkeejhedtleetgfenucffohhmrghinhepkhgv
 rhhnvghlrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdhoiihlrggsshdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihu
 nhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvg
 epshhmthhpohhuthdprhgtphhtthhopehjvghffhgsrghisegrohhstgdrihhopdhrtghp
 thhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhope
 hjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopeigrhihudduudesgihrhiduuddurdhs
 ihhtvg
X-ME-Proxy: <xmx:EtyVaOg8gS4vndBfzV0b7jtinXJAdt6FOI1vIHg4VK94vcs3nDy_eQ>
 <xmx:EtyVaJlsia0V92zAUiCb5SGQXZthOUHZQTPWQMB3k_FQl66m1KrnzQ>
 <xmx:EtyVaCrBQP9XXxKEJJw_t5aFB_nje7FFu3IlN3_6PaFVBL5oP4jSIg>
 <xmx:EtyVaKEwFwhyG6Eqo4RSqggjtkC-29UyJd4aUqx8caCejkmlDeziGg>
 <xmx:EtyVaPObfghgzwFYiggd9u237AZ6n3RkQSGVnglxNbtc_7GLmSfQivrP>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 0B8AC2CE0071; Fri,  8 Aug 2025 07:14:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T384d362b87222747
Date: Fri, 08 Aug 2025 19:14:05 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>, buildroot@buildroot.org
Cc: "Mingcong Bai" <jeffbai@aosc.io>, "Xi Ruoyao" <xry111@xry111.site>
Message-Id: <6d18d123-03f4-4a3e-8dcc-414ca3ba1903@app.fastmail.com>
In-Reply-To: <20250731134401.30301-1-ju.o@free.fr>
References: <20250731134401.30301-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1754651666;
 x=1754738066; bh=cQZCFp/Ma75UJJUOuv5k7dY8VRqzkZlnqaXh6njMBBI=; b=
 DfPhKYYssApUdqoEDR0hSg9+sB3ATXaOy0KTN8IIh4itOwjmP+/ELsZm8sA9VB2U
 +q0g+V8XXXlETbCOIqsCt13iXxVMyXCFnk/ll9AejPkP6bwqDIQ67eXcrZsTGWz2
 EyO8TXvS/ySlO1A7Tb6XLk5tzYcuy6aSTnWmAn29BIa9y6Urt77RMjuJ68l0tMHg
 qkujmU/ORKKUrYdMKb9keuqBmDcTfr9PJalIIuhscTx3kOBMUg9s39+lDQ/6oCJQ
 hNUpnHHC3yJtmYaxfJDakWOxqLI8c6H5af2UoZhhzjRzaEC0y3gQGkB/Q10Tw/Xa
 GaxNawUNZlDQrfpHBwMXOw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754651666; x=
 1754738066; bh=cQZCFp/Ma75UJJUOuv5k7dY8VRqzkZlnqaXh6njMBBI=; b=O
 u53R/3fhW7pa4XxlLYqChQQgq5/IS8cgucugEhfFcEgYM76/lMViELLD3TnjfHvE
 2EXWbyegUc43D2l+DrilmNJq3nDM7AyjLtsvskDR/gEivJ/qEApr02l9APvmVpGO
 yJms+QdafEFbBrZR7I4wFWgQUeKk5PBw5mX8Z5dj/LUThHKbyagjon/mq/KBRr2y
 7arsS6e2n4clonoeO3YGZDExwqTd+imPL0tY/63XIIg66ZGMCRxeg1See93hTmqq
 tL1P3DjjPAlAVhprZrg2sSdIZYBc+ipFxycCsWpTKYAt1UikFEXTbq1j6c9fzj9N
 /9GcCIc2ZElhxg3bCSYzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm1 header.b=DfPhKYYs; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Ou53R/3f
Subject: Re: [Buildroot] [PATCH v3 1/1] arch/loongarch: Mark lp64f and lp64s
 as broken
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

CgrlnKgyMDI15bm0N+aciDMx5pel5ZGo5ZubIOS4i+WNiDk6NDTvvIxKdWxpZW4gT2xpdmFpbuWG
memBk++8mgo+IEZyb206IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KPgo+
IFRvb2xjaGFpbiBmYWlsZWQgdG8gYm9vdHN0cmFwIHdpdGggTFA2NEYgYW5kIExQNjRTIEFCSXMu
Cj4KPiBBcyByZXBvcnRlZCBieSBKdWxpZW4gaW4gWzFdOgo+Cj4gVGVzdGluZyB0aGUgImxwNjRm
IiBBQkkgd2l0aCBjb21tYW5kczoKPgo+ICAgICAgY2F0ID4uY29uZmlnIDw8RU9GCj4gICAgICBC
UjJfbG9vbmdhcmNoNjQ9eQo+ICAgICAgQlIyX0xPT05HQVJDSF9GUFVfMzI9eQo+ICAgICAgQlIy
X0xJTlVYX0tFUk5FTD15Cj4gICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRf
Q09ORklHPXkKPiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAg
ICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9eQo+ICAgICAgQlIyX1RBUkdF
VF9ST09URlNfRVhUMj15Cj4gICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
Cj4gICAgICBFT0YKPiAgICAgIG1ha2Ugb2xkZGVmY29uZmlnCj4gICAgICBtYWtlCj4KPiBmYWls
cyBpbiBob3N0LWdjYy1pbml0aWFsIHdpdGggb3V0cHV0Ogo+Cj4gICAgICBBc3NlbWJsZXIgbWVz
c2FnZXM6Cj4gICAgICAvdG1wL2NjRWt3U3NELnM6Mjg6IEVycm9yOiByZWdpc3RlciBzYXZlIG9m
ZnNldCBub3QgYSBtdWx0aXBsZSBvZiA4Cj4gICAgICAvdG1wL2NjRWt3U3NELnM6MzA6IEVycm9y
OiByZWdpc3RlciBzYXZlIG9mZnNldCBub3QgYSBtdWx0aXBsZSBvZiA4Cj4gICAgICAvdG1wL2Nj
RWt3U3NELnM6NTA6IEVycm9yOiByZWdpc3RlciBzYXZlIG9mZnNldCBub3QgYSBtdWx0aXBsZSBv
ZiA4Cj4KPiBTZWUgYWxzbyBhdXRvYnVpbGRlciBmYWlsdXJlcyBzdWNoIGFzIFsyXS4KPgo+IFRl
c3RpbmcgdGhlICJscDQ2cyIgQUJJIHdpdGggY29tbWFuZHM6Cj4KPiAgICAgIGNhdCA+LmNvbmZp
ZyA8PEVPRgo+ICAgICAgQlIyX2xvb25nYXJjaDY0PXkKPiAgICAgIEJSMl9MT09OR0FSQ0hfRlBV
X05PTkU9eQo+ICAgICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gICAgICBCUjJfTElOVVhfS0VSTkVM
X1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKPiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNf
SE9TVF9PUEVOU1NMPXkKPiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9
eQo+ICAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gICAgICAjIEJSMl9UQVJHRVRfUk9P
VEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICBFT0YKPiAgICAgIG1ha2Ugb2xkZGVmY29uZmlnCj4g
ICAgICBtYWtlCj4KPiBmYWlscyBpbiBob3N0LWdjYy1maW5hbCB3aXRoIG91dHB1dDoKPgo+ICAg
ICAgL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9sb29uZ2FyY2g2NC1idWlsZHJvb3QtbGludXgtZ251
c2YvYmluL2xkOiAKPiBjYW5ub3QgZmluZCBjcnRpLm86IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKPiAgICAgIC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbG9vbmdhcmNoNjQtYnVpbGRyb290LWxp
bnV4LWdudXNmL2Jpbi9sZDogCj4gY2Fubm90IGZpbmQgLWxjOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4gICAgICAvYnVpbGRyb290L291dHB1dC9ob3N0L2xvb25nYXJjaDY0LWJ1aWxkcm9v
dC1saW51eC1nbnVzZi9iaW4vbGQ6IAo+IGNhbm5vdCBmaW5kIGNydG4ubzogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQo+Cj4gU2VlIGFsc28gYXV0b2J1aWxkZXIgZmFpbHVyZXMgd2l0aCBhcyBb
M10uCj4KPiBUaGlzIGNvbW1pdCBtYXJrcyB0aG9zZSBBQklzIGFzIGJyb2tlbiBhdCB0aGUgbW9t
ZW50IHRvIGFsbG93IHRpbWUKPiBmb3IgaW52ZXN0aWdhdGlvbi4gQWxzbywgc2luY2UgZ2NjIGRl
ZmF1bHRzIHRvIHRoZSAibHA2NGQiIEFCSSB3aGljaAo+IHJlcXVpcmVzIGEgNjRiaXQgRlBVIGlz
IHByZXNlbnQsIHRoZSBCUjJfTE9PTkdBUkNIX0ZQVV8zMiBhbmQKPiBCUjJfTE9PTkdBUkNIX0ZQ
VV9OT05FIG9wdGlvbnMgYWxzbyBuZWVkcyB0byBiZSBtYXJrZWQgYXMgYnJva2VuCj4gYXMgd2Vs
bC4gU2VlIFs0XS4KPgo+IFsxXSAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
ZTE3ZGExMDhkMWZiNGU2YWJkYTI2NDQ1ZGMwNTNiMzVAZnJlZS5mci8KPiBbMl0gCj4gaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2Y5ODU3MDI5MzgyMzg2N2U2YzQzYTE2
NzJlMWE0YjQzY2ExZTRiZTUKPiBbM10gCj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzL2NmNTZjMzdmYWJjYWU5NjRkYmY0Zjk2ZWI0M2E3ZTRkOTY0NDUyYjYKPiBbNF0g
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzdiMGYxY2I2MjlmY2U4YTU3ZDli
NjQ0YjhiZWI4YjJhQGZyZWUuZnIvCj4KPiBDYzogTWluZ2NvbmcgQmFpIDxqZWZmYmFpQGFvc2Mu
aW8+Cj4gQ2M6IFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgoKT29wcywgdGhpcyB3YXMg
bWlzc2VkIGJ5IG15IGVtYWlsIGZpbHRlciBhZ2Fpbi4KClJldmlld2VkLWJ5OiBKaWF4dW4gWWFu
ZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+CgpNYW55IHRoYW5rcyBmb3IgeW91ciBoZWxwLgoK
PiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+Cj4g
W0p1bGllbjoKPiAgLSBhZGQgbGluayB0byBtYWlsaW5nIGxpc3QgZGlzY3Vzc2lvbgo+ICAtIGFk
ZCBjb25maWd1cmF0aW9uIHRvIHJlcHJvZHVjZSBpc3N1ZXMgdG8gaGVscCBmdXR1cmUgaW52ZXN0
aWdhdGlvbnMKPiAgLSBhZGQgbGlua3MgdG8gYXV0b2J1aWxkZXIgZmFpbHVyZXMgaW4gY29tbWl0
IGxvZwo+ICAtIG1hcmsgQlIyX0xPT05HQVJDSF9GUFVfezMyLE5PTkV9IGFzIGJyb2tlbgo+IF0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+IENo
YW5nZXMgdjIgLT4gdjM6Cj4gLSBhZGQgbGluayB0byBtYWlsaW5nIGxpc3QgZGlzY3Vzc2lvbgo+
IC0gYWRkIGNvbmZpZ3VyYXRpb24gdG8gcmVwcm9kdWNlIGlzc3VlcyB0byBoZWxwIGZ1dHVyZSBp
bnZlc3RpZ2F0aW9ucwo+IC0gYWRkIGxpbmtzIHRvIGF1dG9idWlsZGVyIGZhaWx1cmVzIGluIGNv
bW1pdCBsb2cKPiAtIG1hcmsgQlIyX0xPT05HQVJDSF9GUFVfezMyLE5PTkV9IGFzIGJyb2tlbgo+
Cj4gTm90ZTogdGhpcyB2MyBpcyBhIGZvbGxvdy11cCBvZjoKPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwNzEwLWxvb25nYXJjaC1mYWJp
LXYyLTItNzJmY2Y5NWM4YjY1QGZseWdvYXQuY29tLwo+IC0tLQo+ICBhcmNoL0NvbmZpZy5pbi5s
b29uZ2FyY2ggfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5sb29uZ2FyY2ggYi9hcmNoL0NvbmZpZy5p
bi5sb29uZ2FyY2gKPiBpbmRleCBmYTFiMTNiYzUyLi40YjUwYjk4NzEwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvQ29uZmlnLmluLmxvb25nYXJjaAo+ICsrKyBiL2FyY2gvQ29uZmlnLmluLmxvb25nYXJj
aAo+IEBAIC0zOCwxMiArMzgsMTYgQEAgY29uZmlnIEJSMl9MT09OR0FSQ0hfRlBVXzY0Cj4gCj4g
IGNvbmZpZyBCUjJfTE9PTkdBUkNIX0ZQVV8zMgo+ICAJYm9vbCAiMzIiCj4gKwkjIE9ubHkgc3Vw
cG9ydGVkIGJ5IGxwNjRzIGFuZCBscDY0ZiBBQklzIHdoaWNoIGFyZSBtYXJrZWQgYXMgYnJva2Vu
Cj4gKwlkZXBlbmRzIG9uIEJSMl9CUk9LRU4KPiAgCWhlbHAKPiAgCSAgQWxsb3cgdGhlIHVzZSBv
ZiBoYXJkd2FyZSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMgZm9yCj4gIAkgIDMyLWJpdCBv
cGVyYXRpb25zIG9ubHkuCj4gCj4gIGNvbmZpZyBCUjJfTE9PTkdBUkNIX0ZQVV9OT05FCj4gIAli
b29sICJub25lIgo+ICsJIyBPbmx5IHN1cHBvcnRlZCBieSBscDY0cyBBQkkgd2hpY2ggaXMgbWFy
a2VkIGFzIGJyb2tlbgo+ICsJZGVwZW5kcyBvbiBCUjJfQlJPS0VOCj4gIAloZWxwCj4gIAkgIFBy
ZXZlbnQgdGhlIHVzZSBvZiBoYXJkd2FyZSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMuCj4g
IGVuZGNob2ljZQo+IEBAIC04NywxMSArOTEsMTUgQEAgY29uZmlnIEJSMl9MT09OR0FSQ0hfQUJJ
X0xQNjRECj4gIGNvbmZpZyBCUjJfTE9PTkdBUkNIX0FCSV9MUDY0Rgo+ICAJYm9vbCAibHA2NGYi
Cj4gIAlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gKwkjIEZhaWxlZCB0byBidWlsZCBob3N0
IEdDQyBpbml0aWFsLCBwZW5kaW5nIGludmVzdGlnYXRpb24KPiArCWRlcGVuZHMgb24gQlIyX0JS
T0tFTgo+ICAJZGVwZW5kcyBvbiBCUjJfTE9PTkdBUkNIX0ZQVV82NCB8fCBCUjJfTE9PTkdBUkNI
X0ZQVV8zMgo+IAo+ICBjb25maWcgQlIyX0xPT05HQVJDSF9BQklfTFA2NFMKPiAgCWJvb2wgImxw
NjRzIgo+ICAJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ICsJIyBHQ0MgY2FuJ3QgZmluZCBs
aWJyYXJpZXMsIHBlbmRpbmcgaW52ZXN0aWdhdGlvbgo+ICsJZGVwZW5kcyBvbiBCUjJfQlJPS0VO
Cj4gIGVuZGNob2ljZQo+IAo+ICBjb25maWcgQlIyX0FSQ0gKPiAtLSAKPiAyLjUwLjEKCi0tIAot
IEppYXh1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB701C369D5
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 21:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C36683A68;
	Thu, 24 Apr 2025 21:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v68IfDdF0GwT; Thu, 24 Apr 2025 21:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A0B483A69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A0B483A69;
	Thu, 24 Apr 2025 21:48:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D97C9968
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB6C483935
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 851AZJ6FsJo0 for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 21:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82BDA839E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82BDA839E7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82BDA839E7
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:48:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A123444D9;
 Thu, 24 Apr 2025 21:48:15 +0000 (UTC)
Date: Thu, 24 Apr 2025 23:48:14 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <20250424234814.28d834df@windsurf>
In-Reply-To: <20250424-fix_gmp_c23-v2-1-a03fc808a87c@rivosinc.com>
References: <20250424-fix_gmp_c23-v2-1-a03fc808a87c@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeegveethfffhfdvhfdtffeuheelgefhfeegheefgeefuedugfelueeikefhtdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhnuhdrohhrghdpghhmphhlihgsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgur
 hhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745531296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KsVYPhbP2hB4rYWvvQeQMqwOXLX4Zu9RKXOQjJhm2OM=;
 b=bwTz+1R5+Fk/cBwsC0qzdeRG4eHZTOTC/aB7AXYxli37IKf5PboUdYv4uXzS83f5ctmtCC
 bnT68lYgOlFtDCklJ5j6KEXYSvzkcDJL502AZy4EoUIy+2hQlNORC7MhEBQ5bmbhDBU8WX
 SpGY9MYKCSuBiq1W1ydW8HJMLjYz9olkEcyCrEJnJxMxZvNaWSpuXIr2rVmxdFMTtPQGZH
 JCyNvNoLvA++6h+H7+tRphNoPzZTin//YWRPe2Xe7z8BnyXwIZ4X0cyMtGP7taixJOOkRO
 KQ+aIbDfJwq7tRU8Tnq23vskRmDFX87DXNvr+VI3qI/1eLsFJzIYvK5XPqyCcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bwTz+1R5
Subject: Re: [Buildroot] [PATCH v2] package/gmp: Fix for c23
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hhcmxpZSwKCk9uIFRodSwgMjQgQXByIDIwMjUgMTI6MTc6MjYgLTA3MDAKQ2hhcmxp
ZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cgo+IEdNUCB3aWxsIG5vdCBi
dWlsZCBmb3IgYSBDIGNvbXBpbGVyIGNvbmZpZ3VyZWQgZm9yIGMyMyBiZWNhdXNlIGl0cwo+IGF1
dG9jb25mIHNjcmlwdHMgdXNlIGRlcHJlY2F0ZWQgZnVuY3Rpb24gcHJvdG90eXBlcy4gSW5jbHVk
ZSBhbiB1cHN0cmVhbQo+IHBhdGNoIHRoYXQgZml4ZXMgdGhpcyBpc3N1ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IENo
YW5nZXMgaW4gdjI6Cj4gLSBVc2UgYXV0b3JlY29uZiBpbnN0ZWFkIG9mIHBhdGNoaW5nIGNvbmZp
Z3VyZQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDQyNC1m
aXhfZ21wX2MyMy12MS0xLWIyNDc0YTk1ODViNkByaXZvc2luYy5jb20KClRoYW5rcyBmb3IgdGhp
cyB2Mi4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ21wLzAwMDEtYWNpbmNsdWRlLm00LUFkZC1w
YXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBlLWZvci1nLnBhdGNoIGIvcGFja2FnZS9nbXAvMDAw
MS1hY2luY2x1ZGUubTQtQWRkLXBhcmFtZXRlci1uYW1lcy1pbi1wcm90b3R5cGUtZm9yLWcucGF0
Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAuLjMzOTcxODg4OGQwZTFkZDZiZjBjMzYwMTYzMmZjZWVlNGVmZjVm
ODEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9nbXAvMDAwMS1hY2luY2x1ZGUubTQt
QWRkLXBhcmFtZXRlci1uYW1lcy1pbi1wcm90b3R5cGUtZm9yLWcucGF0Y2gKPiBAQCAtMCwwICsx
LDU2IEBACj4gK0Zyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Cj4gK0RhdGU6IFNh
dCwgMTUgTWFyIDIwMjUgMTc6NTg6NDAgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBhY2luY2x1
ZGUubTQ6IEFkZCBwYXJhbWV0ZXIgbmFtZXMgaW4gcHJvdG90eXBlIGZvciBnKCkuCj4gKwo+ICtU
aGlzIGFsbG93cyBpdCB0byBjb21waWxlIHdpdGggb2xkZXIgZ2NjIGUuZy4gZ2NjLTEwCj4gK3do
aWNoIGRvZXMgbm90IGhhdmUgYWxsb3cgcGFyYW1ldGVyIG5hbWUgb21pc3Npb24sIGl0IHJlc3Vs
dHMKPiAraW4KPiArCj4gK2EuYzogSW4gZnVuY3Rpb24g4oCYZ+KAmToKPiArYS5jOjM6ODogZXJy
b3I6IHBhcmFtZXRlciBuYW1lIG9taXR0ZWQKPiArICAgIDMgfCB2b2lkIGcoaW50LHQxIGNvbnN0
Kix0MSx0Mix0MSBjb25zdCosaW50KXt9Cj4gKyAgICAgIHwgICAgICAgIF5+fgo+ICsKPiArdGhp
cyB3YXMgYWRkZWQgdG8gZ2NjIHZpYSBbMV0gdGhhdHMgd2h5IGl0IGlzIHN1cHBvcnRlZCBpbgo+
ICtuZXdlciBnY2MuCj4gKwo+ICtBZGRpbmcgdGhlIHBhcmFtZXRlciBuYW1lcyBtYWtlIGl0IGNv
bXBhdGlibGUgd2l0aAo+ICtvbGQgYW5kIG5ldyBnY2MKPiArCj4gK1sxXSBodHRwczovL2djYy5n
bnUub3JnL3BpcGVybWFpbC9nY2MtY3ZzLzIwMjAtT2N0b2Jlci8zMzYwNjguaHRtbAo+ICsKPiAr
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtIGF0IGdtYWlsLmNvbT4KPiArVXBzdHJl
YW06IGh0dHBzOi8vZ21wbGliLm9yZy9saXN0LWFyY2hpdmVzL2dtcC1kZXZlbC8yMDI1LU1hcmNo
LzAwNjI5NC5odG1sCgpPdXIgcG9saWN5IHJlcXVpcmVzIHRoYXQgeW91IGFkZCB5b3VyIFNpZ25l
ZC1vZmYtYnkgcmlnaHQgaGVyZS4KCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dtcC9nbXAubWsg
Yi9wYWNrYWdlL2dtcC9nbXAubWsKPiBpbmRleCA3ZThkYTkwMjVjOTNiOThiNTgyMGYyOTdiNmVh
MzU0OTU5NzM5NWE1Li5mZmYyMTFhNGY2MWFjY2NlMzI3NjA4ODViY2EyZDMyY2U5OWM0NzAxIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvZ21wL2dtcC5tawo+ICsrKyBiL3BhY2thZ2UvZ21wL2dtcC5t
awo+IEBAIC03LDYgKzcsNyBAQAo+ICBHTVBfVkVSU0lPTiA9IDYuMy4wCj4gIEdNUF9TSVRFID0g
JChCUjJfR05VX01JUlJPUikvZ21wCj4gIEdNUF9TT1VSQ0UgPSBnbXAtJChHTVBfVkVSU0lPTiku
dGFyLnh6CgpBbmQgaGVyZSBhZGQ6CgojIDAwMDEtYWNpbmNsdWRlLm00LUFkZC1wYXJhbWV0ZXIt
bmFtZXMtaW4tcHJvdG90eXBlLWZvci1nLnBhdGNoCgo+ICtHTVBfQVVUT1JFQ09ORiA9IFlFUwo+
ICBHTVBfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gIEdNUF9MSUNFTlNFID0gTEdQTC0zLjArIG9y
IEdQTC0yLjArCj4gIEdNUF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy5MRVNTRVJ2MyBDT1BZSU5H
djIKClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE8CCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632EE61178;
	Sat, 16 Aug 2025 20:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-CpNnAYSEwq; Sat, 16 Aug 2025 20:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8941F614E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8941F614E7;
	Sat, 16 Aug 2025 20:11:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1D5196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2722540C5C
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHZRVgh0whIB for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27BB840CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BB840CA0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27BB840CA0
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:11:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09E9441C7C;
 Sat, 16 Aug 2025 20:11:22 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:11:21 +0200
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20250816221121.409f7d89@windsurf>
In-Reply-To: <AS1P250MB0608B288A957E1A3B17204B1A92AA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608B288A957E1A3B17204B1A92AA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfekteejffeuvefgleeftdehleehheffgfelffehleduueeiffehjeeugfeivdffnecuffhomhgrihhnpehptgdrihhnpdhgihhthhhusgdrtghomhdptghmrghkvgdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeetlhgvgidrofhitghhvghlseifihgvuggvmhgrnhhnqdhgrhhouhhprdgtohhmpdhrtghpthhto
 hepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755375083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXNesTnJ5LC8r0DV5sTZ2zX0XMaYoUp1dnTqnH4Z2pA=;
 b=XLA6N5PCczrjnwGrfzWFyCM1wth6YCgI6Wx866VxICY9uCCm2NrSadqOxx0AAOFgWbaSHC
 R2sw3Vus3ZwrMC/hdJRk7KMn7xK4o//8b23FzcObxEYSK0eHW9SMk3VJvLMFLpuzr8XoN4
 nR+TuT9JRGRjy4+nBdCByMhcB0QUCjsXKfAvK7yUffqJzT17OzJB6Ztp4r5iwT/gZRS1cV
 tOjDndYBMdxH+qXsK+1XgAX0Gt/FiWM8QcwDVgWMeWQgoXh30kwGMno0yuEVZMc8sabwok
 Q7CYlO6FMOGesvuKmeJs/HUFyWJXIxpF5yw98DzIitLGMLXjxKSRtHoDfkIa6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XLA6N5PC
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-c: install to staging
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

SGVsbG8gTWljaGVsLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpPbiBXZWQsIDEzIEF1ZyAyMDI1
IDA2OjA4OjEzICswMDAwCk1pY2hlbCBBbGV4IDxBbGV4Lk1pY2hlbEB3aWVkZW1hbm4tZ3JvdXAu
Y29tPiB3cm90ZToKCj4gSW5zdGFsbCBsaWJ6ZW5vaGMucGMgdG8gc3RhZ2luZy4gUGFja2FnZXMs
IHdoaWNoIHVzZQo+IGxpYnplbm9oLWMgYXMgZGVwZW5kZW5jeSwgYXJlIG5vdCBhYmxlIHRvIGZp
bmQgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBNaWNoZWwgPGFsZXgubWljaGVsQHdpZWRl
bWFubi1ncm91cC5jb20+CgpUaGUgY29tbWl0IHRpdGxlIGlzIG1pc2xlYWRpbmc6IHRoaXMgY29t
bWl0IGlzIG5vdCBpbnN0YWxsaW5nCmxpYnplbm9oLWMgdG8gc3RhZ2luZywgYXMgdGhpcyBpcyBh
bHJlYWR5IGhhcHBlbmluZy4gSXQncyBpbnN0YWxsaW5nCnRoZSBwa2ctY29uZmlnLnBjIGZpbGUg
dG8gc3RhZ2luZy4gVGhpcyBzaG91bGQgYmUgcmVmbGVjdGVkIGluIHRoZQpjb21taXQgdGl0bGUu
Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tayBiL3BhY2th
Z2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rCj4gaW5kZXggYmZlZThmMzNlMC4uNDFiMDRkOThm
OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tawo+ICsrKyBi
L3BhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rCj4gQEAgLTM1LDYgKzM1LDE1IEBAIGRl
ZmluZSBMSUJaRU5PSF9DX0lOU1RBTExfU1RBR0lOR19DTURTCj4gIOKAguKAguKAguKAguKAgiQo
Y2FsbCBMSUJaRU5PSF9DX0lOU1RBTExfRklMRVMsJChTVEFHSU5HX0RJUikpCj4gIOKAguKAguKA
guKAguKAgm1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlLwo+ICDigILigILigILi
gILigIJjcCAtZHBmciAkKEBEKS9pbmNsdWRlLyogJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUv
Cj4gK+KAguKAguKAguKAguKAgmNhdCAkKEBEKS9pbnN0YWxsL3plbm9oYy5wYy5pbiBcCj4gK+KA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnwgc2VkICJzfEBDTUFLRV9JTlNUQUxMX1BS
RUZJWEB8L3VzcnxnIiBcCj4gK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnwgc2Vk
ICJzfEBQUk9KRUNUX05BTUVAfGxpYnplbm9oY3xnIiBcCj4gK+KAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAgnwgc2VkICJzfEBDTUFLRV9QUk9KRUNUX0RFU0NSSVBUSU9OQHxUaGUgQyBi
aW5kaW5ncyBmb3IgWmVub2h8ZyIgXAo+ICvigILigILigILigILigILigILigILigILigILigILi
gIJ8IHNlZCAic3xAQ01BS0VfUFJPSkVDVF9IT01FUEFHRV9VUkxAfGh0dHBzOi8vZ2l0aHViLmNv
bS9lY2xpcHNlLXplbm9oL3plbm9oLWN8ZyIgXAo+ICvigILigILigILigILigILigILigILigILi
gILigILigIJ8IHNlZCAic3xAUFJPSkVDVF9WRVJTSU9OQHwkKExJQlpFTk9IX0NfVkVSU0lPTil8
ZyIgXAo+ICvigILigILigILigILigILigILigILigILigILigILigIJ8IHNlZCAic3xAQ01BS0Vf
SU5TVEFMTF9JTkNMVURFRElSQHxpbmNsdWRlfGciIFwKPiAr4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCCfCBzZWQgInN8QENNQUtFX0lOU1RBTExfTElCRElSQHxsaWJ8ZyIgXAo+ICvi
gILigILigILigILigILigILigILigILigILigILigIJ8IHNlZCAic3xATElCTkFNRUB8emVub2hj
fGciID4gJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvbGliemVub2hjLnBjCgpDYW4g
d2UgdXNlIHRoZSBzYW1lIHBhdHRlcm4gYXMgZm9yIHRoZSBzZWQgaW52b2NhdGlvbiBpbgpwYWNr
YWdlL3BrZy1jbWFrZS5tazoKCiAgICAgICAgc2VkIFwKICAgICAgICAgICAgICAgIC1lICdzI0BA
U1RBR0lOR19TVUJESVJAQCMkKGNhbGwgcXN0cmlwLCQoU1RBR0lOR19TVUJESVIpKSMnIFwKICAg
ICAgICAgICAgICAgIC1lICdzI0BAVEFSR0VUX0NGTEFHU0BAIyQoY2FsbCBxc3RyaXAsJChUQVJH
RVRfQ0ZMQUdTKSkjJyBcCiAgICAgICAgICAgICAgICAtZSAncyNAQFRBUkdFVF9DWFhGTEFHU0BA
IyQoY2FsbCBxc3RyaXAsJChUQVJHRVRfQ1hYRkxBR1MpKSMnIFwKICAgICAgICAgICAgICAgIC1l
ICdzI0BAVEFSR0VUX0ZDRkxBR1NAQCMkKGNhbGwgcXN0cmlwLCQoVEFSR0VUX0ZDRkxBR1MpKSMn
IFwKICAgICAgICAgICAgICAgIC1lICdzI0BAVEFSR0VUX0xERkxBR1NAQCMkKGNhbGwgcXN0cmlw
LCQoVEFSR0VUX0xERkxBR1MpKSMnIFwKICAgICAgICAgICAgICAgIC1lICdzI0BAVEFSR0VUX0ND
QEAjJChzdWJzdCAkKEhPU1RfRElSKS8sLCQoY2FsbCBxc3RyaXAsJChUQVJHRVRfQ0MpKSkjJyBc
CiAgICAgICAgICAgICAgICAtZSAncyNAQFRBUkdFVF9DWFhAQCMkKHN1YnN0ICQoSE9TVF9ESVIp
LywsJChjYWxsIHFzdHJpcCwkKFRBUkdFVF9DWFgpKSkjJyBcCiAgICAgICAgICAgICAgICAtZSAn
cyNAQFRBUkdFVF9GQ0BAIyQoc3Vic3QgJChIT1NUX0RJUikvLCwkKGNhbGwgcXN0cmlwLCQoVEFS
R0VUX0ZDKSkpIycgXAogICAgICAgICAgICAgICAgLWUgJ3MjQEBDTUFLRV9TWVNURU1fUFJPQ0VT
U09SQEAjJChjYWxsIHFzdHJpcCwkKENNQUtFX1NZU1RFTV9QUk9DRVNTT1IpKSMnIFwKICAgICAg
ICAgICAgICAgIC1lICdzI0BAVE9PTENIQUlOX0hBU19DWFhAQCMkKGlmICQoQlIyX0lOU1RBTExf
TElCU1REQ1BQKSwxLDApIycgXAogICAgICAgICAgICAgICAgLWUgJ3MjQEBUT09MQ0hBSU5fSEFT
X0ZPUlRSQU5AQCMkKGlmICQoQlIyX1RPT0xDSEFJTl9IQVNfRk9SVFJBTiksMSwwKSMnIFwKICAg
ICAgICAgICAgICAgIC1lICdzI0BAQ01BS0VfQlVJTERfVFlQRUBAIyQoaWYgJChCUjJfRU5BQkxF
X1JVTlRJTUVfREVCVUcpLERlYnVnLFJlbGVhc2UpIycgXAogICAgICAgICAgICAgICAgJChUT1BE
SVIpL3N1cHBvcnQvbWlzYy90b29sY2hhaW5maWxlLmNtYWtlLmluIFwKCmkuZSwgb25seSBvbmUg
c2VkIGludm9jYXRpb24sIG5vIG5lZWQgZm9yIGNhdCB8IHNlZCwgdXNhZ2Ugb2YgIyBhcyBhCnNl
cGFyYXRvci4KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==

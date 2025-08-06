Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C40C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE5260F69;
	Wed,  6 Aug 2025 10:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiVpGOhzPUFF; Wed,  6 Aug 2025 10:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D406360E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D406360E93;
	Wed,  6 Aug 2025 10:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10999233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DA8F4159C
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urmQ3lx8I2Kr for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE942415A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE942415A0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE942415A0
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:34:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 915AF43161;
 Wed,  6 Aug 2025 10:34:24 +0000 (UTC)
Date: Wed, 6 Aug 2025 12:34:23 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <buildroot@buildroot.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250806123423.33451a9c@windsurf>
In-Reply-To: <DBV9S1S4XEEA.2DHT8AEV8PEL9@bootlin.com>
References: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
 <20250806110836.387c867c@windsurf>
 <DBV9S1S4XEEA.2DHT8AEV8PEL9@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveelfedvgeduvedvleekkeegvdejhfetgefhieetvdevkeeufeekffeihfevuddunecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgur
 hhoohhtrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754476465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWIRAxwSSWVi3faUIKkKF7jC2s0rRkfXRU3YlOZl9t8=;
 b=DbRX4OjEtZB8FS6gONyUTljUz2iBdTzSqhSKYJMqM3Qxt03nNe0uf2iIb041/AS0X/39oi
 K6Nj7O0d56PIgBGPPpPlvyAe7CeLPmfevo10Jro2OWdsHAZlsqwGjYBrnaNlXNayTIuwID
 XuqjOwzYIO8ql8XwumSpO4HbCCc/DfnCuVQ6vCN2djlIbZvZStwMou8MzZzx+I1l5mWJq2
 lcT8utSLhM5dTR6gIRSd2JJUz51LLM8nE45+BLNbqhwbDNVTJdTf6NZhZ/jEaoTFwR5IMP
 7ZSNV3xG985CEprvBhCPf+cQO3Ugxs3pfltbHPptCiAQhTNNOhnz9Mi53E+PRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DbRX4OjE
Subject: Re: [Buildroot] [PATCH] package/php-pecl-dbus: fix build with PHP8
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

SGVsbG8gQWxleGlzLAoKT24gV2VkLCAwNiBBdWcgMjAyNSAxMjoyMzo1OSArMDIwMApBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gWWVzLCBJIGhh
dmUgdGhvc2UgaXNzdWVzIG9uIHRoZSBtYXN0ZXIgYnJhbmNoLCBvbiAyZmQ1MjBjOGQ1MmIKPiAo
InBhY2thZ2UvZ2xtOiBidW1wIHZlcnNpb24gdG8gMS4wLjEiKQoKT0shCgo+ID4gSXMgdGhlIGlz
c3VlCj4gPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZTk4L2U5ODky
YmJlZmE3ODFiNDAzZmQzZDgzNGI2YzQ4NTI3YzhlMDc4YmEvYnVpbGQtZW5kLmxvZwo+ID4gcGVy
aGFwcyA/IElmIHNvLCBwbGVhc2UgYWRkIGEgcmVmZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRlciBm
YWlsdXJlLiAgCj4gCj4gWWVzLCB0aGF0IGxvb2tzIGxpa2UgdGhlIHNhbWUgaXNzdWUgISBPaywg
SSdsbCBhZGQgYSByZWZlcmVuY2UuCgpQZXJmZWN0LgoKPiA+IEZvciBidWcvYnVpbGQgZml4ZXMs
IHdlIGxpa2UgdG8gdW5kZXJzdGFuZCBzaW5jZSB3aGVuIHRoZSBwcm9ibGVtIGlzCj4gPiBvY2N1
cnJpbmcsIGkuZSB3aGljaCBjb21taXQgaW50cm9kdWNlZCB0aGUgcmVncmVzc2lvbi4gSWYgdGhp
cyBwYWNrYWdlCj4gPiB3YXMgYnVpbGRpbmcgb24gMjAyNC4wMiBhbmQgbm8gbG9uZ2VyIG9uIDIw
MjUuMDIsIEkgc3VzcGVjdCBpdCdzIG9uZSBvZgo+ID4gdGhlIFBIUCB2ZXJzaW9uIGJ1bXAgYmV0
d2VlbiB0aG9zZSB0d28gcmVsZWFzZXM6ICAKPiAKPiBUaGUgdXBzdHJlYW0gY29tbWl0IGluIFBI
UCBwcm9qZWN0IGxlYWRpbmcgdG8gdGhpcyBpc3N1ZSBpcyBhY3R1YWxseSB0aGUKPiBzYW1lIGFz
IGZvciB0aGUgcGhwLWx1YSBwYWNrYWdlIChjb21taXQgOTFlZjQxMjRlNTZhICgiUmVmYWN0b3IK
PiB6ZW5kX29iamVjdF9oYW5kbGVycyBBUEkgdG8gcGFzcyB6ZW5kX29iamVjdCogYW5kIHplbmRf
c3RyaW5nKiBpbnN0ZWQgb2YKPiB6dmFsKHMpLiIpLCBzbyB0aGUgaXNzdWUgaGFzIGJlZW4gaW50
cm9kdWNlZCB3aGVuIHRoZSBQSFAgcGFja2FnZWQgaGFzIGJlZW4KPiBidW1wZWQgdG8gOC4wLjAs
IG5vdCBsYXRlci4gQW5kIGFnYWluLCBJIGNhbiBzZWUgdGhlIGlzc3VlIHdpdGggYSBtaW5pbWFs
Cj4gZGVmY29uZmlnIF93aGVuIHVzaW5nIGJvb3RsaW4gYmxlZWRpbmctZWRnZSB0b29sY2hhaW5f
LiBXaXRoIHN0YWJsZQo+IHRvb2xjaGFpbiwgd2UgY2FuIHNwb3QgdGhlIGNvcnJlc3BvbmRpbmcg
d2FybmluZyBpbiBwaHAtZGJ1cyBidWlsZCBsb2dzLAo+IGJ1dCBpdCBpcyBub3QgdHVybmVkIGlu
dG8gYW4gYWN0dWFsIGVycm9yLgoKQWgsIE9LLiBJIHdhcyB3b25kZXJpbmcgdGhlbiB3aHkgdGhl
IGlzc3VlIHdhcyBub3QgaGFwcGVuaW5nIHdpdGgKQnVpbGRyb290IDIwMjQuMDIgd2hpY2ggYWxy
ZWFkeSBoYWQgUEhQID49IDguMC4wLgoKU28gaXQncyByZWFsbHkgdGhlIHN3aXRjaCB0byBHQ0Mg
MTUueCB0aGF0IGV4aGliaXRzIHRoZSBpc3N1ZSwgdHVybmluZwppdCBpbnRvIGEgaGFyZCBidWls
ZCBlcnJvci4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==

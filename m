Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A926C83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1FAE8226A;
	Wed, 30 Jul 2025 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6A7rDlDmMev; Wed, 30 Jul 2025 16:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159E08229C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159E08229C;
	Wed, 30 Jul 2025 16:55:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B66013D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31ED7411C8
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4Q5hgmQ4beB for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 16:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 074EC411BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074EC411BD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074EC411BD
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:55:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EB49442D9;
 Wed, 30 Jul 2025 16:55:03 +0000 (UTC)
Date: Wed, 30 Jul 2025 18:55:02 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20250730185502.41dad6cf@windsurf>
In-Reply-To: <20250730-openscap-v1-2-46e4a32e26da@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-2-46e4a32e26da@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhop
 egsrghruhgthhesthhkohhsrdgtohdrihhlpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753894504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvuX+5Wi2UcrFfo0QmnPuOFaK3boBp0O/6qzPIiZnfg=;
 b=nJbeJz1dmVuHhVy8bcmT4mRWfwPRyQpiPcktxg1yEmvlRtYq/dg23VmDxt5RPfyhvJIglF
 RjUre59111fq/77/Jl64sL/adaHiSl6uy6DKGL9/aOJATRcYJGMpLqrSMnodxo3hBi1/Ly
 oQAVdcTdyBOpDnAJxxAbmEzwE3FqSwfVi0wOrTphtXevNbdOJL1AewRSMpvEUlzvmbo1Mz
 scHKuYlE0X1jJDgnMZm9v7T2V4kHFhI7U7W+Nq14eRbarPQK1yX28EIEzLMs4Bhan2qD96
 aosGEdvzd4gznpBG8rVjYY6VdM0V7rific3li3TMV1ajynpgE5opUzhNJr4Tkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nJbeJz1d
Subject: Re: [Buildroot] [PATCH 2/4] package/libcurl: Reapply "libcurl: add
 host variant"
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLAoKT24gV2VkLCAzMCBKdWwgMjAyNSAxNDo0NzoxNCArMDIwMApBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gbGliY3VybCBo
b3N0IGJ1aWxkIHN1cHBvcnQgaGFzIGluaXRpYWxseSBiZWVuIGFkZGVkIHdpdGggNzM2ZTBmYzVk
NjEwCj4gKCJsaWJjdXJsOiBhZGQgaG9zdCB2YXJpYW50Iikgd2hpbGUgYWRkaW5nIHN1cHBvcnQg
Zm9yIGhvc3QtY2FyZ28gYnVpbGQsCj4gYW5kIHJldmVydGVkIHdpdGggNjllODQwMDhhYmY4ICgi
UmV2ZXJ0ICJsaWJjdXJsOiBhZGQgaG9zdCB2YXJpYW50IiIpCj4gd2hlbiBzdGFuZGFsb25lIGNh
cmdvIGJ1aWxkIGhhcyBiZWVuIHJlbW92ZWQuIEluIG9yZGVyIHRvIGJyaW5nIGEgbmV3Cj4gaG9z
dCBwYWNrYWdlIGRlcGVuZGluZyBvbiBsaWJjdXJsLCByZS1lbmFibGUgaG9zdC1saWJjdXJsIGJ1
aWxkIHN1cHBvcnQuCj4gCj4gVGhpcyByZXZlcnRzIGNvbW1pdCB3OWU4NDAwOGFiZjg3ZWFlZWIz
ZjJkNTNjODgwY2YzMzQ5MmEzYmY4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbGliY3VybC9s
aWJjdXJsLm1rIHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tayBiL3Bh
Y2thZ2UvbGliY3VybC9saWJjdXJsLm1rCj4gaW5kZXggMWNmZGRhMjdkMjE1Nzc1Y2I4MDIxOTc5
YmM5NTVjMzBhZTRmZWE0Yy4uNzAwYzE2MWFkZTZjZmI5ZDg3NzI3ZDAzZGU5ZGZjZWI5N2NmYjdj
ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tawo+ICsrKyBiL3BhY2th
Z2UvbGliY3VybC9saWJjdXJsLm1rCj4gQEAgLTE4OSw0ICsxODksMTcgQEAgZW5kZWYKPiAgTElC
Q1VSTF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IExJQkNVUkxfVEFSR0VUX0NMRUFOVVAK
PiAgZW5kaWYKPiAgCj4gK0hPU1RfTElCQ1VSTF9ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wK
PiArSE9TVF9MSUJDVVJMX0NPTkZfT1BUUyA9IFwKPiArCS0tZGlzYWJsZS1tYW51YWwgXAo+ICsJ
LS1kaXNhYmxlLW50bG0td2IgXAo+ICsJLS1kaXNhYmxlLWN1cmxkZWJ1ZyBcCj4gKwktLXdpdGgt
c3NsIFwKPiArCS0td2l0aG91dC1nbnV0bHMgXAo+ICsJLS13aXRob3V0LW1iZWR0bHMgXAo+ICsJ
LS13aXRob3V0LW5zcwo+ICsKPiArSE9TVF9MSUJDVVJMX1BPU1RfUEFUQ0hfSE9PS1MgKz0gTElC
Q1VSTF9GSVhfRE9UX1BDCgpUaGlzIExJQkNVUkxfRklYX0RPVF9QQyBob29rIG5vIGxvbmdlciBl
eGlzdHMsIHNvIHRoYXQgbGluZSBpcyBhIG5vLW9wLgoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

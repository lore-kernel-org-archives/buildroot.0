Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF12C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 08:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0683560DD7;
	Thu, 26 Jun 2025 08:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xfm_3413GmPx; Thu, 26 Jun 2025 08:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26BC060DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BC060DD1;
	Thu, 26 Jun 2025 08:46:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 122B611A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED3A64085F
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLas-bw_2dpm for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 08:46:14 +0000 (UTC)
X-Greylist: delayed 42715 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Jun 2025 08:46:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFE9140841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE9140841
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFE9140841
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:46:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5993443896;
 Thu, 26 Jun 2025 08:46:10 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 26 Jun 2025 10:46:10 +0200
Message-Id: <DAWC0TAMO2HJ.11A5HZP7IY369@bootlin.com>
Cc: <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Olivier Benjamin"
 <olivier.benjamin@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250625-perf_libtraceevent-v1-1-0bf7620bc6c9@bootlin.com>
 <20250626100242.27ab1407@booty>
In-Reply-To: <20250626100242.27ab1407@booty>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvhedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhot
 hhlihhnrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750927570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=881AoyRcL+LXZ6a3taqk+XFpe8A5UM5Ku++zikkyG3U=;
 b=MvEg4ulcMuAj3sT5sJHOhNoFkKF1fwpKdbKflB/xrHX7vRvK/yBV8R1vcvsmoLLChKODAw
 W17E1uEoOVOe9vwnJeIvSzCNqaaaRYkiGW17rlkXfzs4eJ4YgXmkng5wmqyVPvXV2roFNG
 3dQx77VafzMIpimJ0sxQlmFjTDwfrzgHL34W1oVC0HzpfVXFqeqqsUD2QtxBa5OPEw0wij
 zhja6O2dxGsaS2R00+FjrPWAY2nvU2dQ7MxTLYdUyVt29wB+t3qYFHJFvrOb33Tbx3Mma1
 zmgn3asc6wXq95Y84SqlowgpD1YyP+kFgpWk2ygPLQdDhoXx4lIo/7jbuqCovQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MvEg4ulc
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: build with
 libtraceevent support when it is selected
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCj4+IEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IHRoZXJlIGlzIGEgYnVnIGluIHBl
cmYgbWFrZWZpbGUga2VybmVsIHRoYXQKPj4gYWZmZWN0cyBtYW55IGtlcm5lbCB2ZXJzaW9ucyAo
dXAgdG8gNi4xMCkgYW5kIHRoYXQgcHJldmVudHMgcGVyZiBmcm9tCj4+IGJ1aWxkaW5nIGNvcnJl
Y3RseSB3aGVuIGVuYWJsaW5nIGxpYnRyYWNlZXZlbnQgc3VwcG9ydCAoc2VlIDQ0MGNmNzc2MjVl
Mwo+PiAoInBlcmY6IGJ1aWxkOiBTZXR1cCBQS0dfQ09ORklHX0xJQkRJUiBmb3IgY3Jvc3MgY29t
cGlsYXRpb24iKSBpbgo+PiBsaW51eCkuCj4KPiBUaGFua3MgZm9yIHRoZSByZXNlYXJjaCEKPgo+
IEFuZCBhcHBhcmVudGx5IHRoZSBtZW50aW9uZWQgY29tbWl0IHdhcyBhcHBsaWVkIGluIDYuMTEg
YW5kIG5vdAo+IGJhY2twb3J0ZWQgdG8gNi4xMCBhbmQgcHJldmlvdXMgc3RhYmxlIHJlbGVhc2Vz
CgpZZXMsIHlvdSBhcmUgcmlnaHQsIG15IG1pc3Rha2UuCgo+IFNob3VsZG4ndCBpdCBiZSBiYWNr
cG9ydGVkPyBUaGlzIGxvb2tzIGxpa2UgYSBmaXgsIGRvZXNuJ3QgaXQ/CgpJbmRlZWQuIFRoZSBv
cmlnaW5hbCBhdXRob3Igb24ga2VybmVsIHNpZGUgZGlkIG5vdCBicmluZyBhbnkgRml4ZXMgdGFn
IHNvCml0IG1heSBoYXZlIHNsaXBwZWQgdGhyb3VnaCB0aGUgc3RhYmxlIGtlcm5lbHMsIGJ1dCBJ
IGNhbiB0cnkgdG8gc3VibWl0IGl0CmZvciBjdXJyZW50IHN0YWJsZS9MVFMga2VybmVscy4KCj4+
IFNob3VsZCB0aGUgbGlidHJhY2VldmVudCB0aGVuIGJlIGV4cGxpY2l0ZWx5IGVuYWJsZWQgYnkg
dGhlCj4+IHVzZXIsIHJhdGhlciB0aGFuIGF1dG9tYXRpY2FsbHkgZW5hYmxpbmcgaXQgd2hlbiBs
aWJ0cmFjZWV2ZW50IHBhY2thZ2UKPj4gaXMgc2VsZWN0ZWQgPwo+Cj4gU2hvdWxkIHRoZSBmaXgg
YmUgYmFja3BvcnRlZCB0byB0aGUgY3VycmVudGx5LXN1cHBvcnRlZCBzdGFibGUga2VybmVsCj4g
dmVyc2lvbnMsIEknZCBzYXkgd2UgY2FuIGF1dG9tYXRpY2FsbHkgZW5hYmxlIGxpYnRyYWNlZXZl
bnQgc3VwcG9ydC4KPiBPdGhlcndpc2UgSSdtIG5vdCBzdXJlLi4uIE1lbnRpb25pbmcgdGhlIGlz
c3VlIGFuZCBwb2ludGluZyB0byB0aGUgZml4Cj4gY29tbWl0IGluIHRoZSBLY29uZmlnIGhlbHAg
dGV4dCBpcyBhbm90aGVyIG9wdGlvbi4KCk1lbnRpb25pbmcgdGhlIGtlcm5lbCB2ZXJzaW9uIGZp
eGluZyB0aGUgaXNzdWUgaW4gdGhlIEtDb25maWcgaGVscCBzb3VuZHMKcmVsZXZhbnQsIGJ1dCBt
YXliZSBoYXZpbmcgdGhlIGV4YWN0IGtlcm5lbCBjb21taXQgb25seSBpbiB0aGUgQlIgY29tbWl0
CmRlc2NyaXB0aW9uIGlzIGVub3VnaCA/IElmIHNvLCBJIGNhbiBwcmVwYXJlIGEgdjIgd2l0aCB0
aGUgdXBkYXRlZCBLY29uZmlnLgoKVGhhbmtzCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ks
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

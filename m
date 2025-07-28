Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AEBC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1148812B2;
	Mon, 28 Jul 2025 20:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9pCjXTWfXag; Mon, 28 Jul 2025 20:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E63812AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E63812AB;
	Mon, 28 Jul 2025 20:56:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F3391D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02D5860D4D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu8H_19Haxnh for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3E0E60C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E0E60C2C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3E0E60C2C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:56:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F9E144319;
 Mon, 28 Jul 2025 20:56:23 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:56:22 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20250728225622.13378e9f@windsurf>
In-Reply-To: <20250725120743.3705187-1-yegorslists@googlemail.com>
References: <20250725120743.3705187-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfekgeetjeevhfetudfgtedvgeffvedvffehkeejgeevtedvtedugfdvvddugfenucffohhmrghinhepshhouhhrtggvfhhorhhgvgdrnhgvthdpshhouhhrtggvfhhorhhgvgdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvhgrrhhordhgrghmvgiisehhrgiivghnthdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753736183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmS/OYJvmBVpQMLIydqj03XO/L81gmn87oilur/7dOo=;
 b=SFBmeXa8Kx8miFpHp4UaekB2EOAOaVfRVEcvxacmhCYVZkZTVaVTY8ljd8PGkYZuBIrITs
 7cDsiEsSw2g9qmCTatQHlbCQDhZusg4jcITNmZ4Qu7Qc0ijqOTshrgKy5LMI1qFgURtp/m
 MQeKb5cT8RFvI8aNOHRcABuUUJlF3amdv8nShuPXVOYkrNm779wW2VX1LNpHaRVth8Uusa
 JmzWJzBYcc/7rL+ZesqXlIownBq+qGPnJ/3BHBOuNGlhDFy9yn6hFrEEqScbXkPp0xAxcU
 2pp2LXL1bh47QDaUNRQEmqfgH58id/3xJDUMvw9lh0KehJbXv1WmGixA/oq9hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SFBmeXa8
Subject: Re: [Buildroot] [PATCH v2] package/libxmlrpc: fix boolean
 definitions
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDI1IEp1bCAyMDI1IDE0OjA3OjQzICswMjAwCnllZ29yc2xpc3RzLS0t
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gRnJvbTog
WWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+IAo+IERvbid0IGRl
ZmluZSBib29sZWFuIG1hY3JvcyBmb3IgQzIzIHN0YW5kYXJkIGFzIHRoZXkgYXJlIGltcGxlbWVu
dGVkCj4gYXMga2V5d29yZHMuCj4gCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBlcnJvcjoKPiAKPiBt
YWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkKPiAnL2hvbWUvdXNlci9Eb2N1bWVudHMvdmVyc2lv
bmVkL29zcy94bWxycGMtYy9saWIvdXRpbCcKPiBnY2MgLWMgLUROREVCVUcgLXB0aHJlYWQgLVdh
bGwgLVcgLVduby11bmluaXRpYWxpemVkIC1XdW5kZWYKPiAtV25vLXVua25vd24tcHJhZ21hcyAt
V21pc3NpbmctZGVjbGFyYXRpb25zIC1Xc3RyaWN0LXByb3RvdHlwZXMKPiAtV21pc3NpbmctcHJv
dG90eXBlcyAtV2ltcGxpY2l0IC1mbm8tY29tbW9uIC1nIC1PMwo+IC1Jc3JjZGlyL2xpYi91dGls
L2luY2x1ZGUKPiAtSS9ob21lL3VzZXIvRG9jdW1lbnRzL3ZlcnNpb25lZC9vc3MveG1scnBjLWMg
ICBjYXNwcmludGYuYwo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBjYXNwcmludGYuYzo5Ogo+IHNy
Y2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaDoxMzo1OiBlcnJvcjogY2Fubm90IHVzZSBrZXl3
b3JkIOKAmGZhbHNl4oCZCj4gYXMgZW51bWVyYXRpb24gY29uc3RhbnQKPiAgICAxMyB8ICAgICBm
YWxzZSA9IDAsCj4gICAgICAgfCAgICAgXn5+fn4KPiBzcmNkaXIvbGliL3V0aWwvaW5jbHVkZS9i
b29sLmg6MTM6NTogbm90ZTog4oCYZmFsc2XigJkgaXMgYSBrZXl3b3JkIHdpdGgKPiDigJgtc3Rk
PWMyM+KAmSBvbndhcmRzCj4gc3JjZGlyL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oOjE1OjM6IGVy
cm9yOiBleHBlY3RlZCDigJg74oCZLCBpZGVudGlmaWVyCj4gb3Ig4oCYKOKAmSBiZWZvcmUg4oCY
Ym9vbOKAmQo+ICAgIDE1IHwgfSBib29sOwo+ICAgICAgIHwgICBefn5+Cj4gc3JjZGlyL2xpYi91
dGlsL2luY2x1ZGUvYm9vbC5oOjE1OjM6IHdhcm5pbmc6IHVzZWxlc3MgdHlwZSBuYW1lIGluCj4g
ZW1wdHkgZGVjbGFyYXRpb24KPiAKPiBVcHN0cmVhbTogaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQv
cC94bWxycGMtYy9jb2RlLzMzMTgvCj4gCj4gU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3Yg
PHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKVGhhbmtzLCBsb29rcyBnb29kLgoKUmV2aWV3
ZWQtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpT
aG91bGRuJ3Qgd2UgdHJ5IHRvIHVwZGF0ZSAoc2VwYXJhdGVseSk/IEFwcGFyZW50bHkgd2UncmUg
c3RpbGwgdXNpbmc6CgojIDEuNjAuMDEgKGNvZGUvYWR2YW5jZWRAcjMxNzYpCkxJQlhNTFJQQ19W
RVJTSU9OID0gcjMxNzYKCkJ1dCB0aGVyZSdzIGEgbmV3IDEuNjAuMDUgYWNjb3JkaW5nIHRvCmh0
dHBzOi8veG1scnBjLWMuc291cmNlZm9yZ2UuaW8vY2hhbmdlX3N1cGVyX3N0YWJsZS5odG1sOgoK
UmVsZWFzZSAxLjYwLjA1CgpSZWxlYXNlZCAyNS4wMy4yOAoKICAgIEZpeCBjcmFzaCB3aGVuIG1l
bW9yeSBhbGxvY2F0aW9uIGZhaWxzIGluIFhNTCBwYXJzaW5nLCB3aGVuIGJ1aWx0IHRvIHVzZSBs
aWJ4bWwyIFhNTCBwYXJzZXIuIEJyb2tlbiBpbiBYbWxycGMtYyAxLjU3IChEZWNlbWJlciAyMDE5
KS4KICAgIEJ1aWxkOiBmaXggZmFpbHVyZSB0byBpbnN0YWxsIGludGVyZmFjZSBoZWFkZXIgZmls
ZXMgd2hlbiB1c2luZyBzZXBhcmF0ZSBidWlsZCBkaXJlY3RvcnkuIAoKTWF5YmUgd2Ugc2hvdWxk
IHVzZSBpdD8KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==

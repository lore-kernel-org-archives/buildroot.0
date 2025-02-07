Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC86C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B7280F75;
	Fri,  7 Feb 2025 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upF7ZdsCMIup; Fri,  7 Feb 2025 20:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A96080F83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A96080F83;
	Fri,  7 Feb 2025 20:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 414091B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25CA180F75
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vokubNJmf3l8 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 20:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F7A880F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7A880F5F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F7A880F5F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:05:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DF0644194;
 Fri,  7 Feb 2025 20:05:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tgUbT-000GUu-1q;
 Fri, 07 Feb 2025 21:05:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250204-usbutils-libiconv-v2-1-245e490da092@armadeus.com>
Date: Fri, 07 Feb 2025 21:05:31 +0100
In-Reply-To: <20250204-usbutils-libiconv-v2-1-245e490da092@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 04 Feb 2025
 16:55:44 +0100")
Message-ID: <87frkpcygk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepieefuddvteelveefuedtffdujefgueehtdeihffhveejgeekveevuedvgfdugeeinecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhkvghrnhgvlhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/usbutils: select libiconv if
 needed
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

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gU2luY2UgdXBzdHJlYW0gY29tbWl0IDdj
N2ZlZDMwZjc1NTNiNTUxZmNlMzE1MWZlMzE1Y2Y2OWU2MDIwNjUsIHdoaWNoCiA+IGZpcnN0IGFw
cGVhcmVkIGluIHVzYnV0aWxzIHZlcnNpb24gMDA3LCBpY29udiBpcyB1c2VkIHdoZW4gYXZhaWxh
YmxlLgogPiBTaW5jZSB0aGVuLCB0aGUgcGFja2FnZSBoYXMgYmVlbiBmYWlsaW5nIHRvIGJ1aWxk
IHdoZW4gbGliaWNvbnYgbmVlZHMgdG8KID4gYmUgcHJvdmlkZWQgYnkgYSBsaWJyYXJ5IGV4dGVy
bmFsIHRvIHRoZSBDIGxpYnJhcnkuIFRoaXMgY29tbWl0IGZpeGVzCiA+IHRoYXQgYnkgc2VsZWN0
aW5nIEJSMl9QQUNLQUdFX0xJQklDT05WIHdoZW4gbGliaWNvbnYgaXMgbm90IHByb3ZpZGVkIGJ5
CiA+IHRoZSB0b29sY2hhaW4uCgogPiBGaXhlczoKID4gIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzL2Q3ZC9kN2RlZGI3NTQ4MDQyNDJkMDIwZDFhMGQzNGRkOTVjN2MxMDc0
NzEwLy8KID4gIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2JjYS9iY2Ex
NGNlNGZlMDVmMDg3ZTFkODgyMTY3MGJhMzE2NWU5ODIwYTdmLy8KID4gIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzY2NS82NjVjMDY0YmYyOGEzMjVhOGJjNGQ5ZmUxNmY0
NTNiZTQ4NDcyZTU3Ly8KID4gIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
L2I1NC9iNTQzYTM3MTM5NDk1NzFiMDRkYmQ5Yzk0ZjA2M2ZhMGExODY3NjViLy8KID4gIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzZlYS82ZWE2Y2RlOTFjMmM2YzQ5ZjU2
YTA4ZjM3ZmVmMGMxMzRlZGE0MGEwLy8KCiA+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5
bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KID4gLS0tCiA+IENoYW5n
ZXMgaW4gdjI6CiA+IC0gUmV3b3JrIHRoZSBjb21taXQgbWVzc2FnZSBhcyBzdWdnZXN0ZWQgYnkg
VGhvbWFzIFBldGF6em9uaQogPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTAyMDQtdXNidXRpbHMtbGliaWNvbnYtdjEtMS0yMzFmZTI3ZGI0OGNAYXJtYWRldXMu
Y29tCgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjExLngsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

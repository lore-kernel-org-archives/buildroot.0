Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD1C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E354127B;
	Wed,  5 Feb 2025 12:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2VFBOC6zpTC; Wed,  5 Feb 2025 12:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C41941620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C41941620;
	Wed,  5 Feb 2025 12:09:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3448212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236F380C76
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynbhY9ljOXJd for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.45.10;
 helo=18.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F5BA80E2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5BA80E2B
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net
 [178.33.45.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5BA80E2B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:09:06 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.140.177])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4YnzYD2pywz1b9G
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:09:04 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6dzcb (unknown [10.110.101.129])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 039D51FE79;
 Wed,  5 Feb 2025 12:09:03 +0000 (UTC)
Received: from armadeus.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-6dzcb with ESMTPSA
 id yolDL99Uo2fHigAASm4GHw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 12:09:03 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 13:08:59 +0100
MIME-Version: 1.0
Message-Id: <20250205-update-developers-v1-1-711afa54260e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIANpUo2cC/x3MQQqAIBBG4avErBNMKKKrRAtrfmsgSrQiEO+et
 PwW7yWKCIJIQ5Uo4JEo51HQ1BUtmz1WKOFiMtq02uhW3Z7tBcV4sJ8eISrd8WwX69hxT6XzAU7
 e/zlOOX+add1WYwAAAA==
X-Change-ID: 20250205-update-developers-06dbacafdfd8
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 6115888297409571819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepteduffeuudegffduvdfhfeejudefjeelkeeghfejueeutddvgeehieekhfelheegnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Kd0T7Za6Jo+hFSTTQdCGK1mL339GfbhgImUzk3rN8mg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738757344; v=1;
 b=sclUqxL6+LL1zltwziliSO6weygBxqQI4+990cV9gnL6b9ZlA7iJstrik4uYLz1xS2r/6ahc
 7ehX+kyEMdN2HU11vf1NNKI2HUK8HlGQi638/Xo4I9q01z/i5UsDTgBHyRT3epU/vicBGDsfc5A
 +oAIk90UnXKIgL2Uy/OTM+y3HBb86cET5/U9y/PsPzu9MMHNBu2emKv96khhxlNTMiW5Bdi95He
 ngticC2gnQXipQVm9j/SnYrXcThsyEz8hZh3TlUcFUtNRwSd2XBgVU98mjlf6zo1+bhIg8HMjTg
 fd4OKrxdT6tLHHhruM7dQ0arnzlDl8URLKBuHy4WTOxAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=sclUqxL6
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-114S008f271955e-e0a2-4a4d-aba6-8d76354f067f,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Chris Dimich
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXMgZW1haWwgYWRkcmVzcyBhdCBib3VuZGFyeWRldmljZXMgaXMgYm91bmNpbmc6CgpDaHJp
cyBEaW1pY2ggaXMgbm8gbG9uZ2VyIHdpdGggRXp1cmlvLiBQbGVhc2UgY29udGFjdCBHYXJ5IEJp
c3NvbiBieQplbWFpbCBhdCBHYXJ5LkJpc3NvbkBlenVyaW8uY29tLiBUaGFuayB5b3UhIgoKTW92
ZSBoaXMgcGFja2FnZSB0byBHYXJ5IEJpc3NvbiBhcyBzdWdnZXN0ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+
Ci0tLQogREVWRUxPUEVSUyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmlu
ZGV4IGYyMGJkNWNlM2Y3NzVlNWQ5OTI3NGQ2YjVhN2NmYWI0YTgxYzZhZTQuLjc1YTRiMjc0OWQx
YWQ3OGUxMDFhMzFhMmFhODMzMGE3MzVjYmI1NGQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysr
IGIvREVWRUxPUEVSUwpAQCAtNTk5LDkgKzU5OSw2IEBAIEY6CXBhY2thZ2UvYWxzYS1wbHVnaW5z
LwogTjoJQ2hhbmdtaW5nIEh1YW5nIDxqZXJyeS5odWFuZ0BueHAuY29tPgogRjoJcGFja2FnZS9x
b3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlLwogCi1OOglDaHJpcyBEaW1pY2ggPGNocmlzLmRpbWlj
aEBib3VuZGFyeWRldmljZXMuY29tPgotRjoJcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUt
aGFudHJvLWRhZW1vbi8KLQogTjoJQ2hyaXMgUGFja2hhbSA8anVkZ2UucGFja2hhbUBnbWFpbC5j
b20+CiBGOglwYWNrYWdlL2NvcmVtYXJrLwogRjoJcGFja2FnZS9jb3JlbWFyay1wcm8vCkBAIC0x
MjE5LDYgKzEyMTYsNyBAQCBOOglHYXJ5IEJpc3NvbiA8Ymlzc29uLmdhcnlAZ21haWwuY29tPgog
RjoJYm9hcmQvYm91bmRhcnlkZXZpY2VzLwogRjoJY29uZmlncy9uaXRyb2dlbioKIEY6CXBhY2th
Z2UvZnJlZXNjYWxlLWlteC8KK0Y6CXBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRy
by1kYWVtb24vCiBGOglwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgvCiBGOglwYWNrYWdlL2xp
YmlteHZwdWFwaS8KIEY6CXBhY2thZ2UvbWZndG9vbHMvCgotLS0KYmFzZS1jb21taXQ6IGMzOWY2
NzdlNmE3MTQyMzk0YmIyNzEzMTgxYmNhNjliNzY4ZTlmOWUKY2hhbmdlLWlkOiAyMDI1MDIwNS11
cGRhdGUtZGV2ZWxvcGVycy0wNmRiYWNhZmRmZDgKCkJlc3QgcmVnYXJkcywKLS0gClPDqWJhc3Rp
ZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

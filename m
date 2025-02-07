Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0633C02199
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6C840090;
	Fri,  7 Feb 2025 15:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQoHy6VMKNIO; Fri,  7 Feb 2025 15:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41E4F40682
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E4F40682;
	Fri,  7 Feb 2025 15:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89214CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4C086073E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFYahsypjljS for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 15:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.8;
 helo=13.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C75260719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C75260719
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C75260719
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:47 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.25.166])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4YqJKn2hhBz1VW8
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-77ppr (unknown [10.110.168.229])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1378E1FE0D;
 Fri,  7 Feb 2025 15:48:45 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-77ppr with ESMTPSA
 id fwALCVwrpmdVAyMA54ZK/A:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 07 Feb 2025 15:48:45 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 07 Feb 2025 16:48:35 +0100
MIME-Version: 1.0
Message-Id: <20250207-nxp-mwifiex-fix-v1-2-6d0e9a7a7892@armadeus.com>
References: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
In-Reply-To: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 3124653718995004395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfelvdefjeeivefhuefhledtjeduieevvefhffehjefgudetfedufeeuhedvudenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=0xoXjENMDtknrAgMhqFpzPxXJARpuP7kF+x7x5oYCFE=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738943325; v=1;
 b=YpxPXUuGB95EVJIgA1RSbnZzhZIyJOU6VzicBxyFTZeAt/QvB0FIaQKaGYtwwn98PHTGsOl5
 soJBkR8wgkM9pcRhXbZw6Ue4mnBtTelNLqFxIr6Y/ibKtbWxEjdbJwqQmMRFVmOXG3C8pv24Phg
 6fyz+4Qg3pV12ZyfrRrp4Wf/m0qX1Q8f/9z2GTLT53YGZ4GrGzIN3KJE7XkHWt1IQzglhgt0Sj8
 KN5tqyxGHHykf8xJld/t8Ta960610E420QH4mPPZzg5wysEMX9hGtAQfVs2fwrFqOaNtBHsWDsV
 Wfwc2lylEYl8nHn4ySlLPekHF2//7Q5bslKsyYdDuyxUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=YpxPXUuG
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007a17ec4ef-a959-4f9a-9271-e34bd10f7f8d,
 7D5C4D31AAFF8108D9FE7567D41352C5D36F9163)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 2/2] package/nxp-mwifiex: fix build failure due
 to missing Linux options
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

U2V2ZXJhbCBkcml2ZXJzIGZvciBkaWZmZXJlbnQgYnVzZXMgKFVTQiwgUENJZSwgU0RJTykgYXJl
IGNvbXBpbGVkIGJ5CmRlZmF1bHQuIEVuYWJsZSB0aGUga2VybmVsIG1vZHVsZXMgbmVlZGVkIGJ5
IHRoZXNlIGRyaXZlcnMgdG8gcHJldmVudApidWlsZCBmYWlsdXJlOgoKQ09ORklHX05FVApDT05G
SUdfV0lSRUxFU1MKQ09ORklHX0NGRzgwMjExCkNPTkZJR19VU0JfU1VQUE9SVApDT05GSUdfVVNC
CkNPTkZJR19NTUMKQ09ORklHX1BDSUUKCkZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvYzY3OWI3OTNkMGI4MWU3NTY5ODkzYTAzZjk1YjJlMGI4YzgzZTI2OC8K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rIHwg
MTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rIGIvcGFja2FnZS9ueHAtbXdp
ZmlleC9ueHAtbXdpZmlleC5tawppbmRleCBmYWFjYWFkMjg5NTM4MTcyM2ZmYzU5YzA0OGEwYmUy
ZGQyNWFhMDY4Li44ZjA4NTY2OGYxOTY0ZGY4NGQwYzRkYThhZDEwMTk0ZTg3MDAzYjEwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rCisrKyBiL3BhY2thZ2Uv
bnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsKQEAgLTExLDUgKzExLDE1IEBAIE5YUF9NV0lGSUVY
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiAKIE5YUF9NV0lGSUVYX01BS0VfT1BUUyA9IEtFUk5F
TERJUj0kKExJTlVYX0RJUikKIAorZGVmaW5lIE5YUF9NV0lGSUVYX0xJTlVYX0NPTkZJR19GSVhV
UFMKKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVQpCisJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfV0lSRUxFU1MpCisJJChjYWxsIEtDT05GSUdfRU5BQkxFX09Q
VCxDT05GSUdfQ0ZHODAyMTEpCisJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVVNC
X1NVUFBPUlQpCisJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVVNCKQorCSQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX01NQykKKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVf
T1BULENPTkZJR19QQ0lFKQorZW5kZWYKKwogJChldmFsICQoa2VybmVsLW1vZHVsZSkpCiAkKGV2
YWwgJChnZW5lcmljLXBhY2thZ2UpKQoKLS0gCjIuNDUuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK

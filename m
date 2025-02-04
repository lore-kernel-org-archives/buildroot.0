Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600D3C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC0060B29;
	Tue,  4 Feb 2025 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsHbQFDddrJg; Tue,  4 Feb 2025 15:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1495560AE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1495560AE1;
	Tue,  4 Feb 2025 15:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57FA312F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4735381C26
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4vqXlssUG2V for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.80;
 helo=2.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09FBC81AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FBC81AC4
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net
 [178.33.251.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09FBC81AC4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:56:18 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.176.72])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4YnSdr1f2lz1x1g
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:56:16 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ppvwp (unknown [10.110.188.136])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB0F91FEB8;
 Tue,  4 Feb 2025 15:56:15 +0000 (UTC)
Received: from armadeus.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-ppvwp with ESMTPSA
 id ae3sIp84omfvNwwAjHn3yQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 04 Feb 2025 15:56:15 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 04 Feb 2025 16:55:44 +0100
MIME-Version: 1.0
Message-Id: <20250204-usbutils-libiconv-v2-1-245e490da092@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAH84omcC/22NQQqDMBBFr1Jm3RQzKkpXvUdxYZJJHVBTMhpax
 Ls3Fbrr8j34728gFJkErqcNIiUWDnMGPJ/ADv38IMUuM2CBdYFFqVYx68KjqJEN2zAnVdfeOGy
 a1pKHvHtG8vw6mvcu88CyhPg+LpL+2l+t+lNLWmmFpfaEjTNVa299nHpHq1xsmKDb9/0Dj/Kdz
 bUAAAA=
X-Change-ID: 20250203-usbutils-libiconv-55fbd2778cef
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 4080261266428586869
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgfdtgfefteffjedtueekuefhueevjeejfefgleetjeeuheefuedtjeefveethfdtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpuddtledrkeelrddvfedvrdehhedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=5mVTAVB54MgEDTISqJcGeqWXFfkzLuV0LUZzHy4ubkk=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738684576; v=1;
 b=CVnH6wo/RR48/hNZOU2idSDbYPw5Sde8FRnFCvqyZUD50da438fWMpDqaXG/+OOb5+7c/lT2
 M1CbuZu/syC5fPWd6tox2mMTGvcjLk8kGE19jZFskAUX4BpRbZH784a8TcuTMOrXmE/D5K3pj2s
 gMJLtt8Kh4tYDTfQ39PSMhWdNKWLNsGOdcA+I84GbLyL1SfIWM+2fgCDrTU1MgTPYV5U3UKM8c7
 RNfvhaTgsMZe/2FEtJLUgKE9cj/EfVq8Tp8OZBQHHioBUlStsxuQcX+ZpK1b2nOx21+ZC0xWQoK
 K9tMa0HJYGyQ9p2B/awGYdtTinIlLZkUD+dWq3Ki19xEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=CVnH6wo/
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0039f483564-c7d3-4835-9dc7-190ce5c40520,
 4737E9D519EB4FB7C7382537C238276C7098ED2F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2] package/usbutils: select libiconv if needed
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdXBzdHJlYW0gY29tbWl0IDdjN2ZlZDMwZjc1NTNiNTUxZmNlMzE1MWZlMzE1Y2Y2OWU2
MDIwNjUsIHdoaWNoCmZpcnN0IGFwcGVhcmVkIGluIHVzYnV0aWxzIHZlcnNpb24gMDA3LCBpY29u
diBpcyB1c2VkIHdoZW4gYXZhaWxhYmxlLgpTaW5jZSB0aGVuLCB0aGUgcGFja2FnZSBoYXMgYmVl
biBmYWlsaW5nIHRvIGJ1aWxkIHdoZW4gbGliaWNvbnYgbmVlZHMgdG8KYmUgcHJvdmlkZWQgYnkg
YSBsaWJyYXJ5IGV4dGVybmFsIHRvIHRoZSBDIGxpYnJhcnkuIFRoaXMgY29tbWl0IGZpeGVzCnRo
YXQgYnkgc2VsZWN0aW5nIEJSMl9QQUNLQUdFX0xJQklDT05WIHdoZW4gbGliaWNvbnYgaXMgbm90
IHByb3ZpZGVkIGJ5CnRoZSB0b29sY2hhaW4uCgpGaXhlczoKIGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzL2Q3ZC9kN2RlZGI3NTQ4MDQyNDJkMDIwZDFhMGQzNGRkOTVjN2Mx
MDc0NzEwLy8KIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2JjYS9iY2Ex
NGNlNGZlMDVmMDg3ZTFkODgyMTY3MGJhMzE2NWU5ODIwYTdmLy8KIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzLzY2NS82NjVjMDY0YmYyOGEzMjVhOGJjNGQ5ZmUxNmY0NTNi
ZTQ4NDcyZTU3Ly8KIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2I1NC9i
NTQzYTM3MTM5NDk1NzFiMDRkYmQ5Yzk0ZjA2M2ZhMGExODY3NjViLy8KIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzZlYS82ZWE2Y2RlOTFjMmM2YzQ5ZjU2YTA4ZjM3ZmVm
MGMxMzRlZGE0MGEwLy8KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJh
c3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gUmV3b3Jr
IHRoZSBjb21taXQgbWVzc2FnZSBhcyBzdWdnZXN0ZWQgYnkgVGhvbWFzIFBldGF6em9uaQotIExp
bmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAyMDQtdXNidXRpbHMtbGli
aWNvbnYtdjEtMS0yMzFmZTI3ZGI0OGNAYXJtYWRldXMuY29tCi0tLQogcGFja2FnZS91c2J1dGls
cy9Db25maWcuaW4gICB8IDEgKwogcGFja2FnZS91c2J1dGlscy91c2J1dGlscy5tayB8IDUgKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS91c2J1dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3VzYnV0aWxzL0NvbmZpZy5pbgppbmRleCBh
MzhlYjJmMmU1MDQ0NjMzNGUzMjZkNDdiOWVlZGJlMjUwMjM3MDBjLi43ZTcwMjliYmZlYzZjNmFj
YzJiNTkyYzkxNTZlZDIzZGUyNWJiMzMwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3VzYnV0aWxzL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL3VzYnV0aWxzL0NvbmZpZy5pbgpAQCAtMyw2ICszLDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1VTQlVUSUxTCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTICMgbGlidXNiCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF80XzkgIyBsaWJ1c2IKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWICMgbmVlZHMg
aHdkYgorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJJQ09OViBpZiAhQlIyX0VOQUJMRV9MT0NBTEUK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVVNCCiAJaGVscAogCSAgVVNCIGVudW1lcmF0aW9uIHV0
aWxpdGllcwpkaWZmIC0tZ2l0IGEvcGFja2FnZS91c2J1dGlscy91c2J1dGlscy5tayBiL3BhY2th
Z2UvdXNidXRpbHMvdXNidXRpbHMubWsKaW5kZXggNDgzMDFmYmI5ZmQxZDJiMmQyM2QwNzFiZmI2
MTkzYjE2ZWE3NDljMy4uMTA5Mzk4MTM2MDhjMmM3OWI5NThjNmQ0ZDdhMGY2ZjBmMjBhNzYyNSAx
MDA2NDQKLS0tIGEvcGFja2FnZS91c2J1dGlscy91c2J1dGlscy5taworKysgYi9wYWNrYWdlL3Vz
YnV0aWxzL3VzYnV0aWxzLm1rCkBAIC0xMSw2ICsxMSwxMSBAQCBVU0JVVElMU19ERVBFTkRFTkNJ
RVMgPSBob3N0LXBrZ2NvbmYgbGlidXNiIHVkZXYKIFVTQlVUSUxTX0xJQ0VOU0UgPSBHUEwtMi4w
KyAodXRpbHMpIEdQTC0yLjAgb3IgR1BMLTMuMCAobHN1c2IucHkpCiBVU0JVVElMU19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRVMvR1BMLTIuMC1vbmx5LnR4dCBMSUNFTlNFUy9HUEwtMy4wLW9ubHku
dHh0CiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCSUNPTlYpLHkpCitVU0JVVElMU19ERVBFTkRF
TkNJRVMgKz0gbGliaWNvbnYKK1VTQlVUSUxTX0xERkxBR1MgKz0gLWxpY29udgorZW5kaWYKKwog
IyBOaWNlIGxzdXNiLnB5IHNjcmlwdCBvbmx5IGlmIHRoZXJlJ3MgcHl0aG9uIDMueAogaWZlcSAo
JChCUjJfUEFDS0FHRV9QWVRIT04zKSwpCiBkZWZpbmUgVVNCVVRJTFNfUkVNT1ZFX1BZVEhPTgoK
LS0tCmJhc2UtY29tbWl0OiBiMDMwOTg2NDVmNzQ3MzM4OWY4NzhmZGY2MTBkZWY3OWUzNzFjZjQ1
CmNoYW5nZS1pZDogMjAyNTAyMDMtdXNidXRpbHMtbGliaWNvbnYtNTVmYmQyNzc4Y2VmCgpCZXN0
IHJlZ2FyZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBh
cm1hZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

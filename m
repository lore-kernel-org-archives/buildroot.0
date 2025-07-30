Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE2AC87FC9
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 12:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C1D613C0;
	Wed, 30 Jul 2025 12:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhMBAf0VTqZm; Wed, 30 Jul 2025 12:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FCDE6102E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCDE6102E;
	Wed, 30 Jul 2025 12:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E6CB6A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09ED640C42
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ula7u0X7eXWA for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 12:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81E1340736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E1340736
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E1340736
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CAB44318A;
 Wed, 30 Jul 2025 12:47:21 +0000 (UTC)
Date: Wed, 30 Jul 2025 14:47:13 +0200
MIME-Version: 1.0
Message-Id: <20250730-openscap-v1-1-46e4a32e26da@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
In-Reply-To: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteektdduteejffelteehfefgheduffdvtdehfefhteehgeegvdeuvddvffeljeejnecuffhomhgrihhnpegrlhgvkhhsvgihrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtihhmrdhhrghmmhgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753879641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6v4PqkSwxeBikAQSzK0A3vueKbBs82A/9dlKNaQJem0=;
 b=hopDpRLQdc71TH315Iow64ppb3ZegwPA/qFWPUNpqyEr5nrsf/vyWyS8aqi+jjTFnK6Bke
 o0EGm+TKxO2yE5yynNmIgZRzwwB4geZpqR2jX7qzS+tfEXJa2Z19iLBrM3eYTUUpv15wIU
 eWqtb7sjTL4ktgK5u7l1FED8GsHfuUDEAHK/uqMBMhQ3BYT+wlDQXhHTPJgNqZ0r3AjUVA
 ccKPKUF6KDO15XRo/NeHCwYpHQXKzdDWW0oq5t/1K3GqwcccCue8O5zFnVJHvNjPF1h3Q0
 iW5wwtTvsVpmka7s9zi2/fJTqfSJEOu0/Fu44SZAfDU+GkqRxTZhlHnLF46Tig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hopDpRLQ
Subject: [Buildroot] [PATCH 1/4] package/libxmlsec1: Add libxmlsec1 used by
 openSCAP
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW50cm9kdWNlIHRoZSBsaWJ4bWxzZWMxIGxpYnJhcnkgcGFja2FnZS4gbGlieG1sc2VjIGltcGxl
bWVudHMgWE1MCnNlY3VyaXR5IHN0YW5kYXJkcy4KClRoZSBsaWJyYXJ5IGhhcyBvbmx5IGEgZmV3
IG1hbmRhdG9yeSBkZXBlbmRlbmNpZXMobGlieG1sMiBhbmQgbGlieHNsdAphbmQgYSBjcnlwdG8g
bGlicmFyeSkuICBJdCBuZWVkcyBvbmUgb2YgdGhlIGZvbGxvd2luZyBjcnlwdG9ncmFwaGljCmxp
YnJhcmllczogT3BlblNTTCwgTlNTLCBvciBHY3J5cHQvR05VVExTLiBEZWZhdWx0IHRvIG9wZW5z
c2wgZm9yIG5vdyB0bwprZWVwIHRoZSBwYWNrYWdlIHNpbXBsZS4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbGlieG1sc2VjMS9Db25m
aWcuaW4gICAgICAgfCAxMyArKysrKysrKysrKysrCiBwYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1s
c2VjMS5oYXNoIHwgIDQgKysrKwogcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsgICB8
IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25m
aWcuaW4KaW5kZXggMTM3Zjc0ZWQ4MmNlODAyOWU3ZDhmNTNmYzNlMWZhYmM5NTg0ZjczZS4uMmQx
OWJjODEzMDZhYmY2NjYzNGI4ZmNlYTQwNzEyMTA3NjEyYWVkNyAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTE5NDcsNiArMTk0Nyw3IEBA
IG1lbnUgIkpTT04vWE1MIgogCXNvdXJjZSAicGFja2FnZS9saWJ4bWxiL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvbGlieG1scHAvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJ4
bWxycGMvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UvbGlieHNsdC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2xp
YnlhbWwvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9teG1sL0NvbmZpZy5pbiIKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4gYi9wYWNrYWdlL2xpYnhtbHNlYzEv
Q29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAuLjE1NWVmYWM4MjVjMDcxZDBkMzUxOGE5MmNhMzVjYWY3ZDdk
ZWNmOWUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCkBA
IC0wLDAgKzEsMTMgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJYTUxTRUMxCisJYm9vbCAibGli
eG1sc2VjMSIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAorCXNlbGVjdCBCUjJfUEFDS0FH
RV9MSUJYTUwyCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhTTFQKKwloZWxwCisJICBYTUxTZWMg
bGlicmFyeSBwcm92aWRlcyBDIGJhc2VkIGltcGxlbWVudGF0aW9uIGZvciBtYWpvciBYTUwKKwkg
IFNlY3VyaXR5IHN0YW5kYXJkczoKKwkgICAgLSBYTUwgU2lnbmF0dXJlIFN5bnRheCBhbmQgUHJv
Y2Vzc2luZworCSAgICAtIFhNTCBFbmNyeXB0aW9uIFN5bnRheCBhbmQgUHJvY2Vzc2luZworCisJ
ICBodHRwczovL3d3dy5hbGVrc2V5LmNvbS94bWxzZWMvCisJICBodHRwczovL2dpdGh1Yi5jb20v
bHNoMTIzL3htbHNlYwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEu
aGFzaCBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMTU2
ZTEzMTBhMzYwOTQ2NWQ3OTE0YjJjOWU4MzBlNTE1N2I4OGY5OQotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKQEAgLTAsMCArMSw0IEBACisjIExv
Y2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgZDgyZTkzYjY5YjhhYTIwNWE2MTZiNjI5MTdhMjY5MzIy
YmY2M2EzZWFhZmIzNzc1MDE0ZTYxNzUyYjIwMTNlYSAgeG1sc2VjMS0xLjMuNy50YXIuZ3oKKyMg
TG9jYWxseSBjb21wCitzaGEyNTYgIGQ1ZTkzODg1MzQyNTYzNjBjNmEwMDlkNGYxOWFiMmI4ZDZl
YzBhYTdmZjMyYTUxZTIyZDg5OWVkN2JlYjVjNDggIENvcHlyaWdodApkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsgYi9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1s
c2VjMS5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwLi5iMDU0NjVkZDEwZmZmY2Y0OTBkYjQwZDEyYjdhNjZhYzMzZGE3
ZDQ3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsK
QEAgLTAsMCArMSwyOCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbGlieG1sc2Vj
MQorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworTElCWE1MU0VDMV9WRVJTSU9OID0gMS4z
LjcKK0xJQlhNTFNFQzFfU09VUkNFID0geG1sc2VjMS0kKExJQlhNTFNFQzFfVkVSU0lPTikudGFy
Lmd6CitMSUJYTUxTRUMxX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9y
ZWxlYXNlcy9kb3dubG9hZC8kKExJQlhNTFNFQzFfVkVSU0lPTikKK0xJQlhNTFNFQzFfTElDRU5T
RSA9IE1JVAorTElCWE1MU0VDMV9MSUNFTlNFX0ZJTEVTID0gQ29weXJpZ2h0CitMSUJYTUxTRUMx
X0lOU1RBTExfU1RBR0lORyA9IFlFUworTElCWE1MU0VDMV9ERVBFTkRFTkNJRVMgPSBsaWJ4bWwy
IGxpYnhzbHQgb3BlbnNzbAorSE9TVF9MSUJYTUxTRUMxX0RFUEVOREVOQ0lFUyA9IGhvc3QtbGli
eG1sMiBob3N0LWxpYnhzbHQgaG9zdC1vcGVuc3NsCisKK0xJQlhNTFNFQzFfQ09ORl9PUFRTID0J
LS1kaXNhYmxlLXN0YXRpYyBcCisJCQktLWVuYWJsZS1jcnlwdG8tZGw9bm8gXAorCQkJLS13aXRo
LW9wZW5zc2wgXAorCQkJLS13aXRoLWdudXRscz1ubyBcCisJCQktLXdpdGgtZ2NyeXB0PW5vIFwK
KwkJCS0td2l0aC1uc3M9bm8KKworTElCWE1MU0VDMV9BVVRPUkVDT05GID0gWUVTCisKK0hPU1Rf
TElCWE1MU0VDMV9DT05GX09QVFMgPSAkKExJQlhNTFNFQzFfQ09ORl9PUFRTKQorCiskKGV2YWwg
JChhdXRvdG9vbHMtcGFja2FnZSkpCiskKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkK
Ci0tIAoyLjUwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45354C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 12:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5886480D1A;
	Tue,  6 May 2025 12:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mI06WvZCw6M; Tue,  6 May 2025 12:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EFB80CDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EFB80CDC;
	Tue,  6 May 2025 12:47:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F6620F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BAFC80CDC
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58OzXQlPlFyj for <buildroot@buildroot.org>;
 Tue,  6 May 2025 12:47:22 +0000 (UTC)
X-Greylist: delayed 4220 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 12:47:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DA7380B82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA7380B82
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.173.157;
 helo=11.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net
 [87.98.173.157])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA7380B82
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:47:21 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.55])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL437GDz1QKr
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2EF6C1FE2F;
 Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T5
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:52 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:34 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-4-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139976047501437920
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=MmQkZBtsbOpfcPuDWA1pyRiP4O1Tb3MMZMA6tvdt99g=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522652; v=1;
 b=SCyU0obVNuoyJkTjEHYYWFo7RWkjhKRSQ0fVqttuxMs8D11DbAGB9z9bCC5DJwI4G+LYIIVs
 FRnobD45zU6LcZKZsiVqorOI171P9KKqaVrNMQoyVrgy+ZFiWKhUv6wGq0DqEODkj1bkxAAcMFJ
 8UPArBvo9sOFTjURvpFNkqelD3oJCAjDULrfjlZJUK3bD1TRyHcXt6MYZH4zX07qmiZjG2uJFnL
 X7dmuyOwgdDy2KWyrODvjdmAgWv5UCWfBiPJKGGSmR3BWXJlnx1ieoO542C919am28oqU6VwMTT
 Y+gGvweG4Kmh2cElgvp7XEdvUOK1rvc2sXrOPTvzJbpZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=SCyU0obV
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e8ea800b-bfc9-4bc0-b2b1-854bec9cd9a9,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 4/7] package/freescale-imx/imx-gpu-viv: bump
 version to 6.4.11.p3.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
MTIuMy0xLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NyBKdWx5IDIwMjQiIHRvICJ2NTgg
Tm92ZW1iZXIgMjAyNCIuClRoZSBWaXZhbnRlLmljZCBmaWxlIGlzIG5vdyBpbiBncHUtY29yZS9l
dGMvT3BlbkNML3ZlbmRvcnMvIGFuZCB0aGVyZSBpcwphIG5ldyBkaXJlY3RvcnkgInZ1bGthbiIg
aW4gZ3B1LWNvcmUvZXRjLy4gQ29weSBib3RoIE9wZW5DTCBhbmQgdnVsa2FuCmRpcmVjdG9yaWVz
IHRvIC9ldGMvLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGll
bi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Z3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoIHwgOCArKysrLS0tLQogcGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lm1rICAgfCA4ICsrKystLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvaW14LWdwdS12aXYuaGFzaCBiL3BhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoCmluZGV4IDg3YWM4NmFi
N2FiYzEyYTFhNGEyMWUwZTFkNDFiZTllNTFjMTg0MGQuLjdiNGZjZWRmNGE1ZTAzYjVlNjZiYWNl
MTA2N2Q4YTgzNDQ1YzRhNjIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Z3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Z3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoCkBAIC0xLDYgKzEsNiBAQAogIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKLXNoYTI1NiAgMjI0MmM3Y2JmMWEyYjA3ZDQwZWVmZTVkMTUwNzc0N2U0NzdjNTQ5MTJm
MTc5ZWUwNTg1YTVkNzk2NTA3NGNlMCAgaW14LWdwdS12aXYtNi40LjExLnAyLjEwLWFhcmNoMzIt
YWNjZGQ2NC5iaW4KLXNoYTI1NiAgODEwOGZkMTQ2ZGU2OTg2NDg2ZjM0ODYwMjI3NTExYTUxMDFi
MzEwNzJiOTljZDc4YWUzOGFmYmE4OTM5ZmQ0ZSAgaW14LWdwdS12aXYtNi40LjExLnAyLjEwLWFh
cmNoNjQtYWNjZGQ2NC5iaW4KLXNoYTI1NiAgNjAxZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRkNjVh
NmYzMjlhMzJmYWY0OWRiMjJmOThlNDYwODIyMWU4NjFmNyAgQ09QWUlORwotc2hhMjU2ICBjM2Q5
YTdiMmE1YTdkYjVkYTY5MGU5YzEwODFiOThiNjY1ODAyYzNlZmJiYmE3ZmIyMzczMzkzOTVhOTJm
NjA3ICBFVUxBCitzaGEyNTYgIGZlOGZjMjMxZjE4MDQ3Yjk1NDdhMDM4ZTExMWMwOGU4NTU3NjAx
OTBkMGU5ODQ4ZWFkMjJiMzgzZDc5MzQ5OWQgIGlteC1ncHUtdml2LTYuNC4xMS5wMy4wLWFhcmNo
MzItYzYwMGQwMy5iaW4KK3NoYTI1NiAgODJlMWJiNjMwNGQyYWFjNzBjNzJiNjkxMjM5ZDFiYjVm
NjczOGNhZGZhODEyZDA3MTk2ZGIyZjU4MGM2M2QyOSAgaW14LWdwdS12aXYtNi40LjExLnAzLjAt
YWFyY2g2NC1jNjAwZDAzLmJpbgorc2hhMjU2ICAzZjRhMTJjODJhODRiZDFjMzU3OGM5Yzk4NmQ2
MzcxYTYxZDMzOTk1MjVlNzYyODhlY2JiYWUwMWRhZjBhZTI2ICBDT1BZSU5HCitzaGEyNTYgIDM4
ZjE0MDhkNmU5MzVjNTY0ZWZkOTExOWMzMTMyNjllNjQzYzFhODVjYWIxZDkzMGMzYzViZDcwYmMy
NjE3NjkgIEVVTEEKIHNoYTI1NiAgYWIyMGZhM2Y1MjdmY2U5OTA4N2Q4ZDNjZDRlMmNmNGI5Y2Zk
ZmFhYTk4YjNkNzY2YTJiNTk1M2E5ODEzMjNkMyAgU0NSLWlteC1ncHUtdml2LnR4dApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lm1rIGIv
cGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lm1rCmluZGV4IDg1
N2ExMWIzYjkwZGQxMTYwMjMzNmRiYzVjMzlmMDM0NWUwM2ExZDAuLjg3NDRmZjFiYzk5OWQzZDFl
OTZlMjc2MzRkOWU3ZjdjMmJkNmJkZmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LWdwdS12aXYvaW14LWdwdS12aXYubWsKQEAgLTQsMTEgKzQsMTEgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLUlNWF9HUFVfVklWX1JFVklTSU9OID0gYWNjZGQ2NAorSU1YX0dQ
VV9WSVZfUkVWSVNJT04gPSBjNjAwZDAzCiBpZmVxICgkKEJSMl9hYXJjaDY0KSx5KQotSU1YX0dQ
VV9WSVZfVkVSU0lPTiA9IDYuNC4xMS5wMi4xMC1hYXJjaDY0CitJTVhfR1BVX1ZJVl9WRVJTSU9O
ID0gNi40LjExLnAzLjAtYWFyY2g2NAogZWxzZQotSU1YX0dQVV9WSVZfVkVSU0lPTiA9IDYuNC4x
MS5wMi4xMC1hYXJjaDMyCitJTVhfR1BVX1ZJVl9WRVJTSU9OID0gNi40LjExLnAzLjAtYWFyY2gz
MgogZW5kaWYKIElNWF9HUFVfVklWX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKIElNWF9H
UFVfVklWX1NPVVJDRSA9IGlteC1ncHUtdml2LSQoSU1YX0dQVV9WSVZfVkVSU0lPTiktJChJTVhf
R1BVX1ZJVl9SRVZJU0lPTikuYmluCkBAIC05Myw3ICs5Myw3IEBAIGRlZmluZSBJTVhfR1BVX1ZJ
Vl9JTlNUQUxMX1RBUkdFVF9DTURTCiAJJChJTVhfR1BVX1ZJVl9JTlNUQUxMX0VYQU1QTEVTKQog
CSQoSU1YX0dQVV9WSVZfSU5TVEFMTF9HTUVNX0lORk8pCiAJY3AgLWEgJChARCkvZ3B1LWNvcmUv
dXNyL2xpYiAkKFRBUkdFVF9ESVIpL3VzcgotCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS9n
cHUtY29yZS9ldGMvVml2YW50ZS5pY2QgJChUQVJHRVRfRElSKS9ldGMvT3BlbkNML3ZlbmRvcnMv
Vml2YW50ZS5pY2QKKwljcCAtciAkKEBEKS9ncHUtY29yZS9ldGMvKiAkKFRBUkdFVF9ESVIpL2V0
YwogZW5kZWYKIAogJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCi0tIAoyLjQ5LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

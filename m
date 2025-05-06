Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33FC3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 09:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7609240695;
	Tue,  6 May 2025 09:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYNbaaZhfHVM; Tue,  6 May 2025 09:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5750405D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5750405D2;
	Tue,  6 May 2025 09:26:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1142520F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A3C40AFD
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLTgY_NTkJJa for <buildroot@buildroot.org>;
 Tue,  6 May 2025 09:26:10 +0000 (UTC)
X-Greylist: delayed 915 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 09:26:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E442140AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E442140AE1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.107.29;
 helo=15.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 15.mo583.mail-out.ovh.net (15.mo583.mail-out.ovh.net
 [178.33.107.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E442140AE1
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:09 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.198])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL409R0z1WjV
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B9D4F1FEB4;
 Tue,  6 May 2025 09:10:51 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T4
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:51 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:33 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-3-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139694575340284896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=gRE97ngYpqUua4KwytJsy1aBku6gIefJa89WWIjBoRg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522652; v=1;
 b=B0bh+hxiVBH06HaYSqlaWs+za9MDV5dlAFvd3ljPEbC32AWnzzTb/KU/XotXrgtbu3RtccDn
 mB0EozRFijK3L/PEGhEsfW26e/3jdLXF3B4ktAHZBkYzLoHtkfvGYSgW7ADOEs1+gGN6gkNWfRw
 KWLro24jaTbs0BK1rXxT3B3MP52mYm3SFOH07XMYmIvp/nVm9sJ/ntSoadx2Isa2gA7VsPsREsJ
 6u2kEFa0uzar/FAgocar36xS0Ng01ugw+BdjJCQw4WiqoSbpHxT5jtHXgEHVFFnTf67MSycR937
 bK2HlDs5kRGwJDuzwgHFcP23+tib4mkg+B9HHjHfkTWNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=B0bh+hxi
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004bdf186dd-8872-4b87-bf49-a9075c68c1f3,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.1
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
Tm92ZW1iZXIgMjAyNCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14
L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoIHwgNiArKystLS0KIHBhY2th
Z2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgubWsgICB8
IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmly
bXdhcmUtZWxlLWlteC5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1p
bXgvZmlybXdhcmUtZWxlLWlteC5oYXNoCmluZGV4IDYxODJkYzU3YmU4MjNjYTU0MTU5Y2FmNzEy
N2RkMTEwMmU0OGY1YTcuLjU1ZTE4NjRlMzFlNjc4YmMzOWVhNjZiMTY2ZmNmYzQ4NzgwMTYwMmQg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13
YXJlLWVsZS1pbXguaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC9maXJtd2FyZS1lbGUtaW14Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICA4NzkxMTA5ODI0NzY3MzQ2MjM3ZTUzYWMyYzcxMjgyNGU1NDYwOGUy
MDkyODU5MTYxZTZiYjNlNTM4NWE3NTk1ICBmaXJtd2FyZS1lbGUtaW14LTEuMy4wLTE3OTQ1ZmMu
YmluCi1zaGEyNTYgIDYwMWZhNzkwYzViNGQwMzU3OWJkMTgyZmI0ZDY1YTZmMzI5YTMyZmFmNDlk
YjIyZjk4ZTQ2MDgyMjFlODYxZjcgIENPUFlJTkcKLXNoYTI1NiAgYzNkOWE3YjJhNWE3ZGI1ZGE2
OTBlOWMxMDgxYjk4YjY2NTgwMmMzZWZiYmJhN2ZiMjM3MzM5Mzk1YTkyZjYwNyAgRVVMQQorc2hh
MjU2ICBhMmYxNmU0M2U4YWZmOWNmMDE4ZDA5NjJiNzAzMTM5NDBmNzcwNzliMzE0MzMxYWIzOTgw
YzRjNWY0NDI0OWNiICBmaXJtd2FyZS1lbGUtaW14LTIuMC4xLTBhNjZjMzQuYmluCitzaGEyNTYg
IDNmNGExMmM4MmE4NGJkMWMzNTc4YzljOTg2ZDYzNzFhNjFkMzM5OTUyNWU3NjI4OGVjYmJhZTAx
ZGFmMGFlMjYgIENPUFlJTkcKK3NoYTI1NiAgMzhmMTQwOGQ2ZTkzNWM1NjRlZmQ5MTE5YzMxMzI2
OWU2NDNjMWE4NWNhYjFkOTMwYzNjNWJkNzBiYzI2MTc2OSAgRVVMQQogc2hhMjU2ICA4NzIxYTYx
N2E1ZDRjN2YzNjZhYWY4NTdlYmRhMjFlYjRjOWZjOTE3NWRjOTJiNzBmNjI3YzYxMWQ0MDNlYzhl
ICBTQ1IudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC9maXJtd2FyZS1lbGUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tawppbmRleCA0MjI1ODA1ZDUwMjNlZmJkYjkwNzMz
MmNmZjE0NjAzOTYzMTEyODA1Li44ZjI1ZjRiNWI1MzcyODRmYTZhNGEwMjdmMjIwMzU4NTVjODlh
YjI5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9m
aXJtd2FyZS1lbGUtaW14Lm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1l
bGUtaW14L2Zpcm13YXJlLWVsZS1pbXgubWsKQEAgLTQsOCArNCw4IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1GSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04gPSAxLjMuMAotRklSTVdB
UkVfRUxFX0lNWF9SRVZJU0lPTiA9IDE3OTQ1ZmMKK0ZJUk1XQVJFX0VMRV9JTVhfVkVSU0lPTiA9
IDIuMC4xCitGSVJNV0FSRV9FTEVfSU1YX1JFVklTSU9OID0gMGE2NmMzNAogRklSTVdBUkVfRUxF
X0lNWF9TSVRFID0gJChGUkVFU0NBTEVfSU1YX1NJVEUpCiBGSVJNV0FSRV9FTEVfSU1YX1NPVVJD
RSA9IGZpcm13YXJlLWVsZS1pbXgtJChGSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04pLSQoRklSTVdB
UkVfRUxFX0lNWF9SRVZJU0lPTikuYmluCiAKCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==

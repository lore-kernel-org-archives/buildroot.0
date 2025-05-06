Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD64C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 13:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B892180C1D;
	Tue,  6 May 2025 13:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJUmsVAf4aaL; Tue,  6 May 2025 13:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFACB80C5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFACB80C5B;
	Tue,  6 May 2025 13:56:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACE2612E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A926F608BE
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LpB2Udh1_cV for <buildroot@buildroot.org>;
 Tue,  6 May 2025 13:56:46 +0000 (UTC)
X-Greylist: delayed 16185 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 13:56:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A4A460008
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4A460008
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.72.216;
 helo=16.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo581.mail-out.ovh.net (16.mo581.mail-out.ovh.net
 [46.105.72.216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4A460008
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:56:44 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.25.134])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL53fy4z1QND
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:53 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 38C231FD9E;
 Tue,  6 May 2025 09:10:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T8
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:53 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:37 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-7-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15140257526254332896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=BU2YaXcXJEZLZ/A7dEF9snPnqzEpX8XB1JFOC6zpFrU=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522653; v=1;
 b=TIcaY+L3NKDDhuy+WIlhCIQ0R3IsPRYiVaFsnhvmXlNf4jbgwt5WY7oyOC7serZQpOax03TV
 f/+vHVlgBQOssKXH6qL4XtLXQdy+aN0ZAmYmPOYI87aKnLLlsmARBnIE8SKBAlZjZrTq/Mua/yy
 Y9r+CXIGJpLaFOHoSnOskRMq2LE8sCMasR8BSUToSapvnV5dtnY0VOS4g9La3N9F6omd8NH+G8K
 YlbF4k7+H8gKtScFx7Tcv1LSv48H8bDVhWQa+Fpj8WutyEjVX1ROoZR+2Av1HhJmObhRR2FdD02
 lnfDZucDv5akuJL9BQhA0ZWlG5pgqgHXVY+Fw87gyalwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=TIcaY+L3
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004aa27ae6a-ae55-4321-97f1-9a5ecc3f1f59,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 7/7] package/freescale-imx/imx-sc-firmware: bump
 version to 1.18.0
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
L2lteC1zYy1maXJtd2FyZS9pbXgtc2MtZmlybXdhcmUuaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5tayAgIHwgNCAr
Ky0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1m
aXJtd2FyZS5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zYy1maXJtd2FyZS9pbXgt
c2MtZmlybXdhcmUuaGFzaAppbmRleCA5YTEyMzgzZTAyOWUzNDcwNDE5YjBkNWE0YWJiZjNmOTQw
NDg4MWI0Li5kMzY4NjhiN2JlNTc2YjY4NGEwYWViMThiYzM5MzQ4MTczMWMxNzA5IDEwMDY0NAot
LS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2Fy
ZS5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2MtZmlybXdhcmUvaW14LXNj
LWZpcm13YXJlLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICAwODNlODZjYzI2ZjIxODc4NjM1MTM2NzcwODU0NzQxNDk5NjAzMTFlN2ViY2EzNmRmNjkz
MDYwMTRkYWFiOTQ4ICBpbXgtc2MtZmlybXdhcmUtMS4xNy4wLTgzNjI0YjkuYmluCi1zaGEyNTYg
IGMzZDlhN2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJiYTdmYjIzNzMzOTM5
NWE5MmY2MDcgIEVVTEEKLXNoYTI1NiAgNjAxZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRkNjVhNmYz
MjlhMzJmYWY0OWRiMjJmOThlNDYwODIyMWU4NjFmNyAgQ09QWUlORworc2hhMjU2ICAzOTJmMWU1
Y2RmMWM4ZDdlZDc1NDA5YTJjNDZiMDBhMzMyYWNlNjc3ZjBlMjcwMGI1ODdmZTlhZTgwMGExZmYz
ICBpbXgtc2MtZmlybXdhcmUtMS4xOC4wLTY1NDkwN2IuYmluCitzaGEyNTYgIDM4ZjE0MDhkNmU5
MzVjNTY0ZWZkOTExOWMzMTMyNjllNjQzYzFhODVjYWIxZDkzMGMzYzViZDcwYmMyNjE3NjkgIEVV
TEEKK3NoYTI1NiAgM2Y0YTEyYzgyYTg0YmQxYzM1NzhjOWM5ODZkNjM3MWE2MWQzMzk5NTI1ZTc2
Mjg4ZWNiYmFlMDFkYWYwYWUyNiAgQ09QWUlORwogc2hhMjU2ICBiZmJlZWYzMzJkMDVjOTYwOGM3
OTBhMTJiYmJmNGM2NmE4YWNjNzZiMTU5MTQ1YmE3ZWY0OGQzNzk5Y2E4YTYxICBTQ1IudHh0CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1m
aXJtd2FyZS5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2MtZmlybXdhcmUvaW14LXNj
LWZpcm13YXJlLm1rCmluZGV4IDFlNmQ2ZTdkZDU1ZDkzMjg3ODM3ZDIzMmFhMzkwZjBlOTcwYzVi
YTcuLjkwYmZjYzZlM2M2OTMxYTM4MGVlZDBmMWQ5MmMzZmQ4NWM4YzU3MzIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2MtZmlybXdhcmUvaW14LXNjLWZpcm13YXJlLm1r
CisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2MtZmlybXdhcmUvaW14LXNjLWZpcm13
YXJlLm1rCkBAIC00LDggKzQsOCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotSU1Y
X1NDX0ZJUk1XQVJFX1ZFUlNJT04gPSAxLjE3LjAKLUlNWF9TQ19GSVJNV0FSRV9SRVZJU0lPTiA9
IDgzNjI0YjkKK0lNWF9TQ19GSVJNV0FSRV9WRVJTSU9OID0gMS4xOC4wCitJTVhfU0NfRklSTVdB
UkVfUkVWSVNJT04gPSA2NTQ5MDdiCiBJTVhfU0NfRklSTVdBUkVfU0lURSA9ICQoRlJFRVNDQUxF
X0lNWF9TSVRFKQogSU1YX1NDX0ZJUk1XQVJFX1NPVVJDRSA9IGlteC1zYy1maXJtd2FyZS0kKElN
WF9TQ19GSVJNV0FSRV9WRVJTSU9OKS0kKElNWF9TQ19GSVJNV0FSRV9SRVZJU0lPTikuYmluCiAK
Ci0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

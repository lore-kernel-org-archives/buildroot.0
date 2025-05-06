Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F300FC3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 12:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6D9181971;
	Tue,  6 May 2025 12:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_BZxcNv51eo; Tue,  6 May 2025 12:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59E681985
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C59E681985;
	Tue,  6 May 2025 12:49:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB57C12E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 910E360C09
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuX2DiI0xxDk for <buildroot@buildroot.org>;
 Tue,  6 May 2025 12:49:25 +0000 (UTC)
X-Greylist: delayed 8418 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 12:49:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77B1260BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B1260BE8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.75.36;
 helo=2.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net
 [46.105.75.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77B1260BE8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 12:49:24 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.140.166])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL31sNdz1SkJ
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:51 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F38FD1FEC2;
 Tue,  6 May 2025 09:10:50 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:50 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:31 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-1-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139694575204363232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ozewPPRHBl2fnbZiGt+WYGW7o6vNI3y3Pxc+K1hi6R4=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522651; v=1;
 b=P1COsh9fMJCA3pWRD/b1pGUmgiW+oCMt++TXm94yuk4e+vkoiwwkj7opgA1YSEbc5P++6hHq
 cBnpEeSxF4sTr1B/2pgz0E0orx+DkzmftURsPPVidaz1snb/qCqkekNmkObhDVY+08B3whx+ony
 TJqZ0nx7MGZZR73O8NWarF3lbrX0KPCtStA9tCPdJuTD+CzjIM5iAdO/7AGmteRsJaMvvXclQu7
 N9msTF5aGgT1XjbdIU6/7/L19N0zhpaXC7r7QdllbjJjxn9B5fnQPxKEBOkBojq8HP3fATL2WPo
 zhFAhubimJhaV8Cq/0TYJExDOAgTNb8RKqIvulCP0hi4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=P1COsh9f
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004962d3ff9-9907-4d76-8082-3678dc61c6d3,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/7] package/freescale-imx/firmware-imx: bump
 version to 8.27
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
L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXguaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tayAgIHwgNCArKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoIGIvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXguaGFzaAppbmRleCA2
MDYwNzVjODVlYjEzZWEzM2Q1NTUwZjRkN2E2ODcxNWVhNGUwNmNlLi4xM2U5ZTFhODdiYTk5NTI5
ZGY5MmI3ODhlODMzMTMzOWVmZDhiNTVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBiMmZjZjg0YTA0MTc2NzhhYTQ0MWIxYmNkZTllY2U0
NjdmOGJkMDYzYTYzZDgzOTA2ODRmOGUzNzc2OGQ4NGNmICBmaXJtd2FyZS1pbXgtOC4yNi1kNGMz
M2FiLmJpbgotc2hhMjU2ICA2MDFmYTc5MGM1YjRkMDM1NzliZDE4MmZiNGQ2NWE2ZjMyOWEzMmZh
ZjQ5ZGIyMmY5OGU0NjA4MjIxZTg2MWY3ICBDT1BZSU5HCi1zaGEyNTYgIGMzZDlhN2IyYTVhN2Ri
NWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJiYTdmYjIzNzMzOTM5NWE5MmY2MDcgIEVVTEEK
K3NoYTI1NiAgNjFmOTI1ZTYwNmFiMDIwYjFhMzZmM2Y3ZjdlNDU5YzY4NDdmNWI5ZGJjNzk0MjFm
OWVmODZlOGZjMTI0ZWIyZiAgZmlybXdhcmUtaW14LTguMjctNWFmMGNlYi5iaW4KK3NoYTI1NiAg
M2Y0YTEyYzgyYTg0YmQxYzM1NzhjOWM5ODZkNjM3MWE2MWQzMzk5NTI1ZTc2Mjg4ZWNiYmFlMDFk
YWYwYWUyNiAgQ09QWUlORworc2hhMjU2ICAzOGYxNDA4ZDZlOTM1YzU2NGVmZDkxMTljMzEzMjY5
ZTY0M2MxYTg1Y2FiMWQ5MzBjM2M1YmQ3MGJjMjYxNzY5ICBFVUxBCiBzaGEyNTYgIDQwZDAyZjZk
NmI0ZTk0ZDkzMDc1Mjk0MDhmMzcyZjVhOTkwOGNmM2QxNTZlYzUzM2E0ZTU0Mjc0YjQwZjI3MWUg
IFNDUi50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgv
ZmlybXdhcmUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJt
d2FyZS1pbXgubWsKaW5kZXggNjIwNzcyMzhhNzA1OGY3YjZhYzExZDYxNTY1NTY3M2FlYjY5YjIz
Yi4uZjhjOWRmMWNjZWU5YjU0ZDIzNzIyZjllYWRlMzliNWZkZTcyNDYyYSAxMDA2NDQKLS0tIGEv
cGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsKKysrIGIv
cGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsKQEAgLTQs
OCArNCw4IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1GSVJNV0FSRV9JTVhfVkVS
U0lPTiA9IDguMjYKLUZJUk1XQVJFX0lNWF9SRVZJU0lPTiA9IGQ0YzMzYWIKK0ZJUk1XQVJFX0lN
WF9WRVJTSU9OID0gOC4yNworRklSTVdBUkVfSU1YX1JFVklTSU9OID0gNWFmMGNlYgogRklSTVdB
UkVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKIEZJUk1XQVJFX0lNWF9TT1VSQ0Ug
PSBmaXJtd2FyZS1pbXgtJChGSVJNV0FSRV9JTVhfVkVSU0lPTiktJChGSVJNV0FSRV9JTVhfUkVW
SVNJT04pLmJpbgogCgotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=

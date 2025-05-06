Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E41C3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148FF60604;
	Tue,  6 May 2025 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4-sL8UwPWJl; Tue,  6 May 2025 10:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C21560BE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C21560BE1;
	Tue,  6 May 2025 10:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E9C20F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 10:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38BF0403CE
 for <buildroot@buildroot.org>; Tue,  6 May 2025 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njgKRgAxaLk4 for <buildroot@buildroot.org>;
 Tue,  6 May 2025 10:35:19 +0000 (UTC)
X-Greylist: delayed 2678 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 10:35:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 505794031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505794031E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.41.16;
 helo=17.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 17.mo584.mail-out.ovh.net (17.mo584.mail-out.ovh.net
 [46.105.41.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 505794031E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 10:35:18 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.139.157])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL512Sgz1TBn
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:53 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D70111FECD;
 Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T7
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:52 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:36 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-6-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15140257522421722080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=CDNkp8WBvunck8Tr1ehHKPyg8EJL146COk9YvqVVYxc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522653; v=1;
 b=AMikQA0mfQvGF8pwH7wOoggBdR6M9OrfkssBPDw1JNDjnqolWfrtHI910sFgkfedXc1jhQpZ
 LXzVFiAJFOvu9quJ1uihc6IkY7/O1e8NTACfE/X7VB0PKqRZT0eFA1N1/osGl/+p1duEPrrWJEZ
 MgEumV/5uDl1PAGQ3PEQWCTpD/FCy7QtrbuiP1rmDRNCimGIH3/d2ujBsol/ItlmnsU8wbLk1yk
 4vly6ca+bUYuBJAhb6MCe4jXaR+b7Hf3iLNN7CtcXp/WKQU+e68beiurp0P4arsoldH1d4atSAA
 rzWyqMGNK04SFHBZg99NMuX2xuampjU9Lg+hdBrGW6Gsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=AMikQA0m
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004da06bfc2-8720-407b-a020-5f5d30d684be,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 6/7]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.5.0
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
MTIuMy0xLjAuMCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogLi4uL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNoICAgIHwgMiArLQogcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1k
YWVtb24ubWsgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1o
YW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNoIGIvcGFja2FnZS9mcmVlc2Nh
bGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24uaGFzaApp
bmRleCAwZjNjYTYwODY1MzU5ZjNhZWU1OTMyYTAzYTBkMTM1YTM3ODc1NzM4Li42MWY3ZjM4NDYy
Y2FjMjI4YzA3N2I2N2MzNTliYzNlMGU4OWQ5MzU3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNo
CisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZw
dS1oYW50cm8tZGFlbW9uLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6
Ci1zaGEyNTYgIGMzYWMzNmMyMDNmZWY0NGVmMjFjOThhOTBiM2ZmZjczYWY5ZjMyOGYxNmI0ZDg1
MTU3MzA4ODQ4ZjZjMzQ4MjMgIGlteC12cHUtaGFudHJvLWRhZW1vbi0xLjQuMC03NWQ5ZGQ5LnRh
ci5negorc2hhMjU2ICBlNzgwNmE5MmQ0YTVhYjUxYjc2ZDllZGVmNTE3NWE5NTYyNWM0YWMzY2Fi
NDY3ZmUxNTE5YmIwY2UxNmU2NTM1ICBpbXgtdnB1LWhhbnRyby1kYWVtb24tMS41LjAtMzIwMGU2
OC50YXIuZ3oKIHNoYTI1NiAgYmI2NDVmMDJiMjYwOTU1ZjMzMzM0ODEwMGU0MGFmNzYyNTNlMmNk
OGIxMTZiYWMwNDcyMzA0MzlkZDUzZWM1YSAgTElDRU5TRS50eHQKIHNoYTI1NiAgYzYxMTc2MDQ4
Zjc0OTUwYzA4NDlkOTFiNGI2YjMwZTMzNWUwNTA0NjJhODk1MGI4OWE0ZTZmMzVjN2ZlNTc3YiAg
U0NSLWlteC12cHUtaGFudHJvLWRhZW1vbi50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50cm8tZGFlbW9uLm1rIGIv
cGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRy
by1kYWVtb24ubWsKaW5kZXggYTMyODAwNTMyOGYwZmM0OGVhNmUyOWQ5ZjVjNGY5M2E0OThkODEz
NS4uY2IwYTA3ODA3OGE1OTNlYzMwNzM3NDdlNDM4YWI4MTljYmJmYzBjZCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRy
by1kYWVtb24ubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRh
ZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24ubWsKQEAgLTQsOCArNCw4IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1JTVhfVlBVX0hBTlRST19EQUVNT05fVkVSU0lPTiA9IDEuNC4w
Ci1JTVhfVlBVX0hBTlRST19EQUVNT05fUkVWSVNJT04gPSA3NWQ5ZGQ5CitJTVhfVlBVX0hBTlRS
T19EQUVNT05fVkVSU0lPTiA9IDEuNS4wCitJTVhfVlBVX0hBTlRST19EQUVNT05fUkVWSVNJT04g
PSAzMjAwZTY4CiBJTVhfVlBVX0hBTlRST19EQUVNT05fU09VUkNFID0gaW14LXZwdS1oYW50cm8t
ZGFlbW9uLSQoSU1YX1ZQVV9IQU5UUk9fREFFTU9OX1ZFUlNJT04pLSQoSU1YX1ZQVV9IQU5UUk9f
REFFTU9OX1JFVklTSU9OKS50YXIuZ3oKIElNWF9WUFVfSEFOVFJPX0RBRU1PTl9TSVRFID0gJChG
UkVFU0NBTEVfSU1YX1NJVEUpCiBJTVhfVlBVX0hBTlRST19EQUVNT05fTElDRU5TRSA9IE5YUCBT
ZW1pY29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50CgotLSAKMi40OS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

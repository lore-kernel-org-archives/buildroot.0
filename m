Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EB7C3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 09:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC5240340;
	Tue,  6 May 2025 09:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvDAt-cFSwH7; Tue,  6 May 2025 09:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FF4401FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FF4401FC;
	Tue,  6 May 2025 09:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B2720F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F3680B75
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqx7gkKQ7gmG for <buildroot@buildroot.org>;
 Tue,  6 May 2025 09:16:42 +0000 (UTC)
X-Greylist: delayed 348 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 09:16:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B85FD80C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85FD80C12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.180.21;
 helo=15.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 15.mo581.mail-out.ovh.net (15.mo581.mail-out.ovh.net
 [87.98.180.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B85FD80C12
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:16:41 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.55])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL26JRyz1QLp
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:50 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8D7AF1FEBE;
 Tue,  6 May 2025 09:10:50 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:50 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:30 +0200
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAbSGWgC/x3MTQ5AMBBA4avIrE3SDkpcRSyKwcRf04ZIxN01l
 t/ivQcCe+EAdfKA50uCHHuEThPoZ7tPjDJEAykqVKEIu3NzKNuNzvaLnTjgOqJBTVh2pakyyk2
 uNcTeeR7l/t9N+74fDO4B+WsAAAA=
X-Change-ID: 20250502-bump-imx-packages-lf-6-12-7b7683246411
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139413101006875616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeejveekgfefffetudduuedvheeuffeiheekgfevfefhueehjeegheelgeehgfeggeenucffohhmrghinhepnhigphdrtghomhenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=jlS8JxRQ8uC7GLdO1vO2c71QyJWUN+tsjci+7UYFI10=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522650; v=1;
 b=ETe9GfL43jCHJvH8FHr41p6VWsH0VDtEXLITBauMP1l6I2mKfNBaf8Agc+DAZ5s5uObSlahj
 CkhqAPoD+k66PFrZNL4A8FfaE9DX8QloZpMKCb00F38qy9ecUIjBkVWf9Pl9tr6la4qLUYM9r4V
 m1JLWRcLmvuJxVHZhk5v1UPYoks41i/9awtqpHYkA0uhK3+sxD5ppxiyAcWH4PKhqH2aikGjU+K
 ZXyv20Xq7+JK6a60m2femztTkFvaVzMRTwOtk8z/5K4yNtjgDsPiXqxUcjcJBnqh937LOhJgPsh
 IMuY/a0K0+AzfafDObtKY//45n4q44OLh1S6S3dadh9Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=ETe9GfL4
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e8c7f8d0-78ef-4e45-b4da-8ff7da45bda5,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/7] package/freescale-imx: bump to NXP release
 LF6.12.3_1.0.0
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

VGhpcyBzZXJpZXMgYnVtcHMgc29tZSBmcmVlc2NhbGUtaW14IHBhY2thZ2VzIHRvIHRoZSBsYXRl
c3QgTlhQIHJlbGVhc2UKTEY2LjEyLjNfMS4wLjA6CgpodHRwczovL3d3dy5ueHAuY29tL2RvY3Mv
ZW4vcmVsZWFzZS1ub3RlL1JOMDAyMTAucGRmCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQpTw6liYXN0aWVu
IFN6eW1hbnNraSAoNyk6CiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXg6
IGJ1bXAgdmVyc2lvbiB0byA4LjI3CiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1
LWcyZDogYnVtcCB2ZXJzaW9uIHRvIDYuNC4xMS5wMy4wCiAgICAgIHBhY2thZ2UvZnJlZXNjYWxl
LWlteC9maXJtd2FyZS1lbGUtaW14OiBidW1wIHRvIHZlcnNpb24gMi4wLjEKICAgICAgcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2OiBidW1wIHZlcnNpb24gdG8gNi40LjExLnAzLjAK
ICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvOiBidW1wIHZlcnNpb24g
dG8gMS4zNi4wCiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVt
b246IGJ1bXAgdmVyc2lvbiB0byAxLjUuMAogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14
LXNjLWZpcm13YXJlOiBidW1wIHZlcnNpb24gdG8gMS4xOC4wCgogcGFja2FnZS9mcmVlc2NhbGUt
aW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoICAgICAgfCA2ICsrKy0t
LQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlt
eC5tayAgICAgICAgfCA0ICsrLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgv
ZmlybXdhcmUtaW14Lmhhc2ggICAgICAgICAgICAgIHwgNiArKystLS0KIHBhY2thZ2UvZnJlZXNj
YWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rICAgICAgICAgICAgICAgIHwgNCAr
Ky0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQuaGFzaCAg
ICAgICAgICAgICAgICB8IDggKysrKy0tLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1
LWcyZC9pbXgtZ3B1LWcyZC5tayAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KIHBhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoICAgICAgICAgICAgICAg
IHwgOCArKysrLS0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUt
dml2Lm1rICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5oYXNoICAgICAgICB8IDYgKysrLS0t
CiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5t
ayAgICAgICAgICB8IDQgKystLQogLi4uL2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhh
bnRyby1kYWVtb24uaGFzaCAgICAgICAgICAgICAgfCAyICstCiAuLi4vZnJlZXNjYWxlLWlteC9p
bXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50cm8tZGFlbW9uLm1rICB8IDQgKystLQog
cGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhhc2gg
ICAgICAgICAgfCA2ICsrKy0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJv
L2lteC12cHUtaGFudHJvLm1rICAgICAgICAgICAgfCA0ICsrLS0KIDE0IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDEwOGFm
MDI5MzUwNGQ2YWQ4ODU4ZGY4ZTU4MGMzNDdkYTZlNDI0OTgKY2hhbmdlLWlkOiAyMDI1MDUwMi1i
dW1wLWlteC1wYWNrYWdlcy1sZi02LTEyLTdiNzY4MzI0NjQxMQoKQmVzdCByZWdhcmRzLAotLSAK
U8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

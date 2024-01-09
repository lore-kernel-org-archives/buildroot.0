Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A58C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 17:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D4460EFD;
	Tue,  9 Jan 2024 17:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D4460EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xr6iGBbDi4YY; Tue,  9 Jan 2024 17:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B40060E25;
	Tue,  9 Jan 2024 17:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B40060E25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43FCB1BF3C8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CB03611C0
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB03611C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPSd2Bz38Yv5 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 17:27:03 +0000 (UTC)
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net
 [87.98.184.158])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4259360A88
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 17:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4259360A88
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.9.253])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id C86BC28CA1
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 17:27:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qkmx4 (unknown [10.110.113.153])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2D1F11FEB5;
 Tue,  9 Jan 2024 17:27:00 +0000 (UTC)
Received: from armadeus.com ([37.59.142.108])
 by ghost-submission-6684bf9d7b-qkmx4 with ESMTPSA
 id julqBuSBnWUujwEA0+FtTA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 09 Jan 2024 17:27:00 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 18:25:57 +0100
Message-ID: <20240109172600.12811-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9359605928765221867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehledgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-108S00265f7a13a-9227-489d-929e-abc899e75d56,
 1C81E47412DA9CB083A96931AFF5080C19F73897)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v3 0/3] i.MX91 and i.MX93 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWRkcyBpLk1YOTEsIGkuTVg5MyBhbmQgaS5NWDkzIDExeDExIEVWSyB0byBC
dWlsZHJvb3QuCgotLS0KCkNoYW5nZXMgZm9yIHYzOgogLSByZW5hbWUgcGFja2FnZSBmaXJtd2Fy
ZS1zZW50aW5lbCB0byBmaXJtd2FyZS1lbGUtaW14CiAtIGFkZCBhIG5vdGUgYWJvdXQgdGhlIGRl
YnVnIFVBUlQgaW4gdGhlIHJlYWRtZS50eHQgZmlsZSAoSnVsaWVuIE9saXZhaW4pCiAtIGFkZCBC
UjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eSBhbmQKICAgQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19HTlVUTFM9eSB0byB0aGUgZGVmY29uZmlnIGZpbGUgKEp1bGllbiBPbGl2YWluKQogLSBi
dW1wIEFURiwgVS1Cb290IGFuZCBMaW51eCB0byBsYXRlc3QgTlhQIHJlbGVhc2UgbGYtNi4xLjU1
LTIuMi4wCiAgIChKdWxpZW4gT2xpdmFpbikKCkNoYW5nZXMgZm9yIHYyOgogLSBwYXRjaCAxIG9m
IHYxIGhhcyBiZWVuIGFwcGxpZWQKIC0gbW92ZSBTb0MgYXNpYyB2ZXJzaW9uIHNlbGVjdGlvbiB0
byBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluCiAtIG1pbm9yIGZpeGVzIGluIGxhdGVz
dCBwYXRjaAoKU8OpYmFzdGllbiBTenltYW5za2kgKDMpOgogIHBhY2thZ2UvZnJlZXNjYWxlLWlt
eDogYWRkIGkuTVg5MSBhbmQgaS5NWDkzIFNvQyBzdXBwb3J0CiAgcGFja2FnZS9mcmVlc2NhbGUt
aW14L2Zpcm13YXJlLWVsZS1pbXg6IG5ldyBwYWNrYWdlCiAgY29uZmlncy9mcmVlc2NhbGVfaW14
OTNldms6IG5ldyBkZWZjb25maWcKCiAuLi4vY29tbW9uL2lteC9nZW5pbWFnZS5jZmcudGVtcGxh
dGVfaW14OSAgICAgfCA0MSArKysrKysrKysrCiAuLi4vY29tbW9uL2lteC9pbXg5LWJvb3Rsb2Fk
ZXItcHJlcGFyZS5zaCAgICAgfCAzNCArKysrKysrKwogYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9p
bXgvcG9zdC1pbWFnZS5zaCAgICAgIHwgIDQgKwogYm9hcmQvZnJlZXNjYWxlL2lteDkzZXZrL3Jl
YWRtZS50eHQgICAgICAgICAgIHwgNzcgKysrKysrKysrKysrKysrKysrKwogY29uZmlncy9mcmVl
c2NhbGVfaW14OTNldmtfZGVmY29uZmlnICAgICAgICAgIHwgMzkgKysrKysrKysrKwogcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrCiAu
Li4vZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbiAgfCAyMSArKysrKwog
Li4uL2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoICAgIHwgIDQgKwogLi4u
L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tayAgICAgIHwgMjcgKysrKysrKwog
cGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9Db25maWcuaW4gIHwgIDkgKysrCiAu
Li4vZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tayAgICAgICAgICAgICAgfCAyMyArKysrKysK
IDExIGZpbGVzIGNoYW5nZWQsIDMxNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvZ2VuaW1hZ2UuY2ZnLnRlbXBsYXRlX2lteDkKIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC9mcmVlc2NhbGUvY29tbW9uL2lteC9pbXg5LWJvb3Rsb2Fk
ZXItcHJlcGFyZS5zaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2ZyZWVzY2FsZS9pbXg5M2V2
ay9yZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9mcmVlc2NhbGVfaW14OTNl
dmtfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zp
cm13YXJlLWVsZS1pbXgvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9mcmVl
c2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdh
cmUtZWxlLWlteC5tawoKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK

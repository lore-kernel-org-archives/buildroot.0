Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442B7C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 09:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B948C6104E;
	Tue, 23 Jan 2024 09:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B948C6104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uJ7a4_B-dju; Tue, 23 Jan 2024 09:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B42607F5;
	Tue, 23 Jan 2024 09:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B42607F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97DAE1BF2C9
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67EB341A41
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67EB341A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcNKmX9267mG for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 09:03:41 +0000 (UTC)
X-Greylist: delayed 1011 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Jan 2024 09:03:41 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7288940592
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7288940592
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 09:03:41 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.25.169])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 901882AB3A
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 08:46:47 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-z67fj (unknown [10.110.178.220])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 147801FD54;
 Tue, 23 Jan 2024 08:46:47 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-z67fj with ESMTPSA
 id 8+2wAPd8r2XcAgAA1SVGbg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 23 Jan 2024 08:46:47 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 09:45:14 +0100
Message-ID: <20240115-imx93-support-v4-0-8d7f90f60980@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9004665980480187371
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekjedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepvddttddvffdvteekieejheffhfdvhefhjeeltdeluedvuddviefhjefhtdegtdelnecuffhomhgrihhnpeguvghngidruggvnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011cfc0969-35b3-482b-903a-a54ec46cbb89,
 A4CB3E8D8654BE2E72DAECBD2DECF1014D99D5AE)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v4 0/3] i.MX91 and i.MX93 support
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
dWlsZHJvb3QuCgotLS0KQ2hhbmdlcyBmb3IgdjQ6CiAtICJpLk1YIHBsYXRmb3JtIGFzaWMgdmVy
c2lvbiIgLT4gImkuTVggU2lsaWNvbiBSZXZpc2lvbiIgKEdhcnkgQmlzc29uKQogLSBtb3ZlIGku
TVggU2lsaWNvbiBSZXZpc2lvbiBjaGFuZ2VzIGludG8gZmlyc3QgcGF0Y2ggKEdhcnkgQmlzc29u
KQogLSBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfRERSX1ZFUlNJT04gZGVmYXVsdCB0byAidjIw
MjIwMSIgaW5zdGVhZCBvZgogICBqdXN0ICIyMDIyMDEiIChHYXJ5IEJpc3NvbikKIC0gQ29weSBh
bGwgRERSIGZpbGVzIHRvICQoQklOQVJJRVNfRElSKSBhcyBVLUJvb3QgY2FuIG5vdyBjcmVhdGUg
YQogICBib290YWJsZSBpbWFnZToKICAgaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1i
b290Ly0vY29tbWl0L2Y2MzdkZmU4YzQ2ODIyOWM5ZmIzMTNkMTNjNDZkNTFjZGJiODg4MjQKIC0g
cmVtb3ZlICJwbXVfdHJhaW4iIGZyb20gZ2VuZXJhdGVkIF9wYWQgYmluYXJ5IGZpbGUgbmFtZXMK
CkNoYW5nZXMgZm9yIHYzOgogLSByZW5hbWUgcGFja2FnZSBmaXJtd2FyZS1zZW50aW5lbCB0byBm
aXJtd2FyZS1lbGUtaW14CiAtIGFkZCBhIG5vdGUgYWJvdXQgdGhlIGRlYnVnIFVBUlQgaW4gdGhl
IHJlYWRtZS50eHQgZmlsZSAoSnVsaWVuIE9saXZhaW4pCiAtIGFkZCBCUjJfVEFSR0VUX1VCT09U
X05FRURTX09QRU5TU0w9eSBhbmQKICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFM9eSB0
byB0aGUgZGVmY29uZmlnIGZpbGUgKEp1bGllbiBPbGl2YWluKQogLSBidW1wIEFURiwgVS1Cb290
IGFuZCBMaW51eCB0byBsYXRlc3QgTlhQIHJlbGVhc2UgbGYtNi4xLjU1LTIuMi4wCiAgIChKdWxp
ZW4gT2xpdmFpbikKCkNoYW5nZXMgZm9yIHYyOgogLSBwYXRjaCAxIG9mIHYxIGhhcyBiZWVuIGFw
cGxpZWQKIC0gbW92ZSBTb0MgYXNpYyB2ZXJzaW9uIHNlbGVjdGlvbiB0byBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvQ29uZmlnLmluCiAtIG1pbm9yIGZpeGVzIGluIGxhdGVzdCBwYXRjaAoKLS0tClPD
qWJhc3RpZW4gU3p5bWFuc2tpICgzKToKICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14OiBhZGQg
aS5NWDkxIGFuZCBpLk1YOTMgU29DIHN1cHBvcnQKICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14
L2Zpcm13YXJlLWVsZS1pbXg6IG5ldyBwYWNrYWdlCiAgICAgIGNvbmZpZ3MvZnJlZXNjYWxlX2lt
eDkzZXZrOiBuZXcgZGVmY29uZmlnCgogLi4uL2NvbW1vbi9pbXgvZ2VuaW1hZ2UuY2ZnLnRlbXBs
YXRlX2lteDkgICAgICAgICAgfCA0MSArKysrKysrKysrKysKIC4uLi9jb21tb24vaW14L2lteDkt
Ym9vdGxvYWRlci1wcmVwYXJlLnNoICAgICAgICAgIHwgMzQgKysrKysrKysrKwogYm9hcmQvZnJl
ZXNjYWxlL2NvbW1vbi9pbXgvcG9zdC1pbWFnZS5zaCAgICAgICAgICAgfCAgNCArKwogYm9hcmQv
ZnJlZXNjYWxlL2lteDkzZXZrL3JlYWRtZS50eHQgICAgICAgICAgICAgICAgfCA3NyArKysrKysr
KysrKysrKysrKysrKysrCiBjb25maWdzL2ZyZWVzY2FsZV9pbXg5M2V2a19kZWZjb25maWcgICAg
ICAgICAgICAgICB8IDM5ICsrKysrKysrKysrCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrCiBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvZmlybXdhcmUtZWxlLWlteC9Db25maWcuaW4gICB8IDIxICsrKysrKwogLi4uL2Zpcm13
YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoICAgICAgICAgfCAgNCArKwogLi4uL2Zp
cm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tayAgICAgICAgICAgfCAyNyArKysrKysr
KwogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9Db25maWcuaW4gICAgICAgfCAg
OSArKysKIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1r
IHwgMjUgKysrKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMzE5IGluc2VydGlvbnMoKykKLS0tCmJh
c2UtY29tbWl0OiBlODc0ZmQwOGUwMWE4ZDU0MzUyMGY4NjdkOTVhZThhNmE5ZmEyNDJlCmNoYW5n
ZS1pZDogMjAyNDAxMTUtaW14OTMtc3VwcG9ydC0xNjY3MWI1YjdmMTIKCkJlc3QgcmVnYXJkcywK
LS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

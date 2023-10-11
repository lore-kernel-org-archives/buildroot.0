Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D820CD6E64
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35867611DB;
	Wed, 11 Oct 2023 12:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35867611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mvRB6jhHnxN; Wed, 11 Oct 2023 12:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75942611E2;
	Wed, 11 Oct 2023 12:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75942611E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACE61BF2E5
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 12:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 811CC416E3
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 12:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811CC416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuqXWGuBA9qf for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 12:39:44 +0000 (UTC)
X-Greylist: delayed 4816 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Oct 2023 12:39:44 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EA90415B2
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net
 [87.98.173.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EA90415B2
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 12:39:44 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.4.136])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 3C63C247AC
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 11:10:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-gj8s2 (unknown [10.110.103.246])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C1E911FEA5;
 Wed, 11 Oct 2023 11:10:10 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-gj8s2 with ESMTPSA
 id zesNLJKCJmUtsQAAOOc7LA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 11 Oct 2023 11:10:10 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 13:09:28 +0200
Message-ID: <20231011110932.4425-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9408864050682194923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheekgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepffeufffgveeiffelteelgfetjeffueffuefhffeikefhkefghfejjeeufeduteegnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0035ce4be4a-9a0d-49a2-ba0d-48ddb6f39707,
 D325CBA16CF7D2396D5DBDA76F1DA3B90F182274)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/4] i.MX91 and i.MX93 support
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWRkcyBpLk1YOTEsIGkuTVg5MyBhbmQgaS5NWDkzIDExeDExIEVWSyB0byBC
dWlsZHJvb3QuCgpTw6liYXN0aWVuIFN6eW1hbnNraSAoNCk6CiAgcGFja2FnZS9pbXgtbWtpbWFn
ZTogYnVtcCB2ZXJzaW9uIHRvIGxmLTYuMS4zNi0yLjEuMAogIHBhY2thZ2UvZnJlZXNjYWxlLWlt
eDogYWRkIGkuTVg5MSBhbmQgaS5NWDkzIFNvQyBzdXBwb3J0CiAgcGFja2FnZS9mcmVlc2NhbGUt
aW14L2Zpcm13YXJlLXNlbnRpbmVsOiBuZXcgcGFja2FnZQogIGNvbmZpZ3MvZnJlZXNjYWxlX2lt
eDkzZXZrOiBuZXcgZGVmY29uZmlnCgogLi4uL2NvbW1vbi9pbXgvZ2VuaW1hZ2UuY2ZnLnRlbXBs
YXRlX2lteDkgICAgIHwgNDEgKysrKysrKysrKysKIC4uLi9jb21tb24vaW14L2lteDktYm9vdGxv
YWRlci1wcmVwYXJlLnNoICAgICB8IDM0ICsrKysrKysrKwogYm9hcmQvZnJlZXNjYWxlL2NvbW1v
bi9pbXgvcG9zdC1pbWFnZS5zaCAgICAgIHwgIDQgKwogYm9hcmQvZnJlZXNjYWxlL2lteDkzZXZr
L3JlYWRtZS50eHQgICAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKwogY29uZmlncy9m
cmVlc2NhbGVfaW14OTNldmtfZGVmY29uZmlnICAgICAgICAgIHwgMzggKysrKysrKysrKwogcGFj
a2FnZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgIDkgKysrCiBwYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L0NvbmZpZy5pbiAgfCAgOSArKysKIC4uLi9m
aXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rICAgICAgICAgICAgICB8IDIzICsrKysrKwogLi4u
L2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtc2VudGluZWwvQ29uZmlnLmluIHwgMzQgKysrKysrKysr
CiAuLi4vZmlybXdhcmUtc2VudGluZWwvZmlybXdhcmUtc2VudGluZWwuaGFzaCAgfCAgNCArCiAu
Li4vZmlybXdhcmUtc2VudGluZWwvZmlybXdhcmUtc2VudGluZWwubWsgICAgfCAyNyArKysrKysr
CiAuLi5vdmVycmlkaW5nLUJMMzItYW5kLUJMMzMtbm90LW9ubHktQkwucGF0Y2ggfCA2MCAtLS0t
LS0tLS0tLS0tLS0KIC4uLi8wMDAyLUFkZC1MREZMQUdTLXRvLWxpbmstc3RlcC5wYXRjaCAgICAg
ICB8IDI2IC0tLS0tLS0KIC4uLnJ0LWZvci1vdmVycmlkaW5nLUJMMzEtQkwzMi1hbmQtQkwzMy5w
YXRjaCB8IDYxIC0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1h
Z2UuaGFzaCAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdl
Lm1rICAgICAgICAgICAgfCAgNyArLQogMTYgZmlsZXMgY2hhbmdlZCwgMzAxIGluc2VydGlvbnMo
KyksIDE1MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9mcmVlc2NhbGUv
Y29tbW9uL2lteC9nZW5pbWFnZS5jZmcudGVtcGxhdGVfaW14OQogY3JlYXRlIG1vZGUgMTAwNzU1
IGJvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvZnJlZXNjYWxlL2lteDkzZXZrL3JlYWRtZS50eHQKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2ZyZWVzY2FsZV9pbXg5M2V2a19kZWZjb25maWcKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtc2VudGluZWwv
Q29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13
YXJlLXNlbnRpbmVsL2Zpcm13YXJlLXNlbnRpbmVsLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtc2VudGluZWwvZmlybXdhcmUtc2VudGluZWwu
bWsKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lteC1ta2ltYWdlLzAwMDEtQWRkLXN1cHBv
cnQtZm9yLW92ZXJyaWRpbmctQkwzMi1hbmQtQkwzMy1ub3Qtb25seS1CTC5wYXRjaAogZGVsZXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW14LW1raW1hZ2UvMDAwMi1BZGQtTERGTEFHUy10by1saW5r
LXN0ZXAucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lteC1ta2ltYWdlLzAwMDQt
QWRkLXN1cHBvcnQtZm9yLW92ZXJyaWRpbmctQkwzMS1CTDMyLWFuZC1CTDMzLnBhdGNoCgotLSAK
Mi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

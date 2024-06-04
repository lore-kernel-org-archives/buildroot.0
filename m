Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D0EC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B261D6106E;
	Tue,  4 Jun 2024 13:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0g5ektERP3j; Tue,  4 Jun 2024 13:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC7E61070
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC7E61070;
	Tue,  4 Jun 2024 13:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C28C61BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0816106E
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neQ0q-rPYVOp for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:36:55 +0000 (UTC)
X-Greylist: delayed 1800 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Jun 2024 13:36:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F9E0606DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9E0606DA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.32.96.204;
 helo=9.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 9.mo583.mail-out.ovh.net (9.mo583.mail-out.ovh.net
 [178.32.96.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F9E0606DA
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:36:53 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.40])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4VtrGD0PJJz1Dj2
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 12:57:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-msz8m (unknown [10.110.168.247])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A58F41FD80;
 Tue,  4 Jun 2024 12:57:07 +0000 (UTC)
Received: from armadeus.com ([37.59.142.109])
 by ghost-submission-6684bf9d7b-msz8m with ESMTPSA
 id nqsAJSMPX2b6cCEAmvfe2g
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 04 Jun 2024 12:57:07 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jun 2024 14:57:01 +0200
Message-ID: <20240604125701.26637-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1090715537770343403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00379d1a54b-6cc3-4f14-999e-64ede07ef4e0,
 1C94CC713AF3A73937467F77B7C86ACFBFDD39AD)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump version to
 lf-6.6.3-1.0.0
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
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaCB8
IDIgKy0KIHBhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UubWsgICB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaCBiL3BhY2thZ2UvaW14LW1raW1h
Z2UvaW14LW1raW1hZ2UuaGFzaAppbmRleCAwMzRiM2QwMmVkMzMuLjMxNjFkNjZhZDJlNSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5oYXNoCisrKyBiL3BhY2th
Z2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxs
eSBjYWxjdWxhdGVkCi1zaGEyNTYgIGZkNTM4ZGM1NzFjZTA2NjA5ZDZhNGQ5ZWU4Y2ZkN2QwYzkz
ZWM0Njg1YWZhOWYxMDc5ZTVhNTkzMWFkM2JkYmMgIGlteC1ta2ltYWdlLWxmLTYuMS4zNl8yLjEu
MC50YXIuZ3oKK3NoYTI1NiAgNDhlN2JhZDRhNDllNjkzNDE1NDE4ODU5YmIwMzMwYjYzOTM4YTc3
YmJiMTI2NjBiYzY0NzYxYTVkYWE5MTVjOSAgaW14LW1raW1hZ2UtbGYtNi42LjNfMS4wLjAudGFy
Lmd6CiBzaGEyNTYgIDIzMWY3ZWRjYzczNTJkNzczNGE5NmVlZjBiODAzMGY3Nzk4MjY3OGM1MTY4
NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW14LW1r
aW1hZ2UvaW14LW1raW1hZ2UubWsgYi9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1r
CmluZGV4IDZlNzBhOTQ2YmY2NC4uYTgyODU0ZWI2ZTJmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2lt
eC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rCisrKyBiL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1r
aW1hZ2UubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1J
TVhfTUtJTUFHRV9WRVJTSU9OID0gbGYtNi4xLjM2XzIuMS4wCitJTVhfTUtJTUFHRV9WRVJTSU9O
ID0gbGYtNi42LjNfMS4wLjAKIElNWF9NS0lNQUdFX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG54cC1p
bXgsaW14LW1raW1hZ2UsJChJTVhfTUtJTUFHRV9WRVJTSU9OKSkKIElNWF9NS0lNQUdFX0xJQ0VO
U0UgPSBHUEwtMi4wKwogSU1YX01LSU1BR0VfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIu
NDQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

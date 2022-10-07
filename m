Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA2C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 09:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 080E260C34;
	Fri,  7 Oct 2022 09:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080E260C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcm_TsQe5cyc; Fri,  7 Oct 2022 09:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F38660AD7;
	Fri,  7 Oct 2022 09:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F38660AD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 069161BF391
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 09:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5F8A83E16
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 09:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F8A83E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiWQMmPO1dQI for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 09:35:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B768338B
Received: from 17.mo550.mail-out.ovh.net (17.mo550.mail-out.ovh.net
 [87.98.179.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17B768338B
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 09:35:44 +0000 (UTC)
Received: from player739.ha.ovh.net (unknown [10.108.4.60])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 7714A21D7A
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 09:25:54 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id 9FC352B653C3D;
 Fri,  7 Oct 2022 09:25:51 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 11:23:00 +0200
Message-Id: <20221007092300.1003-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17339140043528661995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeijedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeujefhkeetleeuleffhfelveejueeutdeiteeltedvvdehvdejieevffeghfettdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdelvddrudegtddrvdduuddrudekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeefledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedt
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069becc4f8-4615-4b4b-9253-de338a33c5e0,
 E6B47EF5AD39DED0BB771E11788A8042248574CF)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaCB8IDIgKy0K
IHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnQt
dGVzdHMvcnQtdGVzdHMuaGFzaCBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaAppbmRl
eCAzYWRkYTYwZjQyLi40OWRmODMxM2Y5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3J0LXRlc3RzL3J0
LXRlc3RzLmhhc2gKKysrIGIvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5oYXNoCkBAIC0xLDQg
KzEsNCBAQAogIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4
L3V0aWxzL3J0LXRlc3RzL3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIGI1ZTc5NTliY2I1YzcwM2Iy
NzQzMDMwNzUxYWY5NzVlYTRlMDQ5NjJlMjlmYzExMThmNGI2MDU5ODc1ODU3MzUgIHJ0LXRlc3Rz
LTIuMy50YXIueHoKK3NoYTI1NiAgMzkzNDU3ZjBjOTFjY2U1N2U4MmI4NzZlY2I5YjY3Mjg3MWY4
OThlNmNlY2FmYzc1MTU0ODA3OTUxMmJjYzgwOCAgcnQtdGVzdHMtMi40LnRhci54egogIyBsb2Nh
bGx5IGNvbXB1dGVkIGhhc2gKIHNoYTI1NiAgYWIxNWZkNTI2YmQ4ZGQxOGE5ZTc3ZWJjMTM5NjU2
YmY0ZDMzZTk3ZmM3MjM4Y2QxMWJmNjBlMmI5Yjg2NjZjNiAgQ09QWUlORwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tayBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMu
bWsKaW5kZXggMDU2YTRhNjcyMy4uNzQyOTAyMTFjZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9ydC10
ZXN0cy9ydC10ZXN0cy5taworKysgYi9wYWNrYWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1rCkBAIC02
LDcgKzYsNyBAQAogCiBSVF9URVNUU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgv
dXRpbHMvcnQtdGVzdHMKIFJUX1RFU1RTX1NPVVJDRSA9IHJ0LXRlc3RzLSQoUlRfVEVTVFNfVkVS
U0lPTikudGFyLnh6Ci1SVF9URVNUU19WRVJTSU9OID0gMi4zCitSVF9URVNUU19WRVJTSU9OID0g
Mi40CiBSVF9URVNUU19MSUNFTlNFID0gR1BMLTIuMCsKIFJUX1RFU1RTX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCiAKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK

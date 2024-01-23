Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3572EC47DDC
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 09:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C644260A7E;
	Tue, 23 Jan 2024 09:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C644260A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLlnGpYVDjVE; Tue, 23 Jan 2024 09:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC6460769;
	Tue, 23 Jan 2024 09:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC6460769
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28E941BF2B8
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0254560739
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0254560739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S--tR54T8KAI for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 09:23:37 +0000 (UTC)
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net
 [46.105.79.203])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D16DF60701
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 09:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16DF60701
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.10])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 916092DD90
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 09:23:33 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-f7d8r (unknown [10.110.96.50])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D1D331FEF5;
 Tue, 23 Jan 2024 09:23:29 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-f7d8r with ESMTPSA
 id 0HVjMJGFr2U3GQIAweU6DA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 23 Jan 2024 09:23:29 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 10:22:26 +0100
Message-ID: <20240123092226.476-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9624755356157078507
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhhtpdgukhhimhepphgrshhs
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ed3e5da8-7ef6-4d9b-b4a3-685cdd0d2a45,
 A4CB3E8D8654BE2E72DAECBD2DECF1014D99D5AE)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] docs/manual/contribute.txt: fix typo
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IndobyBzcG9uc29yZWQgd2hvIHNwb25zb3JlZCIgLT4gIndobyBzcG9uc29yZWQiCgpTaWduZWQt
b2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+Ci0tLQogZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9t
YW51YWwvY29udHJpYnV0ZS5hZG9jIGIvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jCmluZGV4
IDE1ZmUzNmFlZjAzZS4uMmI5MGQxM2I0MWFkIDEwMDY0NAotLS0gYS9kb2NzL21hbnVhbC9jb250
cmlidXRlLmFkb2MKKysrIGIvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jCkBAIC0yNTksNyAr
MjU5LDcgQEAgc2VwYXJhdGVkIGZyb20gaXQgYnkgYSBwbHVzIGArYCBzaWduLiBFLmcuOgogKwog
YFlvdXItTmFtZSBZb3VyLVN1cm5hbWUgPHlvdXItbmFtZS55b3VyLXN1cm5hbWUrY29tcGFueW5h
bWVAbWFpbC5jb20+YAogCi0qIGZvciBhbiBpbmRpdmlkdWFsIHdobyBzcG9uc29yZWQgd2hvIHNw
b25zb3JlZCB0aGUgc3VibWl0dGVkIHdvcmssIHVzZQorKiBmb3IgYW4gaW5kaXZpZHVhbCB3aG8g
c3BvbnNvcmVkIHRoZSBzdWJtaXR0ZWQgd29yaywgdXNlCiAgIHRoZWlyIG5hbWUgYW5kIHN1cm5h
bWU6CiArCiBgWW91ci1OYW1lIFlvdXItU3VybmFtZSA8eW91ci1uYW1lLnlvdXItc3VybmFtZSt0
aGVpci1uYW1lLnRoZWlyLXN1cm5hbWVAbWFpbC5jb20+YAotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

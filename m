Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46198C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 10:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B8880CD0;
	Tue, 13 Feb 2024 10:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEdxcVyub1BY; Tue, 13 Feb 2024 10:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F31C80C48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F31C80C48;
	Tue, 13 Feb 2024 10:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC001BF47E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 10:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94766400B8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 10:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCkPoG9LjAob for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 10:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.43.205;
 helo=6.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF02540585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF02540585
Received: from 6.mo550.mail-out.ovh.net (6.mo550.mail-out.ovh.net
 [46.105.43.205])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF02540585
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 10:11:00 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.17.234])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TYxt95FDnz1FPM
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 10:10:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xl44w (unknown [10.110.168.221])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 58D9D1FED9;
 Tue, 13 Feb 2024 10:10:57 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-xl44w with ESMTPSA
 id IqkbEjFAy2VAlg8AHV6mZA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 13 Feb 2024 10:10:57 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 11:09:48 +0100
Message-ID: <20240213100948.5264-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4625478293354572779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepffeufffgveeiffelteelgfetjeffueffuefhffeikefhkefghfejjeeufeduteegnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00670aecbd1-ea91-4ebc-af4f-b5cfc6095188,
 8CA07152DC61E3307569CE588BF5DAD580CF0A4B)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-ele-imx: fix
 dependency comment condition
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGRlcGVuZGVuY3kgY29tbWVudCBtdXN0IGJlIHNob3duIHdoZW4gdGhlIHBsYXRmb3JtIGhh
cyBubyBFTEUgYW5kCm5vdCB3aGVuIHRoZSBwbGF0Zm9ybSBoYXMgbm8gVlBVLgoKRml4ZXM6IDY5
ZDEyN2ZlMjlkYyAoInBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14OiBuZXcg
cGFja2FnZSIpClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdh
cmUtZWxlLWlteC9Db25maWcuaW4gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmly
bXdhcmUtZWxlLWlteC9Db25maWcuaW4gYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUt
ZWxlLWlteC9Db25maWcuaW4KaW5kZXggMjQxYWQzOTQyZDY1Li5hOTljYmMzMzkyYzIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9Db25maWcuaW4KQEAg
LTEsNSArMSw1IEBACiBjb21tZW50ICJmaXJtd2FyZS1lbGUtaW14IG5lZWRzIGFuIGkuTVggcGxh
dGZvcm0gd2l0aCBFZGdlTG9jayBTZWN1cmUgRW5jbGF2ZSIKLQlkZXBlbmRzIG9uICFCUjJfUEFD
S0FHRV9GUkVFU0NBTEVfSU1YX0hBU19WUFUKKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9GUkVF
U0NBTEVfSU1YX0hBU19FTEUKIAogY29uZmlnIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0VMRV9JTVgK
IAlib29sICJmaXJtd2FyZS1lbGUtaW14IgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=

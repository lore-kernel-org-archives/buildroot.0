Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D06C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B97B4079B;
	Wed,  5 Feb 2025 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBx_6mIfBy7u; Wed,  5 Feb 2025 11:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B4AB407A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4AB407A7;
	Wed,  5 Feb 2025 11:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 579D512F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C6244079B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3na_PckVJRLI for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:58:33 +0000 (UTC)
X-Greylist: delayed 599 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 11:58:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B00C7407A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00C7407A7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.43.173;
 helo=6.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net
 [188.165.43.173])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B00C7407A7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:32 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.127])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywq5z96z1Nvj
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:40:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 200E21FEA4;
 Wed,  5 Feb 2025 11:40:58 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:40:58 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:50 +0100
Message-Id: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEJOo2cC/x3MQQqAIBBA0avErBsw0aKuEi0mm2qISpQikO6et
 HyL/xNEDsIRuiJB4FuinEdGVRbgVjoWRpmyQSttlVYGZX/Qk9to4YjjtXukip0l0za1NZA7H3i
 W53/2w/t+pENqbWMAAAA=
X-Change-ID: 20250204-imx-packages-bump-a1ec5a497654
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5641602961454132192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepjeevkefgfeffteduudeuvdehueffieehkefgveefhfeuheejgeehleeghefggeegnecuffhomhgrihhnpehngihprdgtohhmnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=loZz6w9O2DiSxqkgIo+t4pNNrVwHWbdtV9xbZV9AtHw=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755660; v=1;
 b=G56UxF+kPZKMpvHwNnoJhOcQHbdzz5SkDc2cQ4EN6BB9fZQ7j4GcCsP2xvj0g/y7OvDVhANa
 VuT/bY3ApJOmWWqBgA0l/DdAEt3Grf+O8na87btbv3fFrdejBlxJf3g+yVe9iS87NNTCekSZwKu
 8VLA9T24pK9m2zDLv3vBHB6lRT2RMkxCVFrHElLeIS8+qJqJBDJKA/W8nH2QbbLxLmT58blxd7j
 wqNuk6f8K4q0dNQKAEak3OZp7L+8yn70UGnlD/mE0szgTbPFb+YT3arOQBujLHKE0m/d2D/x5NY
 Iakf+ggWC9T82UwfeVrXCt+sfIKrGEYeIjqm8DSjJ38YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=G56UxF+k
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007b88ff861-3ee1-4261-a987-76745d3a8040,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 00/11] package/freescale-imx: bump to NXP
 release LF6.6.52_2.2.0
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
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYnVtcHMgc29tZSBmcmVlc2NhbGUtaW14IHBhY2thZ2VzIHRvIHRoZSBsYXRl
c3QgTlhQIHJlbGVhc2UKTEY2LjYuNTJfMi4yLjA6CgpodHRwczovL3d3dy5ueHAuY29tL2RvY3Mv
ZW4vcmVsZWFzZS1ub3RlL1JOMDAyMTAucGRmCgpQYXRjaCAwMDAxIGZpeCB0aGUgaW14LWdwdS1n
MmQgcGFja2FnZSBmb3IgdGhlIGkuTVg4TU0gcGxhdGZvcm0uCgpTaWduZWQtb2ZmLWJ5OiBTw6li
YXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQpT
w6liYXN0aWVuIFN6eW1hbnNraSAoMTEpOgogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14
LWdwdS1nMmQ6IGluc3RhbGwgdGhlIHNwZWNpZmljIGxpYnJhcnkgZm9yIGkuTVg4TU0KICAgICAg
cGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXg6IGJ1bXAgdG8gdmVyc2lvbiAx
LjMuMAogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjOiBidW1wIHRvIHZlcnNp
b24gNC45LjAKICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteDogYnVtcCB2
ZXJzaW9uIHRvIDguMjYKICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJv
OiBidW1wIHZlcnNpb24gdG8gMS4zNS4wCiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
dnB1LWhhbnRyby12YzogYnVtcCB2ZXJzaW9uIHRvIDEuMTAuMQogICAgICBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uOiBidW1wIHZlcnNpb24gdG8gMS40LjAKICAg
ICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zZWNvOiBidW1wIHZlcnNpb24gdG8gNS45LjQu
MQogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlOiBidW1wIHZlcnNp
b24gdG8gMS4xNy4wCiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZDogYnVt
cCB2ZXJzaW9uIHRvIDYuNC4xMS5wMi4xMAogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14
LWdwdS12aXY6IGJ1bXAgdmVyc2lvbiB0byA2LjQuMTEucDIuMTAKCiAuLi4vZnJlZXNjYWxlLWlt
eC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaCAgfCAgNyArKysrLS0tCiAu
Li4vZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgubWsgICAg
fCAgNyArKysrLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJl
LWlteC5oYXNoICAgICAgfCAgNiArKystLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2Fy
ZS1pbXgvZmlybXdhcmUtaW14Lm1rICAgICAgICB8ICA0ICsrLS0KIHBhY2thZ2UvZnJlZXNjYWxl
LWlteC9pbXgtY29kZWMvaW14LWNvZGVjLmhhc2ggICAgICAgICAgICB8ICA3ICsrKystLS0KIHBh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14LWNvZGVjLm1rICAgICAgICAgICAgICB8
ICA0ICsrLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5o
YXNoICAgICAgICB8ICA5ICsrKysrLS0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUt
ZzJkL2lteC1ncHUtZzJkLm1rICAgICAgICAgIHwgMTUgKysrKysrKysrLS0tLS0tCiBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvaW14LWdwdS12aXYuaGFzaCAgICAgICAgfCAgOSAr
KysrKy0tLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5t
ayAgICAgICAgICB8ICA5ICsrKysrLS0tLQogLi4uL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13
YXJlL2lteC1zYy1maXJtd2FyZS5oYXNoICAgIHwgIDcgKysrKy0tLQogcGFja2FnZS9mcmVlc2Nh
bGUtaW14L2lteC1zYy1maXJtd2FyZS9pbXgtc2MtZmlybXdhcmUubWsgIHwgIDcgKysrKy0tLQog
cGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zZWNvL2lteC1zZWNvLmhhc2ggICAgICAgICAgICAg
IHwgIDggKysrKystLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5t
ayAgICAgICAgICAgICAgICB8ICA3ICsrKystLS0KIC4uLi9pbXgtdnB1LWhhbnRyby1kYWVtb24v
aW14LXZwdS1oYW50cm8tZGFlbW9uLmhhc2ggICAgICB8ICAzICsrLQogLi4uL2lteC12cHUtaGFu
dHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24ubWsgICAgICAgIHwgIDYgKysrKy0tCiAu
Li4vaW14LXZwdS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaCAgICAgICAgICAgICAg
fCAgNyArKysrLS0tCiAuLi4vZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1
LWhhbnRyby12Yy5tayAgfCAgNyArKysrLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8vaW14LXZwdS1oYW50cm8uaGFzaCAgfCAgNyArKysrLS0tCiBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8ubWsgICAgfCAgNyArKysrLS0t
CiAyMCBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiBjMzlmNjc3ZTZhNzE0MjM5NGJiMjcxMzE4MWJjYTY5Yjc2OGU5ZjllCmNo
YW5nZS1pZDogMjAyNTAyMDQtaW14LXBhY2thZ2VzLWJ1bXAtYTFlYzVhNDk3NjU0CgpCZXN0IHJl
Z2FyZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

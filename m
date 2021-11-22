Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0BDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 15:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FAB4400CC;
	Mon, 22 Nov 2021 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ip5QRFmutzsk; Mon, 22 Nov 2021 15:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 992EA400D2;
	Mon, 22 Nov 2021 15:19:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDDAE1BF2C3
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 15:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA5F340239
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 15:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayIYoYLIfMor for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 15:19:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CFA840057
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 15:19:34 +0000 (UTC)
Received: from player159.ha.ovh.net (unknown [10.110.208.168])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 0852E20B2B
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 15:19:31 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 2A61524899163;
 Mon, 22 Nov 2021 15:19:30 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003f1259c39-77e0-4b22-ad91-7e5788d61684,
 BC8332B12BEA9754997DEE75483A33FA83ACCE21)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 16:18:13 +0100
Message-Id: <20211122151813.12079-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13043268946057751531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephffggefffeeigefhvdelgfdtieehjedvleevgfevtdegfeffgfejuedtudehtdefnecukfhppedtrddtrddtrddtpdelvddrudefuddruddugedrvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 1/1] linux: fix typo in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in the help text
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IlBhdGggdG8gdG8gb3V0LW9mLXRyZWUuLi4iIC0+ICJQYXRoIHRvIHRoZSBvdXQtb2YtdHJlZS4u
LiIKClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFu
c2tpQGFybWFkZXVzLmNvbT4KLS0tCiBsaW51eC9Db25maWcuaW4gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saW51eC9D
b25maWcuaW4gYi9saW51eC9Db25maWcuaW4KaW5kZXggZDM1ZGFjYzc1Ni4uMGY2NzdkMWU0ZSAx
MDA2NDQKLS0tIGEvbGludXgvQ29uZmlnLmluCisrKyBiL2xpbnV4L0NvbmZpZy5pbgpAQCAtNDEx
LDcgKzQxMSw3IEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRQogY29u
ZmlnIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRICiAJc3RyaW5nICJPdXQtb2YtdHJl
ZSBEZXZpY2UgVHJlZSBTb3VyY2UgZmlsZSBwYXRocyIKIAloZWxwCi0JICBQYXRoIHRvIHRvIG91
dC1vZi10cmVlIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlcy4KKwkgIFBhdGggdG8gdGhlIG91dC1v
Zi10cmVlIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlcy4KIAkgIFlvdSBjYW4gcHJvdmlkZSBhIGxp
c3Qgb2YgZHRzIHBhdGhzIHRvIGNvcHkgYW5kCiAJICBidWlsZCwgc2VwYXJhdGVkIGJ5IHNwYWNl
cy4KIAotLSAKMi4zMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

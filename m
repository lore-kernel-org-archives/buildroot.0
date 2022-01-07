Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B8EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 16:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D37B82A53;
	Fri,  7 Jan 2022 16:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxW4SM9Z77ph; Fri,  7 Jan 2022 16:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B86C81A3B;
	Fri,  7 Jan 2022 16:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 231191BF5F6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1214049E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 16:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9sXJTUq5Xdx for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 16:33:05 +0000 (UTC)
X-Greylist: delayed 02:25:38 by SQLgrey-1.8.0
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net
 [178.32.96.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFD2E40002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 16:33:04 +0000 (UTC)
Received: from player774.ha.ovh.net (unknown [10.109.138.205])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 9B9A424BC2
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 14:07:23 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id DFA5826295A1B;
 Fri,  7 Jan 2022 14:07:19 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001301fa72a-6593-4061-9d71-075aa4e89468,
 8E692038E36AABC90AC6DF0540460028F21FDC7A)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:05:45 +0100
Message-Id: <20220107140546.1921-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5267522715219520491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegvddgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephffggefffeeigefhvdelgfdtieehjedvleevgfevtdegfeffgfejuedtudehtdefnecukfhppedtrddtrddtrddtpdelvddrudefuddruddugedrvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 1/2]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: use "config"
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Z3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uIGRvZXNuJ3QgaGF2ZSBzdWItb3B0aW9ucyBzbyB1
c2UgImNvbmZpZyIKaW5zdGVhZCBvZiAibWVudWNvbmZpZyIuCgpTaWduZWQtb2ZmLWJ5OiBTw6li
YXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQog
cGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9u
L0NvbmZpZy5pbiBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5l
b24vQ29uZmlnLmluCmluZGV4IDU3MDMwMGEzMDQuLmQzZTRkMGUyNDMgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vQ29uZmlnLmluCisr
KyBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vQ29uZmln
LmluCkBAIC0xLDQgKzEsNCBAQAotbWVudWNvbmZpZyBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFZRVIyUkdCX05FT04KK2NvbmZpZyBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFZRVIyUkdC
X05FT04KIAlib29sICJnc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24iCiAJZGVwZW5kcyBvbiAo
QlIyX2FybSAmJiBCUjJfQVJNX0NQVV9IQVNfTkVPTikgfHwgQlIyX2FhcmNoNjQgIyBiYXllcjJy
Z2ItbmVvbgogCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGJheWVyMnJnYi1uZW9uCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

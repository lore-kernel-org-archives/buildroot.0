Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 15:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B6F82E95;
	Fri,  7 Jan 2022 15:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bhr0zbKJ4jp1; Fri,  7 Jan 2022 15:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D116B82D57;
	Fri,  7 Jan 2022 15:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B22F11BF83B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD95482D57
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 15:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMGxXLjPIylf for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 15:23:07 +0000 (UTC)
X-Greylist: delayed 01:10:00 by SQLgrey-1.8.0
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3141B82D17
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 15:23:07 +0000 (UTC)
Received: from player774.ha.ovh.net (unknown [10.110.115.233])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 7C3E624A5D
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 14:07:28 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 096B226295A80;
 Fri,  7 Jan 2022 14:07:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e6037635-4a29-4f4c-bd69-be4c74a7f096,
 8E692038E36AABC90AC6DF0540460028F21FDC7A)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:05:46 +0100
Message-Id: <20220107140546.1921-2-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107140546.1921-1-sebastien.szymanski@armadeus.com>
References: <20220107140546.1921-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5269211567257742315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegvddgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepleekgfetgefgheekffdtheekleffvdegieejueffkeetieeikeelffdtteefgfeinecuffhomhgrihhnpehsihhgmhgrqdgthhgvmhhnihhtiidruggvnecukfhppedtrddtrddtrddtpdelvddrudefuddruddugedrvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 2/2]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: show comment on aarch64
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

T24gYWFyY2g2NCwgdGhlIENvbmZpZy5pbiBjb21tZW50IGZvciBnc3QxLXBsdWdpbnMtYmF5ZXIy
cmdiLW5lb24gaXMgbm90CnNob3duIHdoZW4gYSBkZXBlbmRlbmN5IGlzIG1pc3NpbmcuIEZpeCB0
aGF0LgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenlt
YW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMt
YmF5ZXIycmdiLW5lb24vQ29uZmlnLmluIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dz
dDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4gYi9wYWNrYWdlL2dzdHJlYW1lcjEv
Z3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgppbmRleCBkM2U0ZDBlMjQzLi42
OGQ3YTJiYzU2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJh
eWVyMnJnYi1uZW9uL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVn
aW5zLWJheWVyMnJnYi1uZW9uL0NvbmZpZy5pbgpAQCAtMTUsNiArMTUsNiBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBWUVSMlJHQl9ORU9OCiAJICBodHRwczovL2dpdGxhYi1l
eHQuc2lnbWEtY2hlbW5pdHouZGUvZW5zYy9nc3QtYmF5ZXIycmdiLW5lb24KIAogY29tbWVudCAi
Z3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgZHlu
YW1pYyBsaWJyYXJ5LCBnY2MgPj0gNC45IgotCWRlcGVuZHMgb24gQlIyX2FybSAmJiBCUjJfQVJN
X0NQVV9IQVNfTkVPTgorCWRlcGVuZHMgb24gKEJSMl9hcm0gJiYgQlIyX0FSTV9DUFVfSEFTX05F
T04pIHx8IEJSMl9hYXJjaDY0CiAJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9J
TlNUQUxMX0xJQlNURENQUCB8fCBcCiAJCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkK
LS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

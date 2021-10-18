Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAFEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92AB60EB2
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B92AB60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52206402A2;
	Mon, 18 Oct 2021 18:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huFyazPlYwaG; Mon, 18 Oct 2021 18:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A9740459;
	Mon, 18 Oct 2021 18:12:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA5C91BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2719608EE
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SeuFGBmw6Ua for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 18:12:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1985C608BE
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634580716;
 bh=BdK/rsHj2b2Zhj6ov0pkYOFnuxa3D45W70TN3Loe3gs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Z3XRP3FuUenbkY1zBAxsnUY1zG9aPORVhk8XgpZYdJXVULtjo3KeXmHozUPErgzJr
 QN59dp3GLRZw8F/cdGOvkNntPOESxrh/ZtiPFmR384FJ2zXXC6t/88nn4oAyVKV60V
 Uzn0IwWaXmBN8MzRploXUFOEWsgsRHtVatRi3jf4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1mcX7604f2-000650; Mon, 18
 Oct 2021 20:11:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 20:11:55 +0200
Message-Id: <20211018181155.16110-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6RwqDxvbmKaPT1j+hcC2ILOn0RBEopAQs+EBIFj97QkUTmSkGiK
 QJ8mc64rX+WvXwqE0B8uJSCcL3sm1HL7Y7JlOcwN/d0vXWS2vEh6K/mJzQAXxmWOJRvAelJ
 FICKCUqDiKEXZ460mDfxSlYuAB7Afp2eP4N2oPKq46eapA4MvBBo1yklkqptchFj7qYEUAs
 S6Ul9zfKe3SapG5w5l5fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bFe85eAwX1Y=:dN7bZ1ZyAaYWs0kggI8Uie
 48H+w6ENey8/ua3N38tpxgBkilW14sxmTbaaqSqcf7eOxYMbgwHXQPj13VWqbA6srYXjk38fX
 0WY9+v1VcgpbFd0bt3tu4CqfaPV9ZIvJM9hD1Taz/IW5sDeltFQVDJTdWtK2EPUxvT/cdjWxc
 O8xpUpNfvpLX/zvc2y4vl88Eh2AszMsAFzRl+kmkEsxGHD0/mSNH5v1NT4hdyFYDdRrvPBbL7
 oaPDtb3on/Kd8zT0mYkJU2fs+IHrEIe38BqEfyvNJVa47mSVNzyMby+VFARs4KgAgugcGIZHr
 HkJq8Ut1Q12mNGVifRJdM1+WoWFY4ZEsmDV9bnAYl3bM1YYL9yzCFTjxMs8uHVDKz3EPJ1GXn
 PY7NgVOvTBdHTYb/ElPziuOJP7opbmT7hEsqlZeKgg5C+Z/+RFBv4BKaey0mbykYXlBUA0+cF
 rTcKx7pT7kzupr0U8pJw7JlVrp6Ii3ReapR4VNPJWSaZsLuFs6qkil43eeGn/lKPuiEqQC6oG
 CInV/Jsd4O+Ybr5DjDVcqtFAOjOsEIs+yxwmeoKW3ehdCv0KwBgiWsxxdJaHwrqBtrTIcllR3
 2FHgUDc8xfEv+QP8YavZ9rYzH9hgyvJCLbcwNadgkCIk7Rn2ueSskodZVrQ+1RxrNzlWRzikn
 p2g7HI136XRmMv7zGew76jkG8S3iWEWHu/jnRt4yOySD2VYl26G8oL31KVC4tKwn3IW/Zbty8
 o8DXI/bDmL6o4zrcimc9AqtgzHfOez+KX9qFnBuFR9096Ba2xT1JOxyV0RAo+k8+8R2xQlEX0
 rWi6JWMIoUAdtRevekYMJfwDPtkwc5bql974UHAADZs1gyKPQYdCNsw3mItRZWQ8WYna9Pi9x
 q9x6G3hwfHz04U0HdCeRw5f7D2tTc3e6yWbcD8w1Za+ksXFUbFJQzofi3+LnDHVhbnrgikp4C
 4vZ5Rraa8x6WfPTEdJ9pTdAD1OmnY6qpjApJy46eol1GKil/A+oV61NfoVg+4757p52ob3jrt
 j6NoPNDreni2bE748Y6N6SWGsCaIRr5lnqfUsbOFOyUgt7o0lz/34/xt1GPhTKsCQdGYveFjj
 xhICngkn4qUMic=
Subject: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.70
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 1.68):

  - 1.69, 2021-03-30 Added link to Ada bindings by Tama McGlinn.
    Fixed problem with undefined off_t on some compilers.
  - 1.70, Patch to ensure compilation with gcc -std=c99, as reported by
    John Blaiklock. Fix some inconsistencies in version numbers.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index e366f19038..c9f7acfd01 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b7eda59fd7bc3cb97fdac14e8455e86ddad75006d69270358ac8d00108e369a9  bcm2835-1.68.tar.gz
+sha256  c062a8a1cf1dc1ba1ca3978451d2f668b66f7ce5548200a0f4a8bb2117b1b2c9  bcm2835-1.70.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 1ddd035818..e9d7256f19 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.68
+BCM2835_VERSION = 1.70
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

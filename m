Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DD6C74A5B
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3EFA822A8;
	Thu, 23 Mar 2023 21:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3EFA822A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aVv_nMI3bMM; Thu, 23 Mar 2023 21:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA4E82299;
	Thu, 23 Mar 2023 21:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA4E82299
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743461BF399
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E80882299
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 21:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E80882299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2TbOP76og1B for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 21:49:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4322A82276
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4322A82276
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 21:49:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.230]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mk0Ne-1qL9Lp2aoC-00kSvQ; Thu, 23 Mar 2023 22:49:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 22:49:01 +0100
Message-Id: <20230323214901.3489-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:hEyqJg0SKRziNLNkp2RoAGVszKBUHVXvhk99ACTPyaW18a9D0QJ
 lJ+TBnWOvfrwXEmTrWs3lQEh07pW6dzgtaXT1vL0oy2/onOuIkQq5pD6SjIm1Q/IzPraYpu
 tP+2bdMmYisdUdlGE2EwvuYHFwLV9MxdhioWl5JpBb+hUUrugfdsq6hqhCubSoC3Y+rCt6U
 vJoSyrVs9dzIp/Wsf1Asw==
UI-OutboundReport: notjunk:1;M01:P0:Q9SkDr+vLuY=;mdIwBqPhE7J0O45Jf6sNNe9z5Ju
 fvIcHCFnlxPORNOpVfEUAj+6G76sO0Gf6NdMYRTV6M03BLZye5QcZdPyima9pdDkb5WMgIY53
 iN2k1NkBEEKl8pCisTeOsJCiKsFyE1f2PQw6nphbu67LS0wTraOuc2+cKeGQMHgK4DV6y6Is5
 xR8om4V4eV3OAs8DYZeZu30i1DshyrcTG3WHug2OWDbDzz2EKFv7wJuKYG/g143jFXBM3SxXE
 VAymSTiLs7ZKvJJ3elo8nDB1lnBFx6cyBEYcxKGyebrsRSNgOsYDwMFIYCTp1+TW+42WF+jzS
 g8OZoX0sDLgcLOOPKCCH8MPYYT/2AwTparblKUC1ForBfeC40cSQqDbGVE+2OIIrop+IcWOjs
 8CWEylYz7xSFhP5vWbABNoljvq8Dxp+0uO+mA7DE6pqwhtSvqgps13YRPlnGkDwOYI2KCWL54
 JbGwbkQbMSd8AgCiFW908sVubEQslvtTT1fviCfDS6LXBf0mVZXs8S6VSYVmbwJS6bkHIP4CE
 IO07Wz2s1O5fWNK5ig6+/f57fZUWAeICI/IcDht0EWtKzqzS0KdWEyREMWA+NecADL1QGl3Hd
 yPjjdLhNUvF5hgbeMKEpuZ0F1N5iuxRXdjM9+BgRaYuO5qNaqbQ9lEyIHQezU/hFsvQTUx69p
 uq8cAJ4AK5UyWvFuzNCDbm2Hn8h5hMYsw46VcPPuFIPBGY+5JteqL68wnkrFsY9lQKgWRk8P2
 oobQyNOmvimBwIJKJbsWMDWhgZkyYmGMXODaBCPpq0eYLyFC3Tf+173N1bsQYCPCNhVwsvgv+
 5/+3XUQMcgK6yi1aG+o/rXwqrfd2RwDmRksMPZPCUS+6OZkC9/zTWBM9lQzfOLW8F90pV7zx4
 GK8IGMnz9rQBGD4n+esJG/W6BwNXDmheOZ3DjXA3n5N7ExdHcH9PD7vsfwRr2bVowSJfQMn67
 12qFtf9OyX4zlR4WHS1/zEzUeZM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679608141; i=ps.report@gmx.net;
 bh=K8NGk1j95ImJqtdXJ9CJS4hB5ZUH1p/ZBlhPjYlxH50=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MzgQI/ASspxC/NHr9gS1LUz2Wx4LmJ1kF60+6EUDFRfdfLic8Gm82sUqX1cccFtI2
 OGPD+8x/13M67CgDUOr2dgE1GnG48gIVztBaoezu+xV4CKA/wDrmrokcouInBOgYma
 roiQGMWIVBJCZcjbCUpqrr9AZrgvk0HW5xDyw1pnJdcuiPZHH/kPlIg6bKklfKIZQL
 GNoIlULDJLYVGSXA0R3WVE4jCtQ0rxMa+7d5mm/MolRaAR+hBTZUCWA1t0BGghVQza
 PnHLFKCQoLIQf+Kzv0+PiGy/1M7SrAaJgUWxeNv7fpf5M26ReVmpN6XfnB2uwBJ43k
 eR/K3eb8UYAmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MzgQI/AS
Subject: [Buildroot] [PATCH v1] package/grep: bump version to 3.10
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00007.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index c83e4653c3..142d15644d 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  abcd11409ee23d4caf35feb422e53bbac867014cfeed313bb5f488aca170b599  grep-3.9.tar.xz
+sha256  24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b  grep-3.10.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 309987010f..2f3b405f93 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.9
+GREP_VERSION = 3.10
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

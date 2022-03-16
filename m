Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6773C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0494813FB;
	Wed, 16 Mar 2022 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2H0xe6inj3fS; Wed, 16 Mar 2022 21:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF9F81323;
	Wed, 16 Mar 2022 21:38:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC571BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE31E40179
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GlOnYmFwTXK for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73D93401DF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=8n2z4yAncDXka2k3leRnMgmQA9LCwv2Sgw6jTwCfByU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Djq/WQBVrf/WkBFfLEDTjI76y6ocIQV8DJ3nnLKcaD4VlaTLvpxTse+OTU/pK8RHS
 J8w4nLjxnQETP9Twb8UyuORt1bqgDewVsc5tExWpYyBV0vkiVRRZ689CTldUEX2ML9
 TZ4AIGysh8vbceKoo6xEXpjq7uiv0op6JURdlTm4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Fs-1nrJLy23yo-00oDXo for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:10 +0100
Message-Id: <20220316213614.16878-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1ajzJJ5kYYqbNf40lrznk55Sj/QYlsXSM5PO4uZ1nHyzxvKBL3I
 bPdXuPceAU/3mPmUv7abMu1BdIMjWXRKx632JeBEo1zUZwPd6nSMH1Hc4kl3oW1CUpEEGdE
 gVdVa8YnHMfd8/g0BalIm2wciQejcf0113kWDBTj3g2RNQca+lXynjw6PEvhOfh9e0G1y3b
 XVy6EzsHz6QkSDzWfs8EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wA6K4kC8GFQ=:CoaOn4Ta2/vQ9BO+vcvXQC
 DOPpufRYBG9OFdr25Ioa9WCxoYtoSaaWlRV7nSjh5g0bZAMNzcyg5CEoWedyxPayQZ+ghkEuX
 PjwdTl3t6jWd70o0N4PmmScacdAeA1mxIfliKJqEnq/bBKA84os8vx87AB18DBEKzurRcMa/v
 VeZ1mCAsVvqgorlWbKPVMrO7cKpkCP8UdECKGNL6uCZej3xkOODZeUMpEgGlVIJdS9FHypsAa
 H8iHuZE0SqRTOJTQXhOceJuKD1MdE05VydU1Yh+XO3SWFUnXaeU0CQ2lqXcx7cpLPso1LwyRG
 oAeN0sRAYTbQoBUAv3hX4qsOx3rGjoOmvmtbdblzpmjgnQJ1nlBBFwNOK2z/LMNA+2P8ylTxI
 UQbMziCNI44gspX3pIh2peOM4op04YyIbKFmGCcPyLdQ4ezoUMgAXq41U+3VQvhOlqcnO6MSX
 Giu/QjOLR/FN6wXeX1gz0txS5RlNWOT77ww05OzpD2RHnjfntoE1fepbSGpl04oBfKionjMZ2
 ZaSU+Yv8ocQNv98y3DhEZXXHT/0qt1mj1e/9ddtAyjclGhsRTamR2RgWqvhW8bOht1X51529E
 Fu1+7OIjiiq4kE1v/z+yfPp/0ifZB6QBLFZhR8BVMJW1D9kKOrvigJb82/qZMpFG5ColdW4bZ
 C4D/jJKBofWjzhDEL0vZZKONfOtEcpXijlWvqs8CXtSzgqhHNa9pn29zZ18MBPw9mc1EhUrvw
 j+3C+HnudLYqzvDYq/WFqAko3MhA7y7CYX37HjDSK0g81vKiHLZwT6rd6/LRzdLnlySYP2zTr
 HeTdWLBneTYkKr7lktRz0osIl2dLV7wdly3YDaMAgXbW1i7y+aZvQC0tZeHiIlbZOKmg6t1Vg
 xG8MSG9AoQNkvaQkMhbwupUXKmZRHmTJFpHTnVwu9c/snUY/AXgNMotJJ8QKVyTw07NPEvS8I
 1IqwdKAaecBR0IF+FLvL7KQd34jA/itbAvna9uve3hCUR6Ml6n8ZG/0jKhMN0klCiQqoA0pH8
 dUuzzLGgxSASQhZT2To33Gubqj9yAKcfiLc9BVKaEByXdlfxHEJFYrA146dAMWzCQwl7vfqIT
 KTc0nqE3mkA5ls=
Subject: [Buildroot] [PATCH v1 08/12] package/gst1-vaapi: bump version to
 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index b32d91e1e2..26a1f52ba0 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.0.tar.xz.sha256sum
-sha256  f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32  gstreamer-vaapi-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.1.tar.xz.sha256sum
+sha256  87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137  gstreamer-vaapi-1.20.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 19ee625703..e0502914b6 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.20.0
+GST1_VAAPI_VERSION = 1.20.1
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

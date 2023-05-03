Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D19C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 18:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56A24400FD;
	Wed,  3 May 2023 18:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56A24400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZStxiVdn7cOe; Wed,  3 May 2023 18:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D10F41D32;
	Wed,  3 May 2023 18:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D10F41D32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0E01BF334
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E86F1404AB
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86F1404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bn6a3DYGiHKS for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 18:58:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580DF400FD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 580DF400FD
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:58:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.65]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbirE-1qW4wQ3c4M-00dFsl; Wed, 03
 May 2023 20:58:32 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 20:58:32 +0200
Message-Id: <20230503185832.14339-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dkTNgAdjHAsMvmJtOAyiloLrmOSMaxN82tUyqCXpnncsWx6Jf24
 oMm2f07zTQ+WbXzARkZmamOe4jI2RZG6938Jy2CUf0F7gH/nfHIhDVlzgvN/DaHTjBX244p
 X45eGz8DZhxKfD2oWWjcqMufvfW/QsLBD+NspuidQlYc2HUlaq8J5LL+iy7AjLgM8SNYVhW
 vGypHoCny9EY5qHeLnWoA==
UI-OutboundReport: notjunk:1;M01:P0:tqZonjCfrng=;UOnSq/iQ7L/iI//UWlOnD5QOlZI
 5iVotAYRsnEJQTdAxNT3mArxcWqtJZZW8/+/VI8fCxy4ewTYHWS9Lm8iRuRd5hO4UrMZDubak
 2Zo8S0Im17dymGmUHVNkgj1vFGFi0Tzlqaj+X/4vqrsGvsyrubJurvGg08KwCQfcli60PR4VQ
 PyOG6slfkAzugSZ7CoMnepiwTBXEsakJkwfEfynLg0gURnLSo1Z+BfeLUbWesM/3NvPDAhyxO
 8dg8mBZSfjnWnto0Pm8exF/SjVM8cl6c42Q8pSCNKLVIHGm0bglcGMNbvwvmXIyvpXB/92AV7
 utiWorOSmvuS9arK3XM7sJbIcZaiS9D4IG7WaGyxjZWEoa/oM6wwLutQi4X//lpqxt08N1Oqt
 rb+MPQQ0EMkHvHde+8oOUS/7scVsheQ05cch63+YTXHxKHK8wuNEcFLMVKnqjU+nBnw8tAIXB
 GseEO81bDXwacwRgiV+92V/XpKBA0uBHL9JQBDq6ctJtbzFuHIT2pRDVBjF5pH/V/y7FL7ygz
 qiWeXYW0tiFvWOQe3nTDgY7XSFh0PznSza7dc3BD3PjqTTdGe8znVlvr4nmm2vePPp5RBEckG
 OI25wafej4KJClOSr1aXQqEcpO2Ltaaxclgeeqqae4UzdP2pZXvrJ5mNKkzcy53gp+yWhJo3W
 Bf7UAL5cRmEgR0EziObh9HUGNntLGxZguV0yhuzC/tO0Uwnowhuvp/ZlAsKRqLv0Y3xMxDRs4
 K5KWauGQiJlGAnaTPPl3iiZU54C82pFpB74zyNeSkaVSTnZ+dIDbidi6y3Li4v5ANfvuNMNTh
 dqH94uo4x6X8MOGMhCwMWNF1ZY9nWcXmJdDIVCJG9//96HnexilIgVTubDiPe5gNxchDYPrd3
 0t4bwLBtAnmlMy2mteSbtz5gMyrr6fw3enaBIbqIipsQ3I+Twy4sY+kkFjsTAyMUWa6UcDeV2
 Tdc1+O9NlN5NX4yn9jimG2EDiZo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683140313; i=ps.report@gmx.net;
 bh=DE1NcfI3P8KRyYtO/faKM1pv/+/Yt9uebOQNr7zQBFM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Y0s8anAtG3Z80J4A9Ph5G/V8IFxbX5EMnaEM1qymcxrtsE5AdOddz24WhyVxyWxUj
 itxYfan9grGTP0mgpmgNxvXcDLColg5ruqXS2q9/roXpDhn25tZneDgoRlB/AT6uwM
 QpkajnZRSGdmTdlCsBNV7P9dm4PtVhNIcjpjcp8uZt0UDEMBKxldoIIx16ldUShWpo
 kuY4oSm3NeHJH3ohZIO+5iaE1cdjpIGIkZDjMWf6zlLx8ElbEMg2LYuhaibIKmCUvf
 fE4TDH8w8p+2bCWsrB50AwCr/WnQA9zp1JfotDVrxOVWoMlOAFhOcZExfVd2SX5IC2
 zpBfGpr5PiprA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Y0s8anAt
Subject: [Buildroot] [PATCH v1] package/gnupg2: bump version to 2.4.1
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c642862fe2..baee824104 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
-sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html
+sha1  d7d021101361a5e1166a6c0cc1731276e7134547  gnupg-2.4.1.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.1.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
+sha256  76b71e5aeb443bfd910ce9cbc8281b617c8341687afb67bae455877972b59de8  gnupg-2.4.1.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 73de185ba7..f7c7ae847c 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.0
+GNUPG2_VERSION = 2.4.1
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

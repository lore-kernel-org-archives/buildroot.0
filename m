Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C70C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F1D83139;
	Fri,  7 Jan 2022 13:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9iVE-R3t5sO; Fri,  7 Jan 2022 13:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B21C83276;
	Fri,  7 Jan 2022 13:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6E0E1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 13:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A3C400D2
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 13:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw8iJmZ85-d4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 13:13:51 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B5E1401B1
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 13:13:50 +0000 (UTC)
Received: from harderbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis)
 id 1Mw9Hm-1mGKrP0UHk-00s6V4; Fri, 07 Jan 2022 14:08:43 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 14:05:07 +0100
Message-Id: <20220107130507.19541-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Dmhz7X4mr/rsYoDXbDjjsEum4ch9xTwtsMaR3WiZaOAdWBH/42z
 XeCl4pTMgAEdMe/0DQf+Lrar2Khz2g/7N/qqEtWaMMtqfO1K+kU9WuAM038l8rtp4nI0Ko6
 dvr4ceMEXhQ1RLH+UvBK9cN1vhivM3YdcLfWtYMMbfM+AHD4JSReA1v31SQPvt+ysvzvWgx
 yVa2eb7MeLzaxh34XtvDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g2agogZDK5w=:ankF0ITRNeVuGxHG5ZNmCk
 JRlXjs+zsRtgFiFKa4H8rRPeGlOkirgWOZtXG8WIHE7qoW8ZxTGi5MQIO9CG4EAxJ6kMn8wCX
 EMbvzQSzd/VCnm1s/CCa4Tr74xBH3I2toYHF+/iPEIlilF2Ew5pzpTmZJiZW2vqDzvVqrLXLv
 E+Nydk/XPCcicj2bLP1OB5Y+T//qRq0qv/OtVwCwfj138xCxIyGntVoy4Lvbx+L+ick4azBqK
 +QLXv2JkUk0bBAN5nRz3L/F0FD8npakWCj1oUB8v7hTCrLzfzSKoEeYK4nYTMpJRTGyQ9qwjv
 IyELlW65DhbclvlSxXudWfrOmR15bLX3HsWSThLHTAMhwj5jlvtaRJ2uck4rUXGaqPdfaHQFj
 W5UKCgUBM6Eet3O22UTCrGQYrGCc3ZZIRywPb9m6/Y/PNIO2eowtwCc3MqH1steAUlkGGyaC/
 PC9WNn3r+2ZaQECpUULVgP4qIwbHMZjZ/wNqBK51rXms4g53LWFI+B3o7mPFI2+wLzOeWNYAL
 qUhnX72fDKq2kaVTtx6G7GFkiJHDk+zalAgs3drCvzU/a2to2M0TR3QfRgBLU1Ox7eZtKkqHs
 xdDc9eEfFlQjFjmD8DP6KHJ105ucCDJQHZ/2/XmTwUx3Nx2aeZBPPwPt/n3nduAlHn8TPQc9+
 RxA0UDkNQ+t5mHJu6ks+kHqTNcVItOelxYJKPayFDuQLmMTsH7red2+l2yCUnB8OmUWWLN1kx
 /n/2s56JADY/0Uk9KXjKeTwrHSEGQC/0CgqxEQ==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.10.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index e29365fc91..11eae3de36 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	35a0b37a5c1e7c48553215c6e8c24a12bac8e9048f008fc61c4b329cf6611b5c	v6.9.0-dist.zip
+sha256	da3025279bbd6cfb0e82b7af95666bede8fd65e8c620a1bc54bba04cebb7e1d4	v6.10.0-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index b20ea9977c..781f9901ea 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.9.0
+OPENLAYERS_VERSION = 6.10.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

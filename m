Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3AAC77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 13:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F778479E;
	Thu, 11 May 2023 13:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49F778479E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tGfpFgrSbQ7; Thu, 11 May 2023 13:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED38683F83;
	Thu, 11 May 2023 13:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED38683F83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 730E01BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5701141F39
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5701141F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qUe9YtNWSIZ for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 13:11:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9EC41EB5
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA9EC41EB5
 for <buildroot@buildroot.org>; Thu, 11 May 2023 13:11:20 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MYN3E-1pkMY60pNK-00VSeA; Thu, 11 May 2023 15:06:16 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 15:06:05 +0200
Message-Id: <20230511130605.60604-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511130605.60604-1-thomas.claveirole@green-communications.fr>
References: <20230511130605.60604-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2p75KswRvljCOCsUy9+Lld4JcKEiyvIOH5S57jQr8YPEGgrZ+3l
 1H+O7iUKDZiYT4VinTIGrU+zgI93cPy0x+F/B7avKr35xAsu1mZRpzajFxHPNb2k7uas+5F
 drNfpx5bDPvD/0p/jA5dEyAKp91dWiJjncDPdQEcx4qEv/7mMSr5W7aiqswOSUTHX/oPWBZ
 HGmphLF9sBHvJVtBfEvSg==
UI-OutboundReport: notjunk:1;M01:P0:4glkWiPDxno=;FbBW+56GrwP4dF2CS7JxMBhbYXI
 C6awA9kkdq3YaiPQrFi8PJtAQ0TWC45+Vv+C36eQaUvOBHVUHfM7+/Bfdk+C16hqisfqd8ntj
 XLnHn1xBLtYH2mh5rL2fIl/nUtjkQqhn+KOX4X8yLVrBTZwHeuqLU38pa2wBu8jHyMpJKWIiF
 Oqtx0VBS6VK8XtTRJWnS1BAmPU2D7mP1jzxTYugmXQ4k3ur/rSSZXGmnnVekkuR2TKZeoB9cb
 MQC+VxJmi0P1PDm+jw5LEyRjETfAE/KjlgnEkXpVE1bn27Bmyqt/uhq2ZqCFBjr88EspBEl0O
 2a07RCU/Gg42VEsghZCUbdj09mPI/t2Pi0bQOZMeSxqa43h1eVckA24uMr7rl07GPmNQ10QZh
 1Vq0Q38oE8cfT6YpYGqW7noa1RnnIWwDIvnCFNXN3fcTcTlYjrAX40Yo9Secjc1j3RY7ex6Qo
 GbAx2QgwzqOLZxNw1sWY4ly070aBPzoK9g95XAlj5SnV0T348rhDNNcxvJVGl3XAXt2CvpGQz
 wS5g+aOGqN2alSgQsNvgG0SHblQl14087eqycELUoSEzUFlT3hDxzbTLsn9oIASplS7W3rlrJ
 +y4EGrOzUvfuJF1WNOv6TUZvHChzImIwjMoXgESgHC84+kdzbDWsurFjJMDCyAGI5ush5Gn/f
 nDNEKCLxdB2fgtYeZ2c/PcGbm5LtecEUOEQLKxfmtg==
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.2.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index b48e59ef48..d9468e722d 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  437558a84b99d0d89743d4897ec16a90a96a1d3a6786e697a8808a044bcb9b8f  vue-router-4.1.6.tgz
+sha256  b044e304367baaaf60fd2ee6880fb02d4e9875bc4321a4e2672a60ad4c5c55b2  vue-router-4.2.0.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index de7e9c30c5..2737134919 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.1.6
+VUEJS_ROUTER_VERSION = 4.2.0
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

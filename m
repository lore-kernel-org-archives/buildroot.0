Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B44C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 08:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E5582F49;
	Thu,  9 Dec 2021 08:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5dnp6YP7zB8; Thu,  9 Dec 2021 08:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6727082CE5;
	Thu,  9 Dec 2021 08:22:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFACC1BF578
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 08:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB834606D6
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 08:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1pelDYnjvIt for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 08:22:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA0F760651
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 08:22:05 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id vEgdmOdbRUpmcvEgjm0Hpp; Thu, 09 Dec 2021 09:22:02 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639038122; bh=+SiindX29a0NYUP4aekZArp0JmnqnPipLxnS40/cik0=;
 h=From;
 b=bjmtPHf6lWF1lbvN92s7EqLoA4sBHy9i5s6W+m1rE/uP20zRXM2bvhtPMwE2oqE2w
 jbOqG1sAwXJwvuW3FSa2Mq5oKJTGqCDJpifHUMc868U34k8wesc7kQyQCKWoEbfHK1
 N9+rxTkpqbueLmZRJ+epqtzn290XN6CaSplrVlSAQ4J0pXFGvgwEpXpD4r69InoSrp
 qmQozpgvJxcmJn6uQpe7GPGlIWHFtegahjm+oErPfBiv79SbOKZsJytd/HDue89G+r
 UOiwY4t+BLHsd1z90c3seduwUfuXDXLCb2Wtrzs47Q5nSKOCoxT52/mvqaRwGXwsTS
 /A7tw81ig4bdw==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b1bcaa cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17 a=jc60OsvsAAAA:8
 a=iP-xVBlJAAAA:8 a=FP58Ms26AAAA:8 a=duKIb4u4o204gyr5VLIA:9
 a=HTgBmCQRAvAkwhNM3RVr:22 a=lHLH-nfn2y1bM_0xSXwp:22
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 09:21:48 +0100
Message-Id: <20211209082148.22068-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfAUtqoKaVygnA572OQl080hVDofKwRWFHDCv+7dDaoNW05V9RX+ZLCy/Semmp25Acckn5YN+qMs5MICEsUPzZJfYPhKIQ/jHfeTj+1ST+1nARTaUnrng
 FOtu77ouum8c6mSaZLTcVUPwu1iNr4/+hPGBFtP33CYAAg+g3KUimR/dfeXI2A9+PPxBqKl8upQ6wiSbdIsbpIIjhN84wQVOB0IaqTaJ/UYSBM3IIeVKe3Zv
 /oSNcMADZvrwKBnK5YuUmSg2cRXSs3/24+gFLpVDVsc/ahyWTIp22fgbmnUna8FMA0Ms2Y267Kc2MjT78s538C6kDsnC8/2x+R/+g9RWKDsFoKEc3Q0sPkSk
 7iPRoeKm
Subject: [Buildroot] [PATCH 1/1] package/pcre2: fix broken URL
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 yann.morin.1998@free.fr, Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As stated on www.pcre.org:
"Note that the former ftp.pcre.org FTP site is no longer available."

Update _SITE URL to Sourceforge.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pcre2/pcre2.hash | 2 +-
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 130ce1f596..e0d5f37229 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
+# http://downloads.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.bz2.sig
 sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
 # Locally computed
 sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 220eb8a99c..b24afb7ca4 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE2_VERSION = 10.37
-PCRE2_SITE = https://ftp.pcre.org/pub/pcre
+PCRE2_SITE = http://downloads.sourceforge.net/project/pcre/pcre2/$(PCRE_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

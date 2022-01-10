Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B520C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0946F8322A;
	Mon, 10 Jan 2022 21:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9VzZ0wNIQZu; Mon, 10 Jan 2022 21:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6815083298;
	Mon, 10 Jan 2022 21:39:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 468D91BF2B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34D8C40962
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6K1_VTp_7fQs for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:39:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E725140956
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641850742;
 bh=0rW8Its2XVo6i6IVuIFFZDQxldvtfhO4azSJinpaLtA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=if+H/zhRCp4jkw1iIiWfBM2tcYU0/k2TUbSh65VyiZTWPH2p4X9TQruP+3sc/uzZX
 Yh2z5zi2pqItWMuFDhvAA6dVjXCiLBc7Zy9hGmLdq+xw5lbyOiTXv0Ig5iUVRcS3F5
 o7NVLEOupAUgKmYhHIgmTTfDytBxyBZaJbb33zwc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhD6W-1mTrs40tiE-00eLtn for <buildroot@buildroot.org>; Mon, 10 Jan 2022
 22:39:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 22:39:00 +0100
Message-Id: <20220110213901.13597-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:GUJZAXA0VszhQwiIjcqiWhPrWNP75CMxeijC3bf4XjOun3KS5dN
 vL/uy1RsEUr71ECi+irKD0+9x3oWNvZwcoznRFe4aFwHPkfECga0OmT5n6/yG9tr9BnxAwF
 83ciD0IU1zV5o0QeCdWk0P4i79hBae5raFqzPneSKMAZ5Fyno4tfhgm4hovrE1h+NCv3wWH
 QFoRY8RtPHIxSwx8mFT+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RLBEgGpMkOw=:W4oX5iAEIVXxpPtJRzcqP1
 KPtL/sotEcEoEdnhZW3YDLMT18zcYBTrd71U7nNIox+lor3bn9M7G7fExx5f/tKhfWj3aiGLD
 4EzqIGyRhv8lKy+UTR6WIpW/nd0C7nibRagP+N+CKGVkIbCCpAzISMJnNiuOIQEpiY7q4PNbA
 RVI6K/yCliqQDPSu4rnVsYNyli6kClT9cn+Ev4tlt2bHd/raiU86HvB1MmBiumn1/zvb3VDls
 SL4dHwt5tl7k+Aa4A4q9wVD9HddzskVv1kTOrhmnJUxIjF8lqxsZ/7ehoN0QWBNqqOGjrtPoG
 7JyxemmpbtslC7iDytXIroXMECFARELLcJ9ZaR5H0VGrhi6TDDERF+lKHQqAT4dXcYQSCfl3p
 xi2eeR7joW1TjgNx1VKMdjWzVTomJgfZX1526eSMGT8WpkwWILas46B00q0wSBJOrAebahFVT
 9QNF6P6BEE1E6T8vLPYmPNLbdi0eMEoDtXswA5n66DzGTPQWabRWywGEpjq/d8finoA8GMI+q
 /H9Xa6WX9gTGiLTwvT9+cZetaAPgNbPjn5QJsWQNUTsXXo7lGj1F95/Y2n5itWi3OhexA3h4/
 egn2uXiqYsHQghTz67u08xSI/fCLowdMWaQhSPUFP+AEQgrbLF60/3KuanOZfRVAKN9S2hm4I
 32FeLEgObU6LtVR9/YurHGXQpjAh8/UGCzzlaL+In3s8O7GFwPjubVf2mMXzVhYovgec89fwn
 bYCEhVcWswJRJWmjSTUNzqksK91KgDSSY5qX+H6VliElMMjfPsqnE+Xxk7VZoiH5KQCSk2itJ
 Sm1GWq3fdDassWvG0xL6MihNIgd5uE9yny8geV+HEXdggQiNRVGooubzTPmehJiVikuS7JCl7
 MUylgYRxrkBSpGo1yQf3aK9WtMw1ea/LRsCG+XoQ7sOdDNRqUdQfgRKThI8Slju6wj5ral9po
 fxyB7vbv0ppOlHZqbtaGZXWYikpWUFmXXl6XGtYe93RsIDGzjSvHz+5Pv34hEu3dPmbKPkrVP
 4IxdgFVohn7wxYhDneyzgfoOuXoO4H0/81ccFq7OlAz6l/ECgeyccMPTtA3EHYCvbLcfyPcT6
 Wm3SBM5z+x0f6M=
Subject: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.47
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

- Changelog (since 0.46, from [1]):

  ver 0.47:
    Fix issue with memory leaking from DHCP leases.
    Fix issue with NULL terminating of Base64 encoding.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 20b568dde4..cd724eae2d 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d  ell-0.46.tar.xz
+sha256  4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9  ell-0.47.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 4fad6e8d1b..3ce64b6f2f 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.46
+ELL_VERSION = 0.47
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

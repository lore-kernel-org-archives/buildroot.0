Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BA761245
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95BA761245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C87B83A9E;
	Wed,  6 Oct 2021 05:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfQxz51u004b; Wed,  6 Oct 2021 05:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEEF83A9C;
	Wed,  6 Oct 2021 05:33:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 401D11BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB35403EC
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9bvNAKn5kH7 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 05:32:47 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 667A240377
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 05:32:47 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.42.49]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M8yso-1mT1ed2cdS-0065Nr; Wed, 06 Oct 2021 07:27:33 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mXzSl-0005bm-E1; Wed, 06 Oct 2021 07:27:32 +0200
Received: (nullmailer pid 7389 invoked by uid 2001);
 Wed, 06 Oct 2021 05:27:28 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 07:27:15 +0200
Message-Id: <20211006052717.7328-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211006052717.7328-1-post@lespocky.de>
References: <20211006052717.7328-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 065d172b6fd9f72e1e90181fa0439b73
X-Provags-ID: V03:K1:9s5OfiM3+2fyoRmHwdMpmmf1emid4PmjaIJS+K/Hwg4j3EdgOKe
 3TgeYiwu8892E9eqN1u9e8c2lX/GadllxDZcjixRbaktRR2orMXLbpwCKEh9Hy5C/1aZhku
 cKRcXE5LGd8sAXTxV0AMksKUaTzvNR2DjJg8ZdNLoL+9zt/5T83wsiOkvMHGONzEFTTTuaP
 5lbPUjpWTlkkMxOyiAaMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i+HCIvDLgxQ=:noFLmfultD6VgbPn+tDqQf
 0DeJ9V5/tke5cDpt4CvGomPhcfVH8bKoPBNzzSO2WuPOyqzf6OPWuj9WzyvRTUJ2En9asCrHA
 m2L0SPuQNDJc1kTpg1U1wGR2VeGORFagVcB+QXkfw2HX3cIGPcXVFdHkQmQTsBHQtQsIWNpqj
 1NLcWvYJSpv3BNaiTnfDYqjFi781RtkUhvUc91/2ERUv3yaZRrIupgAkg+CwlgSOH0QKEUX2R
 bkg7V6IEKvZAVD/l/fU8ME4S2AYfDXsFkaeV+ykXegqNcS419Xw/J3kGqwLjqW7xqED0Xn6WZ
 qbM83H3ryZzkQbdNty79JhVSkair3UE6AKgcINAolaJOOeCcKVoo4mkC4177FpeU0f6jt9XUV
 0JepD0aSctbTCN7UqenyOs4lKjltGzXYaM9BfmaifrHM6P0aCOcqo07qbNQo2tm9WnsklFDDf
 EgaqB6v6y9ZDx+2SihFH098WFm/oPL0QT0yaAYaT1O+eIbI5SraV1itQNiEEdR4bQ1aNW2B3H
 /ncRHijP7+Ti1aGVnH9Hand9QfDw6vMCChzuAz5EBwfqrvwgcDFZShkJe501ER1ZT0dZpI6SJ
 dl07z8VWWXAxgXCZZ5uV397IBo5PoXM9dsd+dcRGslEiLeQa0Zx9jLiZcvsjyW1gdfg9gmZ26
 OfwAIH4FTxVJI7Cu7UEIvppIb32dleHuxba4gC0oxfP1kVzEvyeMxgsUI38eR2T9A/cVkLUl4
 GUL4rx55H8rYCx99BDtS4AITgc73lYWz5x6a3g==
Subject: [Buildroot] [PATCH 1/3] package/dfu-util: Update help text
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DFU 1.1 specification is also supported.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/dfu-util/Config.in      | 7 ++++---
 package/dfu-util/Config.in.host | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
index 71c1a1687c..2eddbf0521 100644
--- a/package/dfu-util/Config.in
+++ b/package/dfu-util/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_DFU_UTIL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
-	  Dfu-util is the host side implementation of the DFU 1.0
-	  specification of the USB forum. DFU is intended to download
-	  and upload firmware to devices connected over USB.
+	  Dfu-util is the host side implementation of the DFU 1.0 and
+	  DFU 1.1 specification of the USB forum.
+	  DFU is intended to download and upload firmware to devices
+	  connected over USB.
 
 	  http://dfu-util.sourceforge.net/
 
diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
index 1bf9275f97..5ce0da0372 100644
--- a/package/dfu-util/Config.in.host
+++ b/package/dfu-util/Config.in.host
@@ -2,9 +2,10 @@ config BR2_PACKAGE_HOST_DFU_UTIL
 	bool "host dfu-util"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
-	  Dfu-util is the host side implementation of the DFU 1.0
-	  specification of the USB forum. DFU is intended to download
-	  and upload firmware to devices connected over USB.
+	  Dfu-util is the host side implementation of the DFU 1.0 and
+	  DFU 1.1 specification of the USB forum.
+	  DFU is intended to download and upload firmware to devices
+	  connected over USB.
 
 	  http://dfu-util.sourceforge.net/
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

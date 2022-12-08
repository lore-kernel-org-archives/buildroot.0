Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5872FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D779981754;
	Thu,  8 Dec 2022 17:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D779981754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vwm9g066mi0; Thu,  8 Dec 2022 17:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB1981839;
	Thu,  8 Dec 2022 17:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB1981839
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 973A11BF20D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 17:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E93B408E3
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 17:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E93B408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDUAfeVkhM9p for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 17:41:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EBFE408D1
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EBFE408D1
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 17:41:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3KtGp4GIMQipd3KtGpiGvO; Thu, 08 Dec 2022 18:40:59 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 18:40:57 +0100
Message-Id: <20221208174057.687435-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLTK/9Ckpo1jfoZFLZ4/WsToykIXSUzdc7+VVAI5VlW/t/XecnsR2FfgAyPCdYJxtElK/VXNsFcNuvA/Q+5wA8ZPKraUujmmoplxBtnQFvIkHVJzDh44
 JLusQJJQR+po/QaNBaFX6fSL2n/A9kCyiOagZNWua7G9phWaXQZ4xIrQXNqRD0YDpdY5Pj4xYgE8TEovgf1CdgMkswYaVHILHSIjAx+yPPAB+k9j7+tsDnaX
 8T73akOwxZne4E1cuzEYRtJwQYlrJz/+0RntDElV3+tcjonovrbBbNEBvX/VaEzS9YJ70yOR22S8ea9iRT6Jcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670521259; bh=WPmzrMYgrFa+sUJTj1cGcg1aG2doorXyBboPjuDxiHw=;
 h=From:To:Subject:Date:MIME-Version;
 b=oJiny6Df0u7PhSEYewESj34UruV5glqTtBdlWrm2TQOuTavcA/QqjPfb4vjx8+/4M
 Yh19vKB0RetrRZoG0hnxHUPW4SusNgkUf3L384zf4lXWxvCatKjz4QrS4+HyIWRbFf
 /vUW2uQdcL8l4i9sUbqZN6ctK+nVOrz3MDCTYSW8RXnDkmSF0MoBleCjTxKSH0ex0k
 Se84ioRGo7hp0awjQZq5mO/B1eiZD5x9Oq8Mv6KJ/qTYwMnlZ4nbilas0h/jFVyEoc
 2nPyZTrpVrVKtrlwlb/R2B5hHTeYP7M1jt7xGUsw95znjLcJwUIabht3uAGpN3f6x2
 4fqQLYCVKmMkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=oJiny6Df
Subject: [Buildroot] [PATCH] package/xr819-xradio: fix build failure with
 Linux 6.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to latest version to fix build failure with Linux 6.0.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 89201a8eb7..08a3b6e8cc 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
+sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 835e229347..8c1cb1587f 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
+XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

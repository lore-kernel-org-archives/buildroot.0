Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11316C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 08:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F7D612B4;
	Thu, 17 Mar 2022 08:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NguYFWPX3BNN; Thu, 17 Mar 2022 08:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCC1E612B2;
	Thu, 17 Mar 2022 08:09:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAAA91BF387
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 08:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAEBD409FF
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 08:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=work-microwave.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuJyPTtfOPIh for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 08:08:52 +0000 (UTC)
X-Greylist: delayed 00:08:59 by SQLgrey-1.8.0
Received: from gateway.work-microwave.com (gateway.work-microwave.com
 [185.170.114.92])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 558BE409A0
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 08:08:52 +0000 (UTC)
Received: from mail.work-microwave.com (mail.work-microwave.com [10.9.5.20])
 by gateway.work-microwave.com (Postfix) with ESMTPS id D4C8540455;
 Thu, 17 Mar 2022 08:59:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.work-microwave.com (Postfix) with ESMTP id 52AA81282BD4;
 Thu, 17 Mar 2022 08:59:51 +0100 (CET)
Authentication-Results: mail-wsvr1.work-microwave.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=work-microwave.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 work-microwave.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1647503989; bh=e4FoRwP2xG2qpqX+gvLBz6CijUVHfFCiTtrzzG
 6i4ic=; b=qiKpK0udaHsknl56zJPvwDK8QsLwapK8zQsziUSxsvfPqvi6bZ8yeS
 /+v7i47BTR2S6p7DIsQk/HUa25bYwbbx+GMITMV6TpIoGTiNlLKgr2LLTxRkThgK
 27x+6Q2UUMTiJno50O84N80qwuKgK0VlQjjR4fKrh7rhcRnmfugWs7kvyjcRrtw+
 E0jfo9/je0jKlEUPBm66bYojFLR4YU8/oUziNbh/8vTRuuD49sfc4d6VLDt11P8e
 iQ0X40hTSR0VZm4oCrSGA8QUrnkIQgq0MsaftJcWZYY+X4PZ80us3md8/C40BoKz
 7c4IaQhiRpUB0UsebZqW9lba5111oDOw==
Received: from mail.work-microwave.com ([127.0.0.1])
 by localhost (mail-wsvr1.work-microwave.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id tDP3ky1u_RbL; Thu, 17 Mar 2022 08:59:49 +0100 (CET)
From: Johannes Agricola <johannes.agricola@work-microwave.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 08:59:10 +0100
Message-Id: <20220317075909.3705760-1-johannes.agricola@work-microwave.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version 4.3.1
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
Cc: Johannes Agricola <johannes.agricola@work-microwave.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1761a7658a..f92c66018f 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
+sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
 sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c25686d385..152659cee6 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.0.21
+LIBWEBSOCKETS_VERSION = 4.3.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

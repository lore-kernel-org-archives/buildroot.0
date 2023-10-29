Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA06C4167D
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582E47093C;
	Sun, 29 Oct 2023 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582E47093C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xq8e7ybpCFrH; Sun, 29 Oct 2023 20:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61A470894;
	Sun, 29 Oct 2023 20:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61A470894
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0D971BF308
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B728270894
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B728270894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcLJrGsAzsmg for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 20:48:32 +0000 (UTC)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5E607058E
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 20:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E607058E
Received: from localhost.localdomain ([146.241.104.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xChwqyQ86PegxxChxqsW0Y; Sun, 29 Oct 2023 21:48:29 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 21:48:28 +0100
Message-Id: <20231029204828.81352-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ+0P9xvxRUpO2amGF2wgOjuhCJ6d7ZNY2kBuvvfPGBb/7NWsXvl+4CulV9QSdGZyuSIH/K+KfOUTE6WFReGeYDSgC4Vm+dRkq2MgDpUUdWbwGlotzXU
 xGJIGwwLq1zjPwVHRchUpKQAJ3NpfvJZpScgi1e0k+nozEaHJ9DVrTPBiUlgi/f/lHugi72u4ubLN0dmGeMpDfzksIrk6J71FnEac8fSj6XABSYJCRWasV4l
 p1vtLDZK4sGRkXFBTtHJQTTPWHk25C4JS/flSKnVzDE7XxKLOs0rzsO5dD9QReWl0elrgSIbeniJgx5jQLmylOp2TLTWrHxvJU6QBjD0o4o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698612509; bh=B6RQTRtP2FbdxLZSViri7zWk6D/awVpy1p9MoQCXo2k=;
 h=From:To:Subject:Date:MIME-Version;
 b=dAyli0hZqVYP/U7BGfDQr93Yk74BvH0LlREKfEbpfiXJSlVHxqb//QxgmcnPH7jR4
 +yPSdxaRKKK9Luc795aZZ/mMa8DqALhMK+RWmfeQZqp1pTn2SDraz62hmBRPYDyXPK
 wAHsgG3iEEvdzhA4b1yk+WYeT+ZVefvrURetEX8Bt6yzrdgG5ORy/ifGLtSRXscsM7
 Xy2XqEuhprroHVLJT7tmCETafziQ3/mdTLULey3ny/dQgetMzhBI5rkuXmAWp3Ce0W
 zSZTeTSsV/YRbD5S31CMc9sFNwT8VTga+ZjK59ZMghZpZyEz+AHh1kb2YD6mgc8+NH
 JmKEYkleIfIdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dAyli0hZ
Subject: [Buildroot] [PATCH v2] package/libnvme: needs host-swig when python
 is enabled
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* moved host-swig dependency under python3 check as suggested by Yann Morin
---
 package/libnvme/libnvme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 38394b9931..b393122c85 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -14,7 +14,7 @@ LIBNVME_CONF_OPTS += \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBNVME_DEPENDENCIES += python3
+LIBNVME_DEPENDENCIES += python3 host-swig
 LIBNVME_CONF_OPTS += -Dpython=enabled
 else
 LIBNVME_CONF_OPTS += -Dpython=disabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

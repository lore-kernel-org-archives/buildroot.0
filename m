Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C0FC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6020D60A87;
	Sun, 19 Mar 2023 19:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6020D60A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQhXp2gPw5wb; Sun, 19 Mar 2023 19:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D6BE606F2;
	Sun, 19 Mar 2023 19:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D6BE606F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1ED1BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E47A1606F2
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47A1606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xevO2YMeZsFZ for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:29:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2DBC605EE
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2DBC605EE
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:29:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dyiRpSzbZXAcFdyiRpgScR; Sun, 19 Mar 2023 20:29:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:29:15 +0100
Message-Id: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEFO75x7FNX6NXyVMrFd7MKr2ckVs+HuWotuIvqmlRLGkA47x/xLhth928WCEwnGPwWgITMUAKp1UkqBoCtloj+ScSeuNVpi9q+rgGRQoHHbRDakjv4W
 atFRRTHnCA/J896sFHewATWriu9q41wb2J9yA44rsa8HFS4/4sm1b30aVNNNKYjwaCDXwQVF065EK+FlgbNjiud+VtWcX2SI0PzrCKpPxuf1kHU+NnxQIofs
 EM5YwcsJk2vzRrhwnU1JaOAZBJ5J/TF8M4OdSJke5eBZ1QCh+frpiWAflecS23QEk4T2oU3nel9T62KVAzlcQ2veNVKl3WSV4H+Lf+A9nZo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679254156; bh=BsvZ9dHH/nyBs2ZKPnjvDb381TYfz21Ce4d2lgaiJh8=;
 h=From:To:Subject:Date:MIME-Version;
 b=dbGTOheRgcfg9sTdgtFNlKAZcYEDcamelj2WdKD86nNiKVOevfDWD0v+n3s8lYpxP
 Vi6q+lQOmwJL5iDZcg0lc7C1tuwC0apGAOk5zAX9ffPeqRP3nTZ0lV8sQ27f/hkaTj
 ToN/tLRnOpbfXdxHXRhC16H7az57QrZzZKNR9u0rQyLT9vIjcUPVDQE+tJCgO2sbmC
 NQYa6yNqLPMhZa0dxPdYNZ+W6Sl7VKdzwusrPhXI5yHj9OZS6e+LW/mV4c0WpUXlpz
 ghtQtwSSgLXn9sCKCLH+mKzYpywSU/O0SskOi9pr1+wlcStJx1RzG26+sYqoVhmzO2
 7NVrwDslJU7BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dbGTOheR
Subject: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mmc-utils/mmc-utils.hash | 4 ++--
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1256f63487..22d34c3d40 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
-sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
+sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
+sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 435e6ae7f1..bc0fc7aaf2 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
+MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

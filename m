Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF487C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704114099E;
	Sun, 19 Mar 2023 20:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704114099E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rF-xCPUH9qFG; Sun, 19 Mar 2023 20:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C8A409A9;
	Sun, 19 Mar 2023 20:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C8A409A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEA561BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 898054023F
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898054023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oRFJjLFpxRp for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:17:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0757D4013D
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0757D4013D
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:17:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dzSgpTK47XAcFdzSgpgZbR; Sun, 19 Mar 2023 21:17:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 21:17:01 +0100
Message-Id: <20230319201701.469279-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG01HB3lDctidfmKQ3gchttqpXVHJHsxQIMBef/ByIjlOBiJ6ey/D2uOcwiIltQQtux/RaYnJay3rLPITeX2OgrcWSHif2ztxwf0pAumPehc+IPAGIp8
 r87NmAWpwVExjihmMNsSoI4xvu77vEhwDxK4MlOHAcUzOq+enhZDSbLpVkQM/tZ4O+oBh01u/wEjwzcJ0x2/lggi7ROePtVqf6l7bOd+xAbv1tGZ08BzUg3l
 5IH6W48ivg7rVtuUTwZkxOBI8c/X7v5u7igiBVZyKQIMz+h7SiCzQJPKFYUuQRwU+o9cIrDB9wTC0/Ft+1sX4w6vwSPTo8l3LoKfP8qx8N3rb6r6lOmJlTJS
 b52eM6UZS4pwcaLxpGyHceu91hVM/IJ3RQ3+Uj3xb6Mt+N1K8sA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679257022; bh=++lwPDekBcvmW+Zvm7sSAJj3xA6gyTC3la1P/qhGkkA=;
 h=From:To:Subject:Date:MIME-Version;
 b=CwICH2tGy+YYPHbbCx3PkoUGlZpz/Rtv/1P5NeCmqyEteeFu+i9f1uAKek9jQDs6A
 NnvGST/iWnIYzm6x1g6InEMtZ6WwvPQShQ0iZH7Pl4L/xWUCzftD6RY6/Cb6X/QpDu
 ROPOqNIbUOFZJziQJIaTGQY07YfdEN4a+g/EAHTfbTCtZjn9d/K+Tpz7hrZsBm9q8M
 OzkN4GgeB9LMXnqKH634Xm+U1k/TLqFrSWJVhgYlISNuQCIUQ93V9JUQXaycC1aDwH
 /w0grDOHzlj1QUkpMGTzMgdKvlCCyaWUE1givjgHxdB2Dz5Y8KCn+wUNOh5qP4FdmD
 Vw2I1N01DVtNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CwICH2tG
Subject: [Buildroot] [PATCH v2] package/mmc-utils: bump to version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>, Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's also switch to a _SITE that can be accessed from a web browser and
results to be the official one for mmc-utils.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* switch _SITE to a browsable one suggested by Peter Seiderer
---
 package/mmc-utils/mmc-utils.hash | 4 ++--
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 435e6ae7f1..44abf00dbc 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
-MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

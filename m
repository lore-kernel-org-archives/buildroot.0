Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF224C54EBE
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 312DC821DC;
	Sat, 14 Jan 2023 00:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312DC821DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x49YHmiuJuNg; Sat, 14 Jan 2023 00:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C09821D7;
	Sat, 14 Jan 2023 00:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C09821D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92D7D1BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D30D41B56
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D30D41B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZnf_8FtGPAm for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:36:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574CB41A58
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574CB41A58
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:36:49 +0000 (UTC)
Received: from localhost.localdomain ([88.149.186.89])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GUXPpp1J5BXcMGUXPpPeTV; Sat, 14 Jan 2023 01:36:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 01:36:46 +0100
Message-Id: <20230114003646.1540536-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHfLoJr/eNcvv2iRxkiuy1MQCLlbeXIGxcE7I8S+GN03ilNulL2iw9EQRUqxx3fU0X1DghkprmuBf303ofb2Q0kHeXwGpRaMlinspXHMF8/xUfpHQtQD
 OEIkz1hS7tOPnn23AZxYsKzgY9j4omb69l2Sv3Z05JrGd8ilCCGPBOfXCwMqCrOp15ZY7dMXZZAs1HU4tR80vQsoOLVKGpvVPRmIWmtZYRJlMRKt7eI7ku1f
 2bSjPM4RgXrNln7vyAulNzzWriMIHmE79fWOdQ4tlezvKg1DU3AV+dDA9Ely6z2kWb0DsKxX9458b41FI8H+ww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673656607; bh=zUEJyXmohgQQex2vXGuw8nRx/22MUxT2hpapyrg/ecM=;
 h=From:To:Subject:Date:MIME-Version;
 b=IDoSINwOyvF7xXtQ47PKViImkx13jQxyXvupjD/3GtBL4ovXq/Tm7rj+YMEYdrbvV
 XorfSsseB6zKNMMx9LIu7j0Mal2WQrEzD2fMKXykpuSlVsBBOHeXDRfvqbIIGEcIvQ
 WZom8SDxW32Lc/7XmOufC7PRRAOh/MnQPEM/rDQMKqFj5bipEnKJMxNUt0FrXFjdcD
 pmEu52TADSUEealRS1g1Fm/1HQAKRRSyAZVuBQxiD50tfGKiXrPkA+RJjXGraaymPz
 4NYcg7Ti2OBZXc90BuIoUGY4G4fnLaRJIK89/oWRsNl6egmIB0wKSAIu7Om9R7s8nG
 JYdQcUTr+ao0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IDoSINwO
Subject: [Buildroot] [PATCH] package/libfuse3: bump version to 3.13.0
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 2fb5f329e3..691bfbc9d6 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  25a00226d2d449c15b2f08467d6d5ebbb2a428260c4ab773721c32adbc6da072  libfuse3-3.11.0.tar.gz
+sha256  224544214204eb348b548d6faa7a9bc91b053aacfc92e8b5da3f478c76ae4a03  libfuse3-3.13.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index b3e3176708..d94f7d3d3a 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.11.0
+LIBFUSE3_VERSION = 3.13.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

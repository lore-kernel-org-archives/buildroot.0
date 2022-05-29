Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6EDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 00:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D3A415F1;
	Sun, 29 May 2022 00:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD05DWpp78B7; Sun, 29 May 2022 00:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1626415ED;
	Sun, 29 May 2022 00:23:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89EDB1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 00:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78340414C6
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 00:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvmrqfCzh3F6 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 00:23:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E90B415ED
 for <buildroot@buildroot.org>; Sun, 29 May 2022 00:23:23 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v6iHnqC2jY1m9v6iHn4gNN; Sun, 29 May 2022 02:23:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653783802; bh=qnfEr4DezSXc5bBSgflsKKZGnzyTeU9FTcVXgA7meyE=;
 h=From:To:Subject:Date:MIME-Version;
 b=XMqzle4U633IhqMBg+vWg5gyN6sRiwqc/ZexzJxmaHQ5IezQV/p31kuhTSmvIPDAZ
 gfMr4OHPot223fxqdlyXkQF1AXnYtB/W78oJvwnlYpr+A54LWP7+pGcvckWw3H5g01
 0T+ruoPAFSH096q0L5bzQsCUj/ZsgVHv6Sb83d91QNbU6KDACvvwlz80kvh/PUhhkt
 C/m1n2VO8TUUYQVycCkzj0NzHiGwyu0x2nmZcNySTjqtEy6+5er3X95CJiQL5fXQVT
 jhtcl0rknHzTvJ2KYJYbFZYJNgcJjRbvomqZJ07x4HxIm+Y+9dkfgW4QKkADwM0TrK
 2CLAZ9XsyhU8Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 02:23:20 +0200
Message-Id: <20220529002320.1275752-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJSNHXy0TWRcVMNXpOhPch5yKW+ePZ9HcmO2FT89t19jnC5N0QCYkbBhoHtFKU7ypbuTgNGSzZrOm/yH2Hj89KeYutJQU7RcfyYB2ZnEGwnftmFPjkhW
 aHMjGtGjSUx78g/yUKeXPim5oSCR1hEjWPYANwWnRwtCGPZ88TozSQPV2SmwuMC4tM2cFw5gjcJIUGVKAA6JItbZDgDM0h23djQt/8lAlGa70PZ/EcxHOQYw
 lMkOSuzz8bETrmSSQBaBnsmfHbN4PAj45bQBjJy9FNSXreYf8QKTrha2fVO6cp1sWce8p+Kv/hB61lm6S7L0dg==
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.11.0
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
index cce2b11171..2fb5f329e3 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  e73f75e58da59a0e333d337c105093c496c0fd7356ef3a5a540f560697c9c4e6  libfuse3-3.10.5.tar.gz
+sha256  25a00226d2d449c15b2f08467d6d5ebbb2a428260c4ab773721c32adbc6da072  libfuse3-3.11.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 1dbe918c5b..b3e3176708 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.5
+LIBFUSE3_VERSION = 3.11.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

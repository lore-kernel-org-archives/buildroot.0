Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F7DCD80BA
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 12:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 426A74194E;
	Tue, 10 Oct 2023 12:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 426A74194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dp6Bly9Oaj9; Tue, 10 Oct 2023 12:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1953F41928;
	Tue, 10 Oct 2023 12:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1953F41928
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2C131BF344
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 12:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88CF6404ED
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 12:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88CF6404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXyAQu5GBibq for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 12:19:14 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD25A4014D
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 12:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD25A4014D
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qBhdqaUxYNaf2qBheqqwG3; Tue, 10 Oct 2023 14:19:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 14:19:09 +0200
Message-Id: <20231010121909.1476603-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIN/OaQjBXkx8uCSu4RSWurIhpETnrOHHQNyLlTsIYhmFVjckSIdn3dEaeftcwFFW4cJM5xE1QPxjjCKL4IoWRZsaUzJxngZ+Bfdw3zIFp3X6563hn9e
 i2vh94D6VdJXU21U7CI3zjU7tGkT/jx6hFWaaW9RehzNw+dGt0pfqarXEIvf5qNZ3e4Jpzy8IxxDe4ohJL+qyjoUGs9x1QMNWKoa7ARqUNOqZ2dH4Ci2ZgBx
 cR2r9k/qN6pTXxgSgbgR/NXT9p+7OTTXxHtE3+6XOam3d1k4nAvnNxNUmzX67fbxA+j5JcBVM4OvVqQNeFe7aA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696940350; bh=nVu1+sDTnw73+Kw/ip9WkGcxk68uiT+BUD1aTGe/7JQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=df0BdK02nwWh6s/M5BgdMWdTV2CU0ti7uK9QTwcW4sM2gnvg8ex/JMgvVL5xX9kRZ
 T4mV9fbdMQ1g21e6sYnsHNsg6viGrs/FXBEEqk4cMZrfyPXd8uby4gidzsomJtWZBQ
 54b0Q7N5PfhsyVFrgTkp2t4YVmOvppSOWZWQh89X5QaxJEiZBdvxutj0F8kW5/xGYS
 WJHmDtzMPSgNwARD4PRyB9oTN0yiPJgH+8RdXX9OmczE2b03GirpDmlOrHNDB1t9EI
 fvqOQPc17PVOUk8x5bb26IfCtE3bwiIqc+N23Wsc3urjipd4D7Cfov2vDpAz0zLZjq
 z5o+Lag3AMInA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=df0BdK02
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.2
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
index e812bb81e8..6f3b3ce122 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693  libfuse3-3.16.1.tar.gz
+sha256  1bc306be1a1f4f6c8965fbdd79c9ccca021fdc4b277d501483a711cbd7dbcd6c  libfuse3-3.16.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index a4b1f08266..f5c9dae8f7 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.16.1
+LIBFUSE3_VERSION = 3.16.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

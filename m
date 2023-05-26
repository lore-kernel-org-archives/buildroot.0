Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2154CC77B73
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 18:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7548584589;
	Fri, 26 May 2023 18:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7548584589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzKBjO-IeSsU; Fri, 26 May 2023 18:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9763484586;
	Fri, 26 May 2023 18:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9763484586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAD61BF300
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 18:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1636342EF4
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 18:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1636342EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAS6w4qcoHJH for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 18:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6804014B
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B6804014B
 for <buildroot@buildroot.org>; Fri, 26 May 2023 18:47:23 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-75b050b75a1so72577285a.1
 for <buildroot@buildroot.org>; Fri, 26 May 2023 11:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685126841; x=1687718841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ujzpuM+dSEEHQRt1mDrS3kN2o5xyOQInrur2RAyTVNY=;
 b=DZyo7gFFHAzSz69wbnctONUCd+VLc+4P1o89cI/bam6OdEbv/+7eDpOdSS5AhVyyXP
 jD1ZhB1a6Yaal2uj3QTch9GocnlkEXzOhQy+sE1v/fx+tdMt6ovbfiNNR9sBpR1tykTk
 35ugbKq24b9npwkr/FyS3ibfntld2z/2dHTTZX+iuLXxhpCRw2b5p0l+aX9ppmE3hLFA
 PLC6pLfBkaibyr+AEC2FDT5t+rwUdt/OZyRg/BvzfjGUHlRGb/Ql4/5VDUrBW5Dr0dJd
 EIgUaS/F22gaXdbAv9wDLGA7SD2xCxNYQatUYBIEBSrbmMfdic7Fqf4LOKUxcIzwSELl
 0wdA==
X-Gm-Message-State: AC+VfDxAUlfJG6B0n+ArI0ThH/YyI8szb2N2BLw1KOVPtSq0bAuUSahc
 ePx/LZF6Wdr9Dg1OPaRBs99NWn6/rck=
X-Google-Smtp-Source: ACHHUZ50YzSm67WyD9ZvQkbS4bAwVLCDEphQ9EUERDvZPldNZyDC15LvWEhB67Bjeyn8+4ETAQsq2w==
X-Received: by 2002:a05:6214:20a2:b0:623:8896:2d77 with SMTP id
 2-20020a05621420a200b0062388962d77mr2120786qvd.41.1685126841507; 
 Fri, 26 May 2023 11:47:21 -0700 (PDT)
Received: from jring-t580-gns3.gridpoint.com.com
 ([2600:4040:264b:4800:9790:1493:2347:e88a])
 by smtp.gmail.com with ESMTPSA id
 lw14-20020a05621457ce00b006238b37fb05sm1392504qvb.119.2023.05.26.11.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 11:47:21 -0700 (PDT)
From: jonringle@gmail.com
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 14:47:07 -0400
Message-Id: <20230526184707.53781-1-jonringle@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685126841; x=1687718841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ujzpuM+dSEEHQRt1mDrS3kN2o5xyOQInrur2RAyTVNY=;
 b=Wi9mthHBdpRf1YSvz5EiGTBNEvO6pU1hYlH0PpVgz4NEHXBlXcoXqA5ZOIJmtBIkca
 RUc0Mv43Prdp7VI/EW3TyXq6M2xUFH4ffK5iPSovxKGzY28IDMZ701c5D/ejtSqN6Hxd
 wHAODITeEGYsakH6ZxYmFjWJk0viqhwxPpSC2L3BpsNfYnJvC8jV5EpjdYPLO65o/YoH
 OPPVJeUHq3Bd1Qn3+zsNd1zz8zk77sdb7YvimruU84PWPFYTIWbir7P71RmDI2s/vMM0
 P5eUEJKTBiZxB07Usgm233Cylmybhvz0KvrNA0xtE7zd7jY4AwSGRZH8MWS3Y2c+mEYt
 ditQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Wi9mthHB
Subject: [Buildroot] [PATCH 1/1] package/mbpoll: new package
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
Cc: Jon Ringle <jringle@gridpoint.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jon Ringle <jringle@gridpoint.com>

mbpoll is a tool that can be used to test communication
with modbus slave devices

Signed-off-by: Jon Ringle <jringle@gridpoint.com>
---
 package/Config.in          |  1 +
 package/mbpoll/Config.in   |  5 +++++
 package/mbpoll/mbpoll.hash |  3 +++
 package/mbpoll/mbpoll.mk   | 11 +++++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 package/mbpoll/Config.in
 create mode 100644 package/mbpoll/mbpoll.hash
 create mode 100644 package/mbpoll/mbpoll.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..cfc7c4ed91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -125,6 +125,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mbpoll/Config.in"
 	source "package/mbw/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
diff --git a/package/mbpoll/Config.in b/package/mbpoll/Config.in
new file mode 100644
index 0000000000..b0d7be1c4d
--- /dev/null
+++ b/package/mbpoll/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_MBPOLL
+	bool "mbpoll"
+	select BR2_PACKAGE_LIBMODBUS
+	help
+	  mbpoll utility to test modbus
diff --git a/package/mbpoll/mbpoll.hash b/package/mbpoll/mbpoll.hash
new file mode 100644
index 0000000000..d72ebee7b8
--- /dev/null
+++ b/package/mbpoll/mbpoll.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  046fdac2d88eddb71a1091a87d0a4bb23fee39595a929cde50c546dae0fbcd6d  mbpoll-1.5.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
new file mode 100644
index 0000000000..e1a71bed09
--- /dev/null
+++ b/package/mbpoll/mbpoll.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# mbpoll
+#
+################################################################################
+
+MBPOLL_VERSION = 1.5
+MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
+MBPOLL_DEPENDENCIES = libmodbus
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

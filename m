Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB1AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9CD40273;
	Mon, 24 Jan 2022 07:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbgB2kDR46mS; Mon, 24 Jan 2022 07:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0DD040116;
	Mon, 24 Jan 2022 07:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEBB1BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1726060AD2
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvvhMUemg3_W for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:11:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44513607A1
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:11:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y17so4280050plg.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wNN4DCKXzphXMBsfEPKDKLnl9p6AulICu6fNJ5N5n7I=;
 b=w/ZD2+snAtLGAAeGEX+ExJoNOad+yr/eNN0okrdy3f8wlur56eDZcIinLpdXZ2KKeS
 5bht5sQbVZj0r7RmO5stpz5bDmZ5TkEca8rBasX/5H/5d9kO4PgyK9aNgZclt4uNtMkI
 9mBEVXpnmaiFLeZ0BMMkrU5wYpESXBl83iMGaEOgRcNKkMsNHw+23YbGdCBoLUqYZCoJ
 ySL7n0+nZJ7j3yczEet1SQZ+UAxIaE9uWvJPTRy0R4et7dCPFgyaM2E4YfUBDGIkqcHk
 dNc+VDNngZr4CKhuKTBXJYMcB8SH6ok+aOkFfmYDp+u4wQBwwz/O7YH+fxO6qVdS0ZG0
 MIjA==
X-Gm-Message-State: AOAM532vfb9+zL5zE+NC4gAGrsx4ZXOTBTMfXWStQQyaa/QVFJ0ioW50
 qXpI1e9D8Bq5dtngErMWVwP60rV8Ld3UxA==
X-Google-Smtp-Source: ABdhPJyTBLs22Xwd97tMDSIJQ7/I1qztfjPmGb4nkqbAlixwuo95o6J3OvhKktvpBESQPu45eNBSUA==
X-Received: by 2002:a17:902:eb4d:b0:14b:5ab:a365 with SMTP id
 i13-20020a170902eb4d00b0014b05aba365mr12837019pli.105.1643008307284; 
 Sun, 23 Jan 2022 23:11:47 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 lp17sm1513839pjb.25.2022.01.23.23.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:11:46 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:11:43 -0800
Message-Id: <20220124071143.15869-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version 2021.04
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/batman-adv/batman-adv.hash | 4 ++--
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index f81df11000..2060e3de2e 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
 # From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.1/batman-adv-2021.1.tar.gz.sha1
-sha1  27a0dc7cb74b868bc0ab52794ecedd0448f0fb61  batman-adv-2021.1.tar.gz
+sha1  80a3e4d763b6bf35db6e561ed9d6775dc874d7c6  batman-adv-2021.4.tar.gz
 
 # Hash for license files
-sha256  5a989ba580897268373bd516b87b588061f344af773a0f6b038a3d8d2af028a1  batman-adv-2021.0.tar.gz
+sha256  cff7a2f160045fd0dbf1f1cd7e35e93bf489e81cb8b9501b3756daa391f3eb1b  batman-adv-2021.4.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index e58ac85bef..838f9b1851 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2021.1
+BATMAN_ADV_VERSION = 2021.4
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CE4ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 10:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B7A401EF;
	Tue,  6 Sep 2022 10:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B7A401EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvkG0tKHBjpA; Tue,  6 Sep 2022 10:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D405D400BF;
	Tue,  6 Sep 2022 10:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D405D400BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8721BF25F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 10:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4019840BB0
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 10:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4019840BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2Oscg0nch0T for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 10:23:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 175AA40BB6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 175AA40BB6
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 10:23:25 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A847F20014;
 Tue,  6 Sep 2022 10:23:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 12:23:20 +0200
Message-Id: <20220906102322.899679-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662459803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mR/mCKleYzpXm7tGg7aHadnJu6p5cqSkqKfmNRqPUQ8=;
 b=OXm7EUv6JVTH8iHsj4hOaReXufoGoIXoQnMsO8cXJy0FVlzlxvm5YsXQjtk3+sZo3M7wpk
 bZPQqkdszzHQWJs1mxBl4b2pHxgBdyoAMB0jauMgYEKobDCgMdNKUl3w2P0YsIpwqmlEZG
 6UzHpbt0sK7UvSTXmkOrx7lqI/rT0l55/xDRqiqtB/nHjNMHdDUupS1iEUDIILmtCWEm6z
 /SwWZd9y9dwkwkuyffenlvOu7EADp1Jt3C3zWhzF/8tERBLpc5h4od/6VkDhcxdxrJn9K3
 iESc48ZXjmjFc/wpky33Pvuv+Y8m5iSl0vlaYVDZlNeGmq96kAbXxDCOdVPFrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OXm7EUv6
Subject: [Buildroot] [PATCH v2 1/2] boot/optee-os: remove host-python-pillow
 build dependency
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

host-python-pillow dependency was needed to build the STMicroelecronics
version during its rc versions but is is not needed anymore in the release.
It is then useless to keep this dependency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/optee-os/Config.in   | 7 -------
 boot/optee-os/optee-os.mk | 4 ----
 2 files changed, 11 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index db7a93c10c..5244700bc2 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -91,13 +91,6 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
-config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW
-	bool "OP-TEE OS needs host-python-pillow"
-	help
-	  Some specific OP-TEE OS versions may use python-pillow to
-	  build the Trusted User Interface feature.  Select this
-	  option if optee-os need python-pillow to be built.
-
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 136c4b2401..38b0d367ef 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -36,10 +36,6 @@ else
 OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
 endif
 
-ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW),y)
-OPTEE_OS_DEPENDENCIES += host-python-pillow
-endif
-
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEFDC38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF10C6108C;
	Tue,  6 Sep 2022 08:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF10C6108C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbbCxqVKbp1i; Tue,  6 Sep 2022 08:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0219B61089;
	Tue,  6 Sep 2022 08:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0219B61089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ABBD1BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43FAE417A4
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FAE417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWSKb5SONVoL for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD52A416D9
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD52A416D9
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:14:29 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08046100004;
 Tue,  6 Sep 2022 08:14:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 10:14:25 +0200
Message-Id: <20220906081425.854318-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662452067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wLZT7+PzlA5UnRDHPWF44zgl0B1nodxz89Y1oJEAI5E=;
 b=ASbF/9ieHUcMPfOTHVmSVc1WYBgdV9Vs2noGEIR+Si/fH9yrDPqCLdgKwrYaOsjjrlF/AU
 1igiQ9ljtyw2+Zo1ZCqN5fKiaUrfO9htB7EuIk/7aLAA8qB55ysGpnTO+qbc5zbhKiSqXd
 oHLEKvJgXNfJvJB9Au/huEaZ3Mj9ZP4LNlyQLedDxWHh/yRz3e17n4qJqx36FvW5pUTkAu
 OKUOt6rv3RpY6Guc9yizG0q2rjazqZrkS5Yxb9tu16csci2pU+FoGQ4vx/aiDvXQuTGFi0
 OSzRu+2QPyl2YRnvjSBXE9OLzfO34HazjA0dh9ERSfbBKOLt/0TYRExFhzPtGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ASbF/9ie
Subject: [Buildroot] [PATCH] package/python-pillow: remove
 host-python-pillow support
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

host-python-pillow was needed to build optee-os from STMicroelecronics
during its rc versions but is is not needed anymore in the release.
It is then useless to keep this support.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/python-pillow/python-pillow.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 7cff54e9ea..31725a3e46 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -71,18 +71,4 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
-HOST_PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-HOST_PYTHON_PILLOW_BUILD_OPTS = \
-	build_ext \
-	--disable-freetype \
-	--disable-jpeg \
-	--disable-lcms \
-	--disable-xcb \
-	--disable-jpeg2000 \
-	--disable-tiff \
-	--disable-webp \
-	--disable-webpmux
-HOST_PYTHON_PILLOW_INSTALL_OPTS = $(HOST_PYTHON_PILLOW_BUILD_OPTS)
-
 $(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

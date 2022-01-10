Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9ADC4332F
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89EF40901;
	Mon, 10 Jan 2022 08:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hswVhiLEkXh0; Mon, 10 Jan 2022 08:02:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5127B40905;
	Mon, 10 Jan 2022 08:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E663E1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E173E400BF
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZZchISBeTNT for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:02:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D461F4013A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:02:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g11so41332080lfu.2
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rCngoOon7mfU9I4IZenIsVEd3Z7WBQsFuXXe/9hmew=;
 b=STM8ZEbeuRHolqpZtoKxTWt9LfSgmAZoF7nI6ZLsl5DLrArz/XvqyPV/YIudrR0s5F
 1Poe4oDGQ3PhICapcXZlKYQGOBI3lA/G7c2pb2tXdOOkqC/WY1h+qhD3cMZD0aEz5oOB
 IvBShFIQ68Gxu6Qe2hGj4uOHA+zDUYvrbTvMegETT1mHkmkMilOwsuTo9PLcCDrAGHhA
 STZNyygTNsIVXGlVmfxDNe82GWfOy41a7AmMWhKiVPlgaCaq3sWkrJ11EGL7COdsSnl6
 lKAk+mVvwKFR6+3yXxvzwxEc1tkgrZPmKMZzfl+0s6e5mmFinR32jT9ahUt43FRsIAJ3
 rcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0rCngoOon7mfU9I4IZenIsVEd3Z7WBQsFuXXe/9hmew=;
 b=YvccClisirmxLeRkgGoC2szI9R3OA31KFF9109eE2totblGEuVtyCBCQhGnfunMXfI
 hqLwKz3UzNrzXYNEReDhv7sCho46npixEBdgzjgQEh8BQ3Cfe+PjecJ69+3oOsduwUsn
 Qs9lsoAhLFS7ZgdcMYHEo+wi7f1tzVmgUAYdDb/zq00ty8kZJGfAk5/6CrmcYIhLyW5o
 IK+frJtus0mogxABeM3qrzSe493elv2JUNEte2isLTxdEFDOcWjjaksemOKG3dJ18gVx
 W1ucEXcn2qaBBXqAjxZbZnnOv/cBdRfem9vW9NiLyrQpiZexx9vW6J5jwRAV+LfNbtZD
 +qDQ==
X-Gm-Message-State: AOAM532OZigV0114tz6rsrhPmWDh0PL7MG8lR9gJ2I+OzooPVYGQP4Ve
 +uVsYyP6KurvvcRaLxvAVRf/hTyYTyQ=
X-Google-Smtp-Source: ABdhPJwZJKYON9dxszkrfV6TngFknN+YI7AFb6WoPMFMOohJghDp0Oj6U25mQ7P+5zRGLrRxgqhtRg==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr51823298ljc.120.1641801750654; 
 Mon, 10 Jan 2022 00:02:30 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id g4sm941891lfu.137.2022.01.10.00.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 00:02:30 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 09:03:01 +0100
Message-Id: <20220110080301.2805134-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index e81deb82a6..3a06340575 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e80631cb1363d4734fe9d0c91f69a68be3848166d6e0481db19ce44a9cb4f531  libostree-2021.6.tar.xz
+sha256  43a00e7856842b8a34f6616fc2ce1ce238ef43210cca41f70e6b4b0d2a9fcad5  libostree-2022.1.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index a6b09f95e5..22cb83d039 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2021.6
+LIBOSTREE_VERSION = 2022.1
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

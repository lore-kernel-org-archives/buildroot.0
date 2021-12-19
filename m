Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96E7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 16:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B82BD40125;
	Sun, 19 Dec 2021 16:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnJ9yYnN7SIA; Sun, 19 Dec 2021 16:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20AFE40364;
	Sun, 19 Dec 2021 16:05:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 160AF1BF228
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0565A60888
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 16:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ciuYusyR459g for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 16:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCF80607F9
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 16:05:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r17so14666824wrc.3
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wkW+5V4wbxKtqZDGbG4Tdf1b6K+DTNEnVgm7iZ9feg=;
 b=KrFd0tt05OUFZsCeQhwRiIC/pD9afoC57MXr97Zb2dfaXbC2A9unw5bEAUUYZfT7QU
 Hc7ToajhKtyX09nTf7gIqwI3vyeQepIRbajFytDlI4vNPOBOtB4qmOxl+KmQDN5ejE9J
 ldP3eihruR5MyzywpWIBMQV6wI/yMLuk4kvWq/M3dLuKQFL8x5feIk4Sv9tTQSzuvJde
 YITRhq26eyTTftSDaoqD6Q2Cn4aygcWhR+lQ2ROiKZfB6E3sUwC2pYz2HxBkvmqpfSiO
 iPP387cMF4mir2K0LSvHlsdcVubPpSuJ5FqAPXTb6tCBmcjmx0GirRUgydz0Ry9yrtO+
 74yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wkW+5V4wbxKtqZDGbG4Tdf1b6K+DTNEnVgm7iZ9feg=;
 b=XZodRq9BPD6Q53NYWKUjmghwrwuQSR/0I1jb7cd3yWGcKi+wyF/Ru99cf5/tidI8pp
 rbVjgaYOshKZrEtq/dEE9T5ZAlFjxTCj9YxRAXQBVYCfQMOpxtK1DAgH5cnsEBCYHrh/
 vjzwoHM6AFMWX09Nv+9YzIajQ9ZQi5Mb6ommsZJvzdr0vxIzXftRVXJT6k4thQ+XwjcE
 OJY9cMaOpTeaz2OCD3rjY+Z1H5O1JvwLZ9+CrhYvRy3QN/si8Zgf49+5YLxCBA2aRcNk
 RPc1FzJ+YYORc7IhVdApb61bifsoC2uNN2dfGsod/AWw7us2xX9fRnmz37SWDg7hDRah
 NYBQ==
X-Gm-Message-State: AOAM530V86ZDTiwuNOeAbVcLfcPou1p44VbPjuuTdzHYt1F+7KU/nmeE
 vmxMjbwibZUikLdedJMv76NEiiXTK8aR6w==
X-Google-Smtp-Source: ABdhPJxo46La3NRSPX03XXU0MWVlUi+qxNoPCppVid7xsLKjZqjkonexl/hKEvQ8tBzs2T1z2/U0fA==
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr9679387wri.242.1639929939755; 
 Sun, 19 Dec 2021 08:05:39 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o12sm13441164wmq.12.2021.12.19.08.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 08:05:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 17:05:10 +0100
Message-Id: <20211219160510.1359989-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: use official tarball
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stm32flash/stm32flash.hash | 2 +-
 package/stm32flash/stm32flash.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 514d71f823..7039f06eec 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dec1a81a3ba85a61dfa39ec12e391ea16a8d431470f41d34413f7ab183da46ef  stm32flash-v0.6-br1.tar.gz
+sha256  ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09  stm32flash-0.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index 1c68a0ffbe..6e38e09d98 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = v0.6
-STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
+STM32FLASH_VERSION = 0.6
+STM32FLASH_SITE = http://downloads.sourceforge.net/project/stm32flash
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

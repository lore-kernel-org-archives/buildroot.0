Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F89C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9ABF412D7;
	Fri,  1 Apr 2022 17:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxSO2sC8fjpk; Fri,  1 Apr 2022 17:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BBF412CB;
	Fri,  1 Apr 2022 17:06:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 600051BF575
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 17:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CCD66F670
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 17:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EPOuWj4klfB for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 17:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB4F76FE06
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 17:06:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b19so5107482wrh.11
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PZBmgO+6rbVDFjoClzA+Uc9E4u11iOyz71QbzXralQ=;
 b=St5+KyXCgllTyTgui/zhOa0yaLEre4IckH4Xu7tgOul4fbKlyEGJ+Jeijiip50FRef
 Sr7xSEgcuQjvwhRi4US88sTkvSGU/kovO1fndcrg0SS3E7Np5yPkhv2Hc/axburNDLov
 Pp3xi+kHKwsGX6rbLqUm0bS2K3Mi7g6W87Eb5C5b0joAZ2UsFEuYM9p9LsPG00rrGUzY
 Si4kmF4CnIJVFW6N46mGeWaT80yGkg2ha2AD5KREjjZ8H1nCSLKDLqRQdqzOJGNSpQ5I
 lv8gs8tdA3CiPrCR/4SUdYqhuQ9mUIJUUEPl5jddW3+z84hkuo8TaSGTFVJDhpdgudJ9
 5Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PZBmgO+6rbVDFjoClzA+Uc9E4u11iOyz71QbzXralQ=;
 b=rKLtjHBkh7/MZuxGf2ZQ6J206M9w0+YnFlkMEsL0vXzajZeyZerd0O8iqHHNzdWDMN
 Z9LmKr3mJ/zUyRv4ZGLremU5gSIi8s+geySgaPbVa0cdRxbouquxiQBg/KzQ3QpqGAFL
 WIpl+sKzGd/SZ/o7FYs77h2fVU/Utej6YV4WC5QUOHtr+3a1gNVajZx8u5eI72tg91m2
 tv7nmvQV8nfgsIMgtSuA0B9h6GyF4uMPEtLyDyIlKQ260uCSlJV7L9/OdebbYO2ZELmS
 RtTc7ygVyMX6NbQdC6xCB/ZCAfDA4pIRj3t2teokGx4RdrAItODyiNJ6k+gr/THz5mMd
 uT3g==
X-Gm-Message-State: AOAM5314OWT4ZHp3esZQdFomCMlWM2UD+mGa5t/5tgxm92Oomt07PKG3
 /ciS+mRWoGzLGLtqzh1J7UWARGXErYI=
X-Google-Smtp-Source: ABdhPJz4h3gr5jzU5UZAj6kD1Z/k56CppODfT28O21VpibxvSwDyOjZBfLtWltiBSV/5MESTkQPgSw==
X-Received: by 2002:a5d:5849:0:b0:205:8206:86d3 with SMTP id
 i9-20020a5d5849000000b00205820686d3mr8362150wrf.327.1648832762500; 
 Fri, 01 Apr 2022 10:06:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b0038cd93a59e4sm2550971wmq.28.2022.04.01.10.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:06:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 19:02:55 +0200
Message-Id: <20220401170255.540939-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/udpcast: fix build without pod2man
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

udpcast unconditionally build manpages which will raise the following
build failure without pod2man since at least bump to version 20200328 in
commit 4fb91d8b9dff314fc53438144f843b3e3ceaacaa:

sh: line 1: pod2man: command not found

To fix this issue, rework how udpcast is built and installed to always
build and install the sender or the receiver and never build the
manpages. As a side effect, this will also avoid to install the unneeded
rateGovernor.h

Fixes:
 - http://autobuild.buildroot.org/results/ce602a09357e950d79794391cd4a852d565914f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpcast/Config.in  |  2 ++
 package/udpcast/udpcast.mk | 24 ++++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index ef94b30a99..cc38c6e57c 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UDPCAST_SENDER \
+		if !BR2_PACKAGE_UDPCAST_RECEIVER
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 34ebddd2d5..4c151bb41f 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -9,23 +9,15 @@ UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
+UDPCAST_TARGETS = \
+	$(if $(BR2_PACKAGE_UDPCAST_RECEIVER),udp-receiver) \
+	$(if $(BR2_PACKAGE_UDPCAST_SENDER),udp-sender)
+UDPCAST_MAKE_OPTS = $(UDPCAST_TARGETS)
 
-define UDPCAST_REMOVE_UDP_SENDER
-	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
-	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1
+define UDPCAST_INSTALL_TARGET_CMDS
+	$(foreach f,$(UDPCAST_TARGETS),\
+		$(INSTALL) -D -m 755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(f)
+	)
 endef
 
-ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
-UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
-endif
-
-define UDPCAST_REMOVE_UDP_RECEIVER
-	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
-	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
-endef
-
-ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
-UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
-endif
-
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

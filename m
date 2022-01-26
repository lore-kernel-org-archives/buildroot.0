Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E3FC5DF62
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8233560FCD;
	Wed, 26 Jan 2022 20:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e72QAW4nhX9f; Wed, 26 Jan 2022 20:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B859360FC9;
	Wed, 26 Jan 2022 20:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 713701BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F94960FBE
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV1endgQwe35 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:22:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27AA360FC6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:22:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u15so1019319wrt.3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pSaMPBw596n3rslMG+AIq3OwzFS6e0l8+aKrs/79KVg=;
 b=qD1Ax8+awq1aQuyQuexQ3O/IYdSccJMOWHd4EIuzKGTnwsJ6jYuAX+o51AFdV2AjoP
 fiRW6rTktV7lNPunZ33PFXZi9giyhv6Ok0NLEImYQI9JfBRrpk6Cjn6UuBL6Im/h4Xi0
 qZcMaflNABYxtW0t5RU4Ukhw2lIsbNAW+B2tZ2gjhA1XRffjayPNszyVQ7HGfeEEMXND
 HYZCA5cJsLqOmpa6BWaRbOUs9Bv4lKc1ecr9D+RBSyEQOzCznxPp/X+/sLMBEG1IbDHE
 cg5Ar52h26xTJWVFXhMTqiibO4Qq8UW3eboibzSuDo/kcCXfFDnACBZJSMo5KeRcfdN6
 5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pSaMPBw596n3rslMG+AIq3OwzFS6e0l8+aKrs/79KVg=;
 b=NpDWdHm9yntIgb4ghlGlTTOGgdKSKFmtDzVqLhIMf8gk1os98lBKO2cvTUr9pTxAPi
 pWUthGDwnRJCpx0Qf1/Rl+tO18Dc6m84TUmKGspPjmdm+bnsurSBcPvSz6LHthC8zoj+
 fsUm62ZJXPum52WOieCbMIsoD3Uw1TzsmoQOClyOUDCQ4OhwcGp/ztchrsu6bRI/7HMW
 MC9XjgP9PcVWs6tqS63vNUs3NetmjLp/dGxx7t8UKnKZMR7ann/EjXSK+I5NLPzch8p5
 wQfv4/bX+j5crtQi0j0Y7bBKTlQGCJZD/ZX3KmfZLdlnGZT4wxyN7lqH/QCDz9pkREYF
 Wj+g==
X-Gm-Message-State: AOAM531+U05WRRzaGPIuY73WWTV6mq10oDRUrkHB+SJh8qIdOnVbvkpH
 88Z4tMS7tzexi3n+Po2CdA6w+lt0R/E=
X-Google-Smtp-Source: ABdhPJx7DBpXIgBM34FzuHVpXR0Ije51wll8btRtsTrc3oZxgi05X7/pDO/EEuLmmg2EoNPmyWtEVA==
X-Received: by 2002:adf:de0c:: with SMTP id b12mr252299wrm.26.1643228560242;
 Wed, 26 Jan 2022 12:22:40 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 by smtp.gmail.com with ESMTPSA id k18sm280239wms.14.2022.01.26.12.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:22:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:22:36 +0100
Message-Id: <20220126202236.1399934-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/polkit: bump to fix CVE-2021-4034
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are currently using the fork by Adam, with support for duktape as a
JS engine. But upstream has finally merged that just a day ago. Woohoo!

Between the fork we were using and upstream, there are very little
changes, mostly centered around:
  - translations
  - buildsystem
  - duktape
  - CVE-2021-4034

So, we just switch to using the HEAD of the repo: it has not much more
than the two important changes: duktape and the CVE fix.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index f108ac19ec..1fedb5a707 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  0a30dbc0ff798ff45f5bb303b4b40160f56679e81b139287cc0efb32aa5dfc1b  polkit-0.120.tar.gz
+sha256  243fa69d1e480510c504723487716cda7d6fb588360c7c8f7ec6ba4a3f6ae60e  polkit-a2bf5c9c83b6ae46cbd5c779d3055bff81ded683.tar.gz
 
 # Locally calculated
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a7ab725c81..61666594a2 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.120
-POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
+POLKIT_VERSION = a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
+# Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+POLKIT_IGNORE_CVE = CVE-2021-4034
+
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

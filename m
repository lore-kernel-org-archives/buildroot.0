Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2174C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E4E681A34;
	Sun,  9 Jan 2022 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwYWgSbB0DN7; Sun,  9 Jan 2022 13:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4D0481A2B;
	Sun,  9 Jan 2022 13:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB1D51BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A74C481A2B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp_073G37o_J for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:40:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE0E281A27
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:40:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t28so14881929wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeUjaqOUdBzvJyHz4lorEm4GzryVEQ5hdZU/uVZMCr0=;
 b=Ts4l+Gnn1uT4bGEwG+AKgBhxa1JsukssS5lB4hPJwkwyypdmBeZ61taCpdM08UI3Hz
 ZqORiCNSMvXV15I0nLcfVLltD24Q0koIZgONEt45N229bvw87niJIUN3b6vaVEGPWabG
 Q7DqzDMgYPRIEFtMKdcI/mfUuJL9nKRjvlIBJiXm7uosWBxG161rX8+i1rLU1cbj1sW/
 5TK5JXPdmVI2W3TykR51DJY820frBUjuMWAEJj+nOGFexXMOC62SwPNVZggd2YcuW7hi
 STMlSw5Wuvgr55jhOn/+MyaesLLUYKrBoTzbHRgpiPCKDMLBcyngPzq3x2L1ROfUUsvc
 AHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeUjaqOUdBzvJyHz4lorEm4GzryVEQ5hdZU/uVZMCr0=;
 b=Vw4ZbUXLHGXAiyzn0NHs5qQE8vR88nlJ1Ba7Mhs/FGsUz/DKyXSaAQn3f90oXhOEex
 m5P6RGqbadOEEH+CtiFNb8RlaGOSx13Omf99eEhIPgEld0+FC7IofNRyMedyQ/L1MVmX
 lNaPK0HkLmKr+GSxa1FLsbfYL/LQXGEHpPgSJkR3J6an2dCeoFN5A8NHK6mxNc4GqoXW
 q7gLRNmQ1h9g48Gy6IxfFcVdCDKN38i3YDLWZ7fwM9FXfbOQhI4mJpJqWc0f/fVlkokr
 Qr4wncVYX9T7Ah/QYPI3ucubISFKf31IV/44M6wBGXr7KIy37IYx7zfAhDH9sSptSLTA
 NLZA==
X-Gm-Message-State: AOAM532scuT5hcCQkG5Mni+kWVNyy9o1+qW8Y75wPipdP6sYtqjgwAlk
 NIqavZ21e5RitaGvTYPkbNGO8ZNnIhw=
X-Google-Smtp-Source: ABdhPJzYKiWzuwS49oec4k8bsbEaqJroYxirhlaNWyflWNE2n6qnWXSyclDwyhH9L2jWtTAJ0cDpKg==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr62018008wrm.697.1641735656934; 
 Sun, 09 Jan 2022 05:40:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l4sm4170072wrm.62.2022.01.09.05.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 05:40:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 14:39:39 +0100
Message-Id: <20220109133939.496946-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: disable system mbedtls
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hiawatha needs mbedtls3 since bump to version 11.1 in commit
24e4c888c3d36e3943206ea55894b84344cc8b2e:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/hiawatha-11.1/src/wigwam.c:39:10: fatal error: mbedtls/psa_util.h: No such file or directory
   39 | #include "mbedtls/psa_util.h"
      |          ^~~~~~~~~~~~~~~~~~~~

As mbedtls 3.x is not backward compatible with mbedtls 2.x, disable
system mbedtls to let hiawatha uses its own copy (which will be
installed in $(TARGET_DIR)/usr/lib/hiawatha)

Fixes:
 - http://autobuild.buildroot.org/results/064af90aa95c28781d96d7eca0f14841fce0687a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/Config.in   | 1 -
 package/hiawatha/hiawatha.mk | 7 +++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 8f1908f6f4..4b1a3ca86c 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -32,6 +32,5 @@ if BR2_PACKAGE_HIAWATHA
 
 config BR2_PACKAGE_HIAWATHA_SSL
 	bool "hiawatha TLS support"
-	select BR2_PACKAGE_MBEDTLS
 
 endif
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 5618e6900d..017592de1e 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -20,8 +20,11 @@ HIAWATHA_CONF_OPTS = \
 	-DWORK_DIR=/var/lib/hiawatha
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_MBEDTLS=ON
-HIAWATHA_DEPENDENCIES += mbedtls
+# Disable system mbedtls as hiawatha needs mbedtls 3.x
+HIAWATHA_CONF_OPTS += \
+	-DENABLE_TLS=ON \
+	-DINSTALL_MBEDTLS_HEADERS=OFF \
+	-DUSE_SYSTEM_MBEDTLS=OFF
 else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

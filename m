Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81886C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 06:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3327D40222;
	Thu, 24 Mar 2022 06:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCw3zmQZ_4Jt; Thu, 24 Mar 2022 06:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2264012C;
	Thu, 24 Mar 2022 06:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B41151BF420
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 06:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2ACA84290
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 06:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GV0B5oQwQSN for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 06:39:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B62168428B
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 06:39:43 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id b16so4363573ioz.3
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 23:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqLzoLkyZ2FoabMGchrKrKNQX4c4/nvICczRzHyy0ug=;
 b=h8GXHs6/UXIPAeadF8v6I+eUAuElOPGyegTyKa+dKr/2thdaY5jcpmOjie/40WE2xP
 hf/zhb1F7xNP2o2Dzp1Sr0tdbr0LKLMKoXevEW+3YID+qF7pil8H2+C6CkiYnZ3OOzFr
 QxZ6a22sCG78mALK5WItcVvEC08VTOCPLc20W86TGglE3bw3At/quhQSgkUWNIwqgLxq
 VGldk2J6PkyI635B0NaIvFe7Et+UbXUJDHiwC6AFZZ10UQWqZWcvEcTvqcXfdWGwB5MG
 4VRN4iCnumfD+B+pjtxAaO4eDGmNMSSi2AmeR3bDGh5W+mvS88mRQ6ukPEgKdnchPUwx
 46LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqLzoLkyZ2FoabMGchrKrKNQX4c4/nvICczRzHyy0ug=;
 b=KAUhe8SkT31ONnBKN1aSRQYLi0iyVkamksY/wzFc1sGbIOb689LOv15j8qxZiwakRk
 FWtzd7C5qgpy2vs7u1CqfNzZdjEhIydsORFH/ysnlwYcGO4PcuF/6JMdSL9O8SyqQOgl
 TJ0ULKMbwvgMq5Ue5goglroj9J1lDy9Pb09xudGGAPKu7rZ4nmPJpguOUIb7NcuoV+oR
 JaT6RkZ3KSb7qC2lxtqaC+Tndf7ETnIFvj21lz9DeuEvKx+xNsEII+r68nVb5K3CLRXg
 uEQ7sAGikWpQAUO/c4Wgti+m08CW6XgOX5DRJHNMIwgCyuVq0LknsVwSdbuaJvHersfN
 Tubw==
X-Gm-Message-State: AOAM533GtDXlqDenR74geCeJLqYdshhuoVKN/PSKZVXE9Z9b2R4TU0ru
 FI8nrShRDHrUtnfjYt/ucBI5fnbaBMZr4A==
X-Google-Smtp-Source: ABdhPJye11GmtdTaQgypEDzbDz2jIEVAnMsraU7mrHi+zB+u38ZHCTdPOOkKOsLv8BtTPHx2vj8qMg==
X-Received: by 2002:a02:cd11:0:b0:317:b06c:3569 with SMTP id
 g17-20020a02cd11000000b00317b06c3569mr2044361jaq.256.1648103982586; 
 Wed, 23 Mar 2022 23:39:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 f9-20020a5ec709000000b00645ec64112asm993964iop.42.2022.03.23.23.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 23:39:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 00:39:28 -0600
Message-Id: <20220324063928.3448755-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.36.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONTRIBUTING.md hash changed due to various style updates.

Set new default wifi backend config option to iwd when enabled in
cases where the default wpa_supplicant is not enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.hash |  6 +++---
 package/network-manager/network-manager.mk   | 13 ++++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index d25f0e8194..26bcf843c2 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
-sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
+sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
+sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a90228992c..3479bb3794 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.34
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.36
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -53,8 +53,15 @@ endif
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += --with-iwd
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
+NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
 else
-NETWORK_MANAGER_CONF_OPTS += --without-iwd
+NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
+endif
+else
+NETWORK_MANAGER_CONF_OPTS += \
+	--without-iwd \
+	--with-config-wifi-backend-default=wpa_supplicant
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD3F410BE;
	Thu, 17 Feb 2022 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oyI1JA7Gw95; Thu, 17 Feb 2022 17:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9655C42598;
	Thu, 17 Feb 2022 17:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BCBE1BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882A660B97
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTF3v8IdXlpi for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C825160B34
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:19:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e3so10301275wra.0
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2ngvWtu49oNJPOQlxXKg35W74JPBcx8rUSQ7Jdfsyc=;
 b=Mlom3Sdu7CdyGnGeRJSC8A20wCVjNQtYSngUfABmo3qYBah1liSAh5ygxZNpnT2V3M
 H015gEaWb7wZSEIZCTLM+lwkqcm3cMrizTTAzI1KHYFRV7C/VKdfwqQ9Z5T3S8pKYwxW
 ZvZkFoCu7Xgwt654o/tPKWPXy77EMO8vWYGE/Pxes7Y+jdEnRa8WS74aRamPrARvqB1k
 tKqW71MftriXW+c5MiiY4JczYE4GP8Ykw+JuKdwgIbIjkoLYfi68WWr73vQMyZczMoMs
 X3kBmv1MTbtRYiXslqaR2lopgtDkJbjmxuD/NakvyEHV4Uq95Q97wQNr9UWtjcOWAhUU
 YGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2ngvWtu49oNJPOQlxXKg35W74JPBcx8rUSQ7Jdfsyc=;
 b=Zu9RzmpUH5MhX37tQPTfzFcGMdBdqYgwrqVzTLtZz3BMo658v2rvz47cu4NrU8DPxg
 nZAqFNmhQ2Ev4GISvtd7EQYSREHCvLi9SXixeJSnNCuodwQCVqD0pXrhoPDpd5uisWXU
 tmP4XbXXLQ5aWw8Gt8twptxaQ/ttwIQ6xFElxnX8D0E3h0L43Q4wmg7QZAi0otIOfkFW
 zbsSikGria+6FU35aY4lgDZNFWO+ZDin8GOZH9ssoilYemfzf0sWrlCrPUen0Bn8whdN
 Zu/uwKe/549ZN1A5mBmmYTKHZVyDv+1CYeAq/T1aB/nSusIVSC52EHpeowiNMsMgmN4e
 CNZg==
X-Gm-Message-State: AOAM533UfTmuZHWO4IMoz/VkJEml7ISQuSpV6Fu8CIfb/Ph95fB6uacQ
 TigXTJU1dLr4eXefKX5D1ABuhfPWMns=
X-Google-Smtp-Source: ABdhPJw6JVnhBp5ilr12V4FyfMRbmbxV3mnRCTWEq5cbPAolcxir/SBY6UdkVpjFi1y3wuh/AzxxkA==
X-Received: by 2002:a5d:440b:0:b0:1e3:f66:bf59 with SMTP id
 z11-20020a5d440b000000b001e30f66bf59mr3050625wrq.250.1645118340672; 
 Thu, 17 Feb 2022 09:19:00 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t18sm2056890wmq.2.2022.02.17.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:19:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:19:06 +0100
Message-Id: <20220217171906.552326-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglvnd: fix LIBGLVND_CONF_OPTS
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

LIBGLVND_CONF_OPTS are wrongly overridden in conditionals since the
addition of the package in commit
0378e2e5d9ce9d5676975dfbff501360094fdc1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglvnd/libglvnd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 3df609f6eb..3bac4b31e2 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -37,17 +37,17 @@ LIBGLVND_CONF_OPTS += -Dglx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_EGL),y)
-LIBGLVND_CONF_OPTS = -Degl=true
+LIBGLVND_CONF_OPTS += -Degl=true
 LIBGLVND_PROVIDES += libegl
 else
-LIBGLVND_CONF_OPTS = -Degl=false
+LIBGLVND_CONF_OPTS += -Degl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GLES),y)
-LIBGLVND_CONF_OPTS = -Dgles1=true -Dgles2=true
+LIBGLVND_CONF_OPTS += -Dgles1=true -Dgles2=true
 LIBGLVND_PROVIDES += libgles
 else
-LIBGLVND_CONF_OPTS = -Dgles1=false -Dgles2=false
+LIBGLVND_CONF_OPTS += -Dgles1=false -Dgles2=false
 endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

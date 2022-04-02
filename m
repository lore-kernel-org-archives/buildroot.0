Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF66C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 03:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F151641A4C;
	Sat,  2 Apr 2022 03:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T90GjGQ28agC; Sat,  2 Apr 2022 03:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DE441914;
	Sat,  2 Apr 2022 03:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96E441C1135
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 03:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F78484118
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 03:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPo1ac1WlK5F for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 03:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6D61840F3
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 03:49:46 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id 8so3282686ilq.4
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 20:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8hEDZs2Ea4pPEtPffrJ3sxXC/dEsvvUahngpZ1LmdU=;
 b=eOiwztYpVqNgtxZ2dwAY2cS4ABnDb01oX/pbi2cVsfhE/0IylybYr6SlcsICFx3R0D
 7vYlzKmaoWH9UPVtl5KknJhAbX7S49vgW8HJ5b3V0c5DBVfDwFgzbScw228BH3rKzHqX
 O8tGb/AtIdSbicxNg+zKvgCqu1N5zCb/lKc/BIEiNFPDsi3wPUgFCdT5x9YfPROpIs8N
 mlo5ByeRMYYL+5wQp+GF0xpwQqN/LrKajWckopczVHygRkBf7KDKuPtniTcgvqUaWTNi
 mtOUaqBqv7PMLlZ5g1FT9CIvH+uORO8wR/e3NHfd1G9H1hFR+K/Vkqzp444br3bSfbR5
 h7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8hEDZs2Ea4pPEtPffrJ3sxXC/dEsvvUahngpZ1LmdU=;
 b=QmuW/IAwRA0PFcnnkccy/d36ekrWRGgOHoNgzAzXQS4x40t/dlDoupRf1UJiFi2qYa
 0Kow2/KBjZNeFLdJAh9h79nzXfJwJeGeyRqTpir8KA2oXOYAACoghWjqltjoshsVXpQ+
 Z6/tPM09pzSZ9ZjQFrzUpw0L02lgpE0Dh9y3KkFCI0mUL4+R/VYQiVVEwlf0ngBcSruN
 /guZ9OZGXO329LqjvolgfgsjjrR/atUbcnYzdfBq2gZd7nAl+1b4xQo1KvjtRtTZJC8a
 Bdp4JH8gFML6iI6H57WLGvP394SbU1rHgD9m89YmkF0ygJh9nOX4Rb9AwfBSVQake8Yy
 bSQw==
X-Gm-Message-State: AOAM532p0Zex3vXzCRI0iQQQG/di9fY3Fm5dHD20e1ca7zvso9M2dysr
 LFCx8vokvi/8ou/AN8b43ds4Jx51LMPiYg==
X-Google-Smtp-Source: ABdhPJwZkNKDeeu76ZITLJi9aEmwvO22aub5J2mnfQBTrA3D+Bt5PqPjArDxjO49qXMbWOM/ZsCm6w==
X-Received: by 2002:a92:1e09:0:b0:2c6:304e:61fa with SMTP id
 e9-20020a921e09000000b002c6304e61famr1316046ile.211.1648871385596; 
 Fri, 01 Apr 2022 20:49:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 p3-20020a056e02104300b002c9f5a5cb7csm2332519ilj.42.2022.04.01.20.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 20:49:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 21:49:33 -0600
Message-Id: <20220402034933.507692-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: ensure headers
 version is set
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

Validate that BR2_DEFAULT_KERNEL_VERSION is set when required.

Fixes:
http://autobuild.buildroot.net/results/2b9/2b91cb82a290348843a2422c01b10e49f45be9ca

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-headers/linux-headers.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index a8d1c2ccaf..93007c8fb2 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -33,6 +33,12 @@ LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
 LINUX_HEADERS_CIP =
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
+ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+ifeq ($(LINUX_HEADERS_VERSION),)
+$(error No kernel headers version set, check your BR2_DEFAULT_KERNEL_VERSION setting)
+endif
+endif
+
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

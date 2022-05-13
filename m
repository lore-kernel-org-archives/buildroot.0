Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516FCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B1183DFC;
	Fri, 13 May 2022 07:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id welyFaPC2nmU; Fri, 13 May 2022 07:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F0EE83495;
	Fri, 13 May 2022 07:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 520561BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41DCC81350
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu2SanfPxmpl for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056C0813D3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:11:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y21so8916274edo.2
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wDi6wrcnB8wkpIs3RVl+QlP0cZGg+ztRSleIsYbdSS8=;
 b=Rv1oW9eP4QeKON3AOwE59Lc/nxTI8zSyQAUnOCAXcwb7p3ak3HhXnoUNQgEYQTtdOZ
 aU4eBk05ec3k0L4mQ1w3u6kzoSRfu15EVcEVaL/+GozjVSe9EVKArjSeGVB3r7D5tb9A
 Q0+BlYfNQV+3pDZiKGgr/llsXkSRUxdA28Dm3hOTWW80HW29J5YEJXCyUsq37I0UG5JY
 qiG2wljHv3o78ND4z0QbhnPxoka526yrM6kgFqGb8etpF6KulzN+nKzPrElZ7dhyvLQb
 9nPAxIiQJsJS9zZmkCwUJ71YkYjNnco+4gdPlxK2B2Hnl9IzoGohKihWVvRtL8rTVN6b
 McYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wDi6wrcnB8wkpIs3RVl+QlP0cZGg+ztRSleIsYbdSS8=;
 b=I/TL7clDQa9KXoPE7jZR2gIzqS/+MBJcvPq0jmAKOySTbym+QFTUZz+NIWgMM8vMii
 H+7Y3likgxoTfewvcOPM7/MdzNICR25CEL7YKVLPL1f86qRDgB9a/SY2e5WYfG2grtXl
 5mW4TWr4K0sKvY90hyxmhDSop53J1XYsWDNy0mF/hHG/eMnq6WddRGrTuzwkUdEyhQlL
 dMY03/AiBxl8xLboHYKKq55WM2Rq8SXKrjUMcj53015Ta8NT5NKmtaMtK2d02zAnHYap
 dc2kS7CiSc/PzWRQ+38MgQ0AJ5S6dkJ8h/rKuoBtql4pmVKty72qxJ6/U7+8Y/WBTqCF
 9niA==
X-Gm-Message-State: AOAM531TAOkezHICIcH/ZJOJpyldwPBpQeYVSoG8J/tZ6dGnnaI+hdBO
 Tupf4MAO95bFOFIz8fT9buMcl/eKB+x4fQ==
X-Google-Smtp-Source: ABdhPJxftGPLd0eR8e05SJO3plvizBkTljlfePl6Ly/xJFcwdgA8snDS+Cn5eOF4zkVxWqcsji3Glg==
X-Received: by 2002:a50:eb87:0:b0:425:c3e2:17a9 with SMTP id
 y7-20020a50eb87000000b00425c3e217a9mr39277144edr.109.1652425889858; 
 Fri, 13 May 2022 00:11:29 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ml13-20020a170906cc0d00b006f3ef214e63sm443183ejb.201.2022.05.13.00.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:11:28 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:10:51 +0200
Message-Id: <20220513071046.18618-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220513071046.18618-1-heiko.thiery@gmail.com>
References: <20220513071046.18618-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 2.1.16
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency to sytemd if enabled so cmake can find libsystemd
and install the systemd service file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 2895bc51d0..0145a9cc78 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dedae40419cfddd09c1be7bb536b3a762ec8dcd568c2bfe803c0f6789a5ca834  netopeer2-2.0.35.tar.gz
+sha256  1e4b46f2e4889f5a8203f36f9faed6dff82093dd783bb6e3c4f14b73b7e16871  netopeer2-2.1.16.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 43f22b7e4c..fe6e0caf55 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.0.35
+NETOPEER2_VERSION = 2.1.16
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
 NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETOPEER2_DEPENDENCIES += systemd
+endif
+
 NETOPEER2_CONF_OPTS = \
 	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
 	-DENABLE_TESTS=OFF
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

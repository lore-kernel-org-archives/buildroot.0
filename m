Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453E3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB31B60A70;
	Sat, 22 Jan 2022 12:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MH2NPkZ3c3tz; Sat, 22 Jan 2022 12:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1471D607C0;
	Sat, 22 Jan 2022 12:41:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3FD1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BAD9415BD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Z3NeVuiV3YO for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:41:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F76D4155F
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:41:54 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f21so4184628ljc.2
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DySxxN/yAXbm7l1ylH/q37F79F11AU6S2cf6eMFo1V0=;
 b=G+UTBSaL4OoOICF6AJLlVIa27/EVkD3Og8r6pwpCEhuuUD3Sr9VG6+i4eXnjuw5hjK
 msSRlSOwXz+raewIpEKQ4CwXrtaV1a+F4g38/tNhdvcrQ/s5qCFvivMCW/hV3A+J+Olw
 UoYAWzzo91QRsxXcIxZbHupiMZ+UFh696GyKOj7Sajph/X8iP2s+A6x17YLka4bRqiQ0
 MA00sOtrMU6i8PIZLEXIMuLZR2kLyxLhrLtcapWCl7nC+v8bp7iMDpl4C07GvfvQhdpN
 Af9ZHkUSYKoztXd+zrL52v/PBlV3EHzHv1iMABVfu+4jib1wvwVE65awkttg4EMJnZ5y
 JC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DySxxN/yAXbm7l1ylH/q37F79F11AU6S2cf6eMFo1V0=;
 b=OJXlOhjutoi58dQ6g2D5nFQ6TNE2pVluVIlmm7dxY6lMUVYkff5j7ZQpfhcF6fBtxX
 cekFThKJO9yMzCgOS1YT1enLl7xdDjpH+wmGUW3bpWeogwtgu93VXOYdlFIQa4yrp3lX
 N9jPKfwk8QZQXqmjVEsXFXRob4RG0ilnM6A4Z8qYkQekRNzo2z750mwLuwmy+DHeqyWy
 UvHLFDeqKZBQ/LhqHaR2BRYeEm4BS56uZHIK90nMQgwQeBNJXcx3sOByUfuLvDBvopvW
 qiiiua1yZ2sFjKkENLIHPONixF4BPMPPqgGeMrsxweH95pAmXCdlhohsgn3d5I54Ufeq
 rWgQ==
X-Gm-Message-State: AOAM531YC8KSbG4tEJyWLGrJfIDgMm1U9znuBnoIySrONram7KuHABK+
 cvc66bb1YFC8Fy4etKSZmNddX0igxkM=
X-Google-Smtp-Source: ABdhPJygrgMk98yg7WqkX0oDwx/cdbQszYI4fZTBhXu65VKfdZh+kfOdexPsbIXCgg4FiGFMXH7xFg==
X-Received: by 2002:a2e:9093:: with SMTP id l19mr5593773ljg.231.1642855311714; 
 Sat, 22 Jan 2022 04:41:51 -0800 (PST)
Received: from fester.. (46-138-128-26.dynamic.spd-mgts.ru. [46.138.128.26])
 by smtp.gmail.com with ESMTPSA id b24sm557714lfj.26.2022.01.22.04.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 04:41:51 -0800 (PST)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 15:41:11 +0300
Message-Id: <20220122124111.103131-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.1.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 3 ++-
 package/sdbus-cpp/sdbus-cpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 8b87653dfd..3a0e863a86 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628  v0.8.3.tar.gz
+sha256  35e939fdd9c796522702c9c8762dd59b5c47f3440c01ba9feb9921c042780b55  v1.1.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
+sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 24904ee26f..e0fbc5c856 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 0.8.3
+SDBUS_CPP_VERSION = 1.1.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-SDBUS_CPP_LICENSE = LGPL-2.1+
-SDBUS_CPP_LICENSE_FILES = COPYING
+SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
+SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 
 $(eval $(cmake-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

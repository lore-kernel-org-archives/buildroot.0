Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B7FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 19:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF9B60A80;
	Mon, 27 Dec 2021 19:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQx32FY8vgR0; Mon, 27 Dec 2021 19:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C3860A76;
	Mon, 27 Dec 2021 19:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 791631BF386
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7550660A76
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCow2Zc2ceLE for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 19:07:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF0160A74
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 19:07:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso8743725wmk.4
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 11:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BapEvReF7kgbIFl0TihbiH51gP3te23RotcLXLplNrM=;
 b=cStk3DjkMzcCEoI3UcUPVkKvdTrKqqDVck2PJf8+dY6Gfw99795lAF3B9ydrGwMlwj
 CKKKY3TYFKuUHOTZOd+LeVUEyZGIddHeue4s4vW01I58/+kYIsj7g0gVuHLTP1ol7Wko
 6a43JYURQHVh5yIKCPgjMMBySuuI4GTW1UtgYodver0wll+brnIdaVkr3Jz//xi1iXzG
 VcozoEzF3Vv0pzp8qQA9ZTv03GmgvK9tWVnwp4sX+cRDlEZj+fvKmd3c35nw4kuSThB7
 ICQPhCPaggyb33FvR2edMGCSoz2+Lr+3ORD0xQ/JFZ9TNDQM1pgMvChhCQTFR7sHRkcZ
 BwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BapEvReF7kgbIFl0TihbiH51gP3te23RotcLXLplNrM=;
 b=VUphs9dSo9h8KsAZ6JRSsUANgGFPm8/TL5s87eL/loPQlE/aCp9pEkwpOA5NmHLthN
 ZAfXfd4Tnd36WjFUhThN4WTbiKdHxIXRfrXTmOs9mqxNV0QJCFoVmeADlVz1dGV4mPio
 3etRzbpDYDvvBlUQE81ivlHndHqx80SmL6mFxxrUEQ0quOkLUYPVDCtgfR2Us2KuwG+9
 CtO2yTD80pACiR+qWq0nWJpVfDwpQCKmIuhaYkrPvcj9nP6tgiYmZkY44+3Dhf9L/C9a
 GZ57hQRM7P2fvhxyY/M6JwbBFu0ekaw8ytHn0fZYP3592HnMahJ6qZiJIWV6O8yO0r00
 ZQhw==
X-Gm-Message-State: AOAM531puPJywoUYZXH/CZUjAkSG3FRIwEEMsp18QqN6fo48KpLmKULp
 p1E3YvBgap7CrKCgirE5GxGos9rm7Ez3dg==
X-Google-Smtp-Source: ABdhPJw+pJRgTEuH2/KIbccMzrV3/Ye3DtZ2rgJX3O55WpCli35c3+hQrwJHyWtrSXoAwFh8mnH9IA==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr14633037wmk.194.1640632045770; 
 Mon, 27 Dec 2021 11:07:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y13sm17945740wrd.89.2021.12.27.11.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 11:07:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:06:36 +0100
Message-Id: <20211227190636.2885882-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: needs threads
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

threads dependency was wrongly removed by commit
d29d1368478df621c2426820e1a6019225467234

Fixes:
 - http://autobuild.buildroot.org/results/151765cb4000643048e8d86c7a49bc8bcbf9f390

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/Config.in | 5 +++--
 package/ncmpc/ncmpc.mk  | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 4155404fcf..eda6e0bbd5 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
@@ -13,7 +14,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 91859cbc24..41fface525 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -20,8 +20,7 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
 	-Ddocumentation=disabled \
-	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled) \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-Dsignalfd=true,-Dsignalfd=false)
+	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

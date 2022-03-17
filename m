Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF05AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 19:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B078F418DF;
	Thu, 17 Mar 2022 19:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TR1ENU3cjBM7; Thu, 17 Mar 2022 19:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A2C418C5;
	Thu, 17 Mar 2022 19:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014E41BF349
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2E3640497
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0L_9OdSvpNj for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 19:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B31C402A8
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 19:01:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j17so8739423wrc.0
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpdyIfTKNSGmia8VTIyuyfx/V9Yp2nRXHMjHMdgOc0Q=;
 b=HevXWqDrcsM9X7urt0YeU54pnX9WEPjjQx7fmFAI3jIMI3a/iXwgC2tmZ3m/ZdvyRA
 4zEtLWO1GIOv7o9Hyx8MGUSmsz5IThyA5gNn6VVmmxyUyWL8rGFUjrIGpi5Xu8YsD72i
 JOI74hyQCODW3H3S1//dQsviGRAGZvNAs2hJMYKKUX0ihy20IS6qxo1orkPrVWdWVlKv
 d7nRbcJ0l0TMyZqdft6hYCXeHPxxq20vPJsw1etfATxvb7SZ+rZaY3Zj4ge2XHKXZD9o
 +5/QFX6Dba+Ty5aIVLmZixAk9eYnz2w6bj/9bx6tNFsfoVVI45zvNO/gl0hTuTmunBjz
 2neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpdyIfTKNSGmia8VTIyuyfx/V9Yp2nRXHMjHMdgOc0Q=;
 b=HsZvBYu1a4WsgAkePxVTF6xlhiKshw3yGF/6cUB9xIrh4+N8hY+h4ZwgQEPEOEeImx
 lC6An1A8qmalntCkEjY2sb6uaZm67DXiAUOKXY2sWpWfdWHEyCNXxLdySIF33DlsqtxU
 0FaukPaU82nZA0e+VcPJweMAgjJ129e+d06Q0K3GOZgsPSpbBeTw5zUZc2jfk9Xw9buh
 01lr98+6Hw4r+L0pBrH2RFupBYspw9UTWWjjD4fDAWI4YIlxkjf7kKBkLPdxRYk1PwF7
 5ed6d4txBefjAMbC6dlAz0RwZswZ2OyTzadDVcK0IMMDf5JiseMeDysY8neipfZUbSG7
 +LYA==
X-Gm-Message-State: AOAM533wtI+OycjkhcmvVMN2bs9Fujkg7SCSm5UtH5wJ1+w0Nxv31gkN
 K8ccshBvFq95MMeEP8Bf+Hlr0NXCqMk=
X-Google-Smtp-Source: ABdhPJw/xVaQMkPOkBrN6M8isytvqd/1J8y99bq0hLUwEy2Tcsiv8WE6hSQsJI5rTLxpGipLjOKF8g==
X-Received: by 2002:a05:6000:100a:b0:203:d9e5:3ba7 with SMTP id
 a10-20020a056000100a00b00203d9e53ba7mr5190281wrx.447.1647543693466; 
 Thu, 17 Mar 2022 12:01:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adfb608000000b0020229d72a4esm4482547wre.38.2022.03.17.12.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 12:01:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 20:00:27 +0100
Message-Id: <20220317190027.183976-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgee: needs gcc >= 4.9
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

Fix the following build failure raised since bump to version 0.20.5
in commit 10780e8d6df83d7a92b6dd3282e91fdc0ba369af and
https://gitlab.gnome.org/GNOME/libgee/-/commit/f0ccfe94ff731929e93601a38f931a12d52e5c2e:

task.c:59:1: error: initializer element is not constant
 static GOnce gee_task_data_async_pool = (GOnce) G_ONCE_INIT;
 ^

Fixes:
 - http://autobuild.buildroot.org/results/8354ea4192bcf2eb9c3be74d93b640db52ced10a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/granite/Config.in | 6 ++++--
 package/libgee/Config.in  | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/granite/Config.in b/package/granite/Config.in
index 726bde1b2d..9519e16d45 100644
--- a/package/granite/Config.in
+++ b/package/granite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANITE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgee
 	depends on BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_LIBGEE
 	select BR2_PACKAGE_LIBGLIB2
@@ -12,7 +13,8 @@ config BR2_PACKAGE_GRANITE
 
 	  https://github.com/elementary/granite
 
-comment "granite needs libgtk3 and a toolchain w/ wchar, threads"
+comment "granite needs libgtk3 and a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libgee/Config.in b/package/libgee/Config.in
index 07c387c985..cb33ec9ec2 100644
--- a/package/libgee/Config.in
+++ b/package/libgee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libgee is an utility library providing GObject-based
@@ -10,6 +11,7 @@ config BR2_PACKAGE_LIBGEE
 
 	  https://wiki.gnome.org/Projects/Libgee
 
-comment "libgee needs a toolchain w/ wchar, threads"
+comment "libgee needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

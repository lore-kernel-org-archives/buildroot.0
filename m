Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4740A408E5;
	Sun, 23 Jan 2022 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOGu7vvi4K41; Sun, 23 Jan 2022 21:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DEC408E1;
	Sun, 23 Jan 2022 21:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CC941BF3F6
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28F3B405F7
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEw3GegdFLXn for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 21:47:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3694E405ED
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 21:47:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so26316812wms.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MOUgNs1uCoFdwVWRAe8lLaMROzUahtFMvWAMUObVGlI=;
 b=Cyx6+Rgi89XQdzSuvhGccgXaQOW0igollSWKqoAwZsVXPWo+R3tShLnjyC3fZXx5ys
 OjMvDo5kv+4x5n/IwA9jVKqRgUIslVy9FN8S83kPn5F0O66s91Yr0/eykbJ5e4i2pYGr
 0fJum/ej/sfbvivaljr3x8gUdMLeFx0pTM0XqOzRESXuRceup2xE+jbrO9EHdKbJYTmN
 K0dHeaLPwz5U1nVlIPzovHHS/A+joqtuEpOX6alRODX19onZA5sQ1R17+zEz5etRH0aa
 hhgkha/H6BT4L2N85dQg8J+GANQMS/Sp7Baz1/CDvkU8du/rG+8QAUdCxMZiwn2l29JW
 MtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MOUgNs1uCoFdwVWRAe8lLaMROzUahtFMvWAMUObVGlI=;
 b=eH8nZ+ZwXnKNebZy71mDhUPfb5+yVtXdi6F8xk35Zk2/lJlckZoULGAbqrPdJdV5fZ
 jYB8ldrTWgc92OWWrsjTg/B5RIx7CVQlAJ9p0jvZi4y/IVLcyFV6jO01FMNQyrC6SrG5
 sRrMvAZFMBUNaQ07ksn83Uy1zqw7bZGdyDQD/IPoP0+L4U6U1t2ugjriVdMStBrVIapD
 U/ub+tJLQA64sW0SFOFDlp0USYyKwN33/tWDXN0k7FdjiKGLVr23gSD77JIreTDeJFzq
 vrS3i8jdnL7gCgqMxp0Ck780VxskwkF4dCFxe8Og5hRvFDLIYTYmk2Mdys7+VHULafXp
 R2bA==
X-Gm-Message-State: AOAM533M0UqhdjlTEmBRllgQbCCVE9piVwwq8Dag1efG5LUa9B7T8N47
 pCkJfjnhfzGtWsxYgDZumW5/OV+lnKY=
X-Google-Smtp-Source: ABdhPJyRboXLG7Sklu37ZL05sjTfqSkgd2DDMmGBByfRDIogJsBnAJxJzLKNtoiThV7Q4zGgUFROiQ==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr9187566wmc.75.1642974452292; 
 Sun, 23 Jan 2022 13:47:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i2sm2764098wmq.23.2022.01.23.13.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 13:47:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 22:45:48 +0100
Message-Id: <20220123214548.783629-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vte: needs gcc >= 10
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

vte needs C++20 since
https://gitlab.gnome.org/GNOME/vte/-/commit/eec33cce0b9359fddda35703e22bffd1f8f28852
to avoid the following build failure raised since bump to version 0.66.2
in commit 53c0c7dd01228122c7ceb44d65f2800dbcf473f1:

../output-1/build/vte-0.66.2/meson.build:144:0: ERROR: Assert failed: option -std=gnu++20 not supported by gcc

Fixes:
 - http://autobuild.buildroot.org/results/c0d1adeffbf97805a0f669d01929a56ccc66a835

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vte/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vte/Config.in b/package/vte/Config.in
index 2635a6007c..45d627885f 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
@@ -22,13 +22,13 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

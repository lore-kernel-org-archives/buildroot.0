Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EFDC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 10:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA9460A6C;
	Thu,  7 Mar 2024 10:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gnu2JbzVjhzh; Thu,  7 Mar 2024 10:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7141560AA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7141560AA2;
	Thu,  7 Mar 2024 10:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A44B1BF2C2
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 933C2407EF
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MknNKeV9NOqY for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 10:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FD58407E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD58407E3
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FD58407E3
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 10:16:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33d36736d4eso446999f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 02:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709806605; x=1710411405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=evvDTNwkDR2l71mw7Jtn0qRbtDL8xPQ1sinCYupfFAQ=;
 b=N9NvYtG8UsP3i8xunbDX6sh9YAv90Ncef8L7NAzbI3BlCbd/6kzWvNaWw/39TNYbuF
 2iaZk+S843DgpAeEIubk81TjraTfUNedlokgKE+8qNmtPbpmN1TLTjpgvkTvEldlFoxR
 rb4cFfUyHlnwvQvOIySsc5deXRu8ha941fCH3cy+tRZrd2vYxS7i+eiplOpMeXZ9s02X
 I2cgfwp/nSp/5961DTIKELmKE3OZHxB2yRkdT/sU1u+VZ9NBBhsXYHie6r9LYscduL0H
 vRWtXjNeZUTbB153dfnPT9mhqHNdagmgZQJ4F1QeZYmq7Z9z3SgcHf3Y9CkwRLYJ9qFF
 NqjQ==
X-Gm-Message-State: AOJu0YxOe7HGgHFe96TKQs9xrE9FmJZgwpXqi92z+Rd/HSRLEyK53wF/
 xEZttqbJTCNDP6tBAH3zIWEWK0hoXzZN7tWJXO2MLzWwZ7wxn9Uu0oBoYDjF
X-Google-Smtp-Source: AGHT+IHzoguSAJWmj/EqVbiZ/zwHp+8X2IVH8pEwLikkull8K6dXYGA8fu7hI2nGcee2Ca/OXQ74OQ==
X-Received: by 2002:a5d:4404:0:b0:33d:82cb:6595 with SMTP id
 z4-20020a5d4404000000b0033d82cb6595mr12878738wrq.68.1709806604697; 
 Thu, 07 Mar 2024 02:16:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i8-20020adfb648000000b0033e0ed396bdsm19778222wre.106.2024.03.07.02.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:16:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 11:16:38 +0100
Message-ID: <20240307101638.15609-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709806605; x=1710411405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=evvDTNwkDR2l71mw7Jtn0qRbtDL8xPQ1sinCYupfFAQ=;
 b=C37pnLwYIhQj+YnEU3cQv+iHnxxi88KKO1+KKlS1Pqj7GCPeHgrOoaaP6p2S3KZITG
 EQa1lUHgpxI8Fz6GmkoX65uzR3uE31YDIQ4ob2cn6huvBB/e0OKJDoOcC/yd5p0ljiJn
 4fXUJ9VJih1ENdfYin6oGJxEA/ps08wTcU3y4bl6oUdfzK2YY2TVNfZ/SNvz9ZWdDwQu
 ZOgsfrcNDdaa6NuZSPH1g/RPJBKR9LnsJa8saUNtWcba6Kylq2yjQ/E9o7x0reV7G4Fo
 /5oLCmrK5Hq6lACy2rtVQtZ8kJ5VKKyV3Z6RAn//Xq8FLA2gig3Eh/P8psaINJexbLXF
 FYZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C37pnLwY
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: needs threads
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

threads are mandatory since switch to an active fork in commit
456a7398316655ad0b669635f580e4887c24a700:

CMake Error at /home/buildroot/autobuild/run/instance-1/output-1/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Threads (missing: Threads_FOUND)

Fixes: 456a7398316655ad0b669635f580e4887c24a700
 - http://autobuild.buildroot.org/results/b600582d9c5407c7324af70d61fa5c1f96d929f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
 package/zxing-cpp/Config.in                   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index cad02a18d4..26cdf87d39 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -748,11 +748,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
 	depends on !BR2_STATIC_LIBS # zxing-cpp
 	depends on BR2_USE_WCHAR # zxing-cpp
 	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zxing-cpp
 	select BR2_PACKAGE_ZXING_CPP
 
-comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library"
+comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
 
diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 0d8b79538d..b72a00ec35 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,12 +1,13 @@
-comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library"
+comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

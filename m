Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9739BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E744E417D6;
	Sat,  2 Apr 2022 17:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEqQT779hxJn; Sat,  2 Apr 2022 17:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC34E417FC;
	Sat,  2 Apr 2022 17:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 812591BF96B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FDC260BA1
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4baHS6IaZzS for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67B7D60B9F
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:11:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id q20so3470703wmq.1
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ckc5jaOlp4DoVF7YDBXBnjq8FvJQq+PLujICyU2oLWs=;
 b=LYPgw/oQvx6eDSOipYxCjIL9FCkNhZadKoeQ4FlidDRr0HXEcQSqDlKJtctZnxYoYj
 tdxePdhz69AIvEYM2Xrae3cEeHQApB4x1X9SCu/pdVZ1JNr4OIxPJk+JCuRQGMSYR1wP
 MI9DD+XSdVadSZOrtEWc0m6wy/g5mhizR5f9JX3pqImarrW/FkZTOegUCjO9IlK9efAu
 KXNp3GDeNU/i/a6FWGzSRIJyKicz3c63S6yN7E+WoKPRgXQQupZ+3bD8xslYvIePcI6L
 etpRVuBrFSS4+BMMxqzMCV34RZGPNTKc4TZhhNwSVeg3oX9XO4CNZcCnK8JDEoukQsXB
 pZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ckc5jaOlp4DoVF7YDBXBnjq8FvJQq+PLujICyU2oLWs=;
 b=32VQu1J89ugzJlmTI1oRUAY2ZAgVwFCfvpISt4uZGcv5r3EWMIdGXfCxr+pci5c7PH
 f6wyfecKj58a6x9XU+nIy8lTk6dEeBDgo3e6m2qol+ytnhjQetodh3IIWSVc/glb2xnp
 BbuxdEMo0wfcaro0OyPqihYufKWBmB2e7hP9wQ8tlX0cHEW6fcryn2mYG1IgqhO/EJxj
 RDx0mClxx2H79kOfFJQeKi/M1SjPhvWHI1Nr578sQUIftlSG5MowTrUtT1uFDinAlOnL
 ncDCY78FHSMQFRterLv2ELZT5vDmvH3wkXTc1izqukmuv8Pn+eCMZXAHE/KjQ23vAQj7
 OMVQ==
X-Gm-Message-State: AOAM532SdR6bAFBMSLkZd8TRhx3hy8R/2FdGhQ/bRHfQ7TYFZDbuDG5a
 f1DLPw2mfs4HiwK+BCz/aNjFY7Mvl8s=
X-Google-Smtp-Source: ABdhPJwXEhnZXo9oTuNcCtgQRu8sppKStLl1Tmre7tCjIhFTJ+9OZbSXzXyCs6OUCiWI1Cmlnb56Pg==
X-Received: by 2002:a05:600c:4fd4:b0:38c:cc3f:ac01 with SMTP id
 o20-20020a05600c4fd400b0038ccc3fac01mr13246349wmq.206.1648919515414; 
 Sat, 02 Apr 2022 10:11:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a1c2602000000b0038ca9ffac53sm4766634wmm.11.2022.04.02.10.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 10:11:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 19:10:15 +0200
Message-Id: <20220402171015.1180992-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: needs C++
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

wireshark needs C++ since switch to cmake-package in commit
7cb7fb8191fc52c1e2cc8b4b15ea52fd12c30d9a:

CMake Error at CMakeLists.txt:32 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/1ce9bc2a2330e27dfaceae682139d222feb806ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 95fc9b38f3..fdeb9da259 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
@@ -45,8 +46,8 @@ comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host
 
 endif # BR2_PACKAGE_WIRESHARK
 
-comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
+comment "wireshark needs a toolchain w/ wchar, threads, dynamic library, C++"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

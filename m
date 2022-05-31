Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3761FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 19:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C661941C9F;
	Tue, 31 May 2022 19:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uxeRDa8MjVi; Tue, 31 May 2022 19:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25C141C83;
	Tue, 31 May 2022 19:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C97B1BF85D
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B89B41C7B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 19:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49s2ch-FBPHb for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 19:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBCF441C72
 for <buildroot@buildroot.org>; Tue, 31 May 2022 19:13:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1728011wms.3
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nz+hdE7kLdUNWoFK4e0iQfwni++M9hYta3PmpRs/WL0=;
 b=aCvdIhYE5lVYgoJ9ZTG8fOqByNV0hQUJOXMBX0yfa9AxvIEWpiYeyTyx83O03Y1uz8
 jWaGdrpnrvTpA2dJQBYp/9nNrUQWwuhTjM/CfhkXDHAyBiuHjBNGWYdqn/tvZgK2bIo3
 OKGeVTN0g+7Yt/ribA+Nzh/aA8G0Yi4s2/rzfhuEASMAhfV8dQQnlcPtjrB0iEjcsLhe
 9WFbnkprvB7CUZTDD9QX+TK2PBa+SkAa2CeJlVhmUyhUiOye96nQ8hcPPx/cn+Q9lbrh
 vCH1vMfl0xlM/enylZAOMahGtT8X8Ov5XwqrQ+6F/kUofZkYUE6sjqFz1o7kgzujoC0S
 eOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nz+hdE7kLdUNWoFK4e0iQfwni++M9hYta3PmpRs/WL0=;
 b=yLXWQ2GFKlX+4X34U8GBgRHSVow9zWChrWQRF7/4xhhS7QVoTs5EDkvJpD2rAX5ohF
 mTiM49kfgLWRYGOO89QUH/8/GkCTWjV8u26EiJ6YJjEsFBcbJUW7wH12m1zKb1Ow0n2b
 s+X+eZmMvIA/E5RKh40+lRSn6MWbnlDW2id6cmldyjBM5b0/P5OggjBxr7STL65FPv5M
 +/xIZNva0WSEdtUiXLaRhAhCqabKhDu32YAIknUz9V1MEDdlbBma0DCd4Hgp8Uo1rMHt
 R6s7C13Kd7bgUOeaIIypP6t0S6x3unmLmirFz05y0mBIdqp4jwKfujwSjSpzyriX0reA
 KEXQ==
X-Gm-Message-State: AOAM531vK/hY5mwwgXJ8lguPNwfo7uN798Y0Dnta/L6qo7jB0evx22DP
 x61MVXPB7rusHjqSSOy4yDxdHl3R+k4=
X-Google-Smtp-Source: ABdhPJzKC5S5sU/a1z+g9SPzYALfJ2gK+sNR52qmRxl5yStVjz2ulWHnzOI/rQNxI13TqF2G04XqYQ==
X-Received: by 2002:a05:600c:2157:b0:39a:a4d0:54e1 with SMTP id
 v23-20020a05600c215700b0039aa4d054e1mr15023251wml.14.1654024381717; 
 Tue, 31 May 2022 12:13:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a5d6ace000000b0020c5253d914sm12444288wrw.96.2022.05.31.12.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 12:13:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 21:10:36 +0200
Message-Id: <20220531191036.107607-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: fix version in zlib.pc
 when building statically
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

Fix the following static build failure with transmission:

checking for ZLIB... configure: error: Package requirements (zlib >= 1.2.3) were not met:

Package dependency requirement 'zlib >= 1.2.3' could not be satisfied.
Package 'zlib' has version '', required version is '>= 1.2.3'

Fixes:
 - http://autobuild.buildroot.org/results/b3b882482f517726e5c780ba4c37818bd379df82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-version-in-zlib.pc-when-building-.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch

diff --git a/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch b/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch
new file mode 100644
index 0000000000..749c45ddca
--- /dev/null
+++ b/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch
@@ -0,0 +1,53 @@
+From 9fcc446306f27eb253545540ce28403874b899fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 May 2022 23:25:21 +0200
+Subject: [PATCH] CMakeLists.txt: fix version in zlib.pc when building
+ statically
+
+When building statically (i.e. with BUILD_SHARED_LIBS=OFF),
+ZLIB_FULL_VERSION is not set resulting in an empty version in zlib.pc
+and the following build failure with transmission:
+
+checking for ZLIB... configure: error: Package requirements (zlib >= 1.2.3) were not met:
+
+Package dependency requirement 'zlib >= 1.2.3' could not be satisfied.
+Package 'zlib' has version '', required version is '>= 1.2.3'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b3b882482f517726e5c780ba4c37818bd379df82
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zlib-ng/zlib-ng/pull/1278]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a62a95e..6a26d59 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -150,8 +150,10 @@ if(ZLIB_COMPAT)
+     add_definitions(-DZLIB_COMPAT)
+     set(WITH_GZFILEOP ON)
+     set(SUFFIX "")
++    set(ZLIB_FULL_VERSION ${ZLIB_HEADER_VERSION}.zlib-ng)
+ else()
+     set(SUFFIX "-ng")
++    set(ZLIB_FULL_VERSION ${ZLIBNG_HEADER_VERSION})
+ endif()
+ 
+ if(WITH_GZFILEOP)
+@@ -1068,10 +1070,8 @@ if(NOT DEFINED BUILD_SHARED_LIBS OR BUILD_SHARED_LIBS)
+     set_target_properties(zlib PROPERTIES DEFINE_SYMBOL ZLIB_DLL)
+ 
+     if(ZLIB_COMPAT)
+-        set(ZLIB_FULL_VERSION ${ZLIB_HEADER_VERSION}.zlib-ng)
+         set_target_properties(zlib PROPERTIES SOVERSION 1)
+     else()
+-        set(ZLIB_FULL_VERSION ${ZLIBNG_HEADER_VERSION})
+         set_target_properties(zlib PROPERTIES SOVERSION 2)
+     endif()
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

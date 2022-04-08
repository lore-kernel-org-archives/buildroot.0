Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE97C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D4EB41180;
	Fri,  8 Apr 2022 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bXNgFeXXkFT; Fri,  8 Apr 2022 21:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373AE401DD;
	Fri,  8 Apr 2022 21:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9774C1BF3EA
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9537E84527
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 21:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qq6lMicWyrD9 for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 21:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9913C84524
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 21:20:46 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p135so6235059iod.2
 for <buildroot@buildroot.org>; Fri, 08 Apr 2022 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XLEn84rE/mcaEVsDgbTpaPdXzlJMgxEMrj0lCvOlsIA=;
 b=atM6bBzgvWBR6mfuHs6nluIY8B5+HGJfqTN6kT6mxiASN0BHCb64lrnjsFUT4Iox6Z
 LpKqssB2xbUb8KuqRlMx3WPaZmlKqAvGUVLsV3+XZANCBHDU3xG+ziyEC5x/dFABdKL4
 7xALjT+tyXNKSxthvhOtO24+TreAqL+90xlMXIAqfEGvOnXNy7mf3cP0NmEJQDU6+lwe
 Woy/YdgVISa22mGz3Arai0WXqVgaYNO6hn4CGG9bXwBkryg2oEvcsjd1xTb+7HbNxXE2
 owu7NGLYjiHqp3mwQ4040HmtgqRNbPPfzTvCPdDDH8d84h1HYz2e113NxMLl3W7MrWyO
 THcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XLEn84rE/mcaEVsDgbTpaPdXzlJMgxEMrj0lCvOlsIA=;
 b=O3O/LdEk42r4VR8cNOQPSNJgbrRzkoCk2ZW6eVo3vlMhaz8JisTYyYeHOtOhY5u7Xf
 CktWRput0q8DHb9Ihjre7ljncshf15BeophmOIfTeNHLYku6C+ktr452Sgtei37hfGkT
 bloV/rKAuuCXunjpSocWVyjMuiK4/1KX9YNtEBPETx8xAy1zvBusGBQ4PtzPs56HSABV
 JvUITfy4SLx33QyjIDOStklC4zvTCUM29VJ+Vcuf1zrIo2FMabdmLwVUhi78tcdcb17n
 zlrNNXq3dcppoN/kgh3eULd/TvKruNGKh7GdUFkVUCSazELPEalYrJQcJs8VG3YcPJMa
 Irow==
X-Gm-Message-State: AOAM531xO+eIdBMrE5SvjSj6r4FH6eJx0ioZ5csv89/Su8MneqQfLyeH
 QKxm/JmJcSndfk7KBiUWj8ZCpHkbM1jOzw==
X-Google-Smtp-Source: ABdhPJzuOzQ8VoMEq/L78AXzDjKqOx2z0nb/noagKGP4Af7Dq1ioeoLv/muwHWiSogd0NLtH4n2UWQ==
X-Received: by 2002:a05:6638:24e:b0:323:6014:2c8 with SMTP id
 w14-20020a056638024e00b00323601402c8mr10445901jaq.23.1649452845350; 
 Fri, 08 Apr 2022 14:20:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 20-20020a056e020cb400b002ca35c7e099sm10356990ilg.46.2022.04.08.14.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:20:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Apr 2022 15:20:43 -0600
Message-Id: <20220408212043.3856376-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.20.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...01-build-add-option-to-disable-tests.patch | 58 ------------------
 ...002-meson-only-require-cpp-for-tests.patch | 59 -------------------
 package/wayland/wayland.hash                  |  6 +-
 package/wayland/wayland.mk                    |  2 +-
 4 files changed, 4 insertions(+), 121 deletions(-)
 delete mode 100644 package/wayland/0001-build-add-option-to-disable-tests.patch
 delete mode 100644 package/wayland/0002-meson-only-require-cpp-for-tests.patch

diff --git a/package/wayland/0001-build-add-option-to-disable-tests.patch b/package/wayland/0001-build-add-option-to-disable-tests.patch
deleted file mode 100644
index 5ecf100d64..0000000000
--- a/package/wayland/0001-build-add-option-to-disable-tests.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 88f1605a826ca0c2ff02be6f4cf9ecabf68e8341 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 3 Mar 2020 15:27:51 -0700
-Subject: [PATCH] build: add option to disable tests
-
-When building for a product, tests are not needed.
-
-Besides, one test requires a C++ compiler, which is not always
-available.
-
-So, add an option to configure to disable building tests altogether.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/66]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index cdb66bc..714a86d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -84,7 +84,9 @@ subdir('src')
- if get_option('libraries')
- 	subdir('cursor')
- 	subdir('egl')
--	subdir('tests')
-+	if get_option('tests')
-+		subdir('tests')
-+	endif
- 	if get_option('documentation')
- 		subdir('doc')
- 	endif
-diff --git a/meson_options.txt b/meson_options.txt
-index de588d1..4433fa0 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -6,6 +6,10 @@ option('scanner',
-   description: 'Compile wayland-scanner binary',
-   type: 'boolean',
-   value: 'true')
-+option('tests',
-+  description: 'Compile Wayland tests',
-+  type: 'boolean',
-+  value: 'true')
- option('documentation',
-   description: 'Build the documentation (requires Doxygen, dot, xmlto, xsltproc)',
-   type: 'boolean',
--- 
-2.25.1
-
diff --git a/package/wayland/0002-meson-only-require-cpp-for-tests.patch b/package/wayland/0002-meson-only-require-cpp-for-tests.patch
deleted file mode 100644
index 84d0e4cf6f..0000000000
--- a/package/wayland/0002-meson-only-require-cpp-for-tests.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 4c2105312379b62dc84f6eaaf26e2ab293d51b92 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 16 Apr 2021 02:32:38 -0600
-Subject: [PATCH] meson: only require cpp for tests
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/130]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- meson.build       |  2 +-
- tests/meson.build | 16 +++++++++-------
- 2 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 12b4641..cdb66bc 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project(
--	'wayland', 'c', 'cpp',
-+	'wayland', 'c',
- 	version: '1.19.0',
- 	license: 'MIT',
- 	meson_version: '>= 0.52.1',
-diff --git a/tests/meson.build b/tests/meson.build
-index a32ac50..2e11af4 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -64,15 +64,17 @@ executable(
- 	dependencies: test_runner_dep
- )
- 
--test(
--	'cpp-compile-test',
--	executable(
-+if add_languages('cpp')
-+	test(
- 		'cpp-compile-test',
--		'cpp-compile-test.cpp',
--		wayland_server_protocol_h,
--		include_directories: src_inc
-+		executable(
-+			'cpp-compile-test',
-+			'cpp-compile-test.cpp',
-+			wayland_server_protocol_h,
-+			include_directories: src_inc
-+		)
- 	)
--)
-+endif
- 
- sed_path = find_program('sed').path()
- 
--- 
-2.31.1
-
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index e9dcb63a90..cd4cb1a474 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-January/041692.html
-sha256  baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15  wayland-1.19.0.tar.xz
-sha512  d8a86f5e23e4a88e7c84b82fdb51eb350419086afe462ecb2f4d5c3ba9290ede310cbbcffd60215219ddccf5bad4adec21a5ebfbef6577200f66ac7a1b64a5ef  wayland-1.19.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042064.html
+sha256  b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725  wayland-1.20.0.tar.xz
+sha512  e8a1f410994b947f850799bdd0d95a2429d8467f853e62a0ab3915a4e9fe130f8aa977e03715114ab740c6ec546edea63d275ce7f927d4f3029ea126e6a7d215  wayland-1.20.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index ecfe95d68a..4c19875bba 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.19.0
+WAYLAND_VERSION = 1.20.0
 WAYLAND_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

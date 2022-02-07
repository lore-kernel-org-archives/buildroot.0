Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946B3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31218402A7;
	Mon,  7 Feb 2022 17:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBi8BwHQAQW9; Mon,  7 Feb 2022 17:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BDC40265;
	Mon,  7 Feb 2022 17:27:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECE4E1BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9455401EE
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFxRFxBNuevN for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:27:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D36F40265
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:27:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c19so11383582wrb.10
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 09:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxQVMlIIAyGJnMX/eNWNle7CMpMga1IylBYcc1gm4K4=;
 b=F5Ol4ABTRf5sbUmv182Sv4dt0lcKLFeXUgtE9rZqEYpQusru8v+tUVR95eWKVMKZaz
 VmE6pSnGk3JHtPKlxVZTd+W9BgcUyp5sSY84VyjEAmahv8Y6E3ly9QqGpIgnBdKnnelQ
 //pFtbWQlce172oq+HkuxE77RUz7Uwr6j03WN4PKzkxgwxmzWKvPjLDXMnTiN3HeDdA7
 jjDp6aTxI+yVVck4Xsya2iNUfulZyHHG/owo43CrOeNC2f24IAYQczTp7UbRbuOG/FKg
 jgU5LvTVo/Cu7nWYWZYXzTollKNVlF8+dMcjAzvW68y/L9ugjQYk2AsRZlSSQKIkdYhr
 1X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxQVMlIIAyGJnMX/eNWNle7CMpMga1IylBYcc1gm4K4=;
 b=WpgVC5eYHPFJz1mrgBvbo8BF3u9Q0WoaoqR4jDVEJ8U7ugVmuimOLXsDkbHnOsbi4q
 lpSV8bVf4LBLylAMHx5ngFGwbc2GAax1ThqvORApnjWXEQMmYOFYPUPWiglPIqw5SEV1
 h/XFfE2XCE7GQ8x6yQqq5K10iOLkselloc+Us1PFWxRYRjPdw7PFwFuHIHAYVwhoevAH
 cyyROFGLa2bDJyj9bihIsebQorRH78cjwGkJlEg54noENAOQMJU81nu9Fk6NSwjfQJ2i
 qXmIVH/4o4o/DRi6qriejY5JV8rV7HxcUmcfcKZBe2hUIKsXa6XWAB0tKxL38Y93esv7
 aIPw==
X-Gm-Message-State: AOAM530weXb6iePxgJDFsEuke+cn96NmiOWzlGEGZaSh4DOqIigISyfq
 3dv9DCf1H9ZiS/sr7CxzGuoeL8YTdww=
X-Google-Smtp-Source: ABdhPJyE0ldx857gAOvt3wdaearxdnhZvR0y309RgDuXUFrOpLey345AC8JCY9MTvA2S3jRgbcKAyg==
X-Received: by 2002:a05:6000:16c7:: with SMTP id
 h7mr382028wrf.93.1644254838547; 
 Mon, 07 Feb 2022 09:27:18 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p15sm4502835wma.27.2022.02.07.09.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 09:27:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 18:25:00 +0100
Message-Id: <20220207172500.3041019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libusb: add -latomic to
 libusb-1.0.pc if needed
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libusb unconditionally uses atomic since version 1.0.25 and
https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
resulting in the following build failure with pcsc-lite or openocd since
commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:

checking for libusb_init... configure: error: libusb not found, use ./configure LIBUSB_LIBS=...

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
 - http://autobuild.buildroot.org/results/b59b30cbe0e27399db5c7586f369104e68a1589a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-link-with-latomic-if-needed.patch | 39 +++++++++++++++++++
 package/libusb/libusb.mk                      |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch

diff --git a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
new file mode 100644
index 0000000000..5f6c88e57d
--- /dev/null
+++ b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
@@ -0,0 +1,39 @@
+From 0b857081d687f7ee41483a3d7e9846af44a5ba7d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 7 Feb 2022 11:55:54 +0100
+Subject: [PATCH] configure.ac: link with -latomic if needed
+
+libusb unconditionally uses atomic_fetch_add since version 1.0.25 and
+https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
+https://github.com/libusb/libusb/commit/eed8a371ea53939096ba94d44001e0637d042572
+but some architectures (e.g. sparc) needs to link with -latomic to be
+able to use it. So check if -latomic is needed and update libusb-1.0.pc
+accordingly to avoid the following build failure with openocd:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libusb/libusb/pull/1064]
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index f6cf2f9..002bcf6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,6 +152,7 @@ if test "x$platform" = xposix; then
+ 	AC_SEARCH_LIBS([pthread_create], [pthread],
+ 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
+ 		[], [])
++	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
+ elif test "x$platform" = xwindows; then
+ 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
+ else
+-- 
+2.34.1
+
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 1e82cb9a85..aa306e295d 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -13,6 +13,8 @@ LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_CPE_ID_VENDOR = libusb
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

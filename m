Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45439C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 16:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92CB81A65;
	Mon,  9 May 2022 16:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xS3worKHH3aS; Mon,  9 May 2022 16:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C464A813EA;
	Mon,  9 May 2022 16:13:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 775661BF281
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B33813EA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWaRuwH7VgK8 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 16:13:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8B3813BE
 for <buildroot@busybox.net>; Mon,  9 May 2022 16:13:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so20172857wrb.6
 for <buildroot@busybox.net>; Mon, 09 May 2022 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vdyPEI1dDg+4bEkFfeFDOvKX/zVx6s6Y00A+6V5T94w=;
 b=IXSHsZXZburmVulbxYLb6x2MZIiDUY4VX16VxmwLqG7crqYzwKMGDuqev9zwfXLN2N
 1hRGLKOPCI2lK7bd6NQttBzLi8bsJvn/iwxh/u0NTWaRqJvLZOchBS7MdKr6sgs5eGIo
 9yVdBEGm44aW2Gxe2WlBNJjpPADKaUdm9Xj/2bJpW1sURfx8FUDRZslFFKwYD/VIqZyb
 iODnfhImpAZ9YuyfCKPTx/UG4StQuMQa+atLHtllj4K3qGn/SNyKc5Rlo2YCd3tAJ0A2
 Pg9tMvD6WfX1q/At8ixAG1bGWsRfR60yx+O7MYVlPHdB4bgOm5AHEmilpWMJE1j/N29J
 EktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vdyPEI1dDg+4bEkFfeFDOvKX/zVx6s6Y00A+6V5T94w=;
 b=zpqrqZ1Wm0gXl4qHa7VDyOoia4oZkdOOavqEmgFq4fdpKGLvSOU1uyiYDWRIfcg0Cq
 BUeYn30k4ohh2w9QoAqzbo90PH756lMWw+fcL/68pv/8X2UvxLGz6JRUp8dnfqHJACJ7
 u96ykhJ07aAkHwWivnl03hBnobkD+cqPIqx3L5cWieOx9hZKGzseuig/0QQ106Nbc1Nb
 vN6BzylhlIxx4BRorZBJ7G7byvGhI2SUlrHjVgxoM6El7HdHUMwhxc/vZj4ZokqQ41BX
 LtJLbxwF9mP5RQezXZsE9cpL15A3qdxS8NtS15YI35HjUAuXty2jxknQJhPp3PuD67IV
 4hKw==
X-Gm-Message-State: AOAM533CKm6nva218OjpeyzbkHVMywuX8ZTrqlNAKYrEGb2WC5+QhzS9
 AwItBmFI+KUFJCv+WrF1dGA0QCtDtvc=
X-Google-Smtp-Source: ABdhPJxF6t4bvgTpCaj5knei/Z8bcRC1e6yPs2QRA4DkNpPQfsuptBh5/6zfwDE4LnEIYDOZGuRSJw==
X-Received: by 2002:adf:f543:0:b0:20a:e059:2f80 with SMTP id
 j3-20020adff543000000b0020ae0592f80mr15010688wrp.495.1652112790167; 
 Mon, 09 May 2022 09:13:10 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bu21-20020a056000079500b0020c5253d8c5sm11244936wrb.17.2022.05.09.09.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:13:09 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 May 2022 18:12:58 +0200
Message-Id: <20220509161258.188861-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...igure.ac-fix-static-build-with-hwloc.patch | 54 -------------------
 package/htop/htop.hash                        |  4 +-
 package/htop/htop.mk                          |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch

diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
deleted file mode 100644
index 0ac79766c..000000000
--- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Apr 2022 17:27:01 +0200
-Subject: [PATCH] configure.ac: fix static build with hwloc
-
-Retrieve hwloc dependencies through pkg-config to avoid the following
-static build failure:
-
-checking for hwloc_get_proc_cpubind in -lhwloc... no
-configure: error: can not find required library libhwloc
-
-This build failure is raised because without pkg-config, hwloc
-dependencies such as libxml2 are not retrieved:
-
-configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
-configure:9022: /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc -o conftest -D_GNU_SOURCE -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lhwloc  -llzma -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib -lncurses -lm   >&5
-/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
-topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
-
-Fixes:
- - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ecac1ecf..6bb7eb69f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -456,8 +456,18 @@ case "$enable_hwloc" in
-    no)
-       ;;
-    yes)
--      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
--      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+      m4_ifdef([PKG_PROG_PKG_CONFIG], [
-+         PKG_PROG_PKG_CONFIG()
-+         PKG_CHECK_MODULES(HWLOC, hwloc, [
-+               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
-+            ], [
-+               AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+            ])
-+         ], [
-+            AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+         ])
-       ;;
-    *)
-       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d7c39be4d..908dd32c4 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
-sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
+sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 1e7b171a1..e1aba23b3 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.1.2
+HTOP_VERSION = 3.2.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

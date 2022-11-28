Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F35C4167D
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31BFE401A2;
	Mon, 28 Nov 2022 12:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31BFE401A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtlkKkB5ALeH; Mon, 28 Nov 2022 12:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B73640164;
	Mon, 28 Nov 2022 12:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B73640164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D73EE1BF334
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C0560AAF
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C0560AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDbvHJoBmkGP for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E248860A81
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by smtp3.osuosl.org (Postfix) with ESMTP id E248860A81
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:27 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S7;
 Mon, 28 Nov 2022 20:35:06 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:18 +0000
Message-Id: <20221128123418.2197-6-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr48tr48Ar1fArW8CFy7trb_yoW7XFWxpw
 4Sqry3GrW2g3WfCFWxW3W7uF1ayrs2kr45J3Z3Jw10vryfAF4kXr1UJa18AryDA347J34x
 X3W5Kr4UW34DKFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR_WrAUUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzgXHjWI0WpO7awAAsO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=t2ROH
 x1AI2B7UBkSegCAerGOQVtGZVFPMovi0th/WE4=; b=nJ9YMIBn9THT/kgf/GVSS
 A1YiBzO0Ao8BZvovSIn8tMhzDYIozfAUKvbIiWFkhy5d4hy3OLHQcaLEDkM6WWqG
 9B4XZS04c6dsml+BufWN24xveOgxj2eV1S8k8henRAS/fhyTGdmhZrcptl6ekzJR
 RQ6u3mBqygmQ8juoy/cxsI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=nJ9YMIBn
Subject: [Buildroot] [PATCH/next 6/6] package/micromamba: new package
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

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/micromamba/Config.in       | 43 ++++++++++++++++++++++++++++++
 package/micromamba/micromamba.hash |  3 +++
 package/micromamba/micromamba.mk   | 43 ++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/micromamba/Config.in
 create mode 100644 package/micromamba/micromamba.hash
 create mode 100644 package/micromamba/micromamba.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 462a9511aa..b0250faed5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2740,6 +2740,7 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/libsolv/
+F:	package/micromamba/
 F:	package/open-isns/
 F:	package/reproc/
 F:	package/termcolor/
diff --git a/package/Config.in b/package/Config.in
index 29153048cf..620c9e24d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2499,6 +2499,7 @@ comment "*                                                      "
 comment "See the manual:                                        "
 comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
+	source "package/micromamba/Config.in"
 	source "package/opkg/Config.in"
 	source "package/opkg-utils/Config.in"
 	source "package/rpm/Config.in"
diff --git a/package/micromamba/Config.in b/package/micromamba/Config.in
new file mode 100644
index 0000000000..998809f452
--- /dev/null
+++ b/package/micromamba/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
+	bool
+	# See libmamba/include/mamba/core/context.hpp
+	default y if BR2_arm && (BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A)
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+
+config BR2_PACKAGE_MICROMAMBA
+	bool "micromamba"
+	depends on BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # fmt, reproc
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	select BR2_PACKAGE_YAML_CPP
+	select BR2_PACKAGE_SPDLOG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSOLV
+	select BR2_PACKAGE_REPROC
+	select BR2_PACKAGE_TL_EXPECTED
+	select BR2_PACKAGE_CLI11
+	select BR2_PACKAGE_FMT
+	select BR2_PACKAGE_TERMCOLOR
+	help
+	  micromamba is a small, pure-C++ reimplementation of
+	  mamba/conda. It strives to be a full replacement for mamba and
+	  conda.
+
+	  https://github.com/mamba-org/mamba
+
+comment "micromamba needs a toolchain w/ wchar, threads, C++, gcc >= 8"
+	depends on BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/micromamba/micromamba.hash b/package/micromamba/micromamba.hash
new file mode 100644
index 0000000000..e584c3bd28
--- /dev/null
+++ b/package/micromamba/micromamba.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7303d983b49a1a52b302ceae355af1c05afef3a07aa3ad6dd27c36d64c43f991  micromamba-1.0.0.tar.gz
+sha256  41fd98a468e39d319911bd94f4e65d6ad6a7ea66559dd5aa4112f138ff9b629a  LICENSE
diff --git a/package/micromamba/micromamba.mk b/package/micromamba/micromamba.mk
new file mode 100644
index 0000000000..188864444c
--- /dev/null
+++ b/package/micromamba/micromamba.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# micromamba
+#
+################################################################################
+
+MICROMAMBA_VERSION = 1.0.0
+MICROMAMBA_SITE = $(call github,mamba-org,mamba,micromamba-$(MICROMAMBA_VERSION))
+MICROMAMBA_LICENSE = BSD-3-Clause
+MICROMAMBA_LICENSE_FILES = LICENSE
+MICROMAMBA_DEPENDENCIES = \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
+	cli11 \
+	fmt \
+	json-for-modern-cpp \
+	libarchive \
+	libcurl \
+	libsolv \
+	openssl \
+	reproc \
+	spdlog \
+	termcolor \
+	tl-expected \
+	yaml-cpp
+
+MICROMAMBA_CONF_OPTS = -DBUILD_LIBMAMBA=ON -DBUILD_MICROMAMBA=ON
+
+# See libmamba/include/mamba/core/context.hpp
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+MICROMAMBA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D___ARM_ARCH_6__"
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+MICROMAMBA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D__ARM_ARCH_7__"
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MICROMAMBA_CONF_OPTS += -DBUILD_STATIC=ON -DMICROMAMBA_LINKAGE=FULL_STATIC
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MICROMAMBA_CONF_OPTS += -DBUILD_SHARED=ON -DBUILD_STATIC=ON
+else # BR2_SHARED_LIBS
+MICROMAMBA_CONF_OPTS += -DBUILD_SHARED=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

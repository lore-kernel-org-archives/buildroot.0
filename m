Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E55AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D03B4405E9;
	Tue,  4 Jan 2022 22:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmKHnuKDbAs3; Tue,  4 Jan 2022 22:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87D1E4063E;
	Tue,  4 Jan 2022 22:03:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90FED1BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C66C823F6
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql8X5KC3LcI9 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45DC481D4D
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o3so20701136wrh.10
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8v7r2ed8Kw7KaJiUCLM0Xn/90wXKYYXLe1I6LWbjUs=;
 b=VEtCkL9Ui+IfHJvd3op5PFvQjoQRvVawwb51iJuKn3WMfWUlIQNPKvEd1cPMPI4qgz
 5dyUfRmRXznKGlDQKfrVIAkNkuK+z2HDp1V8fKz0pT/CCmksTd7KjHxdSCKUhjbsmdwn
 6Uc1pRcwz5f7eKdd5qckqhLPnBK/r70r/FIR6YW/UYNdtYf63y6ivwaF6EMF31+2OnmX
 vSPUSg/JMveKb+2U6vflpVVhzjYmyHvgqJEkqjEXux+netChwNkDeDpGdH1/4fPun7Lk
 WmPQudF3NGBbPLDnFcTA+VnXIw7nBFxuAbS53afpJ1MXq42BWHKPfuQtBIGehWAYllry
 zoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8v7r2ed8Kw7KaJiUCLM0Xn/90wXKYYXLe1I6LWbjUs=;
 b=RcBgJV6EBM2rPCHd1pPG3hGfSINGR+qP3JTcMwrCaHWAikDw8aFCTYyi7JGb+fKABx
 MD4VyK/H31sWO12ik/bcZ2qyM6Z9SYpnyY6f6DWUo8H93U7wchDb2AQ/R5MlFAcgqHDM
 vw/6IdvkUdzOLI1jvIIrfoRwmxIv1B0wyKQQT8rk5phQLMve1VZD0HL7axpmPjLcOphJ
 pgLn8S73cWD6JyEGH8zc8KW43PibFmWXhwaXZqmCaamGBI7+Ms6pJWtJ9BZW1XRoylBH
 iLVVUgDpkUnmK8jWiCCaPBIr6Ld1apTogzxptp1QDQFPkTvwFWITzpvfrPk3osVHiXhs
 W19A==
X-Gm-Message-State: AOAM53362uemzG44cOjSjPZcZGbCMFfNdcb+Isqg48m2Amyv39AW9/Lv
 aKR9fQdwF4NC2uXhnQwkstJwS08Q6XU=
X-Google-Smtp-Source: ABdhPJyZD/aFyEQjbq4HMvazzcdavRDBlmwvitkcHJO+K7I/I973CKmXafsX5XyD2GANrrHh3647XA==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr41735165wrz.548.1641333826200; 
 Tue, 04 Jan 2022 14:03:46 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:40 +0100
Message-Id: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/libsepol: bump to version 3.3
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add gcc >= 5 dependency because __builtin_add_overflow is
unconditionally used since
https://github.com/SELinuxProject/selinux/commit/0744fa4f533c765d0a704fe8aa7174a0f93eb7bc

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checkpolicy/Config.in    | 6 ++++--
 package/libselinux/Config.in     | 6 ++++--
 package/libsepol/Config.in       | 6 ++++--
 package/libsepol/libsepol.hash   | 2 +-
 package/libsepol/libsepol.mk     | 2 +-
 package/refpolicy/Config.in      | 6 ++++--
 package/restorecond/Config.in    | 5 +++--
 package/selinux-python/Config.in | 8 ++++++++
 package/semodule-utils/Config.in | 6 ++++--
 package/setools/Config.in        | 5 +++--
 10 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index ad769d22b7..6a1f22991d 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_FLEX
 	help
@@ -13,5 +14,6 @@ config BR2_PACKAGE_CHECKPOLICY
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "checkpolicy needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "checkpolicy needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 62070c8d59..348757abce 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
@@ -16,5 +17,6 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libselinux needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 04af880e67..7516076cd5 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
@@ -35,5 +36,6 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 
 endif
 
-comment "libsepol needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libsepol needs a toolchain w/ threads, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index b273f982b6..039e4e3c7e 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  dfc7f662af8000116e56a01de6a0394ed79be1b34b999e551346233c5dd19508  libsepol-3.2.tar.gz
+sha256  2d97df3eb8466169b389c3660acbb90c54200ac96e452eca9f41a9639f4f238b  libsepol-3.3.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 55125f2203..8551a5de79 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.2
+LIBSEPOL_VERSION = 3.3
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index c529b85e1d..043cc40a72 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	# Even though libsepol is not necessary for building, we get
 	# the policy version from libsepol, so we select it, and treat
 	# it like a runtime dependency.
@@ -113,5 +114,6 @@ endif
 
 endif
 
-comment "refpolicy needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "refpolicy needs a toolchain w/ threads, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 31f85f2882..5e5567b213 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RESTORECOND
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,7 +16,7 @@ config BR2_PACKAGE_RESTORECOND
 
 	  https://github.com/SELinuxProject/selinux/wiki/Releases
 
-comment "restorecond needs a toolchain w/ wchar, threads, dynamic library"
+comment "restorecond needs a toolchain w/ wchar, threads, dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 0f1c281777..6a518f97d4 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_SELINUX_PYTHON
 
 config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	bool "audit2allow"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # semodule-utils -> libsepol
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	select BR2_PACKAGE_SEMODULE_UTILS
@@ -29,13 +30,20 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	  audit2why - translates SELinux audit messages into a
 	  description of why the access was denied (audit2allow -w)
 
+comment "audit2allow needs a toolchain w/ gcc 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	bool "sepolgen"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # semodule-utils -> libsepol
 	select BR2_PACKAGE_SEMODULE_UTILS
 	help
 	  This package contains a Python module that allows you to
 	  generate an initial SELinux policy module template.
 
+comment "sepolgen needs a toolchain w/ gcc 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 endif
 
 comment "selinux-python needs python3"
diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
index 38e043dc2c..5d98dc615f 100644
--- a/package/semodule-utils/Config.in
+++ b/package/semodule-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SEMODULE_UTILS
 	bool "semodule-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	select BR2_PACKAGE_LIBSEPOL
 	help
 	  semodule-utils is a package that contains tools for handling
@@ -15,5 +16,6 @@ config BR2_PACKAGE_SEMODULE_UTILS
 
 	  https://github.com/SELinuxProject/selinux/wiki/Releases
 
-comment "semodule-utils needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "semodule-utils needs a toolchain w/ threads, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 3ab7f55948..5a71672bdf 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_LIBSELINUX
@@ -19,10 +20,10 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/SELinuxProject/setools/
 
-comment "setools needs a toolchain w/ threads, wchar, dynamic library"
+comment "setools needs a toolchain w/ threads, wchar, dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "setools needs python3"
 	depends on BR2_USE_MMU
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

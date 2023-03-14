Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E39C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9834D41908;
	Tue, 14 Mar 2023 12:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9834D41908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQQeIMCGDX3N; Tue, 14 Mar 2023 12:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D14418E1;
	Tue, 14 Mar 2023 12:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D14418E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1EB51BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAFBE418DD
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFBE418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yluEtJTcAzc5 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F26F41882
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F26F41882
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:15:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o7so4757607wrg.5
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 05:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHwW3l31KXXSOFzodH0rodGUmpdOdPHWLyLjo9X+2l8=;
 b=xrvM6xruE75kY+dfFog4KE9Y7xXCvA2pXUkycdi+Ni+sQtRm3az649v0T9uY1vAih5
 Pfi0mFFwhQxvYQcK/TR1/OuTV0VHIDHqWRyX90Hy6JrcQgPJxKVyU+cNa0hkX7fd1ZmX
 h3yMo2gHPWtKwfpW1mMaGAm4+RDjEOWXyaycRrnWDk4/JieSf+NtdXQUWOZT+o6xsoUC
 a/mEnVDT1q9wRmeiRe1f8ulHmLZsPBZyFBE2oXjzchRcYcg/roYW8A1OYcejpwokQYDY
 OOSBQ1CTCf5yAKXJR/jY83lbms7yW9u7kIkayugOOf9Hsb4EWIovV919o5xMzoAEVl80
 EmGA==
X-Gm-Message-State: AO0yUKWdbQ7DKTxzoj2BRsWjhmfXpUrJobP0nyMjBmqyQPqAvydY3mhd
 8fBkJAxlkCma9nJzV8bjulU1clH5G7a85MhyQf4=
X-Google-Smtp-Source: AK7set/qqRIV31zDFownmzBHdVUgLBzOa8pDIEPQ87R9COXCNo1ArzFcEukrbO9gX92rrHkd+4jwKA==
X-Received: by 2002:a5d:5688:0:b0:2cf:3a97:ba56 with SMTP id
 f8-20020a5d5688000000b002cf3a97ba56mr4151003wrv.39.1678796118342; 
 Tue, 14 Mar 2023 05:15:18 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:61ee:d4ee:9412:e29a])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6501000000b002c54241b4fesm2011504wru.80.2023.03.14.05.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:15:18 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 13:15:06 +0100
Message-Id: <20230314121507.2597723-4-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678796118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHwW3l31KXXSOFzodH0rodGUmpdOdPHWLyLjo9X+2l8=;
 b=hOkpzTpCNiP6c85cM4zeY/IvUq3+4iTiRS8y18IRuGIzUfa5+hLw8QsTj9ly+VIa/w
 w7+Yifi68vjOqUCk2gt4Pe/Kktik9uYlZd1YyvxkB9HAoqOatQJCoAKdd9J6hSrz4h8r
 Qu0vLkx2DTAe7RQiQL3pJ3L4z4H4TsK8j66r3Jr8UMm0RoSfsONN/iyLn7z36ySpZQ7t
 FUqYudZ1RCY0h3lWgOewqU/f4ePFi2wd+QPvP861kAIvNfTTFqu23kK9Ud7kf//m2g3c
 B14l7nvovRDujl5MF49enhiFg0p1nmVJzrjurHafBWJcfpcoNuAVRUNtwUCs1oyZiCL9
 gj1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hOkpzTpC
Subject: [Buildroot] [PATCH 4/4] package/coreutils: new virtual package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Sebastian Weyer <sebatian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============6389052623766222521=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6389052623766222521==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This virtual package provides the coreutils functionality which is
provided by the classical gnu implementation of the coreutils
package/gnu-coreutils as well as the more recent rust implementation
package/uutils-coreutils. When the user selects coreutils they will be
presented with a choice between the gnu and the rust implementation. The
gnu implementation will be selected by default.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  3 +--
 package/coreutils/Config.in                  | 24 ++++++++++++++++++++
 package/coreutils/coreutils.mk               |  7 ++++++
 package/gnu-coreutils/Config.in              |  8 +++++--
 package/gnu-coreutils/gnu-coreutils.mk       |  2 ++
 package/uutils-coreutils/Config.in           | 10 +++++++-
 package/uutils-coreutils/uutils-coreutils.mk |  2 ++
 8 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 package/coreutils/Config.in
 create mode 100644 package/coreutils/coreutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 14661f7944..f86dcaa420 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2581,6 +2581,7 @@ N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebatian.weyer@smile.fr>
+F:	package/coreutils
 F:	package/uutils-coreutils
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
diff --git a/package/Config.in b/package/Config.in
index 6a0c3fd049..0f8dab3e71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2634,6 +2634,7 @@ menu "System tools"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
+	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/crun/Config.in"
@@ -2654,7 +2655,6 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
-	source "package/gnu-coreutils/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
@@ -2725,7 +2725,6 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
-	source "package/uutils-coreutils/Config.in"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
new file mode 100644
index 0000000000..a5bfc016ac
--- /dev/null
+++ b/package/coreutils/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_HAS_COREUTILS
+	bool
+
+config BR2_PACKAGE_PROVIDES_COREUTILS
+	string
+	depends on BR2_PACKAGE_HAS_COREUTILS
+
+menuconfig BR2_PACKAGE_COREUTILS
+	bool "coreutils"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  Enable coreutils on the target. Either standard GNU-coreutils
+	  or its rust implementation: uutils-coreutils.
+
+if BR2_PACKAGE_COREUTILS
+
+choice
+	prompt "Coreutils Type"
+
+source "package/gnu-coreutils/Config.in"
+source "package/uutils-coreutils/Config.in"
+endchoice
+
+endif
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
new file mode 100644
index 0000000000..e5585afb61
--- /dev/null
+++ b/package/coreutils/coreutils.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# coreutils
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/gnu-coreutils/Config.in b/package/gnu-coreutils/Config.in
index 9a15c0ee8b..60731b8266 100644
--- a/package/gnu-coreutils/Config.in
+++ b/package/gnu-coreutils/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_GNU_COREUTILS
 	bool "gnu-coreutils"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_COREUTILS
+	select BR2_PACKAGE_HAS_COREUTILS
 	help
 	  All of the basic file/text/shell utilities. These are the
 	  core utilities which are expected to exist on every system.
@@ -17,6 +18,9 @@ config BR2_PACKAGE_GNU_COREUTILS
 
 if BR2_PACKAGE_GNU_COREUTILS
 
+config BR2_PACKAGE_PROVIDES_COREUTILS
+	default "gnu-coreutils"
+
 config BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES
 	bool "Individual binaries"
 	depends on !BR2_STATIC_LIBS
@@ -36,4 +40,4 @@ endif
 comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_COREUTILS
diff --git a/package/gnu-coreutils/gnu-coreutils.mk b/package/gnu-coreutils/gnu-coreutils.mk
index 3373021cf5..402cd3f023 100644
--- a/package/gnu-coreutils/gnu-coreutils.mk
+++ b/package/gnu-coreutils/gnu-coreutils.mk
@@ -11,6 +11,8 @@ GNU_COREUTILS_LICENSE = GPL-3.0+
 GNU_COREUTILS_LICENSE_FILES = COPYING
 GNU_COREUTILS_CPE_ID_VENDOR = gnu
 
+GNU_COREUTILS_PROVIDES = coreutils
+
 GNU_COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
index 76ce5b174d..5a75c36e61 100644
--- a/package/uutils-coreutils/Config.in
+++ b/package/uutils-coreutils/Config.in
@@ -1,9 +1,17 @@
 config BR2_PACKAGE_UUTILS_COREUTILS
 	bool "uutils-coreutils"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_COREUTILS
+	select BR2_PACKAGE_HAS_COREUTILS
 	help
 	  uutils is an attempt at writing universal (as in
 	  cross-platform) CLI utilities in Rust. While all programs have
 	  been implemented, some options might be missing or different
 	  behavior might be experienced.
+
+if BR2_PACKAGE_UUTILS_COREUTILS
+
+config BR2_PACKAGE_PROVIDES_COREUTILS
+	default "uutils-coreutils"
+
+endif
diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
index 37a647a1f0..f7b688e42b 100644
--- a/package/uutils-coreutils/uutils-coreutils.mk
+++ b/package/uutils-coreutils/uutils-coreutils.mk
@@ -12,6 +12,8 @@ UUTILS_COREUTILS_LICENSE_FILES = LICENSE
 UUTILS_COREUTILS_BUILD_OPTS = PROFILE=release MULTICALL=y PREFIX=$(TARGET_DIR)
 UUTILS_COREUTILS_INSTALL_OPTS = $(UUTILS_COREUTILS_BUILD_OPTS) install
 
+UUTILS_COREUTILS_PROVIDES = coreutils
+
 define UUTILS_COREUTILS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(UUTILS_COREUTILS_BUILD_OPTS) -C $(@D)
 endef
-- 
2.25.1


--===============6389052623766222521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6389052623766222521==--

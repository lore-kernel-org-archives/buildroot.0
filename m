Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D637FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 08:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A9C40A67;
	Sun, 15 May 2022 08:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VquKfJPHh9r; Sun, 15 May 2022 08:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68A6E40A4B;
	Sun, 15 May 2022 08:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C93601BF2C7
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 08:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B14409B0
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 08:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiY8eJzukDiw for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 08:52:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27C1240249
 for <buildroot@buildroot.org>; Sun, 15 May 2022 08:52:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t6so16812965wra.4
 for <buildroot@buildroot.org>; Sun, 15 May 2022 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2u9oL8ttT2vCe2GfzMP7dLwUy7J5maMi/jIFx8spCY4=;
 b=BQYYHrS4bK/sGNArYNhf7asvMwFws6maCJbdMA7uSli4uPsPM0LhhimC3ZBh7Wi7RI
 RDQFtqykkwwFg90uG+2I06XxCF8TXJCuFFel5/kuGiusDTKdMSSIPWawWYeQJxMUBu4w
 fW3ik2DG5hXKy7Ixxm5sK5TGKYG8YNQkbG5okjyrxphjvEsLJHNdoP3fhpDcYNwEpEOd
 I79917BgrzBk5tWoLMo8EN+7wWmDTFtS1vsRdOyn3ibCEHImbnr53h8fvAx6j3pZEpQj
 tA6eB2F+VacEtwY5Q+cScCQ3IUh/AAnIAGMt5yeK3BJ5CR1/fcMYy5hwTD4tnlRmM/Yz
 mD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2u9oL8ttT2vCe2GfzMP7dLwUy7J5maMi/jIFx8spCY4=;
 b=uiEJdSHe1fBPz9ZPmHn9m7cV5kqYVoc8V5rzHwKa7WE4CbczwkYyMjvISC6pJlXF6+
 i8F7n0vRqKCQLYlYn/h2XFADvTNST6u7JgoRdQ0+cIdLAf1ZthSoh2Vfx5oiK0Av+Lq5
 E/zHSSmJaSbUOBR9D3aNOfcwySDHtF3kXJoPrlszbCTwfsdbl8kLGZagqct8zyLZ2ZxC
 TLmIpxYOAcRdYVXvYmqKLar4WrsfAnF0v9JQZ8dPmBBdYjWE9Zui/2kK2wnRDX8gFgz2
 YgsCOPAAf7QgE9T1VN0lMPu3eLB6MLXxCD0vcFF1FwmuA8VI8cmHjQrAv61+NSEl6lBx
 ni/Q==
X-Gm-Message-State: AOAM531Jrtvo16YdKsQfqLRKDgd8UqIplxSuhj4e0RzrSI+7Hq9FmyCT
 3noKJmrvae353I/VXLgA1RX0O1U+vtE=
X-Google-Smtp-Source: ABdhPJxjl2OeY1UfwLQmdsY5bfnhH9VeKcz8Hqt+E1G8ai/iHfZBmbzvcTdznOWPOR0tOx4/hUZfLA==
X-Received: by 2002:adf:ecc7:0:b0:20a:dba3:a516 with SMTP id
 s7-20020adfecc7000000b0020adba3a516mr10113184wro.143.1652604719891; 
 Sun, 15 May 2022 01:51:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g9-20020adfa489000000b0020ce2ed4b6fsm6441104wrb.58.2022.05.15.01.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 01:51:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 10:49:49 +0200
Message-Id: <20220515084949.395053-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/duktape: can't be built with
 BR2_OPTIMIZE_FAST
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

duktape can't be used with BR2_OPTIMIZE_FAST resulting in the following
build failure in polkit:

In file included from /nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duktape.h:202,
                 from ../src/polkitbackend/polkitbackendduktapeauthority.c:28:
/nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duk_config.h:2893:2: error: #error __FAST_MATH__ defined, refusing to compile
 2893 | #error __FAST_MATH__ defined, refusing to compile
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/587485bcfd85dfd974608aa00b9bd0c42a3a61d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-pk-helper/Config.in | 4 ++++
 package/duktape/Config.in        | 4 ++++
 package/polkit/Config.in         | 4 ++++
 package/systemd/Config.in        | 4 ++++
 package/udisks/Config.in         | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
index 113f433795..756ac49cfa 100644
--- a/package/cups-pk-helper/Config.in
+++ b/package/cups-pk-helper/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CUPS_PK_HELPER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_POLKIT
 	help
@@ -17,3 +18,6 @@ comment "cups-pk-helper support needs a toolchain with threads, wchar, dynamic l
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "cups-pk-helper can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/duktape/Config.in b/package/duktape/Config.in
index 5dad5c3e7c..38f2c48cc0 100644
--- a/package/duktape/Config.in
+++ b/package/duktape/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DUKTAPE
 	bool "duktape"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_OPTIMIZE_FAST
 	help
 	  Duktape is an embeddable Javascript engine, with a focus on
 	  portability and compact footprint.
@@ -14,3 +15,6 @@ config BR2_PACKAGE_DUKTAPE
 
 comment "duktape needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+comment "duktape can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index 622cbbb90b..ca3323931c 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_POLKIT
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # duktape
+	depends on !BR2_OPTIMIZE_FAST # duktape
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
@@ -20,3 +21,6 @@ comment "polkit needs a toolchain with dynamic library, wchar, threads, gcc >= 7
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "polkit can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 00c817172d..d5d88404de 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -359,6 +359,7 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	select BR2_PACKAGE_POLKIT
 	help
 	  If enabled, systemd is built with polkit support and policy
@@ -372,6 +373,9 @@ comment "polkit support needs a toolchain with threads, wchar, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
+comment "polkit support can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_SYSTEMD_PORTABLED
 	bool "enable portable services"
 	help
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 82f11ae7de..a3a0f82144 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
@@ -45,3 +46,6 @@ comment "udisks needs a toolchain with dynamic library, locale, wchar, threads,
 	depends on BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
+comment "udisks can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

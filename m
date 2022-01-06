Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD97AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 17:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A666FC17;
	Thu,  6 Jan 2022 17:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZtFx3S9_RAh; Thu,  6 Jan 2022 17:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EA26FBC9;
	Thu,  6 Jan 2022 17:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA89B1BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A3842906
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yDofuqlOja2 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 17:51:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63F69428EC
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 17:51:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso1606053wmf.3
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbUUl0Si06ZB4O/Wik3uiQm37XVv7p49Y4Jk0hRq89w=;
 b=cj4urhRo9vjWvfqW3RJ14U7xYco/maR2OqWIbfMRXBM/F5/fL5qrYwadk4+m3724b7
 Sjsamtucy3SEsLpWgV7jlaNpk5pEsbodkjYN+dj0TG665AQhImDpGER5omSJ1043SJ5C
 CgVrsiwu/cQ/YAPZPND2O8XOPd2B/LmYVRT6+b04lvfDPLCoflCXCD0MP4H80G7fkFQQ
 +uLQdJJBq6VFW/l3tY6yeNpLi/2hBhIEWmvwhaRAPrPpTqe1M27KfmLJJpsS23RffmrV
 grdBJY7qFT3cFFSUGTJOgPKWGet2yPqk/ujdoUVbWR1vxxDslFArwh5jER7I5DegdXL/
 HbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbUUl0Si06ZB4O/Wik3uiQm37XVv7p49Y4Jk0hRq89w=;
 b=f7sZLq5UPKoD5BbFXquQKQUMWPg16s9+NeWsfB1aMcjNON66KixAbH0glSfUp/VAgm
 d2298ZeXAEtiPAg7y46ZoL7Df8hNJTQCHDVNciH0IUt9uilQEDSEXHZR4TbuCfkb4F+j
 6JrBNGTNQjF/OAyLwTmQ3BQiKKQ6yvpNbkm+IcxWULa1c43ohE5X1C/39QY2VJ/f2mrQ
 HfnGYtyn2sDRaqCUYuwk4sbBMPX+ElkYwuxzq7Qyg9VOPHZYbb+sFI4WHuG3P889cKxg
 N0b655XxyLTZQtjP5vDD4f2vF/BG8N7/YvtV+Ymi13l9BOpZbkK3+vhF+kd9ar8IFl0V
 q1AQ==
X-Gm-Message-State: AOAM533LC03xcuHBCh/uxtlCDSinQzCg/3j4Z22vM/RPIouVkQkeVk4K
 Q2FRqjCaHOqSTWctoZnl7TKSSdSFG74=
X-Google-Smtp-Source: ABdhPJxQRpXmUh4cI7MJACZ8Bp3wQZi7Przz0UyskfS420HczXmQLt/QRDg9W3ydup2lK40DSvnvlQ==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr7536471wmc.115.1641491472496; 
 Thu, 06 Jan 2022 09:51:12 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id 5sm2526610wrb.77.2022.01.06.09.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 09:51:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 18:49:49 +0100
Message-Id: <20220106174949.1064731-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lttng-modules: bump to version
 2.13.1
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add a dependency on kernel >= 3.0:
  https://github.com/lttng/lttng-modules/commit/88eafb709ac811960b1163482f5d537cb18b32df
- Add CONFIG_KPROBES to Config.in for kernel >= 5.7:
  https://github.com/lttng/lttng-modules/commit/a65765406b03e4f3b7a4303e1c9ed83c86cdd358
- Update license files and their hash because SPDX v3.0 identifiers are
  used since
  https://github.com/lttng/lttng-modules/commit/b7cdc18250880cc44edeef4a4b42c8ac7a135a6d
- This bump will fix a build failure with kernel >= 5.6 thanks to at
  least:
  https://github.com/lttng/lttng-modules/commit/edfdcb685c3f56dde803244449f79ad7bed03798

https://github.com/lttng/lttng-modules/blob/v2.13.1/ChangeLog

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=14501

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lttng-modules/Config.in          | 12 +++++++++---
 package/lttng-modules/lttng-modules.hash | 12 ++++++------
 package/lttng-modules/lttng-modules.mk   |  5 +++--
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
index e8ba9bad8c..cb56584155 100644
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTTNG_MODULES
 	bool "lttng-modules"
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  Linux kernel modules for the LTTng 2.x kernel tracing
 	  infrastructure.
@@ -8,7 +9,8 @@ config BR2_PACKAGE_LTTNG_MODULES
 	  Make sure your target kernel has the following config
 	  options enabled:
 
-	    * CONFIG_MODULES: loadable module support
+	    * CONFIG_MODULES: loadable module support (not strictly
+	      required when built into the kernel)
 	    * CONFIG_KALLSYMS: this is necessary until the few
 	      required missing symbols are exported to GPL
 	      modules from mainline
@@ -17,6 +19,8 @@ config BR2_PACKAGE_LTTNG_MODULES
 	    * CONFIG_TRACEPOINTS: kernel tracepoint instrumentation
 	      (enabled as a side-effect of any of the
 	      perf/ftrace/blktrace instrumentation features)
+	    * CONFIG_KPROBES (5.7+): use kallsyms for kernel 5.7 and
+	      newer.
 
 	  The following kernel configuration options will
 	  affect the features available from LTTng:
@@ -29,9 +33,11 @@ config BR2_PACKAGE_LTTNG_MODULES
 	    * CONFIG_KALLSYMS_ALL: state dump of mapping between block
 	      device number and name
 
-	  The packaged version is compatible with Linux 2.6.38 to 3.16.
-
 	  http://lttng.org
 
 comment "lttng-modules needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
+
+comment "lttng-modules needs a toolchain w/ headers >= 3.0"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index f04247ab0b..fb253c9bf6 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,8 +1,8 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.11.0.tar.bz2.sha256
-sha256 98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f  lttng-modules-2.11.0.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.1.tar.bz2.sha256
+sha256  a7c86d91c9bbe66d27f025aa04b8cfc6d7785ed2fc7ef774930800ee44d7f343  lttng-modules-2.13.1.tar.bz2
 
 # Hash for license files
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
-sha256 6334b377a5bd56b56a1e8a495830f2d28ed1b5cbedc7493aec9fba979efcdfe1  LICENSE
+sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
+sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
+sha256  0133d3c505f176845d7a8b4dcfe006ac615832c43c41e76fe3b365191bafca92  LICENSE
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index b8f9be8656..4c1c50d0a0 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.11.0
+LTTNG_MODULES_VERSION = 2.13.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
+LTTNG_MODULES_LICENSE_FILES = \
+	LICENSES/LGPL-2.1 LICENSES/GPL-2.0 LICENSES/MIT LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
 $(eval $(kernel-module))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

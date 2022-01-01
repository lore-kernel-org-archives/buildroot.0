Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD860C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDD481392;
	Sat,  1 Jan 2022 13:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuyRLGu_2SJy; Sat,  1 Jan 2022 13:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0B981370;
	Sat,  1 Jan 2022 13:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDB061BF399
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBE1881370
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKq5eqK-BErE for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA38D81357
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:59:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t26so60667990wrb.4
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 05:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UmWgx4fiK4pBDE4pAxziqfdgXCFJjODDXys68USmpw=;
 b=GDso+Po2e5KQvPAnKsTIMyiPkfYY2M/AqacTb4GnGtMU6bEq9iv+wYG3pOYOXuxe9m
 NPlCU1dXep9AhnM6Xt9+iHmLXhdO0/o2efP8hwAdS/YhciS+4jgFqSt3bcbRq7XeQboJ
 ppsS6JT2dFF/hIYb0DzQx6iqjY/1+YnHXjjJ1R0T49E6JNYxW0jlCQYAkwZNbG0mUeA8
 i8WX+Q+KLst10p/xKXfyX5OnNVMs4Gj8Z7vwAJo14cgUN1kaoUXiqqP4VagHgyBm/nJ7
 nvK+MJOsxhXSGPqEFyzDSG8Ad8ZfKbFU/vnnIrE9a1I48Ub3gx8I47dunTtJx0pfmzOz
 CmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UmWgx4fiK4pBDE4pAxziqfdgXCFJjODDXys68USmpw=;
 b=7l4c0RR50kL/a5e+O5qFQBsNwAGS2vjSZpony+FroZeKT3L+rOlpXyZUmpmo5JX7PE
 KO98A5xemPIVrii17gPHKQ7BY+caNuL1GpCLLeNgNAUC0h9OsnpKyi5KsVL9TQaVHceF
 fm52/hs7+kLY+zNWrg6zhVQVWjwElBfHJtmhKBf3t4v5Wl6Bk699VKwepoL2TqRUxKH4
 uUTgKRVnZbhJMMbBsp2Kh6zliZ0puj6Jg6/ieBkIlIjD6U1OnAZHK7xLCV0pdae5KI9b
 eLUk7C0OwfGody809uUhtUOgrtNuKieH6Xp2cvbsds48fdYtqegsa2kbwLNe+Abr9fAX
 spVA==
X-Gm-Message-State: AOAM531nFNuscV3HNagZIPGszWqlNV4GMdKRt8FBg3g8SFDQIBC2GbQ9
 N/Ox9GqAfTeis7atGI+i65IwNaot72Y=
X-Google-Smtp-Source: ABdhPJzjjft6TwVd+qJRqs5M4+ehhyRFgcz5btQVZqA+tSHKa3FOBcp88hklSlp1jmggcShJFkPHFA==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr32856664wrv.651.1641045548964; 
 Sat, 01 Jan 2022 05:59:08 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm20993663wmq.36.2022.01.01.05.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 05:59:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 14:57:37 +0100
Message-Id: <20220101135737.956301-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: new package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ksmbd kernel server userspace utilities.

https://github.com/cifsd-team/ksmbd-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/ksmbd-tools/Config.in        | 15 +++++++++++++++
 package/ksmbd-tools/ksmbd-tools.hash |  3 +++
 package/ksmbd-tools/ksmbd-tools.mk   | 20 ++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/ksmbd-tools/Config.in
 create mode 100644 package/ksmbd-tools/ksmbd-tools.hash
 create mode 100644 package/ksmbd-tools/ksmbd-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98ff2372cc..cf0e6fe0fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -870,6 +870,7 @@ F:	package/hiredis/
 F:	package/i2pd/
 F:	package/igd2-for-linux/
 F:	package/json-c/
+F:	package/ksmbd-tools/
 F:	package/lcms2/
 F:	package/lftp/
 F:	package/libcap-ng/
diff --git a/package/Config.in b/package/Config.in
index 4185675e4c..1e25ccd964 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2235,6 +2235,7 @@ endif
 	source "package/keepalived/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
+	source "package/ksmbd-tools/Config.in"
 	source "package/leafnode2/Config.in"
 	source "package/lft/Config.in"
 	source "package/lftp/Config.in"
diff --git a/package/ksmbd-tools/Config.in b/package/ksmbd-tools/Config.in
new file mode 100644
index 0000000000..ce1850e016
--- /dev/null
+++ b/package/ksmbd-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_KSMBD_TOOLS
+	bool "ksmbd-tools"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libnl
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNL
+	help
+	  ksmbd kernel server userspace utilities.
+
+	  https://github.com/cifsd-team/ksmbd-tools
+
+comment "ksmbd-tools needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
new file mode 100644
index 0000000000..ad507bfdb2
--- /dev/null
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  bd7218ebfeaa0d6a73c0a4beb9ea506228cd5695c1f8d3f9a9064e2346d52f0a  ksmbd-tools-3.4.3.tar.gz
+sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
new file mode 100644
index 0000000000..b3ffc3e768
--- /dev/null
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ksmbd-tools
+#
+################################################################################
+
+KSMBD_TOOLS_VERSION = 3.4.3
+KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
+KSMBD_TOOLS_LICENSE = GPL-2.0+
+KSMBD_TOOLS_LICENSE_FILES = COPYING
+KSMBD_TOOLS_DEPENDENCIES = host-pkgconf libglib2 libnl
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+KSMBD_TOOLS_CONF_OPTS += --enable-krb5
+KSMBD_TOOLS_DEPENDENCIES += libkrb5
+else
+KSMBD_TOOLS_CONF_OPTS += --disable-krb5
+endif
+
+$(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

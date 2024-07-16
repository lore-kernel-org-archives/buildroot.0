Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8538CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5356460AA6;
	Tue, 16 Jul 2024 17:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7xnwqszSTKV; Tue, 16 Jul 2024 17:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 646A260B07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646A260B07;
	Tue, 16 Jul 2024 17:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB1891BF307
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E51F0406B1
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCHu4thyxMQ7 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 328A34033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328A34033A
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 328A34033A
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-8111f946f04so2382639f.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721152247; x=1721757047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+OG3CiMgiptw8we8hGn7L95om7AZ9c0pa+hHsW5qig=;
 b=QfmECkM1un9XPmGZ9yMtOaEGvl8WB4w8CS63ISAmT82W6yNwyML4pcNjmO3LDG9wPi
 WaZcWWEffPQ2y1UiXYskYI6j/I1dsJyncmm3hUxc39/0kTbAbtf5Z/BKDwNuHWTAIWRn
 0fxjRKr9WlcetfJaitNtOtY6zj1aMIuUBuYJnJY+Gr79xlW+oVt4IV+kR13aXX82Ul6s
 AAD/GTxctAlLMASH95QbYTQkE8wyLDj5NsleJM5gGS+CBakgUsrsuNr+AFadu1BKTPqM
 zApwm92NUc4eJTx9HQraxIRdOEojr9l1JFTEPbZgk01DiOg6SEkAG907LLbcLHg1eNL6
 9TMQ==
X-Gm-Message-State: AOJu0YxBRPQuiFUMB0WMY7ue0MPFM6YkZ+5uWLnyt7eOi7dasAf0rebN
 qcdGY/QFRTIGtYtnoNsKdOOWEDWhVRTiOGmMaTsjfw9lrDJ4HF1snuOkCfud
X-Google-Smtp-Source: AGHT+IHvojBF8xkTz+0ZGjjp72QKLpBI2VBYDA6XezNfOztRj7niE1TeLSP6++ja4YAU/SvVtC5Pdg==
X-Received: by 2002:a05:6602:2190:b0:7f6:2819:b099 with SMTP id
 ca18e2360f4ac-816c5698bd5mr13407939f.16.1721152246758; 
 Tue, 16 Jul 2024 10:50:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c210bbef1fsm39420173.31.2024.07.16.10.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:50:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 11:50:36 -0600
Message-Id: <20240716175037.1844929-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716175037.1844929-1-james.hilliard1@gmail.com>
References: <20240716175037.1844929-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721152247; x=1721757047; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+OG3CiMgiptw8we8hGn7L95om7AZ9c0pa+hHsW5qig=;
 b=jc2MAJKRAGkyGhDHxSz2jHv2YWWiS/lJEY2mx2KpvckJ1S0q4DoRuMPj5v4YUoik7z
 CpcBoZHZHwBWG7u8lNcD6Jmq9uHqqB0eWyqGZgJj+66vR9vnJ4Fp0/Hj6Bp3TVILUfvz
 wVYAEaKXukLy7qiiImegy1qjGnitEJMHND0dubUq4orGzN8+T3qFBLEyzSKQxsbhx8Z0
 To/P/KXbd0FaepMTzdgKQ3M8SHKdqTHwzHlF+5toNdsDaA12eURF/rmQmUvVmsz6curZ
 tpzuKM9YroOgv+vM2au5c6HMhBVOf8rGPgr+8Ahq4EyOms0V3TbCrFS8aGV8jsnqo7zo
 TfTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jc2MAJKR
Subject: [Buildroot] [PATCH v3 4/5] package/fwupd-efi: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport some patches fixing the python shebang and allowing one
to disable the use of genpeimg since we use host-python-pefile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add python shebang fix
  - disable genpeimg binary usage
  - set objcopy path
  - add host-python-pefile host-python-uswid deps
Changes v1 -> v2:
  - use gitlab for efi_sbat_distro_url
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...disabling-the-use-of-genpeimg-binary.patch | 41 ++++++++
 ...-shebang-paths-and-add-python-option.patch | 95 +++++++++++++++++++
 package/fwupd-efi/Config.in                   |  8 ++
 package/fwupd-efi/fwupd-efi.hash              |  3 +
 package/fwupd-efi/fwupd-efi.mk                | 28 ++++++
 7 files changed, 177 insertions(+)
 create mode 100644 package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
 create mode 100644 package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
 create mode 100644 package/fwupd-efi/Config.in
 create mode 100644 package/fwupd-efi/fwupd-efi.hash
 create mode 100644 package/fwupd-efi/fwupd-efi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e181382fe9..f54a01e477 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1480,6 +1480,7 @@ F:	package/apcupsd/
 F:	package/bpftool/
 F:	package/cloudflared/
 F:	package/exfatprogs/
+F:	package/fwupd-efi/
 F:	package/fxdiv/
 F:	package/gensio/
 F:	package/lua-std-debug/
diff --git a/package/Config.in b/package/Config.in
index 4a38c282a3..4cd7cfbc62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ endmenu
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
 	source "package/freescale-imx/Config.in"
+	source "package/fwupd-efi/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
 	source "package/gpm/Config.in"
diff --git a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
new file mode 100644
index 0000000000..e6e460a3b7
--- /dev/null
+++ b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
@@ -0,0 +1,41 @@
+From fb1cf079346a2838cc44f7116cb4a790e40cc5bf Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 2 Jul 2024 15:08:18 -0600
+Subject: [PATCH] Allow enabling/disabling the use of genpeimg binary
+
+In some cases we may want to force the use of python3-pefile instead
+of genpeimg such as when cross compiling, add a feature option to
+allow disabling genpeimg.
+
+Upstream: https://github.com/fwupd/fwupd-efi/commit/fb1cf079346a2838cc44f7116cb4a790e40cc5bf
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a3ce068..a5612a6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -17,7 +17,7 @@ prefix = get_option('prefix')
+ libdir = join_paths(prefix, get_option('libdir'))
+ libexecdir = join_paths(prefix, get_option('libexecdir'))
+ 
+-genpeimg = find_program ('genpeimg', required: false)
++genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
+ 
+ efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
+ host_cpu = host_machine.cpu_family()
+diff --git a/meson_options.txt b/meson_options.txt
+index 26161e1..588ae29 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -7,3 +7,4 @@ option('efi_sbat_distro_summary', type : 'string', value : '', description : 'SB
+ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SBAT distribution package name, e.g. fwupd')
+ option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
+ option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
++option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
+-- 
+2.34.1
+
diff --git a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
new file mode 100644
index 0000000000..9747565182
--- /dev/null
+++ b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
@@ -0,0 +1,95 @@
+From 1cd1ff0216d5beb2a2523031398d4dba7d12729d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 2 Jul 2024 14:51:26 -0600
+Subject: [PATCH] Fix python3 shebang paths and add python option.
+
+Using absolute paths can result in the wrong python3 binary being
+used, such as when cross compiling using a non-system python3.
+
+Use the normal python3 env shebang instead.
+
+Also add a meson option to allow overriding the python path.
+
+Upstream: https://github.com/fwupd/fwupd-efi/commit/1cd1ff0216d5beb2a2523031398d4dba7d12729d
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ contrib/reformat-code.py | 2 +-
+ efi/generate_binary.py   | 2 +-
+ efi/generate_sbat.py     | 2 +-
+ efi/meson.build          | 4 ++--
+ meson.build              | 7 +++++++
+ meson_options.txt        | 1 +
+ 6 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/contrib/reformat-code.py b/contrib/reformat-code.py
+index 65a4ac4..ff6014d 100755
+--- a/contrib/reformat-code.py
++++ b/contrib/reformat-code.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2017 Dell Inc.
+ #
+diff --git a/efi/generate_binary.py b/efi/generate_binary.py
+index 443472a..a4611bb 100755
+--- a/efi/generate_binary.py
++++ b/efi/generate_binary.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
+ # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
+diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
+index 6c904e5..b9b80ac 100755
+--- a/efi/generate_sbat.py
++++ b/efi/generate_sbat.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
+ # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
+diff --git a/efi/meson.build b/efi/meson.build
+index 75ade7a..008ba3d 100644
+--- a/efi/meson.build
++++ b/efi/meson.build
+@@ -1,5 +1,5 @@
+-generate_sbat = find_program('generate_sbat.py', native: true)
+-generate_binary = find_program('generate_binary.py', native: true)
++generate_sbat = [python3, files('generate_sbat.py')]
++generate_binary = [python3, files('generate_binary.py')]
+ 
+ # get source version, falling back
+ git = find_program('git', required : false)
+diff --git a/meson.build b/meson.build
+index a5612a6..5836213 100644
+--- a/meson.build
++++ b/meson.build
+@@ -19,6 +19,13 @@ libexecdir = join_paths(prefix, get_option('libexecdir'))
+ 
+ genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
+ 
++python3path = get_option('python')
++if python3path == ''
++  python3 = import('python').find_installation('python3')
++else
++  python3 = find_program(python3path)
++endif
++
+ efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
+ host_cpu = host_machine.cpu_family()
+ if host_cpu == 'x86'
+diff --git a/meson_options.txt b/meson_options.txt
+index 588ae29..5f6f521 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -8,3 +8,4 @@ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SB
+ option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
+ option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
+ option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
++option('python', type : 'string', description : 'the absolute path of the python3 binary')
+-- 
+2.34.1
+
diff --git a/package/fwupd-efi/Config.in b/package/fwupd-efi/Config.in
new file mode 100644
index 0000000000..3d82f480be
--- /dev/null
+++ b/package/fwupd-efi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FWUPD_EFI
+	bool "fwupd-efi"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  EFI Application used by uefi-capsule plugin in fwupd.
+
+	  https://github.com/fwupd/fwupd-efi
diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
new file mode 100644
index 0000000000..35dc9625ca
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  fwupd-efi-1.6.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
new file mode 100644
index 0000000000..45eeb8d824
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# fwupd-efi
+#
+################################################################################
+
+FWUPD_EFI_VERSION = 1.6
+FWUPD_EFI_SITE = https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
+FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
+FWUPD_EFI_LICENSE = LGPL-2.1+
+FWUPD_EFI_LICENSE_FILES = COPYING
+FWUPD_EFI_INSTALL_STAGING = YES
+FWUPD_EFI_DEPENDENCIES = host-python-pefile host-python-uswid gnu-efi
+FWUPD_EFI_CONF_OPTS = \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Defi_sbat_fwupd_generation=1 \
+	-Defi_sbat_distro_id=buildroot \
+	-Defi_sbat_distro_summary=Buildroot \
+	-Defi_sbat_distro_pkgname=fwupd-efi \
+	-Defi_sbat_distro_version=fwupd-efi-$(FWUPD_EFI_VERSION) \
+	-Defi_sbat_distro_url=https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi \
+	-Dgenpeimg=disabled \
+	-Dpython="$(HOST_DIR)/bin/python3"
+FWUPD_EFI_MESON_EXTRA_BINARIES = objcopy='$(TARGET_OBJCOPY)'
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0CCC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FED970459;
	Fri, 28 Feb 2025 17:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC9lYWIcTEx8; Fri, 28 Feb 2025 17:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CFA6FCD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CFA6FCD7;
	Fri, 28 Feb 2025 17:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 103F968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8353426A9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqBnEs0s6KTJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4066426A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4066426A1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9468818ED; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 20:41:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1a2076e8a1691f78ef9350259a477a07d4c2f01
X-Git-Newrev: 360e811d4045fdf6d00adba0635f8a87415339fd
X-Patchwork-Hint: ignore
Message-Id: <20250228163017.D9468818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fwupd-efi: bump to
 version 1.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=360e811d4045fdf6d00adba0635f8a87415339fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patches which are now upstream.

Changelog: https://github.com/fwupd/fwupd-efi/releases/tag/1.7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to changelog]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ling-disabling-the-use-of-genpeimg-binary.patch | 41 ----------
 ...thon3-shebang-paths-and-add-python-option.patch | 95 ----------------------
 package/fwupd-efi/fwupd-efi.hash                   |  2 +-
 package/fwupd-efi/fwupd-efi.mk                     |  5 +-
 4 files changed, 3 insertions(+), 140 deletions(-)

diff --git a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
deleted file mode 100644
index e6e460a3b7..0000000000
--- a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From fb1cf079346a2838cc44f7116cb4a790e40cc5bf Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 2 Jul 2024 15:08:18 -0600
-Subject: [PATCH] Allow enabling/disabling the use of genpeimg binary
-
-In some cases we may want to force the use of python3-pefile instead
-of genpeimg such as when cross compiling, add a feature option to
-allow disabling genpeimg.
-
-Upstream: https://github.com/fwupd/fwupd-efi/commit/fb1cf079346a2838cc44f7116cb4a790e40cc5bf
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- meson.build       | 2 +-
- meson_options.txt | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a3ce068..a5612a6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -17,7 +17,7 @@ prefix = get_option('prefix')
- libdir = join_paths(prefix, get_option('libdir'))
- libexecdir = join_paths(prefix, get_option('libexecdir'))
- 
--genpeimg = find_program ('genpeimg', required: false)
-+genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
- 
- efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
- host_cpu = host_machine.cpu_family()
-diff --git a/meson_options.txt b/meson_options.txt
-index 26161e1..588ae29 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -7,3 +7,4 @@ option('efi_sbat_distro_summary', type : 'string', value : '', description : 'SB
- option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SBAT distribution package name, e.g. fwupd')
- option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
- option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
-+option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
--- 
-2.34.1
-
diff --git a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
deleted file mode 100644
index 9747565182..0000000000
--- a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 1cd1ff0216d5beb2a2523031398d4dba7d12729d Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 2 Jul 2024 14:51:26 -0600
-Subject: [PATCH] Fix python3 shebang paths and add python option.
-
-Using absolute paths can result in the wrong python3 binary being
-used, such as when cross compiling using a non-system python3.
-
-Use the normal python3 env shebang instead.
-
-Also add a meson option to allow overriding the python path.
-
-Upstream: https://github.com/fwupd/fwupd-efi/commit/1cd1ff0216d5beb2a2523031398d4dba7d12729d
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- contrib/reformat-code.py | 2 +-
- efi/generate_binary.py   | 2 +-
- efi/generate_sbat.py     | 2 +-
- efi/meson.build          | 4 ++--
- meson.build              | 7 +++++++
- meson_options.txt        | 1 +
- 6 files changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/contrib/reformat-code.py b/contrib/reformat-code.py
-index 65a4ac4..ff6014d 100755
---- a/contrib/reformat-code.py
-+++ b/contrib/reformat-code.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2017 Dell Inc.
- #
-diff --git a/efi/generate_binary.py b/efi/generate_binary.py
-index 443472a..a4611bb 100755
---- a/efi/generate_binary.py
-+++ b/efi/generate_binary.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
-diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
-index 6c904e5..b9b80ac 100755
---- a/efi/generate_sbat.py
-+++ b/efi/generate_sbat.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
-diff --git a/efi/meson.build b/efi/meson.build
-index 75ade7a..008ba3d 100644
---- a/efi/meson.build
-+++ b/efi/meson.build
-@@ -1,5 +1,5 @@
--generate_sbat = find_program('generate_sbat.py', native: true)
--generate_binary = find_program('generate_binary.py', native: true)
-+generate_sbat = [python3, files('generate_sbat.py')]
-+generate_binary = [python3, files('generate_binary.py')]
- 
- # get source version, falling back
- git = find_program('git', required : false)
-diff --git a/meson.build b/meson.build
-index a5612a6..5836213 100644
---- a/meson.build
-+++ b/meson.build
-@@ -19,6 +19,13 @@ libexecdir = join_paths(prefix, get_option('libexecdir'))
- 
- genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
- 
-+python3path = get_option('python')
-+if python3path == ''
-+  python3 = import('python').find_installation('python3')
-+else
-+  python3 = find_program(python3path)
-+endif
-+
- efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
- host_cpu = host_machine.cpu_family()
- if host_cpu == 'x86'
-diff --git a/meson_options.txt b/meson_options.txt
-index 588ae29..5f6f521 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -8,3 +8,4 @@ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SB
- option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
- option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
- option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
-+option('python', type : 'string', description : 'the absolute path of the python3 binary')
--- 
-2.34.1
-
diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
index 35dc9625ca..42f9eb83ff 100644
--- a/package/fwupd-efi/fwupd-efi.hash
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  fwupd-efi-1.6.tar.xz
+sha256  96d4fc45467159b2664ce86ee7d5030e265fdb4d4a4d774080654d2f5b1561ff  fwupd-efi-1.7.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
index 45eeb8d824..fbff5a9043 100644
--- a/package/fwupd-efi/fwupd-efi.mk
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FWUPD_EFI_VERSION = 1.6
-FWUPD_EFI_SITE = https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
-FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
+FWUPD_EFI_VERSION = 1.7
+FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
 FWUPD_EFI_LICENSE = LGPL-2.1+
 FWUPD_EFI_LICENSE_FILES = COPYING
 FWUPD_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2454C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7951760767;
	Tue,  4 Aug 2026 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70huD9LvOa5N; Tue,  4 Aug 2026 16:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6F46076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860618;
	bh=6fLPakIdJFP3bN4oMpxqURZvH5Oi4pP3YoixG54QkAs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YctsiM/IVORo66qUQ9XVPjT3QALnSSTPQ3z9rVvKF8y2IgkcB4HorlRO84PVdtjt3
	 MqAlz8f2ezKwGeHmxs5cereFp0H3RuozDyG5hQqPMfCfVqJrvZK8rR58M9xzdQslvG
	 qdMcxk6+0yPaG5RiF5gwg/wbr5SppahZnaRKEFzKd3TTA7PDQHf7wPuXpgt+SQPIIf
	 EOVgGb+W745SnqPSwrTfHlWQa63FXrmKuUwFtKR4xPsczoyYOcXUVG8ZAYfp7uGqKK
	 cwsxfBtPsYbqhlFa1fHEym+v40MQmqnY27KlkD4KCqvEb3CLxdHcIHCIyus2wl2MUy
	 7lC43ticBNgqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E6F46076B;
	Tue,  4 Aug 2026 16:23:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F07CB218
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2B036076B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DQUE5quMI7A for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AE460767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AE460767
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D788BE96; Tue,  4 Aug 2026 16:22:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b60d3e2c5291d09f989751df9950775ad360df69
X-Git-Newrev: 7af1e0a157088f1a674895b5fe5cc8760aa9382c
X-Patchwork-Hint: ignore
Message-Id: <20260804162248.20D788BE96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mini-snmpd: bump to version 2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7af1e0a157088f1a674895b5fe5cc8760aa9382c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This bumps from v1.6 directly to v2.0, for details, please see:

 - https://github.com/troglobit/mini-snmpd/releases/tag/v1.7
 - https://github.com/troglobit/mini-snmpd/releases/tag/v2.0

The release tarball is the canonical supported source for the project
and also ships a pre-generated configure script, hence the switch.

This commit removes the package patch, which is now included in the new
version. The .checkpackageignore file is also updated accordingly.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: update .checkpackageignore to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../mini-snmpd/0001-linux.c-fix-musl-build.patch   | 46 ----------------------
 package/mini-snmpd/mini-snmpd.hash                 |  3 +-
 package/mini-snmpd/mini-snmpd.mk                   |  5 +--
 4 files changed, 4 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e502d52138..c815170e9a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -618,7 +618,6 @@ package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch lib_
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch lib_patch.Upstream
 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch lib_patch.Upstream
 package/mii-diag/0001-strchr.patch lib_patch.Sob lib_patch.Upstream
-package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
 package/minidlna/S60minidlnad Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/modem-manager/S44modem-manager Shellcheck lib_sysv.Variables
diff --git a/package/mini-snmpd/0001-linux.c-fix-musl-build.patch b/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
deleted file mode 100644
index 8e8bb090fd..0000000000
--- a/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 73fa408f51ec25121075aaccac9c9db1c68567cd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 12 Mar 2020 10:02:18 +0100
-Subject: [PATCH] linux.c: fix musl build
-
-Remove include on linux/if_link.h to avoid the following build failure
-with musl:
-
-In file included from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
-                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:4,
-                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/if_link.h:5,
-                 from linux.c:21:
-/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
- struct sysinfo {
-        ^~~~~~~
-In file included from linux.c:19:
-/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
- struct sysinfo {
-        ^~~~~~~
-  CC       mini_snmpd-globals.o
-
-Fixes:
- - http://autobuild.buildroot.org/results/6903a0f685076b4a2c2824de6158da40e9e712d8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/troglobit/mini-snmpd/commit/73fa408f51ec25121075aaccac9c9db1c68567cd]
----
- linux.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/linux.c b/linux.c
-index a657912..86a7085 100644
---- a/linux.c
-+++ b/linux.c
-@@ -18,7 +18,6 @@
- #include <netpacket/packet.h>
- #include <sys/sysinfo.h>
- #include <sys/socket.h>
--#include <linux/if_link.h>
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/time.h>
--- 
-2.25.1
-
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index fee76c07a3..d1e8f51f8e 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,4 @@
+# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.0
+sha256  851acf49a1a36356664af0a7a040fa31f75403eb26e03627eba188ee15d4854c  mini-snmpd-2.0.tar.gz
 # Locally calculated
-sha256  de00c475a3c70c56f3ee97cd683cb71009d3521d60b1f589c5a91b4671ede9f3  mini-snmpd-1.6.tar.gz
 sha256  8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56  COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 1f6e5c1919..89eca4ce79 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 1.6
-MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
+MINI_SNMPD_VERSION = 2.0
+MINI_SNMPD_SITE = https://github.com/troglobit/mini-snmpd/releases/download/v$(MINI_SNMPD_VERSION)
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
 MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
-MINI_SNMPD_AUTORECONF = YES
 MINI_SNMPD_DEPENDENCIES = host-pkgconf
 
 define MINI_SNMPD_INSTALL_ETC_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

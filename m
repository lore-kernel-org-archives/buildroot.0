Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9D4CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA56A41486;
	Wed,  1 Oct 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ks4izTW5YSUN; Wed,  1 Oct 2025 21:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A2D4148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A2D4148A;
	Wed,  1 Oct 2025 21:00:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1302172
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C06E441487
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJtPyikghHKh for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF82741465
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF82741465
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED66E8129B; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:30:12 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 13cafab9d1676d11270ea351d94b393f986a79ed
X-Git-Newrev: d2c6b391e79782349c50d61ab3e2dbe968ed3f00
X-Patchwork-Hint: ignore
Message-Id: <20251001210010.ED66E8129B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sysprof:
 unconditionally select elfutils
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2c6b391e79782349c50d61ab3e2dbe968ed3f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The elfutils package provides libdw, which is required by sysprof.
It is not an optional dependency.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 194a6e039154488c88316dafa91bc72dd300cbdc)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/sysprof/Config.in  | 7 ++++---
 package/sysprof/sysprof.mk | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index a4f53a1179..e89a0e539e 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,14 +1,15 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	depends on BR2_USE_WCHAR # glib2, libdex, json-glib
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit
+	depends on BR2_USE_WCHAR # glib2, libdex, json-glib, elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit, elfutils
 	depends on BR2_USE_MMU # glib2, libdex, json-glib
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit
+	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit, elfutils
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 2670588ebb..f64f6d7120 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -10,7 +10,7 @@ SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
-SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
+SYSPROF_DEPENDENCIES = elfutils libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
 	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

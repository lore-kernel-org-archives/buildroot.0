Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F2AC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 14:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C630960E11;
	Thu, 28 Aug 2025 14:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyDmxSCCnpBO; Thu, 28 Aug 2025 14:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBAC260E1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAC260E1E;
	Thu, 28 Aug 2025 14:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DDFF17D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 14:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245E540CD7
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 14:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDkxy4o69f9V for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 14:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4173940CEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4173940CEA
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 14:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 305C487C39; Thu, 28 Aug 2025 14:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 16:25:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 97e52b323c8940d6022e39451cc4e7c9500a8081
X-Git-Newrev: 7856e41685a179fdda7b21a10455e52fe5fa5cb0
X-Patchwork-Hint: ignore
Message-Id: <20250828145116.305C487C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nnn: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3482792768133035335=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3482792768133035335==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7856e41685a179fdda7b21a10455e52fe5fa5cb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

nnn is a fast and minimal text-based file manager. It is written in C
and has minimal dependencies, which makes it portable and suitable for
embedded systems.

Project page: https://github.com/jarun/nnn
Wiki: https://en.wikipedia.org/wiki/Nnn_(file_manager)

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
[Arnout:
 - add missing dependency on BR2_USE_MMU (found with test-pkg);
 - add missing comment in Config.in;
 - add musl-fls dependency when needed (found with test-pkg);
 - add host-pkgconf dependency;
 - add NNN_MAKE_ENV to collect everything in make environment;
 - drop TARGET_MAKE_ENV from environment, it's already in
   TARGET_CONFIGURE_OPTS;
 - add PREFIX to NNN_MAKE_FLAGS: it is currently not used in the
   build step, but in the future it may be used;
 - use NORL=0/1 for readline optional dependency, the Makefile says that
   the "norl" target is legacy;
 - remove comment about readline dependency, it's obvious;
 - indent continuation line with an extra tab.
]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/nnn/Config.in | 20 ++++++++++++++++++++
 package/nnn/nnn.hash  |  3 +++
 package/nnn/nnn.mk    | 40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cdcde0585f..0276f2f2cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -91,6 +91,9 @@ F:	package/modem-manager/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
+N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/nnn/
+
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
 
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..b4eac5cf91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2973,6 +2973,7 @@ menu "Text editors and viewers"
 	source "package/mg/Config.in"
 	source "package/most/Config.in"
 	source "package/nano/Config.in"
+	source "package/nnn/Config.in"
 	source "package/uemacs/Config.in"
 	source "package/vim/Config.in"
 endmenu
diff --git a/package/nnn/Config.in b/package/nnn/Config.in
new file mode 100644
index 0000000000..64cfa8e0a5
--- /dev/null
+++ b/package/nnn/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_NNN
+	bool "nnn"
+	depends on BR2_USE_MMU # fork
+	# Building nnn without widechar/UTF support is theoretically
+	# possible, but in practice it leads to unstable builds.
+	# That’s why the WCHAR dependency is here.
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  nnn is a lightweight yet powerful terminal file manager.
+	  It is written in C, has minimal dependency, and works
+	  out of the box.
+
+	  https://github.com/jarun/nnn
+
+comment "nnn needs a toolchain with wchar"
+	depends on BR2_USE_MMU # fork
+	depends on !BR2_USE_WCHAR
diff --git a/package/nnn/nnn.hash b/package/nnn/nnn.hash
new file mode 100644
index 0000000000..670a591afb
--- /dev/null
+++ b/package/nnn/nnn.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3  nnn-5.1.tar.gz
+sha256  829f485dc4f2f51c2471b36a99e22f15ff214966e16b72cd79768b2338b4132b  LICENSE
diff --git a/package/nnn/nnn.mk b/package/nnn/nnn.mk
new file mode 100644
index 0000000000..acbd0ce314
--- /dev/null
+++ b/package/nnn/nnn.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# nnn
+#
+################################################################################
+
+NNN_VERSION = 5.1
+NNN_LICENSE = BSD-2-Clause
+NNN_LICENSE_FILES = LICENSE
+NNN_SITE = $(call github,jarun,nnn,v$(NNN_VERSION))
+NNN_DEPENDENCIES = ncurses host-pkgconf
+
+NNN_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+NNN_MAKE_FLAGS = \
+	CFLAGS_OPTIMIZATION= \
+	PREFIX=/usr
+
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+NNN_DEPENDENCIES += musl-fts
+# Must be passed in env so it can be appended to by the Makefile
+NNN_MAKE_ENV += LDLIBS="-lfts"
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NNN_DEPENDENCIES += readline
+NNN_MAKE_FLAGS += O_NORL=0
+else
+NNN_MAKE_FLAGS += O_NORL=1
+endif
+
+define NNN_BUILD_CMDS
+	$(NNN_MAKE_ENV) $(MAKE) -C $(@D) $(NNN_MAKE_FLAGS)
+endef
+
+define NNN_INSTALL_TARGET_CMDS
+	$(NNN_MAKE_ENV) $(MAKE) -C $(@D) $(NNN_MAKE_FLAGS) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))

--===============3482792768133035335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3482792768133035335==--

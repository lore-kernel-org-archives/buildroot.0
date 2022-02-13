Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 821014046A;
	Sun, 13 Feb 2022 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxcJ2isgBXqu; Sun, 13 Feb 2022 15:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 371A540360;
	Sun, 13 Feb 2022 15:31:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D16E1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6508081836
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9N2i3mDc2dsA for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B2DD81839
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2FED482983; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39aa793c0f6605586ad522267f97a33428f7de85
X-Git-Newrev: bf152e55a33a3cb3e10e26813eb36a8801ebfa97
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.2FED482983@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.25
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf152e55a33a3cb3e10e26813eb36a8801ebfa97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-wayland-scanner-is-only-needed-for-tests.patch | 42 ----------------------
 package/wayland-protocols/wayland-protocols.hash   |  8 ++---
 package/wayland-protocols/wayland-protocols.mk     |  2 +-
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
deleted file mode 100644
index ff3ec5719c..0000000000
--- a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 80e97bd00bf6263845aa98b411507baba28be67e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Sep 2021 11:01:00 +0200
-Subject: [PATCH] meson.build: wayland-scanner is only needed for tests
-
-wayland-scanner is only needed for tests so don't require it if tests
-are disabled
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/wayland-protocols/-/commit/80e97bd00bf6263845aa98b411507baba28be67e]
----
- meson.build       | 2 --
- tests/meson.build | 1 +
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 94b49e7..15dbc37 100644
---- a/meson.build
-+++ b/meson.build
-@@ -8,8 +8,6 @@ wayland_protocols_version = meson.project_version()
- 
- fs = import('fs')
- 
--dep_scanner = dependency('wayland-scanner', native: true)
--
- stable_protocols = [
- 	'presentation-time',
- 	'viewporter',
-diff --git a/tests/meson.build b/tests/meson.build
-index 66337e7..74824ae 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,4 +1,5 @@
- prog_scan_sh = find_program('scan.sh')
-+dep_scanner = dependency('wayland-scanner', native: true)
- prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
- 
- libwayland = [
--- 
-GitLab
-
diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index b76bafb437..1262f0f9d7 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
-md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
-sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
-sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.html
+md5  0c192bf32de09ec30de4a82d1c65329c  wayland-protocols-1.25.tar.xz
+sha1  275298332d124e40e345aa82bc8f48ef8cad3480  wayland-protocols-1.25.tar.xz
+sha256  f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460  wayland-protocols-1.25.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 41ab1e1c99..746d82e308 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.23
+WAYLAND_PROTOCOLS_VERSION = 1.25
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C21C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2BC81A15;
	Mon, 14 Feb 2022 21:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wt9g-iykvZeu; Mon, 14 Feb 2022 21:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B799181992;
	Mon, 14 Feb 2022 21:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179BA1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1431260BA0
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ud-F1nR7lhIN for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:17:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BB160B78
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:17:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1657C82BDB; Mon, 14 Feb 2022 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:01:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f7f8f381394207bfb029ec395f5ced5695a0a2e
X-Git-Newrev: 948050c0f9096953555ed7f84835c5297a415a6d
X-Patchwork-Hint: ignore
Message-Id: <20220214211017.1657C82BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxkbcommon: bump
 version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=948050c0f9096953555ed7f84835c5297a415a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- bump version to 1.4.0

- add new option to select some tools for the target (xkbcli,
  xkbcli-compile-keymap, xkbcli-how-to-type, xkbcli-interactive-evdev,
  xkbcli-interactive-x11, xkbcli-interactive-wayland

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libxkbcommon/Config.in         | 11 +++++++++++
 package/libxkbcommon/libxkbcommon.hash |  4 ++--
 package/libxkbcommon/libxkbcommon.mk   |  8 +++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 4e73a24abb..e9f61227a0 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_LIBXKBCOMMON
 	  specification.
 
 	  https://xkbcommon.org
+
+if BR2_PACKAGE_LIBXKBCOMMON
+
+config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
+	bool "tools"
+	help
+	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
+	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
+	  xkbcli-interactive-wayland
+
+endif
diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index c00fffe706..fff2b7a943 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
-sha256  b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234  libxkbcommon-1.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
+sha256  106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031  libxkbcommon-1.4.0.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index ee2bc1ee99..f2c49cc700 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.3.1
+LIBXKBCOMMON_VERSION = 1.4.0
 LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
@@ -23,4 +23,10 @@ else
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

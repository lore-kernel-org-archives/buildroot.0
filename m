Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE6C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5DF41866;
	Fri, 12 Jul 2024 13:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vo5UD0LKLUDU; Fri, 12 Jul 2024 13:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C11E41767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C11E41767;
	Fri, 12 Jul 2024 13:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 006B01BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E23A46071D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCnvOvQ2b4WX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 159AE6071C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 159AE6071C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:32:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3B0085E64; Fri, 12 Jul 2024 13:32:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 15:32:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d466affdbdff1cd6de6fa5ddcc44d920cd3abdc
X-Git-Newrev: 93b460a29449ba3fae3dbd42cdd228475e767ff1
X-Patchwork-Hint: ignore
Message-Id: <20240712133250.F3B0085E64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zoxide: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93b460a29449ba3fae3dbd42cdd228475e767ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A smarter cd command. Supports all major shells.

https://github.com/ajeetdsouza/zoxide.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zoxide/Config.in   | 11 +++++++++++
 package/zoxide/zoxide.hash |  3 +++
 package/zoxide/zoxide.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f5e1e40bf..4b2fdee6c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2820,6 +2820,7 @@ F:	package/biosdevname/
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
 F:	package/procs/
+F:	package/zoxide/
 
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
diff --git a/package/Config.in b/package/Config.in
index 81f87fa2d5..44ce5a5005 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2727,6 +2727,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zoxide/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/zoxide/Config.in b/package/zoxide/Config.in
new file mode 100644
index 0000000000..b2567dad0b
--- /dev/null
+++ b/package/zoxide/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ZOXIDE
+	bool "zoxide"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  zoxide is a smarter cd command, inspired by z and autojump.
+	  It remembers which directories you use most frequently, so
+	  you can "jump" to them in just a few keystrokes.
+	  zoxide works on all major shells.
+
+	  https://github.com/ajeetdsouza/zoxide.git
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
new file mode 100644
index 0000000000..1a3a066af9
--- /dev/null
+++ b/package/zoxide/zoxide.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f2d9b9448516919f6d5cf32a5f154c2dc3a90d9fdf0addab9cd6a7824020befc  zoxide-0.9.4-cargo2.tar.gz
+sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
new file mode 100644
index 0000000000..92b4395a87
--- /dev/null
+++ b/package/zoxide/zoxide.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zoxide
+#
+################################################################################
+
+ZOXIDE_VERSION = 0.9.4
+ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
+ZOXIDE_LICENSE = MIT
+ZOXIDE_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

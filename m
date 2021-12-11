Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9827C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628FF61CCA;
	Sat, 11 Dec 2021 10:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkcDlrZO9r_y; Sat, 11 Dec 2021 10:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0D561CB5;
	Sat, 11 Dec 2021 10:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03E791BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E174842364
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZywqdNh-DAwt for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 568A1400C6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2B3A88277A; Sat, 11 Dec 2021 09:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 10:55:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7600ca7960d5d3b9b7eb0ad8690e8ff4c12ecf7d
X-Git-Newrev: 39a5beb60fb9b38ca4ce3451dcf64038a363254a
X-Patchwork-Hint: ignore
Message-Id: <20211211095654.2B3A88277A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davinci-bootcount: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=39a5beb60fb9b38ca4ce3451dcf64038a363254a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot implements a boot count scheme that can be used to detect
multiple failed attempts to boot Linux. On Davinci platform (TI AM 335x)
the `bootcount' value is stored in the RTC SCRATCH2 register. This tool
allows to read and write this register from userspace.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
[Arnout: use github helper, add license hash, remove unnecessary
defaults, add autoreconf comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                                |  1 +
 package/davinci-bootcount/Config.in              | 10 ++++++++++
 package/davinci-bootcount/davinci-bootcount.hash |  3 +++
 package/davinci-bootcount/davinci-bootcount.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 57208309c4..87135ae52f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
+	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
new file mode 100644
index 0000000000..58f83bb98c
--- /dev/null
+++ b/package/davinci-bootcount/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci-bootcount"
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. On Davinci
+	  platform (TI AM 335x) the `bootcount' is stored in the RTC
+	  SCRATCH2 register. This tool allows to read and write this
+	  register from userspace.
+
+	  https://github.com/VoltServer/uboot-davinci-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
new file mode 100644
index 0000000000..ef4bca2b7d
--- /dev/null
+++ b/package/davinci-bootcount/davinci-bootcount.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  de7843cf1245a739b6d18d4db478893e50c2de0ee19bbce96dc323065d28c3e4  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
new file mode 100644
index 0000000000..385d96d5a2
--- /dev/null
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# davinci-bootcount
+#
+################################################################################
+
+DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
+DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
+
+# sources fetched from github, no configure script
+DAVINCI_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360D9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE28813B7;
	Tue,  4 Jan 2022 16:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5Bd0Kf7LiLy; Tue,  4 Jan 2022 16:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8322813D4;
	Tue,  4 Jan 2022 16:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFBD1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1174400FB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zTw3WyJ7cfG for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 118324010A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8561782BC6; Tue,  4 Jan 2022 16:40:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:17:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0db062f4b6a7e249602e540204e7e428fc5ff2e
X-Git-Newrev: 6be9913a7eeead7cdac804afc127791ba4b0e69e
X-Patchwork-Hint: ignore
Message-Id: <20220104164044.8561782BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ksmbd-tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6be9913a7eeead7cdac804afc127791ba4b0e69e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ksmbd kernel server userspace utilities.

https://github.com/cifsd-team/ksmbd-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/ksmbd-tools/Config.in        | 15 +++++++++++++++
 package/ksmbd-tools/ksmbd-tools.hash |  3 +++
 package/ksmbd-tools/ksmbd-tools.mk   | 20 ++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 21e4f2a84c..37c792816a 100644
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
index d3d0717535..7148639735 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2231,6 +2231,7 @@ endif
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

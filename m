Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694CAC021A1
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C2740179;
	Sat, 14 Sep 2024 15:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PimMkJXDowPm; Sat, 14 Sep 2024 15:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCEA040184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCEA040184;
	Sat, 14 Sep 2024 15:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ED4D1BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DD8540436
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEP-hauPFbJv for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89D54010C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C89D54010C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B51EC83254; Sat, 14 Sep 2024 15:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:19:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86bb1b2360bdaed069cd087541f4edad1d5ce925
X-Git-Newrev: 49c041aa2753d8dfe524bb3bd671b4d769c8640a
X-Patchwork-Hint: ignore
Message-Id: <20240914152217.B51EC83254@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evilwm: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49c041aa2753d8dfe524bb3bd671b4d769c8640a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nice small and very fast Xorg windowmanager:
https://www.6809.org.uk/evilwm/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Arnout: change license to "evilwm license"]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/evilwm/Config.in   |  9 +++++++++
 package/evilwm/evilwm.hash |  3 +++
 package/evilwm/evilwm.mk   | 21 +++++++++++++++++++++
 package/evilwm/xsession    |  2 ++
 6 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d3a3f65b38..1ac59a0221 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3294,6 +3294,7 @@ N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	board/qemu/riscv32-virt/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
+F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
 F:	package/mksh/
diff --git a/package/Config.in b/package/Config.in
index 187ba3a154..269a8cae6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -437,6 +437,7 @@ comment "X window managers"
 	depends on BR2_PACKAGE_XORG7
 
 	source "package/enlightenment/Config.in"
+	source "package/evilwm/Config.in"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
diff --git a/package/evilwm/Config.in b/package/evilwm/Config.in
new file mode 100644
index 0000000000..86cc17dc76
--- /dev/null
+++ b/package/evilwm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_EVILWM
+	bool "evilwm"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  A minimalist window manager for the X Window System
+
+	  https://www.6809.org.uk/evilwm/
diff --git a/package/evilwm/evilwm.hash b/package/evilwm/evilwm.hash
new file mode 100644
index 0000000000..7fede9641f
--- /dev/null
+++ b/package/evilwm/evilwm.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4  evilwm-1.4.3.tar.gz
+sha256  e98134d702e297c35e2b1150918a2b0cffea523f67644fa64e8dbb823fb55986  README
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
new file mode 100644
index 0000000000..b013305c44
--- /dev/null
+++ b/package/evilwm/evilwm.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# evilwm
+#
+################################################################################
+
+EVILWM_VERSION = 1.4.3
+EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
+EVILWM_LICENSE = evilwm license
+EVILWM_LICENSE_FILES = README
+
+EVILWM_DEPENDENCIES = xlib_libX11
+
+define EVILWM_INSTALL_XSESSION_FILE
+	$(INSTALL) -m 0755 -D package/evilwm/xsession \
+		$(TARGET_DIR)/root/.xsession
+endef
+
+EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
+
+$(eval $(autotools-package))
diff --git a/package/evilwm/xsession b/package/evilwm/xsession
new file mode 100644
index 0000000000..9892af719d
--- /dev/null
+++ b/package/evilwm/xsession
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec evilwm -term xterm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

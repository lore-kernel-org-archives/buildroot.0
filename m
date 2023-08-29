Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F6DEC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87D380B6A;
	Thu,  7 Sep 2023 15:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87D380B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0JFvNPb5wfd; Thu,  7 Sep 2023 15:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB2DD83A8E;
	Thu,  7 Sep 2023 15:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB2DD83A8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15DA61BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DCB941E42
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCB941E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8-uOSnkVrhw for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C774641D80
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C774641D80
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBFF486A1F; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 23:33:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ae3f1748b93990436723a4c4f8434ba61fdc099
X-Git-Newrev: f8047ff5987efc80f6ead51edae126911c02a8ad
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.BBFF486A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nushell: new package
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
Content-Type: multipart/mixed; boundary="===============2336111040299072535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2336111040299072535==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f8047ff5987efc80f6ead51edae126911c02a8ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nushell is a shell - written in Rust - that makes use of the nushell
language to interact with the operating system

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/nushell/Config.in    | 12 ++++++++++++
 package/nushell/nushell.hash |  3 +++
 package/nushell/nushell.mk   | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 241de082eb..24ec17a7c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2683,6 +2683,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/nushell/
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 3d16ea37d1..5449884809 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2607,6 +2607,7 @@ comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
 	source "package/mksh/Config.in"
+	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/apg/Config.in"
diff --git a/package/nushell/Config.in b/package/nushell/Config.in
new file mode 100644
index 0000000000..edb01d2f72
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_HOST_PKGCONF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PROGS
+	help
+	  A new type of shell.
+
+	  https://github.com/nushell/nushell
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
new file mode 100644
index 0000000000..b553a6c2bc
--- /dev/null
+++ b/package/nushell/nushell.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
+sha256  e189616e535e9f7bf410a72e6fc51ad1e0ae461c58d592e186c2669daa5d1e5d  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
new file mode 100644
index 0000000000..b9c1ee6434
--- /dev/null
+++ b/package/nushell/nushell.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# nushell
+#
+################################################################################
+
+NUSHELL_VERSION = 0.76.0
+NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
+NUSHELL_LICENSE = MIT
+NUSHELL_LICENSE_FILES = LICENSE
+NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
+
+# Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
+define NUSHELL_ADD_NU_TO_SHELLS
+	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/nu" >> $(TARGET_DIR)/etc/shells
+endef
+NUSHELL_TARGET_FINALIZE_HOOKS += NUSHELL_ADD_NU_TO_SHELLS
+
+$(eval $(cargo-package))

--===============2336111040299072535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2336111040299072535==--

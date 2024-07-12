Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68263C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55484198D;
	Fri, 12 Jul 2024 20:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTh_PK1jh1Yw; Fri, 12 Jul 2024 20:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604CE412F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604CE412F9;
	Fri, 12 Jul 2024 20:57:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 677871BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 550D460651
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syQHdgTmHaBw for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D246063D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80D246063D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67BBB8620F; Fri, 12 Jul 2024 20:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:57:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b919d852e2a09b3517b79f8d0a5edeca21d2a9bb
X-Git-Newrev: f4cf2bbc42d0c55393356bdb5a40b79fc1ba8cad
X-Patchwork-Hint: ignore
Message-Id: <20240712205752.67BBB8620F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tig: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4cf2bbc42d0c55393356bdb5a40b79fc1ba8cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tig is an ncurses-based text-mode interface for git. It
functions mainly as a Git repository browser, but can also
assist in staging changes for commit at chunk level and act
as a pager for output from various Git commands.

https://jonas.github.io/tig/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/tig/Config.in | 12 ++++++++++++
 package/tig/tig.hash  |  6 ++++++
 package/tig/tig.mk    | 21 +++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5ca42fb00..f482e3fe56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1788,6 +1788,7 @@ F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
 F:	package/riscv-isa-sim/
+F:	package/tig/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
diff --git a/package/Config.in b/package/Config.in
index 34ce57f5cf..eeb11dfa83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -202,6 +202,7 @@ menu "Development tools"
 	source "package/ripgrep/Config.in"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
+	source "package/tig/Config.in"
 	source "package/tree/Config.in"
 	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
diff --git a/package/tig/Config.in b/package/tig/Config.in
new file mode 100644
index 0000000000..0a1cc93404
--- /dev/null
+++ b/package/tig/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TIG
+	bool "tig"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_NCURSES
+	help
+	  Tig is an ncurses-based text-mode interface for git. It
+	  functions mainly as a Git repository browser, but can also
+	  assist in staging changes for commit at chunk level and act
+	  as a pager for output from various Git commands.
+
+	  https://jonas.github.io/tig/
diff --git a/package/tig/tig.hash b/package/tig/tig.hash
new file mode 100644
index 0000000000..b5aebb9c5d
--- /dev/null
+++ b/package/tig/tig.hash
@@ -0,0 +1,6 @@
+# From:
+# https://github.com/jonas/tig/releases/download/tig-2.5.10/tig-2.5.10.tar.gz.sha256
+sha256  f655cc1366fc10058a2bd505bb88ca78e653ff7526c1b81774c44b9d841210e3  tig-2.5.10.tar.gz
+
+# Locally calculated
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tig/tig.mk b/package/tig/tig.mk
new file mode 100644
index 0000000000..d3aa6df62a
--- /dev/null
+++ b/package/tig/tig.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tig
+#
+################################################################################
+
+TIG_VERSION = 2.5.10
+TIG_SITE = https://github.com/jonas/tig/releases/download/tig-$(TIG_VERSION)
+TIG_LICENSE = GPL-2.0+
+TIG_LICENSE_FILES = COPYING
+
+TIG_DEPENDENCIES = ncurses
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+TIG_DEPENDENCIES += libiconv
+TIG_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
+else
+TIG_CONF_OPTS += --without-iconv
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

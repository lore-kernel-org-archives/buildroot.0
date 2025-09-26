Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9BCCAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 20:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C5042122;
	Fri, 26 Sep 2025 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onaT8jrM7nO7; Fri, 26 Sep 2025 20:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE55D42130
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE55D42130;
	Fri, 26 Sep 2025 20:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9725412D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D13884BA7
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTvqcQ8mDcYu for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 20:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CAC084BA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CAC084BA2
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:13:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BC5286525; Fri, 26 Sep 2025 20:13:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 21:57:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 800dcabe6568001503dce30644978ad82c332424
X-Git-Newrev: 5d497c095668f88fec94ac49c129d8efe7d9611e
X-Patchwork-Hint: ignore
Message-Id: <20250926201302.3BC5286525@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bvi: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d497c095668f88fec94ac49c129d8efe7d9611e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A visual editor for binary files. Bvi allows the user to edit binary files
with a VI-like interface.

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
[Julien:
 - sort DEVELOPERS entries
 - reword commit log title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/bvi/Config.in |  8 ++++++++
 package/bvi/bvi.hash  |  3 +++
 package/bvi/bvi.mk    | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c074923650..8dded9800b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -873,6 +873,7 @@ N:	Dimitar Tomov <dimi@tpm.dev>
 F:	package/wolftpm/
 
 N:	Dimitrios Siganos <dimitris@siganos.org>
+F:	package/bvi/
 F:	package/wireless-regdb/
 
 N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 85928509f8..c54be6275e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2950,6 +2950,7 @@ endmenu
 
 menu "Text editors and viewers"
 	source "package/bat/Config.in"
+	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/bvi/Config.in b/package/bvi/Config.in
new file mode 100644
index 0000000000..654fbf9cd7
--- /dev/null
+++ b/package/bvi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BVI
+	bool "bvi"
+	select BR2_PACKAGE_NCURSES
+	help
+	  A visual editor for binary files. Bvi allows the user to
+	  edit binary files with a VI-like interface.
+
+	  https://sourceforge.net/projects/bvi
diff --git a/package/bvi/bvi.hash b/package/bvi/bvi.hash
new file mode 100644
index 0000000000..a65daf0612
--- /dev/null
+++ b/package/bvi/bvi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6540716a1a3b2b9711635108da14b26baea488881d4a682121c0bddbba6b74cb  bvi-1.5.0.src.tar.gz
+sha256  3e59ea99615003174426e1321df7a804f1d5bfe61bfaba7ebbb2db0e358f93fb  COPYING
diff --git a/package/bvi/bvi.mk b/package/bvi/bvi.mk
new file mode 100644
index 0000000000..8bf6ac5c0e
--- /dev/null
+++ b/package/bvi/bvi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# bvi
+#
+################################################################################
+
+BVI_VERSION = 1.5.0
+BVI_SITE = https://sourceforge.net/projects/bvi/files/bvi/$(BVI_VERSION)
+BVI_SOURCE = bvi-$(BVI_VERSION).src.tar.gz
+BVI_LICENSE = GPL-3.0+
+BVI_LICENSE_FILES = COPYING
+BVI_DEPENDENCIES = ncurses
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

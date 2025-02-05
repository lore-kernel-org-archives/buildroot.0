Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B71EC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7973284126;
	Fri, 28 Feb 2025 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfNYZXBH4Mvs; Fri, 28 Feb 2025 17:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430768446A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430768446A;
	Fri, 28 Feb 2025 17:15:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13EB668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14ED1419B7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvJlyXHpRnZB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B204383D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B204383D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58DDF865FC; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:00:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1155290904be0f0fab4bc964a099884e7fcb77f5
X-Git-Newrev: 1503580dcd8b677d71b79ea834ff2f72cd605186
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.58DDF865FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snooze: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2418663023871165930=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2418663023871165930==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1503580dcd8b677d71b79ea834ff2f72cd605186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[Peter: add to DEVELOPERS, add s-o-b to patch, add TARGET_CFLAGS/LDFLAGS,
	use /usr PREFIX]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../snooze/0001-fix-snooze-n-format-string.patch   | 40 ++++++++++++++++++++++
 package/snooze/Config.in                           |  8 +++++
 package/snooze/snooze.hash                         |  3 ++
 package/snooze/snooze.mk                           | 28 +++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4dd8df9e0..837fa93f4d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1473,6 +1473,7 @@ F:	package/s6-networking/
 F:	package/s6-portable-utils/
 F:	package/s6-rc/
 F:	package/skalibs/
+F:	package/snooze/
 F:	package/tipidee/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
diff --git a/package/Config.in b/package/Config.in
index 3ec6d0d879..3153fd6afa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2406,6 +2406,7 @@ menu "Miscellaneous"
 	source "package/qpdf/Config.in"
 	source "package/rtl_433/Config.in"
 	source "package/shared-mime-info/Config.in"
+	source "package/snooze/Config.in"
 	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
diff --git a/package/snooze/0001-fix-snooze-n-format-string.patch b/package/snooze/0001-fix-snooze-n-format-string.patch
new file mode 100644
index 0000000000..293777166f
--- /dev/null
+++ b/package/snooze/0001-fix-snooze-n-format-string.patch
@@ -0,0 +1,40 @@
+From 5f9e616b29fe272fffbb31e4b7ea8ff61f781601 Mon Sep 17 00:00:00 2001
+From: Leah Neukirchen <leah@vuxu.org>
+Date: Wed, 29 May 2024 19:42:27 +0200
+Subject: [PATCH] fix "snooze -n" format string
+
+Fixes #22.
+
+Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
+
+Upstream: https://github.com/leahneukirchen/snooze/commit/5f9e616b29fe272fffbb31e4b7ea8ff61f781601
+---
+ snooze.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/snooze.c b/snooze.c
+index 06f0d07..e47ad11 100644
+--- a/snooze.c
++++ b/snooze.c
+@@ -329,13 +329,13 @@ main(int argc, char *argv[])
+ 			char weekstr[4];
+ 			struct tm *tm = localtime(&t);
+ 			strftime(weekstr, sizeof weekstr, "%a", tm);
+-			printf("%s %s %2ldd%3ldh%3ldm%3lds ",
++			printf("%s %s %2dd%3dh%3dm%3ds ",
+ 			    isotime(tm),
+ 			    weekstr,
+-			    ((t - now) / (60*60*24)),
+-			    ((t - now) / (60*60)) % 24,
+-			    ((t - now) / 60) % 60,
+-			    (t - now) % 60);
++			    ((int)(t - now) / (60*60*24)),
++			    ((int)(t - now) / (60*60)) % 24,
++			    ((int)(t - now) / 60) % 60,
++			    (int)(t - now) % 60);
+ 			if(jitter) {
+ 				printf("(plus up to %ds for jitter)\n", jitter);
+ 			} else {
+--
+2.43.0
+
diff --git a/package/snooze/Config.in b/package/snooze/Config.in
new file mode 100644
index 0000000000..0e068cb607
--- /dev/null
+++ b/package/snooze/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SNOOZE
+	bool "snooze"
+	help
+	  snooze is a tool for waiting until a particular time and then
+	  running a command. Together with a service supervision system
+	  such as runit, this can be used to replace cron(8).
+
+	  https://github.com/leahneukirchen/snooze
diff --git a/package/snooze/snooze.hash b/package/snooze/snooze.hash
new file mode 100644
index 0000000000..c1710d857f
--- /dev/null
+++ b/package/snooze/snooze.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  d63fde85d9333188bed5996baabd833eaa00842ce117443ffbf8719c094be414  snooze-0.5.tar.gz
+sha256  2cea433f84afcfd9d55515908d3ea69ed1df00ffbf90cc48cd68d72a2b464544  README.md
diff --git a/package/snooze/snooze.mk b/package/snooze/snooze.mk
new file mode 100644
index 0000000000..9c5f7a3830
--- /dev/null
+++ b/package/snooze/snooze.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# snooze
+#
+################################################################################
+
+SNOOZE_VERSION = 0.5
+SNOOZE_SITE = $(call github,leahneukirchen,snooze,v$(SNOOZE_VERSION))
+SNOOZE_LICENSE = CC0-1.0
+
+# Unfortunately, snooze doesn't have a dedicated file for the license, but it
+# is mentioned in the README and in the manpage.
+SNOOZE_LICENSE_FILES = README.md
+
+SNOOZE_MAKE_OPTS = \
+	PREFIX=/usr \
+	CC=$(TARGET_CC) \
+	CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+
+define SNOOZE_BUILD_CMDS
+	$(MAKE) -C $(@D)/ $(SNOOZE_MAKE_OPTS)
+endef
+
+define SNOOZE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/ $(SNOOZE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))

--===============2418663023871165930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2418663023871165930==--

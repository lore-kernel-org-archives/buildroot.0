Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF3C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12F6143723;
	Wed, 20 Dec 2023 20:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12F6143723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vR2Ht_sp0MBh; Wed, 20 Dec 2023 20:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7046436FA;
	Wed, 20 Dec 2023 20:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7046436FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A666D1BF95D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FA70839BF
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FA70839BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aB8CrHgIGN3X for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F357839B4
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F357839B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 599BF87C6F; Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:44:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 898941a0d78600971c69e688773c5cdbe35ced96
X-Git-Newrev: 713a71c73084f9c610dac71df526c8d7c84bf1cf
X-Patchwork-Hint: ignore
Message-Id: <20231220204701.599BF87C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid-readline: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=713a71c73084f9c610dac71df526c8d7c84bf1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                        |  1 +
 package/python-urwid-readline/Config.in                  |  8 ++++++++
 package/python-urwid-readline/python-urwid-readline.hash |  3 +++
 package/python-urwid-readline/python-urwid-readline.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..d3fc4514c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1372,6 +1372,7 @@ menu "External python modules"
 	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-urwid-readline/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-urwid-readline/Config.in b/package/python-urwid-readline/Config.in
new file mode 100644
index 0000000000..a8046fc25b
--- /dev/null
+++ b/package/python-urwid-readline/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_URWID_READLINE
+	bool "python-urwid-readline"
+	select BR2_PACKAGE_PYTHON_URWID # runtime
+	help
+	  A textbox edit widget for urwid that supports readline
+	  shortcuts.
+
+	  https://github.com/rr-/urwid_readline
diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
new file mode 100644
index 0000000000..75220e937b
--- /dev/null
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/urwid_readline/json
+md5  6e0bd170f621f0ad3edab1875bdb5c5f  urwid_readline-0.13.tar.gz
+sha256  018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4  urwid_readline-0.13.tar.gz
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
new file mode 100644
index 0000000000..782c425b65
--- /dev/null
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-urwid-readline
+#
+################################################################################
+
+PYTHON_URWID_READLINE_VERSION = 0.13
+PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ab/bb/c5b3fec22268d97ad30232f5533d4a5939d4df7ed3917a8d20d447f1d0a7
+PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

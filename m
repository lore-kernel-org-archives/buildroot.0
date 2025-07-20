Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03BFC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CA983A54;
	Sun, 20 Jul 2025 11:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IELxc2bJeQx2; Sun, 20 Jul 2025 11:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B261F8354D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B261F8354D;
	Sun, 20 Jul 2025 11:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60DF1117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 525DE40063
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efnSb8A8wNX7 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14A14005B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14A14005B
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BDB9867FE; Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c52d711923d6e8bab0618e043fa0261457cb76b9
X-Git-Newrev: a0f094b067eb679503ee3b87b22ab42c0423ab8d
X-Patchwork-Hint: ignore
Message-Id: <20250720114114.8BDB9867FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crc: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0f094b067eb679503ee3b87b22ab42c0423ab8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-crc/Config.in       |  6 ++++++
 package/python-crc/python-crc.hash |  5 +++++
 package/python-crc/python-crc.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 66d0cce9a4..59c6635025 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2288,6 +2288,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-crc/
 F:	package/python-django/
 F:	package/python-immutabledict/
 F:	package/python-jc/
diff --git a/package/Config.in b/package/Config.in
index 383c783f78..aa4f43c379 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1076,6 +1076,7 @@ menu "External python modules"
 	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crayons/Config.in"
+	source "package/python-crc/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crontab/Config.in"
diff --git a/package/python-crc/Config.in b/package/python-crc/Config.in
new file mode 100644
index 0000000000..7f5fb72307
--- /dev/null
+++ b/package/python-crc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CRC
+	bool "python-crc"
+	help
+	  Pure Python CRC library.
+
+	  https://github.com/Nicoretti/crc
diff --git a/package/python-crc/python-crc.hash b/package/python-crc/python-crc.hash
new file mode 100644
index 0000000000..f54044af5b
--- /dev/null
+++ b/package/python-crc/python-crc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/crc/json
+md5  cca626fb7bc30b4c468216ca67ee21c2  crc-7.1.0.tar.gz
+sha256  99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d  crc-7.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  803152006c87fdfd8b30b087734fd590e7a8d871df1a6de40a8fbdd27673907f  LICENSE.txt
diff --git a/package/python-crc/python-crc.mk b/package/python-crc/python-crc.mk
new file mode 100644
index 0000000000..afee463092
--- /dev/null
+++ b/package/python-crc/python-crc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-crc
+#
+################################################################################
+
+PYTHON_CRC_VERSION = 7.1.0
+PYTHON_CRC_SOURCE = crc-$(PYTHON_CRC_VERSION).tar.gz
+PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025
+PYTHON_CRC_SETUP_TYPE = poetry
+PYTHON_CRC_LICENSE = BSD-2-Clause
+PYTHON_CRC_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

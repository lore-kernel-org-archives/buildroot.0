Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF39C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 19:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1B661B8F;
	Sat, 19 Jul 2025 19:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQzOQOPiVyoZ; Sat, 19 Jul 2025 19:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0DE61B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0DE61B49;
	Sat, 19 Jul 2025 19:28:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26B59117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1CA61B49
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oata9Q5tSpD5 for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 19:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5787A60BE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5787A60BE0
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45643865A3; Sat, 19 Jul 2025 19:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 21:15:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69b2777291287e9bf43690d5b86bb2a512394233
X-Git-Newrev: b84226a51f8314209b2dd5d32f891abf8a0fdff8
X-Patchwork-Hint: ignore
Message-Id: <20250719192816.45643865A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-log-rate-limit: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b84226a51f8314209b2dd5d32f891abf8a0fdff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-log-rate-limit/Config.in                  |  7 +++++++
 package/python-log-rate-limit/python-log-rate-limit.hash |  5 +++++
 package/python-log-rate-limit/python-log-rate-limit.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6029cf9858..66d0cce9a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2291,6 +2291,7 @@ F:	package/picotool/
 F:	package/python-django/
 F:	package/python-immutabledict/
 F:	package/python-jc/
+F:	package/python-log-rate-limit/
 F:	package/python-pydantic/
 F:	package/python-pydantic-core/
 F:	package/python-pydantic-settings/
diff --git a/package/Config.in b/package/Config.in
index f8f03f1eef..383c783f78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1217,6 +1217,7 @@ menu "External python modules"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
+	source "package/python-log-rate-limit/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
diff --git a/package/python-log-rate-limit/Config.in b/package/python-log-rate-limit/Config.in
new file mode 100644
index 0000000000..06b8a42e68
--- /dev/null
+++ b/package/python-log-rate-limit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LOG_RATE_LIMIT
+	bool "python-log-rate-limit"
+	help
+	  Limit excessive log output with Python's standard logging
+	  framework.
+
+	  https://github.com/samuller/log-rate-limit
diff --git a/package/python-log-rate-limit/python-log-rate-limit.hash b/package/python-log-rate-limit/python-log-rate-limit.hash
new file mode 100644
index 0000000000..80bd5d7290
--- /dev/null
+++ b/package/python-log-rate-limit/python-log-rate-limit.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/log-rate-limit/json
+md5  07ff9e57864b1e005e7272f47d92892f  log_rate_limit-1.4.2.tar.gz
+sha256  06963abe6e1c498d16cb302b5f92d864f41bbe09ea4c898cd4e3a7d675b99de8  log_rate_limit-1.4.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-log-rate-limit/python-log-rate-limit.mk b/package/python-log-rate-limit/python-log-rate-limit.mk
new file mode 100644
index 0000000000..8b2d423de0
--- /dev/null
+++ b/package/python-log-rate-limit/python-log-rate-limit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-log-rate-limit
+#
+################################################################################
+
+PYTHON_LOG_RATE_LIMIT_VERSION = 1.4.2
+PYTHON_LOG_RATE_LIMIT_SOURCE = log_rate_limit-$(PYTHON_LOG_RATE_LIMIT_VERSION).tar.gz
+PYTHON_LOG_RATE_LIMIT_SITE = https://files.pythonhosted.org/packages/0d/c2/d3c67f59b934d0edfc00a7cfcac56d17fa9b9832ba8e353217c93187e506
+PYTHON_LOG_RATE_LIMIT_SETUP_TYPE = poetry
+PYTHON_LOG_RATE_LIMIT_LICENSE = Apache-2.0
+PYTHON_LOG_RATE_LIMIT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

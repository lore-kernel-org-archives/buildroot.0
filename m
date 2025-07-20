Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E131C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 13:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF98283BD6;
	Sun, 20 Jul 2025 13:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6nvUv-03qgW; Sun, 20 Jul 2025 13:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAEE683EC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAEE683EC0;
	Sun, 20 Jul 2025 13:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0DB7DA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE79B40584
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id db099_Nt5LAF for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 13:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC70640414
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC70640414
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA52B86819; Sun, 20 Jul 2025 13:15:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 15:08:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 205dfb943a3eb40df191d854b8f86bd78e348aa6
X-Git-Newrev: 26900bc6c935ef10108915a7f924d46fd422aea7
X-Patchwork-Hint: ignore
Message-Id: <20250720131530.DA52B86819@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apscheduler: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=26900bc6c935ef10108915a7f924d46fd422aea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-apscheduler/Config.in               |  7 +++++++
 package/python-apscheduler/python-apscheduler.hash |  5 +++++
 package/python-apscheduler/python-apscheduler.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 186fd7331c..e8764035b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2288,6 +2288,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
 F:	package/python-immutabledict/
diff --git a/package/Config.in b/package/Config.in
index aa4f43c379..22a57fa911 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1011,6 +1011,7 @@ menu "External python modules"
 	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
+	source "package/python-apscheduler/Config.in"
 	source "package/python-argcomplete/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
diff --git a/package/python-apscheduler/Config.in b/package/python-apscheduler/Config.in
new file mode 100644
index 0000000000..ebb9b13cfa
--- /dev/null
+++ b/package/python-apscheduler/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_APSCHEDULER
+	bool "python-apscheduler"
+	select BR2_PACKAGE_PYTHON_TZLOCAL # runtime
+	help
+	  Task scheduling library for Python.
+
+	  https://apscheduler.readthedocs.io
diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
new file mode 100644
index 0000000000..1f2ba1f82e
--- /dev/null
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/apscheduler/json
+md5  1705663d09aeb1b174f964780c57520a  apscheduler-3.11.0.tar.gz
+sha256  4c622d250b0955a65d5d0eb91c33e6d43fd879834bf541e0a18661ae60460133  apscheduler-3.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
new file mode 100644
index 0000000000..c5d89c5c2d
--- /dev/null
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-apscheduler
+#
+################################################################################
+
+PYTHON_APSCHEDULER_VERSION = 3.11.0
+PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/4e/00/6d6814ddc19be2df62c8c898c4df6b5b1914f3bd024b780028caa392d186
+PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
+PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_APSCHEDULER_LICENSE = MIT
+PYTHON_APSCHEDULER_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

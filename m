Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2507DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0EF409C0;
	Sat,  8 Jan 2022 16:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvmlL14d4hWG; Sat,  8 Jan 2022 16:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085CF40946;
	Sat,  8 Jan 2022 16:59:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB9121BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA2E181570
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7VRSmtRdesy for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 243668151E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:59:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 77BE482DF3; Sat,  8 Jan 2022 16:52:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:57:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79c5639597e961a36ee10e55b0479e642013448f
X-Git-Newrev: c17a9b2de86ace9754ca874707736705865dd309
X-Patchwork-Hint: ignore
Message-Id: <20220108165256.77BE482DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memory-profiler: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c17a9b2de86ace9754ca874707736705865dd309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A module for monitoring memory usage of a python program.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                                          |  1 +
 package/python-memory-profiler/Config.in                   |  8 ++++++++
 package/python-memory-profiler/python-memory-profiler.hash |  5 +++++
 package/python-memory-profiler/python-memory-profiler.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bf7a346f75..bf18d5f4fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1090,6 +1090,7 @@ menu "External python modules"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
+	source "package/python-memory-profiler/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
diff --git a/package/python-memory-profiler/Config.in b/package/python-memory-profiler/Config.in
new file mode 100644
index 0000000000..60833304ae
--- /dev/null
+++ b/package/python-memory-profiler/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MEMORY_PROFILER
+	bool "python-memory-profiler"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
+	help
+	  A module for monitoring memory usage of a python program.
+
+	  https://github.com/pythonprofilers/memory_profiler
diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
new file mode 100644
index 0000000000..9ee515b529
--- /dev/null
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/memory-profiler/json
+md5  b1d1783064a1198fb21bc877e535ec1b  memory_profiler-0.58.0.tar.gz
+sha256  01385ac0fec944fcf7969814ec4406c6d8a9c66c079d09276723c5a7680f44e5  memory_profiler-0.58.0.tar.gz
+# Locally computed sha256 checksums
+sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
new file mode 100644
index 0000000000..053b0e2d62
--- /dev/null
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-memory-profiler
+#
+################################################################################
+
+PYTHON_MEMORY_PROFILER_VERSION = 0.58.0
+PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/8f/fd/d92b3295657f8837e0177e7b48b32d6651436f0293af42b76d134c3bb489
+PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
+PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
+PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

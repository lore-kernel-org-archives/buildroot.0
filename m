Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B469FC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E5F380F49;
	Fri, 16 May 2025 14:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOjgZVaSuLTv; Fri, 16 May 2025 14:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD54D81479
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD54D81479;
	Fri, 16 May 2025 14:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E5B13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EBD360841
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJghQ8qEoRwb for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B7260AC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B7260AC8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A1486BDA; Fri, 16 May 2025 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0468aae90a0124b79febf8705d9779e7a8a2ce4c
X-Git-Newrev: 9b6e7bf7ee2fb03fae040853a3c12a8e1b46a532
X-Patchwork-Hint: ignore
Message-Id: <20250516142129.E4A1486BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspection: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b6e7bf7ee2fb03fae040853a3c12a8e1b46a532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add python-typing-inspection as a newly introduced dependency of
pydantic.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-typing-inspection/Config.in                 |  7 +++++++
 .../python-typing-inspection/python-typing-inspection.hash |  5 +++++
 .../python-typing-inspection/python-typing-inspection.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b15c2238..b4f2bad865 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2276,6 +2276,7 @@ F:	package/picotool/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
+F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index a9074ac405..2991b47548 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1466,6 +1466,7 @@ menu "External python modules"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
+	source "package/python-typing-inspection/Config.in"
 	source "package/python-tzlocal/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
diff --git a/package/python-typing-inspection/Config.in b/package/python-typing-inspection/Config.in
new file mode 100644
index 0000000000..bedfb21fbc
--- /dev/null
+++ b/package/python-typing-inspection/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPING_INSPECTION
+	bool "python-typing-inspection"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Runtime typing introspection tools.
+
+	  https://github.com/pydantic/typing-inspection
diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
new file mode 100644
index 0000000000..2ed08c1d35
--- /dev/null
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing-inspection/json
+md5  694cee9b0518959cd4b2b7ce2dc5cf2e  typing_inspection-0.4.0.tar.gz
+sha256  9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122  typing_inspection-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4e40cba793a388dd456577b8657175bbe95e4ded2970534b3c59cccc2661a708  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
new file mode 100644
index 0000000000..043ee12090
--- /dev/null
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing-inspection
+#
+################################################################################
+
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.0
+PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/82/5c/e6082df02e215b846b4b8c0b887a64d7d08ffaba30605502639d44c06b82
+PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
+PYTHON_TYPING_INSPECTION_LICENSE = MIT
+PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

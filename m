Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B186FE9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 20:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8123880EA7;
	Sat, 27 Dec 2025 20:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDr9W4PdWWDJ; Sat, 27 Dec 2025 20:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B4280DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766868887;
	bh=mMKFQO9NPNG/Us+BTmkTexZF9gEqw53dnj5BhHSCtjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M9cTDRJ+Vf57u3BtyAbXm2br9hRRD5gMtBfp78Sf9hUJ/qppTeAw+1Zw6jbQh7CtL
	 bdq3Yw1BfSNIBwrx5NJzwgJqBUj2RoLgcUiN26qdqQblrS8QkLtQCFhGMtaXgrpnY8
	 zPKIqEyWeFPUwcDEdmX7y/HSBfGzZ8JvvGHUN4YvXXVnX9ceXojCmtRsC0//bLD+v7
	 96kJRF3v4ujrhepevTgUuIAQNGu5SNtazGMtxG5A00MrZoeRppDM6lV5oIOXuJAs1v
	 kR97z3A4IhhUEhF0UX361+JC3B8EPKSdTmZxCcyIWwVNZK4nL3TZ2HKIGgfBzWnf+/
	 0L81UZAHMJmyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B4280DEF;
	Sat, 27 Dec 2025 20:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D326D119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD516403A1
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buB5qa534KUK for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D133040167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D133040167
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF41287816; Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 21:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 673adebb0c8dc34c5572c7419dd3545ab2981380
X-Git-Newrev: ec0872b0e07485703eead4c3febb0402f0d40afe
X-Patchwork-Hint: ignore
Message-Id: <20251227205444.BF41287816@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-varlink: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec0872b0e07485703eead4c3febb0402f0d40afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are currently problems in updating the pypi.org release[1], so we
pull the package from the github generated tarball instead. This in turn
then requires manually setting the version for setuptools_scm in the
environment.

[1] https://github.com/varlink/python/issues/81

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-varlink/Config.in           |  6 ++++++
 package/python-varlink/python-varlink.hash |  3 +++
 package/python-varlink/python-varlink.mk   | 15 +++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a9eb5d9231..0451d8341c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
+F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
diff --git a/package/Config.in b/package/Config.in
index f33c116ec5..499c59a52e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1478,6 +1478,7 @@ menu "External python modules"
 	source "package/python-uvicorn/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
+	source "package/python-varlink/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-visitor/Config.in"
 	source "package/python-waitress/Config.in"
diff --git a/package/python-varlink/Config.in b/package/python-varlink/Config.in
new file mode 100644
index 0000000000..609fa22219
--- /dev/null
+++ b/package/python-varlink/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VARLINK
+	bool "python-varlink"
+	help
+	  Python implementation of the Varlink protocol.
+
+	  https://github.com/varlink/python
diff --git a/package/python-varlink/python-varlink.hash b/package/python-varlink/python-varlink.hash
new file mode 100644
index 0000000000..5d8dfa9d8e
--- /dev/null
+++ b/package/python-varlink/python-varlink.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  d31aee370ded51bc2bf8ad375fcd8b4cf3b7587306c0e05cffb45026ea9b9c40  python-varlink-32.1.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/python-varlink/python-varlink.mk b/package/python-varlink/python-varlink.mk
new file mode 100644
index 0000000000..1180cc4cc3
--- /dev/null
+++ b/package/python-varlink/python-varlink.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-varlink
+#
+################################################################################
+
+PYTHON_VARLINK_VERSION = 32.1.0
+PYTHON_VARLINK_SITE = $(call github,varlink,python,$(PYTHON_VARLINK_VERSION))
+PYTHON_VARLINK_SETUP_TYPE = setuptools
+PYTHON_VARLINK_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_VARLINK_LICENSE = Apache-2.0
+PYTHON_VARLINK_LICENSE_FILES = LICENSE.txt
+PYTHON_VARLINK_ENV = SETUPTOOLS_SCM_PRETEND_VERSION_FOR_VARLINK=$(PYTHON_VARLINK_VERSION)
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D9FE77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4183284639;
	Fri, 13 Dec 2024 22:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jQGs7O2Uz_R; Fri, 13 Dec 2024 22:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DAD84632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DAD84632;
	Fri, 13 Dec 2024 22:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C5E1146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94F3484627
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqJGuplpXjFa for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8918984623
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8918984623
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81FED86F7D; Fri, 13 Dec 2024 22:18:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:06:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dc0482b0770ebe2353e3827b85c6980e3912bdb
X-Git-Newrev: 96e7f24164de9fc3df84c511e456b3840b631a29
X-Patchwork-Hint: ignore
Message-Id: <20241213221820.81FED86F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-changelog-chug: add new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96e7f24164de9fc3df84c511e456b3840b631a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

changelog-chug is a parser for project Change Log documents.

This package is required to build the new version of
the python-daemon module.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                       |  1 +
 package/python-changelog-chug/Config.in                 |  6 ++++++
 .../python-changelog-chug/python-changelog-chug.hash    |  5 +++++
 package/python-changelog-chug/python-changelog-chug.mk  | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7cfcdf2c58..5fa344c321 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "External python modules"
 	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-changelog-chug/Config.in"
 	source "package/python-channels/Config.in"
 	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
diff --git a/package/python-changelog-chug/Config.in b/package/python-changelog-chug/Config.in
new file mode 100644
index 0000000000..5eb9beca55
--- /dev/null
+++ b/package/python-changelog-chug/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHANGELOG_CHUG
+	bool "python-changelog-chug"
+	help
+	  changelog-chug is a parser for project Change Log documents.
+
+	  https://pypi.org/project/changelog-chug
diff --git a/package/python-changelog-chug/python-changelog-chug.hash b/package/python-changelog-chug/python-changelog-chug.hash
new file mode 100644
index 0000000000..848a74cf37
--- /dev/null
+++ b/package/python-changelog-chug/python-changelog-chug.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/changelog-chug/json
+md5  4ccd595cfa9e929bfa04b7e64de3663c  changelog_chug-0.0.3.tar.gz
+sha256  98ee1e8be75b6e9d512c35292c3c293a124541a4ec2014a6ec3cf33a3d265d2d  changelog_chug-0.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  aa0c846d25b7f2bf4ee44e607666bc318eea1ad5bf6f8cfdf50fc350d1085c1c  COPYING
diff --git a/package/python-changelog-chug/python-changelog-chug.mk b/package/python-changelog-chug/python-changelog-chug.mk
new file mode 100644
index 0000000000..ae5ed7287d
--- /dev/null
+++ b/package/python-changelog-chug/python-changelog-chug.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-changelog-chug
+#
+################################################################################
+
+PYTHON_CHANGELOG_CHUG_VERSION = 0.0.3
+PYTHON_CHANGELOG_CHUG_SOURCE = changelog_chug-$(PYTHON_CHANGELOG_CHUG_VERSION).tar.gz
+PYTHON_CHANGELOG_CHUG_SITE = https://files.pythonhosted.org/packages/fc/6d/f08e0f600f88c69923c692d486096ca7d2eae5d657516ec134fb45ed0ab0
+PYTHON_CHANGELOG_CHUG_SETUP_TYPE = setuptools
+PYTHON_CHANGELOG_CHUG_LICENSE = AGPL-3.0+
+PYTHON_CHANGELOG_CHUG_LICENSE_FILES = COPYING
+PYTHON_CHANGELOG_CHUG_DEPENDENCIES = host-python-semver host-python-docutils
+HOST_PYTHON_CHANGELOG_CHUG_DEPENDENCIES = host-python-semver host-python-docutils
+
+$(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

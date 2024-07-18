Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418CC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B830B60EA7;
	Thu, 18 Jul 2024 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBmwVn_rG1LX; Thu, 18 Jul 2024 20:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F6F60E95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F6F60E95;
	Thu, 18 Jul 2024 20:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55CD61BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41B754066C
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS4er1pXUW1u for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 375F7405F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 375F7405F9
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25AB086E18; Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1d9e4b9f74e840f6bb805743f3872310369506e
X-Git-Newrev: c3faf4f71623562480629d550f89cf7bf454e680
X-Patchwork-Hint: ignore
Message-Id: <20240718205557.25AB086E18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpclib: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3faf4f71623562480629d550f89cf7bf454e680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-grpclib/Config.in           |  8 ++++++++
 package/python-grpclib/python-grpclib.hash |  5 +++++
 package/python-grpclib/python-grpclib.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c6e9611ca9..acdc72c441 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ menu "External python modules"
 	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpclib/Config.in b/package/python-grpclib/Config.in
new file mode 100644
index 0000000000..42cc011097
--- /dev/null
+++ b/package/python-grpclib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCLIB
+	bool "python-grpclib"
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	help
+	  Pure-Python gRPC implementation for asyncio.
+
+	  https://github.com/vmagamedov/grpclib
diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
new file mode 100644
index 0000000000..cc65209138
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpclib/json
+md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
+sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
new file mode 100644
index 0000000000..0bec0a1879
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpclib
+#
+################################################################################
+
+PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SETUP_TYPE = setuptools
+PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
+PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

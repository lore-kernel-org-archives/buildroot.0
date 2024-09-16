Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB4C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 455C060A8E;
	Mon, 16 Sep 2024 10:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5cQMxGLjH4D; Mon, 16 Sep 2024 10:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 456D960AA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456D960AA2;
	Mon, 16 Sep 2024 10:11:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD00C1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC3478053D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARpW_6DtCnsi for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 745FE80A6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 745FE80A6C
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D8048379E; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:08:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7839f4737a59c20296c46f7bca4829a2374c758
X-Git-Newrev: 763c2e052ae9ef5a5a618cf5e2b59b1c29de8277
X-Patchwork-Hint: ignore
Message-Id: <20240916101135.5D8048379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iterable-io: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=763c2e052ae9ef5a5a618cf5e2b59b1c29de8277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/python-iterable-io/Config.in               |  7 +++++++
 package/python-iterable-io/python-iterable-io.hash |  5 +++++
 package/python-iterable-io/python-iterable-io.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c0f4d9ece5..a0d2f329b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1167,6 +1167,7 @@ menu "External python modules"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
+	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
diff --git a/package/python-iterable-io/Config.in b/package/python-iterable-io/Config.in
new file mode 100644
index 0000000000..e85159eb2f
--- /dev/null
+++ b/package/python-iterable-io/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ITERABLE_IO
+	bool "python-iterable-io"
+	help
+	  Adapt generators and other iterables to a file-like
+	  interface.
+
+	  https://github.com/pR0Ps/iterable-io
diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
new file mode 100644
index 0000000000..aae6ad547e
--- /dev/null
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/iterable-io/json
+md5  d6027af37f8e15edd346bdff6d5c5e3c  iterable-io-1.0.0.tar.gz
+sha256  fb9e1b739587a9ba0d5c60a3e1eb71246761583bc9f18b3c35bb112b44b18c3c  iterable-io-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  5de72116ec3738168bbaea5bd3405d161246ac542456470dc074f23d336252c0  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
new file mode 100644
index 0000000000..e59c7d6455
--- /dev/null
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iterable-io
+#
+################################################################################
+
+PYTHON_ITERABLE_IO_VERSION = 1.0.0
+PYTHON_ITERABLE_IO_SOURCE = iterable-io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/40/be/27d59b5c1d74ecbd26c1142f84b61d6cb04f0d0337697149645f34406b2d
+PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
+PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
+PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

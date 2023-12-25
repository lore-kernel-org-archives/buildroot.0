Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A94BC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E11415CF;
	Mon, 25 Dec 2023 10:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E11415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLAyp3_VVoML; Mon, 25 Dec 2023 10:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E872F414E4;
	Mon, 25 Dec 2023 10:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E872F414E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E61221BF5DB
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C46806061B
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46806061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaPY9l_0nx_1 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:28:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD90605A5
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD90605A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E03582B36; Mon, 25 Dec 2023 10:28:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:27:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe47e7605c6cde295e209d80690508cfd11ba61
X-Git-Newrev: 442b2af2d4920f1cc0cfc4438a78898cc324e640
X-Patchwork-Hint: ignore
Message-Id: <20231225102820.7E03582B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=442b2af2d4920f1cc0cfc4438a78898cc324e640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-asyncssh/Config.in            |  9 +++++++++
 package/python-asyncssh/python-asyncssh.hash |  6 ++++++
 package/python-asyncssh/python-asyncssh.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index aa79c2dae4..d5b8982df1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,6 +994,7 @@ menu "External python modules"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
+	source "package/python-asyncssh/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-augeas/Config.in"
 	source "package/python-autobahn/Config.in"
diff --git a/package/python-asyncssh/Config.in b/package/python-asyncssh/Config.in
new file mode 100644
index 0000000000..eef4478f3c
--- /dev/null
+++ b/package/python-asyncssh/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ASYNCSSH
+	bool "python-asyncssh"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  AsyncSSH: Asynchronous SSHv2 client and server library.
+
+	  http://asyncssh.timeheart.net
diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
new file mode 100644
index 0000000000..d72b5329c5
--- /dev/null
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/asyncssh/json
+md5  4194feb9e0d17a0750f107f3445ff9f7  asyncssh-2.14.1.tar.gz
+sha256  1ac31c333a0d83c88831523245500caa814503423741b0e465339ef6da5b5e29  asyncssh-2.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
+sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
new file mode 100644
index 0000000000..91e0d9d419
--- /dev/null
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-asyncssh
+#
+################################################################################
+
+PYTHON_ASYNCSSH_VERSION = 2.14.1
+PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49ddcc10567e52a8e0e1553fc936584e241d516b5682d55ea17
+PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
+PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
+PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

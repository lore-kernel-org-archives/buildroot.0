Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B352C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D6584705;
	Sun, 15 Sep 2024 21:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCPZydEEtfeR; Sun, 15 Sep 2024 21:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0EF84774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0EF84774;
	Sun, 15 Sep 2024 21:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E9A1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BF440A0B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qceKwzbBocdq for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E2E40A15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20E2E40A15
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A8D783683; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d7032533d0d2154666ced5d476c0bb11ee97192
X-Git-Newrev: 39fb1550716e00b49fde99bef7e11c63b44063c3
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.1A8D783683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-proto-plus: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=39fb1550716e00b49fde99bef7e11c63b44063c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-proto-plus/Config.in              |  8 ++++++++
 package/python-proto-plus/python-proto-plus.hash |  5 +++++
 package/python-proto-plus/python-proto-plus.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 38944bdd4f..a1d53edf5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1261,6 +1261,7 @@ menu "External python modules"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
+	source "package/python-proto-plus/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-psycopg2/Config.in"
diff --git a/package/python-proto-plus/Config.in b/package/python-proto-plus/Config.in
new file mode 100644
index 0000000000..49c73e5f6b
--- /dev/null
+++ b/package/python-proto-plus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PROTO_PLUS
+	bool "python-proto-plus"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Beautiful, Pythonic protocol buffers.
+
+	  https://github.com/googleapis/proto-plus-python
diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
new file mode 100644
index 0000000000..e9d3632275
--- /dev/null
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/proto-plus/json
+md5  7af507ef2f7c1e512321c29ed5cf131c  proto-plus-1.24.0.tar.gz
+sha256  30b72a5ecafe4406b0d339db35b56c4059064e69227b8c3bda7462397f966445  proto-plus-1.24.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
new file mode 100644
index 0000000000..9ef85790d2
--- /dev/null
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-proto-plus
+#
+################################################################################
+
+PYTHON_PROTO_PLUS_VERSION = 1.24.0
+PYTHON_PROTO_PLUS_SOURCE = proto-plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/3e/fc/e9a65cd52c1330d8d23af6013651a0bc50b6d76bcbdf91fae7cd19c68f29
+PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
+PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
+PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

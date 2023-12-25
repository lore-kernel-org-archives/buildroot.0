Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DD9C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9910E40488;
	Mon, 25 Dec 2023 20:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9910E40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6W3Y-1wujgVR; Mon, 25 Dec 2023 20:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88A9E40528;
	Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A9E40528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31E411BF951
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C55813B3
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C55813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsXiGMWjPT3g for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 114F881379
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 114F881379
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2DB58120A; Mon, 25 Dec 2023 20:42:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:30:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02fddb29abba52fd00aa66cf8608f008b71533b3
X-Git-Newrev: 111e725b08c076dca4966cc3eac3fb073b462fc7
X-Patchwork-Hint: ignore
Message-Id: <20231225204211.F2DB58120A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-anyio: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=111e725b08c076dca4966cc3eac3fb073b462fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/python-anyio/Config.in         |  9 +++++++++
 package/python-anyio/python-anyio.hash |  5 +++++
 package/python-anyio/python-anyio.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d5b8982df1..d8894e4925 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -982,6 +982,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
new file mode 100644
index 0000000000..d843f37af0
--- /dev/null
+++ b/package/python-anyio/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ANYIO
+	bool "python-anyio"
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	help
+	  High level compatibility layer for multiple asynchronous
+	  event loop implementations.
+
+	  https://github.com/agronholm/anyio
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
new file mode 100644
index 0000000000..1cea549bc1
--- /dev/null
+++ b/package/python-anyio/python-anyio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/anyio/json
+md5  58d288dd84e28e2507ff9ce7e4620010  anyio-3.7.1.tar.gz
+sha256  44a3c9aba0f5defa43261a8b3efb97891f2bd7d804e0e1f56419befa1adfc780  anyio-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
new file mode 100644
index 0000000000..80404ac660
--- /dev/null
+++ b/package/python-anyio/python-anyio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-anyio
+#
+################################################################################
+
+PYTHON_ANYIO_VERSION = 3.7.1
+PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/28/99/2dfd53fd55ce9838e6ff2d4dac20ce58263798bd1a0dbe18b3a9af3fcfce
+PYTHON_ANYIO_SETUP_TYPE = setuptools
+PYTHON_ANYIO_LICENSE = MIT
+PYTHON_ANYIO_LICENSE_FILES = LICENSE
+PYTHON_ANYIO_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

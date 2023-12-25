Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC666C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F22B40528;
	Mon, 25 Dec 2023 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F22B40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhAvG4YazoGo; Mon, 25 Dec 2023 20:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 616F940636;
	Mon, 25 Dec 2023 20:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616F940636
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2356E1BF228
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F075481379
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F075481379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdnDPM4VBvBB for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 240358138F
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240358138F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1042383235; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:33:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 111e725b08c076dca4966cc3eac3fb073b462fc7
X-Git-Newrev: cfb0987517db1b16f7794cf6d113019bcd069e17
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.1042383235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfb0987517db1b16f7794cf6d113019bcd069e17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-starlette/Config.in             |  7 +++++++
 package/python-starlette/python-starlette.hash |  5 +++++
 package/python-starlette/python-starlette.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d8894e4925..caab7ccfab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1349,6 +1349,7 @@ menu "External python modules"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-stack-data/Config.in"
+	source "package/python-starlette/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-starlette/Config.in b/package/python-starlette/Config.in
new file mode 100644
index 0000000000..90f590689a
--- /dev/null
+++ b/package/python-starlette/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_STARLETTE
+	bool "python-starlette"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	help
+	  The little ASGI library that shines.
+
+	  https://github.com/encode/starlette
diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
new file mode 100644
index 0000000000..a7f1f66446
--- /dev/null
+++ b/package/python-starlette/python-starlette.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/starlette/json
+md5  5193c4b7d2ea4c93635c340a7ba9b54f  starlette-0.27.0.tar.gz
+sha256  6a6b0d042acb8d469a01eba54e9cda6cbd24ac602c4cd016723117d6a7e73b75  starlette-0.27.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
new file mode 100644
index 0000000000..40932929a0
--- /dev/null
+++ b/package/python-starlette/python-starlette.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-starlette
+#
+################################################################################
+
+PYTHON_STARLETTE_VERSION = 0.27.0
+PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/06/68/559bed5484e746f1ab2ebbe22312f2c25ec62e4b534916d41a8c21147bf8
+PYTHON_STARLETTE_SETUP_TYPE = pep517
+PYTHON_STARLETTE_LICENSE = BSD-3-Clause
+PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
+PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

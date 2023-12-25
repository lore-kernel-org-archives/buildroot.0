Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90997C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4498F40647;
	Mon, 25 Dec 2023 20:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4498F40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lnUJDHf8k8Q; Mon, 25 Dec 2023 20:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D3040645;
	Mon, 25 Dec 2023 20:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D3040645
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 337C61BF951
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C96140939
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C96140939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-NPa-OtPxmB for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356284093B
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356284093B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2036C8324E; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:13:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfb0987517db1b16f7794cf6d113019bcd069e17
X-Git-Newrev: da1f15dbca77131751aa96c0701c4339aca95192
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.2036C8324E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=da1f15dbca77131751aa96c0701c4339aca95192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-fastapi/Config.in           | 12 ++++++++++++
 package/python-fastapi/python-fastapi.hash |  5 +++++
 package/python-fastapi/python-fastapi.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index caab7ccfab..7f9069b75e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1082,6 +1082,7 @@ menu "External python modules"
 	source "package/python-evdev/Config.in"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-fastapi/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
new file mode 100644
index 0000000000..7d376d3dd7
--- /dev/null
+++ b/package/python-fastapi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FASTAPI
+	bool "python-fastapi"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  FastAPI framework, high performance, easy to learn, fast to
+	  code, ready for production.
+
+	  https://github.com/tiangolo/fastapi
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
new file mode 100644
index 0000000000..3dc1578cb7
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastapi/json
+md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
+sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
new file mode 100644
index 0000000000..db86bfce30
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fastapi
+#
+################################################################################
+
+PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SETUP_TYPE = pep517
+PYTHON_FASTAPI_LICENSE = MIT
+PYTHON_FASTAPI_LICENSE_FILES = LICENSE
+PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

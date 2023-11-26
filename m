Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D46DC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37EC3421E4;
	Mon,  4 Dec 2023 20:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37EC3421E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eoBI9WeP3my; Mon,  4 Dec 2023 20:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726BC4180B;
	Mon,  4 Dec 2023 20:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726BC4180B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF521BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014C341690
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014C341690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Mm1YvNau0ea for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8347141609
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8347141609
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69D63879B6; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 18:05:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfafe9b3e9c5a5ae7767c534dccca2d14e50b41c
X-Git-Newrev: 0f26d434278ac641815e0fd856cc771d65f91617
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.69D63879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-types: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f26d434278ac641815e0fd856cc771d65f91617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                         |  1 +
 package/python-annotated-types/Config.in                  |  6 ++++++
 .../python-annotated-types/python-annotated-types.hash    |  5 +++++
 package/python-annotated-types/python-annotated-types.mk  | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..68e6e29a4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -974,6 +974,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
diff --git a/package/python-annotated-types/Config.in b/package/python-annotated-types/Config.in
new file mode 100644
index 0000000000..36525a526b
--- /dev/null
+++ b/package/python-annotated-types/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ANNOTATED_TYPES
+	bool "python-annotated-types"
+	help
+	  Reusable constraint types to use with typing.Annotated.
+
+	  https://github.com/annotated-types/annotated-types
diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
new file mode 100644
index 0000000000..1663bcb51f
--- /dev/null
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/annotated-types/json
+md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
+sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
new file mode 100644
index 0000000000..8bc617069d
--- /dev/null
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-types
+#
+################################################################################
+
+PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
+PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
+PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_TYPES_LICENSE = MIT
+PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_TYPES_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D27C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 276204051D;
	Sun, 29 Jan 2023 16:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276204051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mx9HFHNTf0H9; Sun, 29 Jan 2023 16:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D2E9404B3;
	Sun, 29 Jan 2023 16:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D2E9404B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A663D1BF863
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80735404D1
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80735404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpjMdIclBNne for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5DB7400D9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5DB7400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9102088166; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b86cc6a313773ac90bceabf376e33bba789c2950
X-Git-Newrev: 14d301cbb621e1f044938d628ec47279a80ad7d0
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.9102088166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-generator: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=14d301cbb621e1f044938d628ec47279a80ad7d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-async-generator/Config.in                   |  6 ++++++
 package/python-async-generator/python-async-generator.hash |  7 +++++++
 package/python-async-generator/python-async-generator.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8bc5eee22..6cf2b48a8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1365,6 +1365,7 @@ F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
 F:	package/python-argon2-cffi-bindings/
+F:	package/python-async-generator/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index 24be67b925..dd15467b11 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,6 +962,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
diff --git a/package/python-async-generator/Config.in b/package/python-async-generator/Config.in
new file mode 100644
index 0000000000..eb5720c652
--- /dev/null
+++ b/package/python-async-generator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ASYNC_GENERATOR
+	bool "python-async-generator"
+	help
+	  Async generators and context managers for Python 3.5+.
+
+	  https://github.com/python-trio/async_generator
diff --git a/package/python-async-generator/python-async-generator.hash b/package/python-async-generator/python-async-generator.hash
new file mode 100644
index 0000000000..3a94d5eb31
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/async_generator/json
+md5  078a29b4afb3d7f38c097a530f042a55  async_generator-1.10.tar.gz
+sha256  6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144  async_generator-1.10.tar.gz
+# Locally computed sha256 checksums
+sha256  b54d37617a67005623de975715952a2df062a2616c197bc3b6b451245b0c9265  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-async-generator/python-async-generator.mk b/package/python-async-generator/python-async-generator.mk
new file mode 100644
index 0000000000..d5e4f430fc
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-async-generator
+#
+################################################################################
+
+PYTHON_ASYNC_GENERATOR_VERSION = 1.10
+PYTHON_ASYNC_GENERATOR_SOURCE = async_generator-$(PYTHON_ASYNC_GENERATOR_VERSION).tar.gz
+PYTHON_ASYNC_GENERATOR_SITE = https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a
+PYTHON_ASYNC_GENERATOR_SETUP_TYPE = setuptools
+PYTHON_ASYNC_GENERATOR_LICENSE = Apache-2.0 or MIT
+PYTHON_ASYNC_GENERATOR_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

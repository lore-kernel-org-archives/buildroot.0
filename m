Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6935C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898FF60EF8;
	Tue,  2 Jan 2024 22:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 898FF60EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhvmk_WtanSl; Tue,  2 Jan 2024 22:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA2960F7A;
	Tue,  2 Jan 2024 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA2960F7A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B09CE1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF2258175F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF2258175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4I7eqpMigqe1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2109815AB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2109815AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD35E83E72; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:36:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d37766a886a8dc3d49d45e14955411700a5efd26
X-Git-Newrev: 9553dc98d30edaeb7a7ab4b7d8bc8c6fbb17b9fb
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.DD35E83E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9553dc98d30edaeb7a7ab4b7d8bc8c6fbb17b9fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-google-api-core/Config.in                   | 10 ++++++++++
 package/python-google-api-core/python-google-api-core.hash |  5 +++++
 package/python-google-api-core/python-google-api-core.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dd59baad06..3cd91beaf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ menu "External python modules"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-google-api-core/Config.in"
 	source "package/python-google-auth/Config.in"
 	source "package/python-googleapis-common-protos/Config.in"
 	source "package/python-gpiozero/Config.in"
diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
new file mode 100644
index 0000000000..689923a2f4
--- /dev/null
+++ b/package/python-google-api-core/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
+	bool "python-google-api-core"
+	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
+	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  Google API client core library.
+
+	  https://github.com/googleapis/python-api-core
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
new file mode 100644
index 0000000000..5a1cd7f1cb
--- /dev/null
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/google-api-core/json
+md5  58a4ce34a405e514cdb5295c80834cfd  google-api-core-2.15.0.tar.gz
+sha256  abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca  google-api-core-2.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
new file mode 100644
index 0000000000..84042d8d7a
--- /dev/null
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-google-api-core
+#
+################################################################################
+
+PYTHON_GOOGLE_API_CORE_VERSION = 2.15.0
+PYTHON_GOOGLE_API_CORE_SOURCE = google-api-core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/2c/e4/56b14d35057a23cab9067dd8fb841407d05d32b5d6c7a3c66c1360e8a7c0
+PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
+PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
+PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

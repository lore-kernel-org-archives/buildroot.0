Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAEAC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD1360F3B;
	Tue,  2 Jan 2024 22:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD1360F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NqHVtDCpENH; Tue,  2 Jan 2024 22:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B3260EF8;
	Tue,  2 Jan 2024 22:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B3260EF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D65981BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E4060F3B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E4060F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uQ66hZAENqX for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3DE960DFD
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3DE960DFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D235783E6F; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:35:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ffb74fd91bd301f1ec0cc0fbd30da9bbd0f1eac
X-Git-Newrev: d37766a886a8dc3d49d45e14955411700a5efd26
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.D235783E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d37766a886a8dc3d49d45e14955411700a5efd26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-googleapis-common-protos/Config.in          |  7 +++++++
 .../python-googleapis-common-protos.hash                   |  5 +++++
 .../python-googleapis-common-protos.mk                     | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 422e8a8b40..dd59baad06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1105,6 +1105,7 @@ menu "External python modules"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-google-auth/Config.in"
+	source "package/python-googleapis-common-protos/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
new file mode 100644
index 0000000000..8f487f5ee6
--- /dev/null
+++ b/package/python-googleapis-common-protos/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
+	bool "python-googleapis-common-protos"
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Common protobufs used in Google APIs.
+
+	  https://github.com/googleapis/python-api-common-protos
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
new file mode 100644
index 0000000000..1169e945e9
--- /dev/null
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
+md5  148bfe9b5a92663c5ff0a6700453ebad  googleapis-common-protos-1.62.0.tar.gz
+sha256  83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277  googleapis-common-protos-1.62.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
new file mode 100644
index 0000000000..ca943a1cd3
--- /dev/null
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-googleapis-common-protos
+#
+################################################################################
+
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.62.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis-common-protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4a/5f/eb12d721b45d20a977289d674e179995a0ddab1684d2c61b29a63d43a5f1
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67417C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2255160EF8;
	Tue,  2 Jan 2024 22:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2255160EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xirGiicjnpGb; Tue,  2 Jan 2024 22:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3362660FB6;
	Tue,  2 Jan 2024 22:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3362660FB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3C571BF977
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA989815CA
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA989815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0UhzZCj0id9 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB2F6813E0
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB2F6813E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC66283E5B; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:34:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea45b95c0e54866134c63e88e60489a012b3d134
X-Git-Newrev: 3217fedcb8c8006809c1a3d214c97597677a07fd
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.AC66283E5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3217fedcb8c8006809c1a3d214c97597677a07fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-grpcio-reflection/Config.in                 |  8 ++++++++
 .../python-grpcio-reflection/python-grpcio-reflection.hash |  5 +++++
 .../python-grpcio-reflection/python-grpcio-reflection.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 69516c8705..d538083b76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1106,6 +1106,7 @@ menu "External python modules"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
+	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
new file mode 100644
index 0000000000..d2ee039c5f
--- /dev/null
+++ b/package/python-grpcio-reflection/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
+	bool "python-grpcio-reflection"
+	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Standard Protobuf Reflection Service for gRPC.
+
+	  https://grpc.io
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
new file mode 100644
index 0000000000..d17087d4bb
--- /dev/null
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
+md5  f93b042f8092cf1818f249518668a78a  grpcio-reflection-1.60.0.tar.gz
+sha256  3f6c0c73ba8f20d1420c5e72fc4dd0389fac346ed8fb32a28e6e1967b44fff35  grpcio-reflection-1.60.0.tar.gz
+# Locally computed sha256 checksums
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
new file mode 100644
index 0000000000..b3d2fdffa8
--- /dev/null
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpcio-reflection
+#
+################################################################################
+
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.60.0
+PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio-reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/33/3a/e257225b8fd9f05d2af3e363459f0d074ca684438667892ea3215e2162ca
+PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
+PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
+PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

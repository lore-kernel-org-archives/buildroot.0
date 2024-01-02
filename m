Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3180C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE1260FC6;
	Tue,  2 Jan 2024 22:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE1260FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zBC3wQtFGqQ; Tue,  2 Jan 2024 22:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D9E60EF8;
	Tue,  2 Jan 2024 22:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D9E60EF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078491BF97F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26FC60DFD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E26FC60DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zoTSyNhyP81 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05F4E60EF8
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05F4E60EF8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E96B083E54; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:36:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9553dc98d30edaeb7a7ab4b7d8bc8c6fbb17b9fb
X-Git-Newrev: ed74b4cc5326ff75319067b914c1b46852a85fde
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.E96B083E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpc-requests: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed74b4cc5326ff75319067b914c1b46852a85fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                      |  1 +
 package/python-grpc-requests/Config.in                 | 11 +++++++++++
 package/python-grpc-requests/python-grpc-requests.hash |  5 +++++
 package/python-grpc-requests/python-grpc-requests.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3cd91beaf2..38c36428b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1109,6 +1109,7 @@ menu "External python modules"
 	source "package/python-googleapis-common-protos/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
+	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-gunicorn/Config.in"
diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
new file mode 100644
index 0000000000..3c266e5976
--- /dev/null
+++ b/package/python-grpc-requests/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
+	bool "python-grpc-requests"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
+	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
+	select BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION # runtime
+	help
+	  grpc for Humans. grpc reflection support client.
+
+	  https://github.com/wesky93/grpc_requests
diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
new file mode 100644
index 0000000000..c816a65b50
--- /dev/null
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpc-requests/json
+md5  39f0d7ef45ab3620d8b63c2408af35b0  grpc_requests-0.1.13.tar.gz
+sha256  30a00493b206156b94be21f641edcbef5ea69fb43daf503390da661123520521  grpc_requests-0.1.13.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
new file mode 100644
index 0000000000..9ffd73d424
--- /dev/null
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpc-requests
+#
+################################################################################
+
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.13
+PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/46/51/8981bce4ca61bce1c7b7a12dd04f6cbd35c4ea874842b06283f6bbc9a0e8
+PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
+PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
+PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

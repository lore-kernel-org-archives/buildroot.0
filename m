Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77AAC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932EB844C9;
	Sun, 15 Sep 2024 21:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my_xgVwFC_fr; Sun, 15 Sep 2024 21:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C74847C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C74847C6;
	Sun, 15 Sep 2024 21:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB221BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526B080B3C
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrN0UaCvFkTP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A47A80837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A47A80837
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24F1A83685; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39fb1550716e00b49fde99bef7e11c63b44063c3
X-Git-Newrev: 6b34faee342870f54f1ab30de48297047b5f771c
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.24F1A83685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b34faee342870f54f1ab30de48297047b5f771c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-proto-plus runtime dependency, which requires adding
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS and propagate to reverse
dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-api-core/Config.in                   | 2 ++
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 6 +++---
 package/python-grpc-requests/Config.in                     | 2 ++
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
index 689923a2f4..5ddc8b3b22 100644
--- a/package/python-google-api-core/Config.in
+++ b/package/python-google-api-core/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
 	bool "python-google-api-core"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-proto-plus
 	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 5a1cd7f1cb..7a52c94417 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  58a4ce34a405e514cdb5295c80834cfd  google-api-core-2.15.0.tar.gz
-sha256  abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca  google-api-core-2.15.0.tar.gz
+md5  39052bc872e39093248cc1841b0037ca  google_api_core-2.19.2.tar.gz
+sha256  ca07de7e8aa1c98a8bfca9321890ad2340ef7f2eb136e558cee68f24b94b0a8f  google_api_core-2.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 84042d8d7a..b2bf049624 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.15.0
-PYTHON_GOOGLE_API_CORE_SOURCE = google-api-core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/2c/e4/56b14d35057a23cab9067dd8fb841407d05d32b5d6c7a3c66c1360e8a7c0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.19.2
+PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/78/14/99c2514b3ccc5aad1e0776f0ae8295c9f7153aead4f41d07dd126cecdc14
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 1cdd0d3f67..a4bb238089 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-google-api-core
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
@@ -13,6 +14,7 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	  https://github.com/wesky93/grpc_requests
 
 comment "python-grpcio-requests needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DAC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BC98495F;
	Sun, 15 Sep 2024 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzVPVE6haITh; Sun, 15 Sep 2024 21:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2D38492C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2D38492C;
	Sun, 15 Sep 2024 21:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 292761BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02CF6608A7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRpqvG5wApuq for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E29760888
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E29760888
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B84983682; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:31:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17bdb450da0d085889fc45b51ff06fd909e41f68
X-Git-Newrev: 7bfa483f8185b662d0e2efd77541ad39652b99ed
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.5B84983682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpc-requests: bump to
 version 0.1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bfa483f8185b662d0e2efd77541ad39652b99ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-protobuf runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-grpc-requests/Config.in                 | 3 ++-
 package/python-grpc-requests/python-grpc-requests.hash | 4 ++--
 package/python-grpc-requests/python-grpc-requests.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index a4bb238089..0b6da0a9c1 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-google-api-core
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-google-api-core, python-protobuf
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  grpc for Humans. grpc reflection support client.
 
diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
index c816a65b50..aeb5336a4c 100644
--- a/package/python-grpc-requests/python-grpc-requests.hash
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpc-requests/json
-md5  39f0d7ef45ab3620d8b63c2408af35b0  grpc_requests-0.1.13.tar.gz
-sha256  30a00493b206156b94be21f641edcbef5ea69fb43daf503390da661123520521  grpc_requests-0.1.13.tar.gz
+md5  6d63bed1f4a80fc3e59191ce69903d31  grpc_requests-0.1.20.tar.gz
+sha256  a76744d781c5a7bf3abde8dc778d24c4e17deb39d173d85096ff3caee3d15250  grpc_requests-0.1.20.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
index 9ffd73d424..7fecdf5a3c 100644
--- a/package/python-grpc-requests/python-grpc-requests.mk
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPC_REQUESTS_VERSION = 0.1.13
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.20
 PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
-PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/46/51/8981bce4ca61bce1c7b7a12dd04f6cbd35c4ea874842b06283f6bbc9a0e8
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/92/84/f5a3874a6e10448d8c198253d2c79f7b34a23fb4a96b78a648dc468913a6
 PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
 PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

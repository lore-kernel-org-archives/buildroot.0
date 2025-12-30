Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64912E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A6160B53;
	Tue, 30 Dec 2025 13:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h-lRJ_E5QVC; Tue, 30 Dec 2025 13:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB8960BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099646;
	bh=4pDdyTv4YMUlviC/cStvhEtjH63aRyOihXD97l0Yjgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XucYUEF+mhEWmT2gJkD7S5K6+ILGoUE6amWl5Zkx++DTEzLBclUKYoyugJlePPN0M
	 CeAsrgzzInJ832pxyRwL39aQPRVbJeu6JLbKdeyvGSyiKEKSkATBOA3UNUfUjpBH46
	 Eq7H2ZtpBsc8ZGGjcj8DcaObu+BsqMdajmiuLxTl7WTM8doJ3cYLJ8pHZwBi/65618
	 AE6cT08LfFptMbBsEiudjrDKJPenzGhz0do0DsjIrNil1RGAlmvwoDUIXQab8vJIvt
	 XG3a3xlh+OwKunhixIQG0SmRbcjZagx8SgY2TIZoUBryIC2BwoX3qObwuT0CVQF6oP
	 un3uI9nhIr/xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB8960BBA;
	Tue, 30 Dec 2025 13:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAE1177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A64A4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILFl6-kcKeR9 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C6B40486
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56C6B40486
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54D8D87A42; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb29acc9f22ad632b7af139bbdc2352cf08ca7e2
X-Git-Newrev: 601e3ae5bdb4ba5864a2e28db77e33b1a9edfa54
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.54D8D87A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 25.12.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=601e3ae5bdb4ba5864a2e28db77e33b1a9edfa54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatch build backend.

License hash changed due to formatting changes:
https://github.com/crossbario/autobahn-python/commit/83d985db646fb045e0b26a9075baeec45633e281

Drop no longer supported AUTOBAHN_STRIP_XBR env variable.

Add host-python-setuptools build dependency.

Add new python-base58 encryption dependency.

Add new python-ecdsa encryption dependency.

Serialization dependencies moved to mandatory dependencies.

Propagate new C++ reverse dependency.

Add new python-brotli compression dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/Config.in                  | 33 +++++++++-------------
 package/python-autobahn/python-autobahn.hash       |  6 ++--
 package/python-autobahn/python-autobahn.mk         |  9 +++---
 package/python-channels-redis/Config.in            |  2 ++
 package/python-channels/Config.in                  |  2 ++
 package/python-daphne/Config.in                    |  2 ++
 .../python-magic-wormhole-mailbox-server/Config.in |  1 +
 .../python-magic-wormhole-transit-relay/Config.in  |  1 +
 package/python-magic-wormhole/Config.in            |  1 +
 9 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 527416a3cd..b32463d1b1 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,10 +1,15 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
+	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
+	select BR2_PACKAGE_PYTHON_UBJSON # runtime
+	select BR2_PACKAGE_PYTHON_UJSON # runtime
 	help
 	  WebSocket client and server library, WAMP real-time
 	  framework.
@@ -13,26 +18,22 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 
 if BR2_PACKAGE_PYTHON_AUTOBAHN
 
-config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
-	bool "C-based WebSocket acceleration"
-	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
-
 config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
 	bool "Non-standard WebSocket compression support"
 	depends on BR2_INSTALL_LIBSTDCPP # python-snappy -> snappy
+	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
 
-comment "Non-standard WebSocket compression needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
 	bool "TLS and WAMP-cryptosign encryption/authentication support"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl -> python-cryptography
+	select BR2_PACKAGE_PYTHON_BASE58 # runtime
+	select BR2_PACKAGE_PYTHON_ECDSA # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
 	select BR2_PACKAGE_PYTHON_QRCODE # runtime
 	select BR2_PACKAGE_PYTHON_QRCODE_SVG # runtime
-	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
@@ -40,18 +41,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
 	select BR2_PACKAGE_PYTHON_ARGON2_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_PASSLIB # runtime
 
-config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
-	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
-	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
-	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
-	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
-	select BR2_PACKAGE_PYTHON_UBJSON # runtime
-	select BR2_PACKAGE_PYTHON_UJSON # runtime
-
-comment "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	bool "Twisted support"
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
@@ -59,3 +48,7 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 
 endif
+
+comment "python-autobahn needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index ef26ba346f..34d585278f 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  d3cb29a6d5e8cc4c9671aa46ba1f2d0c  autobahn-25.11.1.tar.gz
-sha256  52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1  autobahn-25.11.1.tar.gz
+md5  3dbc5c77f853b68a4a8c8ffcbd4eb024  autobahn-25.12.2.tar.gz
+sha256  754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c  autobahn-25.12.2.tar.gz
 # Locally computed sha256 checksums
-sha256  49c90822821c78934079a4bfed0a880790a868bc6dba90ea8fe8274e0f985ada  LICENSE
+sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 0ba2b3fb4f..f110276018 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 25.11.1
+PYTHON_AUTOBAHN_VERSION = 25.12.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/3a/aab5632fbd88ed26d330ab156af80c9a90419dfa2841296fd556a65e5fac
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/d5/9adf0f5b9eb244e58e898e9f3db4b00c09835ef4b6c37d491886e0376b4f
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
 PYTHON_AUTOBAHN_CPE_ID_PRODUCT = autobahn
-PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
-PYTHON_AUTOBAHN_ENV = AUTOBAHN_STRIP_XBR=1
+PYTHON_AUTOBAHN_SETUP_TYPE = hatch
+PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi host-python-setuptools
 
 $(eval $(python-package))
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index 785b05cac0..a63f96a4e9 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
+	# python-channels -> python-daphne -> python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-channels -> python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
index b94f53ceaa..4e3bc6db53 100644
--- a/package/python-channels/Config.in
+++ b/package/python-channels/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS
 	bool "python-channels"
+	# python-daphne -> python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
index 51c66532f0..dddb04a153 100644
--- a/package/python-daphne/Config.in
+++ b/package/python-daphne/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_DAPHNE
 	bool "python-daphne"
+	# python-autobahn -> python-ujson
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index 1b0402ebb4..d3b81a46ac 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	bool "python-magic-wormhole-mailbox-server"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
diff --git a/package/python-magic-wormhole-transit-relay/Config.in b/package/python-magic-wormhole-transit-relay/Config.in
index 4cbb840a82..8f341b34c3 100644
--- a/package/python-magic-wormhole-transit-relay/Config.in
+++ b/package/python-magic-wormhole-transit-relay/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY
 	bool "python-magic-wormhole-transit-relay"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
index 57db1bde78..29ff8fd059 100644
--- a/package/python-magic-wormhole/Config.in
+++ b/package/python-magic-wormhole/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
 	bool "python-magic-wormhole"
+	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-ujson
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D39C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D7C41761;
	Tue,  3 May 2022 19:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtN82_akCyaY; Tue,  3 May 2022 19:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C43C541757;
	Tue,  3 May 2022 19:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3D31BF963
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0BB340207
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VOj-K1mMCdh for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:56:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 425BE400F8
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ECCA485232; Tue,  3 May 2022 19:45:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 21:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96a802cab2a00071886aafea1ebd8311d19b785f
X-Git-Newrev: b735fef52914c32807e54d0051a2c314ce85983a
X-Patchwork-Hint: ignore
Message-Id: <20220503194548.ECCA485232@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b735fef52914c32807e54d0051a2c314ce85983a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/python-orjson/Config.in          | 12 ++++++++++++
 package/python-orjson/python-orjson.hash |  4 ++++
 package/python-orjson/python-orjson.mk   | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b08253d6ef..b0a682d376 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1118,6 +1118,9 @@ F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
 
+N:	Graeme Smecher <gsmecher@threespeedlogic.com>
+F:	package/python-orjson/
+
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
 F:	package/gengetopt/
diff --git a/package/Config.in b/package/Config.in
index 66682b9b2d..790dfea123 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1112,6 +1112,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-orjson/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
new file mode 100644
index 0000000000..420e023b0a
--- /dev/null
+++ b/package/python-orjson/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_ORJSON
+	bool "python-orjson"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  orjson is a fast, correct JSON library for Python. It
+	  benchmarks as the fastest Python library for JSON and is more
+	  correct than the standard json library or other third-party
+	  libraries. It serializes dataclass, datetime, numpy, and UUID
+	  instances natively.
+
+	  https://github.com/ijl/orjson
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
new file mode 100644
index 0000000000..5ef2726d82
--- /dev/null
+++ b/package/python-orjson/python-orjson.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
new file mode 100644
index 0000000000..5de4b2c5fa
--- /dev/null
+++ b/package/python-orjson/python-orjson.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-orjson
+#
+################################################################################
+
+PYTHON_ORJSON_VERSION = 3.6.7
+PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
+PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
+PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
+PYTHON_ORJSON_CARGO_ENV = \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# orjson uses "maturin" to generate distribution packages - rather than teach
+# buildroot how to understand this, we reach in and install directly.
+define PYTHON_ORJSON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
+endef
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

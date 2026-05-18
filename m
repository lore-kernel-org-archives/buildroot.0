Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A93CD4F50
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50DF6073E;
	Mon, 18 May 2026 18:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmqeJyixK7Qa; Mon, 18 May 2026 18:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC96360728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130081;
	bh=JMt03Td0ctt0WyvB71yjuIzyE90DqgidXe9py/pseW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U0aIGKx7N5TLh8OXlG1WmxJjFz1fB8luo6jhZp9GdBH4yJdJXmg5JUO2rtk7tRFUt
	 F3tHi4lGtaAjlDcAzJdlz5jRfHeGuzr7CzvDhyfinZ6temkktxL558weaYBvrjfpor
	 B3gM4tdRE4b74W4C1C7E9Q1YoK39WxZY4Q/6slAjcNIUTHKnpwmzmAIZ0J3n5bdn1B
	 qGqsvv0Dkyl/yNXKo4jwdNTIbb91wACCBieIusI7mkrSf73SvydxTuNK3i6OnERYgc
	 8nd1yQsBFgI9vz3BNkDNP+IbfDce0w1QQpGGjZ4XUAPhm+jAj0Ezp+AGwtxoFXQ1dO
	 C8zHpAgKCPTMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC96360728;
	Mon, 18 May 2026 18:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0281B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0EA6804A7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJae-OhC2WbX for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA5D980487
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA5D980487
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9092D8669A; Mon, 18 May 2026 18:47:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:45:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4cd1d52408bdc955fe14fb138d98a37494f5abe
X-Git-Newrev: 9a1fc8176e4808551f9501f0ed8b5745deb28e59
X-Patchwork-Hint: ignore
Message-Id: <20260518184752.9092D8669A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6grpc: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a1fc8176e4808551f9501f0ed8b5745deb28e59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Adds the QT GRPC module (containing Qt Protobuf as well).

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6grpc/Config.in    |  7 +++++++
 package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++++
 package/qt6/qt6grpc/qt6grpc.mk   | 43 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..9c297b321e 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
+source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
new file mode 100644
index 0000000000..3d82cfcb0c
--- /dev/null
+++ b/package/qt6/qt6grpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6GRPC
+	bool "qt6grpc"
+	help
+	  This package provides the Qt GRPC and Protobuf modules:
+
+	  https://doc.qt.io/qt-6/qtgrpc-index.html
+	  https://code.qt.io/cgit/qt/qtgrpc.git/
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
new file mode 100644
index 0000000000..bbf30f2a2d
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgrpc-everywhere-src-6.9.1.tar.xz.sha256
+sha256  c34c869e203289b0fd695a1e5391840bc51b919a8b55e1ed1ff36b4cb923a750  qtgrpc-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSES/LicenseRef-protobuf.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/qt6grpc.mk
new file mode 100644
index 0000000000..8b1c511fef
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# qt6grpc
+#
+################################################################################
+
+QT6GRPC_VERSION = $(QT6_VERSION)
+QT6GRPC_SITE = $(QT6_SITE)
+QT6GRPC_SOURCE = qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
+QT6GRPC_INSTALL_STAGING = YES
+QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRPC_CMAKE_BACKEND = ninja
+QT6GRPC_LICENSE = GPL-3.0-only
+
+QT6GRPC_LICENSE_FILES = \
+	LICENSE.Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LicenseRef-protobuf.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6GRPC_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6GRPC_DEPENDENCIES = \
+	host-pkgconf \
+	host-qt6grpc \
+	qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6GRPC_DEPENDENCIES += qt6declarative
+endif
+
+HOST_QT6GRPC_DEPENDENCIES = \
+	host-protobuf \
+	host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

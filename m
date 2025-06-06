Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B8C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB1B408E2;
	Fri,  6 Jun 2025 19:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkcwCBiZ_FAA; Fri,  6 Jun 2025 19:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C0340CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C0340CFE;
	Fri,  6 Jun 2025 19:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1FB2C8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC068408E2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2RHdgoJj0SQ for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 19:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A8D40849
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03A8D40849
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:54:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E34F487A98; Fri,  6 Jun 2025 19:54:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 6 Jun 2025 21:50:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9188bf42e4e9adde2fd71242843d9207b33c786f
X-Git-Newrev: 110cd929322727d31351d2f4b8e5bbe81b000bf3
X-Patchwork-Hint: ignore
Message-Id: <20250606195418.E34F487A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/msgpack-c: add new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=110cd929322727d31351d2f4b8e5bbe81b000bf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

MessagePack ships both in a C++ and a C variant. Add the latter to
Buildroot. This will be used by fluent-bit.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
[Julien:
 - switch homepage URL to use https
 - add a note in package/msgpack{,-c}/Config.in to clarify C/C++
   variants
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                |  1 +
 package/msgpack-c/Config.in      | 12 ++++++++++++
 package/msgpack-c/msgpack-c.hash |  4 ++++
 package/msgpack-c/msgpack-c.mk   | 18 ++++++++++++++++++
 package/msgpack/Config.in        |  3 +++
 5 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6e9846cee5..a46c459ff5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2305,6 +2305,7 @@ endif
 	source "package/mpfr/Config.in"
 	source "package/mpir/Config.in"
 	source "package/msgpack/Config.in"
+	source "package/msgpack-c/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
 	source "package/neon-2-sse/Config.in"
diff --git a/package/msgpack-c/Config.in b/package/msgpack-c/Config.in
new file mode 100644
index 0000000000..76dfe19614
--- /dev/null
+++ b/package/msgpack-c/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MSGPACK_C
+	bool "msgpack-c"
+	help
+	  MessagePack is an efficient binary serialization format.
+
+	  It lets you exchange data among multiple languages like JSON
+	  but it's faster and smaller.
+
+	  Note: this package is the C variant of msgpack-c. For the
+	  C++ variant, use the "msgpack" Buildroot package.
+
+	  https://msgpack.org/
diff --git a/package/msgpack-c/msgpack-c.hash b/package/msgpack-c/msgpack-c.hash
new file mode 100644
index 0000000000..e4fe61f424
--- /dev/null
+++ b/package/msgpack-c/msgpack-c.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7  msgpack-c-6.1.0.tar.gz
+sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack-c/msgpack-c.mk b/package/msgpack-c/msgpack-c.mk
new file mode 100644
index 0000000000..f12dcb085f
--- /dev/null
+++ b/package/msgpack-c/msgpack-c.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# msgpack-c
+#
+################################################################################
+
+MSGPACK_C_VERSION = 6.1.0
+MSGPACK_C_SITE = $(call github,msgpack,msgpack-c,c-$(MSGPACK_C_VERSION))
+MSGPACK_C_LICENSE = BSL-1.0
+MSGPACK_C_LICENSE_FILES = COPYING LICENSE_1_0.txt
+MSGPACK_C_INSTALL_STAGING = YES
+MSGPACK_C_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF -DMSGPACK_BUILD_TESTS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MSGPACK_C_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
+endif
+
+$(eval $(cmake-package))
diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index b7ae35a0c6..da67956a10 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_MSGPACK
 	  It lets you exchange data among multiple languages like JSON
 	  but it's faster and smaller.
 
+	  Note: this package is the C++ variant of msgpack. For the
+	  C variant, use the "msgpack-c" Buildroot package.
+
 	  http://msgpack.org/
 
 comment "msgpack needs a toolchain w/ C++"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

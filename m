Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D246D5B870
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 603E640AEF;
	Mon, 15 Dec 2025 21:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2R14UUpCtvO; Mon, 15 Dec 2025 21:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF7840AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834607;
	bh=6MUfAvt/nSBnEDrzaQrn+mamUDZpgg1b13kkw30eKRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BfgrFEj1Di982P8etZPXIsc+kN4XuB6S7GSSf+HtOrwrtqBK/rQCmBXPc10cOPmcz
	 zB9fXhPbme8uG4kWknxO4bZ+CnLt2+p82jnoga8temyzExxUPiXyAxyJDEHHxaHLat
	 llQVrCW3ZVT7vkdOhkSTgKiruzIol6El2DePIUVWU7vFu8J6IckkSCeVuwP4+p0mBM
	 2/5cEtmIHP6UTHuuSuXS3ICYHwbi/Sl0vHsJGgvROX/6C9tYHKzuooAvm4eAhJ/E8S
	 uVzE+T6QMHbgGOKk0sVE3duv7jaXOpCvOhDB3sNjN9lC4JAeBkA6poISvU9xLFBUn8
	 P0WkynA70NKeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF7840AD5;
	Mon, 15 Dec 2025 21:36:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C354117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D2960F08
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3wXtskEBO1a for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5206460EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5206460EF8
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:36:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 423ED86FC0; Mon, 15 Dec 2025 21:36:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:36:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 285097051d4a7dd821f01d15c705867f7e26c635
X-Git-Newrev: 7a037d0913a571f390021cc8cbdce9e9a1800ee3
X-Patchwork-Hint: ignore
Message-Id: <20251215213644.423ED86FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: security bump to 4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a037d0913a571f390021cc8cbdce9e9a1800ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a major release that introduces new features,
including one highlighted in the release notes:

"The v4.2 release introduces a powerful new Direct Routing
 capability that allows inputs to specify routes directly to
 outputs, bypassing the traditional routing mechanism."

But it also brings some security fixes. Not all of them are relevant,
but some piece of lecture can be found here [1]. It fixes the
following CVEs:

CVE-2025-12977
CVE-2025-12978
CVE-2025-12972
CVE-2025-12970
CVE-2025-12969

News:
- https://fluentbit.io/announcements/v4.1.0/
- https://fluentbit.io/announcements/v4.1.1/
- https://fluentbit.io/announcements/v4.2.0/

The patch 0001-plugins-kafka-fix-cmake-cross-compile-error.patch
can be dropped as it has been merged upstream [2].

[1] https://www.theregister.com/2025/11/24/fluent_bit_cves/
[2] https://github.com/fluent/fluent-bit/pull/9600

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lib-librdkafka-only-require-a-C-compiler.patch} |  2 +-
 ...ugins-kafka-fix-cmake-cross-compile-error.patch | 47 ----------------------
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  2 +-
 4 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
similarity index 98%
rename from package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
rename to package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
index 83c77ff70c..660ed7bed4 100644
--- a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
+++ b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
@@ -1,4 +1,4 @@
-From c33d6bd392c5c8bbd231b2a9d00d4959cc553c44 Mon Sep 17 00:00:00 2001
+From 7329316bdcc72aceb6bbbdf8711f5bf8894c2a15 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: only require a C compiler
diff --git a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
deleted file mode 100644
index 8b74d5911d..0000000000
--- a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a21de9cb95f2199270a6ac6922ffa4ca8d453f26 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sat, 16 Nov 2024 19:46:28 +0100
-Subject: [PATCH] plugins: kafka: fix cmake cross compile error
-
-KAFKA_INCLUDEDIR is not set if FLB_PREFER_SYSTEM_LIB_KAFKA is not used,
-when cross-compiling, it just translates to -I/librdkafka, which is not allowed.
-Fix this by only including KAFKA_INCLUDEDIR if really set.
-
-x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/librdkafka'
-
-Upstream: https://github.com/fluent/fluent-bit/pull/9600
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- plugins/in_kafka/CMakeLists.txt  | 4 +++-
- plugins/out_kafka/CMakeLists.txt | 4 +++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
-index 928266b57..dc251276e 100644
---- a/plugins/in_kafka/CMakeLists.txt
-+++ b/plugins/in_kafka/CMakeLists.txt
-@@ -3,5 +3,7 @@ set(src
-   )
- 
- FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
--target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+if(DEFINED KAFKA_INCLUDEDIR)
-+  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+endif()
- target_link_libraries(flb-plugin-in_kafka -lpthread)
-diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
-index 9d8b34642..1c967329f 100644
---- a/plugins/out_kafka/CMakeLists.txt
-+++ b/plugins/out_kafka/CMakeLists.txt
-@@ -5,5 +5,7 @@ set(src
-   kafka.c)
- 
- FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
--target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+if(DEFINED KAFKA_INCLUDEDIR)
-+  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+endif()
- target_link_libraries(flb-plugin-out_kafka -lpthread)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 3a4e637d88..be02761ed5 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0031f74b616b4669064a59902559da2f87174aa8007e749b5df19ed79c534f5b  fluent-bit-4.0.9.tar.gz
+sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 73bd686b27..f571896797 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.0.9
+FLUENT_BIT_VERSION = 4.2.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

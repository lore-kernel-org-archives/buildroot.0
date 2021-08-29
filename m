Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB319C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FCB60F38
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63FCB60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DD0606E0;
	Sun, 29 Aug 2021 17:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeRkcj38XIyT; Sun, 29 Aug 2021 17:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BB7606F1;
	Sun, 29 Aug 2021 17:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED491BF599
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B1B880E9D
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkej6n9luHNY for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:12:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71A3A80E9A
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:12:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 44251875DA; Sun, 29 Aug 2021 17:11:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 18:55:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dd1621b067cf2569198227a25080a127a05f7dc4
X-Git-Newrev: 51a282bcb8dfc26d3a27723383c5a1767653a19d
X-Patchwork-Hint: ignore
Message-Id: <20210829171107.44251875DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rwmem: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=51a282bcb8dfc26d3a27723383c5a1767653a19d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rwmem is small tool to read & write device registers. Some of the
features include:

- support mmaped and i2c devices
- addressing with 8/16/32/64 bit addresses
- accessing 8/16/32/64 bit memory locations
- little and big endian addressess and accesses
- bitfields
- address ranges
- register description database

Python bindings are disabled for now.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in        |  1 +
 package/rwmem/Config.in  | 10 ++++++++++
 package/rwmem/rwmem.hash |  2 ++
 package/rwmem/rwmem.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2dbe511de0..1fc8381048 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -134,6 +134,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
+	source "package/rwmem/Config.in"
 	source "package/sentry-native/Config.in"
 	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
new file mode 100644
index 0000000000..0fd9142e92
--- /dev/null
+++ b/package/rwmem/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RWMEM
+	bool "rwmem"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FMT
+	select BR2_PACKAGE_INIH
+	help
+	  Simple program to read/write from/to any location in memory.
+
+	  https://github.com/tomba/rwmem
diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
new file mode 100644
index 0000000000..9becbc5b21
--- /dev/null
+++ b/package/rwmem/rwmem.hash
@@ -0,0 +1,2 @@
+sha256  55d28f029c0cd5c21d3e1c89371e2905d5217f571ef5389ed0fce163804d1c4a  rwmem-c8291705c82bb0686be9adf6a427a2b72114719a.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
new file mode 100644
index 0000000000..24c4e92efc
--- /dev/null
+++ b/package/rwmem/rwmem.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# rwmem
+#
+################################################################################
+
+RWMEM_VERSION = c8291705c82bb0686be9adf6a427a2b72114719a
+RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
+RWMEM_LICENSE = GPL-2.0
+RWMEM_LICENSE_FILES = LICENSE
+RWMEM_CONF_OPTS = -Dpyrwmem=disabled
+RWMEM_DEPENDENCIES = host-pkgconf fmt inih
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

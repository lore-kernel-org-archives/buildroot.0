Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91628C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4848361350
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4848361350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202E46078A;
	Mon, 18 Oct 2021 19:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yULtXKXCcmJz; Mon, 18 Oct 2021 19:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79593607C4;
	Mon, 18 Oct 2021 19:30:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147F91BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4CB605CB
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fWAiQFU8Qil for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:21:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3369160AC9
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE34387503; Mon, 18 Oct 2021 19:18:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:21:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b5b96222b2c00300486a2558004c240604c113d
X-Git-Newrev: 4d203fedfbd4a9763539dd8e93ec198df6f7a132
X-Patchwork-Hint: ignore
Message-Id: <20211018191822.EE34387503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fastd: bump version to 22
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d203fedfbd4a9763539dd8e93ec198df6f7a132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's a new feature to offload L2TP to the Linux kernel, which depends
on libmnl.  A new menu option was introduced for that.

It's possible to link an internal version of libmnl
statically for smaller binary size on constraint targets, but this was
not added to the buildroot package for complexity reasons (both build
and licensing).

The COPYING file gained an additional paragraph for internal libmnl
which does not apply, because internal libmnl is not used in the
package.

Link: https://fastd.readthedocs.io/en/latest/releases/v22.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fastd/Config.in  | 7 +++++++
 package/fastd/fastd.hash | 4 ++--
 package/fastd/fastd.mk   | 9 ++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 5319d68503..97fac9362a 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -21,6 +21,13 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 	help
 	  Enable support for a socket to get fastd's status.
 
+config BR2_PACKAGE_FASTD_OFFLOAD_L2TP
+	bool "l2tp offload support"
+	select BR2_PACKAGE_LIBMNL
+	help
+	  L2TP can be offloaded to the Linux kernel, significantly
+	  increasing throughput.
+
 endif
 
 comment "fastd needs a toolchain w/ threads, dynamic library"
diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index b59085e0ee..5f7f966533 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  942f33bcd794bcb8e19da4c30c875bdfd4d0f1c24ec4dcdf51237791bbfb0d4c  fastd-21.tar.xz
-sha256  1f5acece57466eac89108f934a196be09b7676fa2d637e78d6657ee1a7d644ac  COPYRIGHT
+sha256  19750b88705d66811b7c21b672537909c19ae6b21350688cbd1a3a54d08a8951  fastd-22.tar.xz
+sha256  adf08b42f1b890b89e998360a864cb4f8441a0a57c9e95e2ce1bfdfc24c49976  COPYRIGHT
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index c1db1cc472..5cd6a909c3 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FASTD_VERSION = 21
+FASTD_VERSION = 22
 FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
@@ -33,6 +33,13 @@ else
 FASTD_CONF_OPTS += -Dstatus_socket=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_FASTD_OFFLOAD_L2TP),y)
+FASTD_CONF_OPTS += -Doffload_l2tp=enabled -Dlibmnl_builtin=false
+FASTD_DEPENDENCIES += libmnl
+else
+FASTD_CONF_OPTS += -Doffload_l2tp=disabled
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 FASTD_CONF_OPTS += -Dsystemd=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

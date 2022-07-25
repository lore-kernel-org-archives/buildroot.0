Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C207C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4AC611E4;
	Mon, 25 Jul 2022 09:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4AC611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9NHZDnEkEOi; Mon, 25 Jul 2022 09:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D8E6105B;
	Mon, 25 Jul 2022 09:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7D8E6105B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D878E1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C13434067B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C13434067B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wEpM1wEtf2R for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:36:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A5A40597
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A5A40597
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D971485D3A; Mon, 25 Jul 2022 09:22:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 11:34:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8382574d589ecab2a6c3877a9eadf486eb20fd10
X-Git-Newrev: 68bca98ee8fc40426259826cfb0600e8995ff10c
X-Patchwork-Hint: ignore
Message-Id: <20220725092219.D971485D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: add host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=68bca98ee8fc40426259826cfb0600e8995ff10c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
[yann.morin.1998@free.fr:
  - drop unneeded _BIN_NAME and _INSTALL_BINS
  - s/OCP/OCI/
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host      | 1 +
 package/runc/Config.in.host | 8 ++++++++
 package/runc/runc.mk        | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 71f2a9311c..8078a8304d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -82,6 +82,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
new file mode 100644
index 0000000000..4b2555e029
--- /dev/null
+++ b/package/runc/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_RUNC
+	bool "host runc"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  runC is a CLI tool for spawning and running containers
+	  according to the OCI specification.
+
+	  https://github.com/opencontainers/runc
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 5faa8b683d..b87d07acca 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -23,4 +23,8 @@ RUNC_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
 endif
 
+HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
+HOST_RUNC_TAGS = cgo static_build
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

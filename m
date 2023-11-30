Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9472C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9309F6F4CA;
	Thu, 30 Nov 2023 08:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9309F6F4CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdJ3IXvBNYWm; Thu, 30 Nov 2023 08:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65AF6F4BA;
	Thu, 30 Nov 2023 08:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D65AF6F4BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 541FA1BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B7C84449
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B7C84449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnZphh1xErbz for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E418984497
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E418984497
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFD2786573; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:12:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5e8804218d3c0c8c0bc957f6ec87fce80b8a576a
X-Git-Newrev: 3a0aa2a0a6444da031a725c7fd5fd8ce69f4e626
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.CFD2786573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zfs: not using
 kernel-module infra
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
Content-Type: multipart/mixed; boundary="===============8643267231596378268=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8643267231596378268==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3a0aa2a0a6444da031a725c7fd5fd8ce69f4e626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

zfs already builds the kernel module from the autotools infrastructure.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41493cae71a25a4a1a1819b078717793eda7ffff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/Config.in | 1 +
 package/zfs/zfs.mk    | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zfs/Config.in b/package/zfs/Config.in
index 6209c5865b..049e0716f3 100644
--- a/package/zfs/Config.in
+++ b/package/zfs/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_ZFS
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU  # util-linux (libblkid)
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libtirpc
+	select BR2_LINUX_NEEDS_MODULES
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 6d5d46a305..b852d8d4e2 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -15,7 +15,7 @@ ZFS_CPE_ID_PRODUCT = openzfs
 # 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
 ZFS_AUTORECONF = YES
 
-ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl
+ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
 
 # sysvinit installs only a commented-out modules-load.d/ config file
 ZFS_CONF_OPTS = \
@@ -79,5 +79,7 @@ define ZFS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_INFLATE)
 endef
 
-$(eval $(kernel-module))
+# Even though zfs builds a kernel module, it gets built directly by
+# the autotools logic, so we don't use the kernel-module
+# infrastructure.
 $(eval $(autotools-package))

--===============8643267231596378268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8643267231596378268==--

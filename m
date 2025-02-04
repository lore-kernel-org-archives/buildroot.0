Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C447C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787AB83022;
	Fri, 28 Feb 2025 17:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_5Cyh7adnVE; Fri, 28 Feb 2025 17:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8349984B15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8349984B15;
	Fri, 28 Feb 2025 17:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 066861DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027614064A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qNQE_zxp4-H for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B134240C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21B134240C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1482085E25; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 09:07:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 998e8ccb1ffa77fcc5e70f361322682714db4f7c
X-Git-Newrev: b4853d8428d3795446a40fdc8a642f8b174e7132
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.1482085E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/radvd: bump version to
 2.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4853d8428d3795446a40fdc8a642f8b174e7132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Radvd now uses libbsd.

Changelog:
https://github.com/radvd-project/radvd/blob/v2.20/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Peter: add and propagate remaining libbsd dependencies]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 1 +
 package/radvd/Config.in   | 5 +++++
 package/radvd/radvd.hash  | 4 ++--
 package/radvd/radvd.mk    | 4 ++--
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 6e4de43f73..c55ab429eb 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	depends on !BR2_KERNEL_64_USERLAND_32 # ebtables
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # radvd -> libbsd
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index f1df0c3cb8..374e184b74 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
+	depends on !BR2_STATIC_LIBS  # libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	select BR2_PACKAGE_LIBBSD
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index a624db24ba..8415b8d854 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.19.tar.gz.sha512
-sha512  caa621fd77e34ff6858d60a41b0ee02aff967ac14f2b84c402359744f4bece5c1563419860431c328adc0385e9893ed1f2421d652247a3aa0dfc0aaad1e01233  radvd-2.19.tar.gz
+# From http://www.litech.org/radvd/dist/radvd-2.20.tar.gz.sha512
+sha512  798d8476ab5ff43083b181d6d6ec43c47d06e4067d30c71e038cfd890bcf1ca23e809f9e184c4363458bfa25a916625dd2d7553290fb3e5459034d477b80ebaa  radvd-2.20.tar.gz
 sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 7a3b0a36ac..89d8f55d51 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.19
+RADVD_VERSION = 2.20
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf libbsd
 # We need to ignore <linux/if_arp.h>, because radvd already includes
 # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
 RADVD_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

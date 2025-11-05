Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FD5CCFA1A
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B9D41308;
	Wed,  5 Nov 2025 22:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5wnGO4Hjm1G; Wed,  5 Nov 2025 22:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B1C41358
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B1C41358;
	Wed,  5 Nov 2025 22:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FCE9462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AF72412C1
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X8waZUX9Rd8 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B58411E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B58411E4
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4A7A83DA0; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c519334742781ff8556a2c782518d935bd411208
X-Git-Newrev: 151893aa08dc24de9d97cf9acefd20fe7b57abcc
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.A4A7A83DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: select merged-usr from
 package, not init
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=151893aa08dc24de9d97cf9acefd20fe7b57abcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 255, systemd no longer supports split-usr [0].

Move the select from the init system to the package, to explicitly
expose that fact.

Drop our comment about our design decision, as it no longer applies.

[0] https://github.com/systemd/systemd/blob/v255/NEWS#L7

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/systemd/Config.in | 1 +
 system/Config.in          | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 320d416203..0cb10ea3d8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -24,6 +24,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
+	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/system/Config.in b/system/Config.in
index b24004c533..32462241a5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -115,10 +115,6 @@ comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
 
-# In Buildroot, we decided not to support a split-usr when systemd is
-# used as an init system. This is a design decision, not a systemd
-# issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
-# with BR2_PACKAGE_SYSTEMD.
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
@@ -130,7 +126,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
-	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

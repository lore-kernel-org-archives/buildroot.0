Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC92C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F0D611DE;
	Thu, 11 Jul 2024 10:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paBjfbdbswsH; Thu, 11 Jul 2024 10:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8C1611C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8C1611C4;
	Thu, 11 Jul 2024 10:14:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7651BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52118606A9
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQUe4FKjmy2D for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C09260679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C09260679
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A26684C2D; Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 10:20:21 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d19fb80b36b4accd1f1d998e1f4b8742d3e2189e
X-Git-Newrev: 0660fb5ed89e59bd4ae0f499f0d1054d2b31f1eb
X-Patchwork-Hint: ignore
Message-Id: <20240711101358.6A26684C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/network-manager:
 allow building with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=0660fb5ed89e59bd4ae0f499f0d1054d2b31f1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

NetworkManager officially supports building with musl since version
1.30, so the restriction to glibc toolchain is no longer necessary.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/4f7c04eaf94849d0455e97ba9bcfdd0b84e6459d/NEWS#L615

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8df68d2bb454ff22a32c598e343e63cd7e3c02f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 57d7543131..1d9a02c1d3 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
@@ -59,10 +59,11 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

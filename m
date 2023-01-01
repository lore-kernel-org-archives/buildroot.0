Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2335C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584FF60B77;
	Sun,  1 Jan 2023 18:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584FF60B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk8cLT7QTrpx; Sun,  1 Jan 2023 18:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BB960AE4;
	Sun,  1 Jan 2023 18:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93BB960AE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A88851BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ACEA400D2
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACEA400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uwcwh6bEakRD for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:04:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B120A400CF
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B120A400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B16E86F68; Sun,  1 Jan 2023 18:04:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 18:55:44 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 45ce6c48ba3f2fd0753a60aec4620a2901555cfd
X-Git-Newrev: 72f6b419f088760005d5d23d1b65c6c14bb337eb
X-Patchwork-Hint: ignore
Message-Id: <20230101180456.9B16E86F68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qemu: fix
 indentation for host-qemu sub-options in menuconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=72f6b419f088760005d5d23d1b65c6c14bb337eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 255acdc14365 (package/qemu: needs gcc >= 8) added a comment that
explains that host-qemu would not be available for gcc < 4.8.

However, it interspersed that comment between the main symbol and the
conditional block with the sub-options. This breaks the indentation of
the sub-options in menuconfig, where they appear at the same level as
the main symbol, rather than indented below it.

Fix that by moving the comment before the main symbol.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 037226b33b42fb22234694fe1fcb0b6db624161f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f9cdb9b703..8dd0c7d11b 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -34,6 +34,11 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 
+comment "host-qemu needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
@@ -50,11 +55,6 @@ config BR2_PACKAGE_HOST_QEMU
 
 	  http://www.qemu.org
 
-comment "host-qemu needs a host gcc >= 8"
-	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
-		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
-	depends on !BR2_HOST_GCC_AT_LEAST_8
-
 if BR2_PACKAGE_HOST_QEMU
 
 comment "Emulators selection"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

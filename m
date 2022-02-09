Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 485304056E;
	Wed,  9 Feb 2022 21:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_8CgTEVMS1b; Wed,  9 Feb 2022 21:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E134027F;
	Wed,  9 Feb 2022 21:45:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC071BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F6E860E56
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KU-2tiaSx4Ga for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281FB60E58
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3D34981335; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba163dea744630f6af915c3428f5f5d510437e0e
X-Git-Newrev: 02a067680373b8e1073e64a5bed99a3c0a62b8b2
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.3D34981335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/networkd-dispatcher: drop
 reference to python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=02a067680373b8e1073e64a5bed99a3c0a62b8b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/networkd-dispatcher/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
index ab8c473951..54b48e4ca8 100644
--- a/package/networkd-dispatcher/Config.in
+++ b/package/networkd-dispatcher/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_NETWORKD_DISPATCHER
 	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
-	depends on !BR2_PACKAGE_PYTHON # python3
 	depends on BR2_PACKAGE_SYSTEMD # runtime
 	select BR2_PACKAGE_DBUS # dbus-python
 	select BR2_PACKAGE_DBUS_PYTHON # runtime
@@ -23,7 +22,6 @@ config BR2_PACKAGE_NETWORKD_DISPATCHER
 comment "networkd-dispatcher needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_SYSTEMD
-	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

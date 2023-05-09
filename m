Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECBEC77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C0AB42B66;
	Tue,  9 May 2023 21:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0AB42B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37MHSPWBClwX; Tue,  9 May 2023 21:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331FC42BBF;
	Tue,  9 May 2023 21:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331FC42BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2DF41BF86B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B98D1616A2
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B98D1616A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFh9ZWrjPgKs for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 091FF61694
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 091FF61694
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE8F0862C7; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:57:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d4f1fda8f8a5dc8b136367af73ecb0b97b84279
X-Git-Newrev: 6d1af313c3415e8bfb1bff6642d005ca51575dbb
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.EE8F0862C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: bump to version
 2.20221101
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d1af313c3415e8bfb1bff6642d005ca51575dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch in package/refpolicy/2.20221101 that makes dbus optional
for the mount interface. The patch must go in the 2.20221101 directory or else
the build system will automatically attempt to apply the patch to a custom git
version of refpolicy if chosen.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-mount-dbus-interface-must-be-optional.patch | 33 ++++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |  2 +-
 package/refpolicy/refpolicy.mk                     |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
new file mode 100644
index 0000000000..adec7d98d0
--- /dev/null
+++ b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
@@ -0,0 +1,33 @@
+From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 24 Apr 2023 14:24:49 -0700
+Subject: [PATCH] mount: dbus interface must be optional
+
+If DBus isn't built, the build process fails due to mount.te always using a
+dbus interface even if the dbus module. Fix this by setting the dbus interface
+as optional.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
+---
+ policy/modules/system/mount.te | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
+index d028723..af84af0 100644
+--- a/policy/modules/system/mount.te
++++ b/policy/modules/system/mount.te
+@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
+ 
+ userdom_use_all_users_fds(mount_t)
+ 
+-dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
++optional_policy(`
++	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
++')
+ 
+ ifdef(`distro_redhat',`
+ 	optional_policy(`
+-- 
+2.40.0
+
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index b08c22ed4e..a09e59c270 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  965f98f0b68a24fd0b8e8d973d319332aea88973e1d6c455ef9c2a31aefaeaa6  refpolicy-2.20220106.tar.bz2
+sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index f11b72755a..8fea7cc254 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20220106
+REFPOLICY_VERSION = 2.20221101
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C9C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E003A60F31;
	Sat,  4 Nov 2023 17:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E003A60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wEgUHeNebqZ; Sat,  4 Nov 2023 17:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3ED60BA9;
	Sat,  4 Nov 2023 17:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3ED60BA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCB911BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B2B041B6C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2B041B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nz7RSen573Z0 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:33:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E3441B6B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E3441B6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F3E6866A2; Sat,  4 Nov 2023 17:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa87875b9f22f19bd1ee5f9c6d6a3e9eb49ebc2b
X-Git-Newrev: 68de45491ba7d4b7aeff6f869934745440f88c00
X-Patchwork-Hint: ignore
Message-Id: <20231104173329.4F3E6866A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: bump version to
 2.20231002
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68de45491ba7d4b7aeff6f869934745440f88c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-mount-dbus-interface-must-be-optional.patch | 33 ----------------------
 package/refpolicy/refpolicy.hash                   |  2 +-
 package/refpolicy/refpolicy.mk                     |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
deleted file mode 100644
index adec7d98d0..0000000000
--- a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 24 Apr 2023 14:24:49 -0700
-Subject: [PATCH] mount: dbus interface must be optional
-
-If DBus isn't built, the build process fails due to mount.te always using a
-dbus interface even if the dbus module. Fix this by setting the dbus interface
-as optional.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
----
- policy/modules/system/mount.te | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
-index d028723..af84af0 100644
---- a/policy/modules/system/mount.te
-+++ b/policy/modules/system/mount.te
-@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
- 
- userdom_use_all_users_fds(mount_t)
- 
--dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+optional_policy(`
-+	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+')
- 
- ifdef(`distro_redhat',`
- 	optional_policy(`
--- 
-2.40.0
-
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index a09e59c270..70d1acc9af 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
+sha256  c89cd3b2e5d99765cc24536fd8e76de83951ad23e05472350328b5a4f8bee410  refpolicy-2.20231002.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 8fea7cc254..fb1c213b84 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20221101
+REFPOLICY_VERSION = 2.20231002
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

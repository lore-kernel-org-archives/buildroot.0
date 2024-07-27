Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61287C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A99F40CD7;
	Sat, 27 Jul 2024 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4F8GcyKckvmq; Sat, 27 Jul 2024 14:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A66B40CC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A66B40CC3;
	Sat, 27 Jul 2024 14:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 962911BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 838E540CC3
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPSd5YFmbovs for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241A840C8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 241A840C8F
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE9387585; Sat, 27 Jul 2024 14:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 15:57:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 541eb8bf7db553708ff2286995ce94b38fc8d537
X-Git-Newrev: 127c42033590e73e3161852acd540a79c98d9f3d
X-Patchwork-Hint: ignore
Message-Id: <20240727140752.0BE9387585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 256.4
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
Content-Type: multipart/mixed; boundary="===============2601304770485707889=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2601304770485707889==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=127c42033590e73e3161852acd540a79c98d9f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch which is now upstream

Rebase fix missing LOOP_SET_BLOCK_SIZE patch.

Update config options to match new expected format.

Add new nsresourced, mountfsd and vmspawn config options.

Add new systemd-journal-upload user for journald-remote.

Add new kernel config enable/disable options from systemd readme.

Add new optional dependencies and config options as appropriate.

LICENSES/README.md hash changed due to additional details added:
https://github.com/systemd/systemd/commit/fb747bd8cdcbeb55f9ef3c62289fff8ff5a25b68

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...issing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch |  10 +-
 .../systemd/0002-basic-add-bcachefs-magic.patch    |  53 ----
 package/systemd/Config.in                          |  29 ++
 package/systemd/systemd.hash                       |   4 +-
 package/systemd/systemd.mk                         | 334 ++++++++++++++-------
 5 files changed, 263 insertions(+), 167 deletions(-)

diff --git a/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch b/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
index 7d520f81d4..0ab5a4e98d 100644
--- a/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
+++ b/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
@@ -1,4 +1,4 @@
-From e358793a796f8c742af4ea3f4fe398731ca46649 Mon Sep 17 00:00:00 2001
+From 56ab1c54497d9fac74380ff9e11aaf931a917d2b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
 Date: Fri, 14 Jun 2024 14:37:29 +0200
 Subject: [PATCH] src/basic/missing_loop.h: fix missing LOOP_SET_BLOCK_SIZE
@@ -22,17 +22,17 @@ Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/basic/missing_loop.h b/src/basic/missing_loop.h
-index 7141544b64..b1505f678b 100644
+index b88501d78b..f83a14c914 100644
 --- a/src/basic/missing_loop.h
 +++ b/src/basic/missing_loop.h
-@@ -22,3 +22,7 @@ struct loop_config {
+@@ -29,3 +29,7 @@ assert_cc(LOOP_SET_DIRECT_IO == 0x4C08);
  #ifndef LOOP_SET_STATUS_SETTABLE_FLAGS
- #define LOOP_SET_STATUS_SETTABLE_FLAGS (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN | LO_FLAGS_DIRECT_IO)
+ #  define LOOP_SET_STATUS_SETTABLE_FLAGS (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN)
  #endif
 +
 +#ifndef LOOP_SET_BLOCK_SIZE
 +#  define LOOP_SET_BLOCK_SIZE 0x4C09
 +#endif
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/systemd/0002-basic-add-bcachefs-magic.patch b/package/systemd/0002-basic-add-bcachefs-magic.patch
deleted file mode 100644
index e7f4b1cbb7..0000000000
--- a/package/systemd/0002-basic-add-bcachefs-magic.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-Date: Fri, 31 May 2024 09:51:38 +1200
-Subject: [PATCH] basic: Add BCACHEFS magic
-
-Import magic.h from Linux 6.9 to get the definition of
-BCACHEFS_SUPER_MAGIC. Update filesystems-gperf.gperf to add knowledge of
-bcachefs.
-
-This fixes the following error building against a bleeding edge kernel.
-```
-src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
-
-Filesystem found in kernel header but not in filesystems-gperf.gperf: BCACHEFS_SUPER_MAGIC
-```
-
-Upstream: https://github.com/systemd/systemd/commit/201148b08de65de004d10679a8c3d201cc08fb28
-Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
----
- src/basic/filesystems-gperf.gperf | 1 +
- src/basic/missing_magic.h         | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/basic/filesystems-gperf.gperf b/src/basic/filesystems-gperf.gperf
-index 1cd66b5a5f..c82fe98227 100644
---- a/src/basic/filesystems-gperf.gperf
-+++ b/src/basic/filesystems-gperf.gperf
-@@ -28,6 +28,7 @@ afs,             {AFS_FS_MAGIC, AFS_SUPER_MAGIC}
- anon_inodefs,    {ANON_INODE_FS_MAGIC}
- autofs,          {AUTOFS_SUPER_MAGIC}
- balloon-kvm,     {BALLOON_KVM_MAGIC}
-+bcachefs,        {BCACHEFS_SUPER_MAGIC}
- bdev,            {BDEVFS_MAGIC}
- binder,          {BINDERFS_SUPER_MAGIC}
- binfmt_misc,     {BINFMTFS_MAGIC}
-diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
-index 82d71c8ad1..b3d2ee9f57 100644
---- a/src/basic/missing_magic.h
-+++ b/src/basic/missing_magic.h
-@@ -197,3 +197,10 @@
- #ifndef NTFS3_SUPER_MAGIC
- #define NTFS3_SUPER_MAGIC 0x7366746e
- #endif
-+
-+/* Added in Linux commit e2f48c48090dea172c0c571101041de64634dae5. Remove when next sync'd */
-+#ifndef BCACHEFS_SUPER_MAGIC
-+#  define BCACHEFS_SUPER_MAGIC 0xca451a4e
-+#else
-+assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e)
-+#endif
---
-2.45.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 82c0e30474..6708adce9b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -329,6 +329,15 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
+config BR2_PACKAGE_SYSTEMD_NSRESOURCED
+	bool "enable nsresourced"
+	help
+	  systemd-nsresourced is a system service that permits
+	  transient delegation of a a UID/GID range to a user
+	  namespace allocated by a client, via a Varlink IPC API.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-nsresourced.service.html
+
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
 	default y
@@ -483,6 +492,16 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_MOUNTFSD
+	bool "enable mountfsd support"
+	help
+	  systemd-mountfsd is a system service that dissects disk
+	  images, and returns mount file descriptors for the file
+	  systems contained therein to clients, via a Varlink IPC
+	  API.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-mountfsd.service.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUPDATE
 	bool "enable sysupdate support"
 	select BR2_PACKAGE_OPENSSL
@@ -580,4 +599,14 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
 	  Default keymap for the system. Leave empty to not set a
 	  default keymap.
 
+config BR2_PACKAGE_SYSTEMD_VMSPAWN
+	bool "enable vmspawn"
+	help
+	  systemd-vmspawn may be used to start a virtual machine
+	  from an OS image. In many ways it is similar to
+	  systemd-nspawn, but launches a full virtual machine
+	  instead of using namespaces.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-vmspawn.html
+
 endif
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index f999d0d34e..399ac61492 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  26ac73c2108132b1d11ff939e8b1bece42f1c1da03fdf4a242af5a7cf3ac34f1  systemd-254.13.tar.gz
+sha256  7861d544190f938cac1b242624d78c96fe2ebbc7b72f86166e88b50451c6fa58  systemd-256.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -12,4 +12,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  8ccb649d1fc1103e5726612cf303f05d4eb86b7ab46d9f630009dd32e87612e2  LICENSES/README.md
+sha256  3df2dfbb09215ab1aecdd3c91d7fbe02fee4a0e75ef8967a25d1a6fe3b8abc06  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 52fa344807..5dca8681bc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,8 +19,8 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254.13
-SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
+SYSTEMD_VERSION = 256.4
+SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
 	GPL-2.0+ (udev), \
@@ -65,10 +65,9 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
-	-Ddbus=false \
+	-Ddbus=disabled \
 	-Ddbus-interfaces-dir=no \
 	-Ddefault-compression='auto' \
-	-Ddefault-hierarchy=unified \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
 	-Dfirst-boot-full-preset=false \
@@ -79,29 +78,33 @@ SYSTEMD_CONF_OPTS += \
 	-Dldconfig=false \
 	-Dlink-boot-shared=true \
 	-Dloadkeys-path=/usr/bin/loadkeys \
-	-Dman=false \
+	-Dman=disabled \
 	-Dmount-path=/usr/bin/mount \
+	-Dvcs-tag=false \
 	-Dmode=release \
 	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
-	-Dpasswdqc=false \
+	-Dpasswdqc=disabled \
+	-Dlibfido2=disabled \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
-	-Drootlibdir='/usr/lib' \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
-	-Dsplit-usr=false \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
-	-Dtelinit-path= \
 	-Dtests=false \
+	-Dfuzz-tests=false \
+	-Dinstall-tests=false \
+	-Dlog-message-verification=disabled \
 	-Dtmpfiles=true \
-	-Dukify=false \
+	-Dukify=disabled \
+	-Dbpf-framework=disabled \
+	-Dvmlinux-h=disabled \
 	-Dumount-path=/usr/bin/umount \
-	-Dxenctrl=false
+	-Dxenctrl=disabled
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -117,11 +120,25 @@ ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SYSTEMD_DEPENDENCIES += libglib2
+SYSTEMD_CONF_OPTS += -Dglib=enabled
+else
+SYSTEMD_CONF_OPTS += -Dglib=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+SYSTEMD_DEPENDENCIES += libarchive
+SYSTEMD_CONF_OPTS += -Dlibarchive=enabled
+else
+SYSTEMD_CONF_OPTS += -Dlibarchive=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
-SYSTEMD_CONF_OPTS += -Dacl=true
+SYSTEMD_CONF_OPTS += -Dacl=enabled
 else
-SYSTEMD_CONF_OPTS += -Dacl=false
+SYSTEMD_CONF_OPTS += -Dacl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LESS),y)
@@ -132,144 +149,151 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 SYSTEMD_DEPENDENCIES += libapparmor
-SYSTEMD_CONF_OPTS += -Dapparmor=true
+SYSTEMD_CONF_OPTS += -Dapparmor=enabled
 else
-SYSTEMD_CONF_OPTS += -Dapparmor=false
+SYSTEMD_CONF_OPTS += -Dapparmor=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 SYSTEMD_DEPENDENCIES += audit
-SYSTEMD_CONF_OPTS += -Daudit=true
+SYSTEMD_CONF_OPTS += -Daudit=enabled
 else
-SYSTEMD_CONF_OPTS += -Daudit=false
+SYSTEMD_CONF_OPTS += -Daudit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
 SYSTEMD_DEPENDENCIES += cryptsetup
-SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true -Dlibcryptsetup-plugins=true
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=enabled -Dlibcryptsetup-plugins=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false -Dlibcryptsetup-plugins=false
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=disabled -Dlibcryptsetup-plugins=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 SYSTEMD_DEPENDENCIES += elfutils
-SYSTEMD_CONF_OPTS += -Delfutils=true
+SYSTEMD_CONF_OPTS += -Delfutils=enabled
 else
-SYSTEMD_CONF_OPTS += -Delfutils=false
+SYSTEMD_CONF_OPTS += -Delfutils=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 SYSTEMD_DEPENDENCIES += iptables
-SYSTEMD_CONF_OPTS += -Dlibiptc=true
+SYSTEMD_CONF_OPTS += -Dlibiptc=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlibiptc=false
+SYSTEMD_CONF_OPTS += -Dlibiptc=disabled
 endif
 
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
-SYSTEMD_CONF_OPTS += -Dlibidn2=true -Dlibidn=false
+SYSTEMD_CONF_OPTS += -Dlibidn2=enabled -Dlibidn=disabled
 else ifeq ($(BR2_PACKAGE_LIBIDN),y)
 SYSTEMD_DEPENDENCIES += libidn
-SYSTEMD_CONF_OPTS += -Dlibidn=true -Dlibidn2=false
+SYSTEMD_CONF_OPTS += -Dlibidn=enabled -Dlibidn2=disabled
 else
-SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=false
+SYSTEMD_CONF_OPTS += -Dlibidn=disabled -Dlibidn2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_DEPENDENCIES += libseccomp
-SYSTEMD_CONF_OPTS += -Dseccomp=true
+SYSTEMD_CONF_OPTS += -Dseccomp=enabled
 else
-SYSTEMD_CONF_OPTS += -Dseccomp=false
+SYSTEMD_CONF_OPTS += -Dseccomp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
 SYSTEMD_DEPENDENCIES += libxkbcommon
-SYSTEMD_CONF_OPTS += -Dxkbcommon=true
+SYSTEMD_CONF_OPTS += -Dxkbcommon=enabled
 else
-SYSTEMD_CONF_OPTS += -Dxkbcommon=false
+SYSTEMD_CONF_OPTS += -Dxkbcommon=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 SYSTEMD_DEPENDENCIES += bzip2
-SYSTEMD_CONF_OPTS += -Dbzip2=true
+SYSTEMD_CONF_OPTS += -Dbzip2=enabled
 else
-SYSTEMD_CONF_OPTS += -Dbzip2=false
+SYSTEMD_CONF_OPTS += -Dbzip2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 SYSTEMD_DEPENDENCIES += zstd
-SYSTEMD_CONF_OPTS += -Dzstd=true
+SYSTEMD_CONF_OPTS += -Dzstd=enabled
 else
-SYSTEMD_CONF_OPTS += -Dzstd=false
+SYSTEMD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 SYSTEMD_DEPENDENCIES += lz4
-SYSTEMD_CONF_OPTS += -Dlz4=true
+SYSTEMD_CONF_OPTS += -Dlz4=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlz4=false
+SYSTEMD_CONF_OPTS += -Dlz4=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SYSTEMD_DEPENDENCIES += linux-pam
-SYSTEMD_CONF_OPTS += -Dpam=true
+SYSTEMD_CONF_OPTS += -Dpam=enabled
 else
-SYSTEMD_CONF_OPTS += -Dpam=false
+SYSTEMD_CONF_OPTS += -Dpam=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
-SYSTEMD_CONF_OPTS += -Dfdisk=true
+SYSTEMD_CONF_OPTS += -Dfdisk=enabled
+else
+SYSTEMD_CONF_OPTS += -Dfdisk=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD),y)
+SYSTEMD_DEPENDENCIES += kmod
+SYSTEMD_CONF_OPTS += -Dkmod=enabled
 else
-SYSTEMD_CONF_OPTS += -Dfdisk=false
+SYSTEMD_CONF_OPTS += -Dkmod=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
-SYSTEMD_CONF_OPTS += -Dxz=true
+SYSTEMD_CONF_OPTS += -Dxz=enabled
 else
-SYSTEMD_CONF_OPTS += -Dxz=false
+SYSTEMD_CONF_OPTS += -Dxz=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SYSTEMD_DEPENDENCIES += zlib
-SYSTEMD_CONF_OPTS += -Dzlib=true
+SYSTEMD_CONF_OPTS += -Dzlib=enabled
 else
-SYSTEMD_CONF_OPTS += -Dzlib=false
+SYSTEMD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSTEMD_DEPENDENCIES += libcurl
-SYSTEMD_CONF_OPTS += -Dlibcurl=true
+SYSTEMD_CONF_OPTS += -Dlibcurl=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlibcurl=false
+SYSTEMD_CONF_OPTS += -Dlibcurl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Dgcrypt=enabled
 else
-SYSTEMD_CONF_OPTS += -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Dgcrypt=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 SYSTEMD_DEPENDENCIES += p11-kit
-SYSTEMD_CONF_OPTS += -Dp11kit=true
+SYSTEMD_CONF_OPTS += -Dp11kit=enabled
 else
-SYSTEMD_CONF_OPTS += -Dp11kit=false
+SYSTEMD_CONF_OPTS += -Dp11kit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
-SYSTEMD_CONF_OPTS += -Dpcre2=true
+SYSTEMD_CONF_OPTS += -Dpcre2=enabled
 else
-SYSTEMD_CONF_OPTS += -Dpcre2=false
+SYSTEMD_CONF_OPTS += -Dpcre2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
-SYSTEMD_CONF_OPTS += -Dblkid=true
+SYSTEMD_CONF_OPTS += -Dblkid=enabled
 else
-SYSTEMD_CONF_OPTS += -Dblkid=false
+SYSTEMD_CONF_OPTS += -Dblkid=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
@@ -296,27 +320,35 @@ else
 SYSTEMD_CONF_OPTS += -Danalyze=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
+SYSTEMD_DEPENDENCIES += libpwquality
+SYSTEMD_CONF_OPTS += -Dpwquality=enabled
+else
+SYSTEMD_CONF_OPTS += -Dpwquality=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 # remote also depends on libcurl, this is already added above.
 SYSTEMD_DEPENDENCIES += libmicrohttpd
-SYSTEMD_CONF_OPTS += -Dremote=true -Dmicrohttpd=true
+SYSTEMD_CONF_OPTS += -Dremote=enabled -Dmicrohttpd=enabled
 SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * - - - systemd Journal Remote
+SYSTEMD_UPLOAD_USER = systemd-journal-upload -1 systemd-journal-upload -1 * - - - systemd Journal Upload
 else
-SYSTEMD_CONF_OPTS += -Dremote=false -Dmicrohttpd=false
+SYSTEMD_CONF_OPTS += -Dremote=disabled -Dmicrohttpd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
 SYSTEMD_DEPENDENCIES += libqrencode
-SYSTEMD_CONF_OPTS += -Dqrencode=true
+SYSTEMD_CONF_OPTS += -Dqrencode=enabled
 else
-SYSTEMD_CONF_OPTS += -Dqrencode=false
+SYSTEMD_CONF_OPTS += -Dqrencode=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSTEMD_DEPENDENCIES += libselinux
-SYSTEMD_CONF_OPTS += -Dselinux=true
+SYSTEMD_CONF_OPTS += -Dselinux=enabled
 else
-SYSTEMD_CONF_OPTS += -Dselinux=false
+SYSTEMD_CONF_OPTS += -Dselinux=disabled
 endif
 
 ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
@@ -361,6 +393,12 @@ else
 SYSTEMD_CONF_OPTS += -Dvconsole=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_VMSPAWN),y)
+SYSTEMD_CONF_OPTS += -Dvmspawn=enabled
+else
+SYSTEMD_CONF_OPTS += -Dvmspawn=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
 SYSTEMD_CONF_OPTS += -Dquotacheck=true
 else
@@ -373,6 +411,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysusers=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+SYSTEMD_CONF_OPTS += -Dstoragetm=true
+else
+SYSTEMD_CONF_OPTS += -Dstoragetm=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_FIRSTBOOT),y)
 SYSTEMD_CONF_OPTS += -Dfirstboot=true
 else
@@ -405,24 +449,24 @@ SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
-SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
+SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=enabled
 SYSTEMD_MACHINED_PERMISSIONS = /var/lib/machines d 700 0 0 - - - - -
 else
-SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
+SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
-SYSTEMD_CONF_OPTS += -Dimportd=true
+SYSTEMD_CONF_OPTS += -Dimportd=enabled
 else
-SYSTEMD_CONF_OPTS += -Dimportd=false
+SYSTEMD_CONF_OPTS += -Dimportd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
-SYSTEMD_CONF_OPTS += -Dhomed=true
+SYSTEMD_CONF_OPTS += -Dhomed=enabled
 SYSTEMD_DEPENDENCIES += cryptsetup openssl
 SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/home d 755 0 0 - - - - -
 else
-SYSTEMD_CONF_OPTS += -Dhomed=false
+SYSTEMD_CONF_OPTS += -Dhomed=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
@@ -431,6 +475,12 @@ else
 SYSTEMD_CONF_OPTS += -Dhostnamed=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_NSRESOURCED),y)
+SYSTEMD_CONF_OPTS += -Dnsresourced=true
+else
+SYSTEMD_CONF_OPTS += -Dnsresourced=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
 SYSTEMD_CONF_OPTS += -Dnss-myhostname=true
 else
@@ -450,10 +500,16 @@ SYSTEMD_CONF_OPTS += -Dlocaled=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_REPART),y)
-SYSTEMD_CONF_OPTS += -Drepart=true
+SYSTEMD_CONF_OPTS += -Drepart=enabled
 SYSTEMD_DEPENDENCIES += openssl
 else
-SYSTEMD_CONF_OPTS += -Drepart=false
+SYSTEMD_CONF_OPTS += -Drepart=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_MOUNTFSD),y)
+SYSTEMD_CONF_OPTS += -Dmountfsd=true
+else
+SYSTEMD_CONF_OPTS += -Dmountfsd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_USERDB),y)
@@ -489,10 +545,10 @@ SYSTEMD_CONF_OPTS += -Doomd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
-SYSTEMD_CONF_OPTS += -Dpolkit=true
+SYSTEMD_CONF_OPTS += -Dpolkit=enabled
 SYSTEMD_DEPENDENCIES += polkit
 else
-SYSTEMD_CONF_OPTS += -Dpolkit=false
+SYSTEMD_CONF_OPTS += -Dpolkit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_PORTABLED),y)
@@ -508,9 +564,9 @@ SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
-SYSTEMD_CONF_OPTS += -Dsysupdate=true
+SYSTEMD_CONF_OPTS += -Dsysupdate=enabled
 else
-SYSTEMD_CONF_OPTS += -Dsysupdate=false
+SYSTEMD_CONF_OPTS += -Dsysupdate=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
@@ -533,30 +589,30 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
-SYSTEMD_CONF_OPTS += -Dnss-resolve=true -Dresolve=true
+SYSTEMD_CONF_OPTS += -Dnss-resolve=enabled -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - systemd Resolver
 else
-SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
+SYSTEMD_CONF_OPTS += -Dnss-resolve=disabled -Dresolve=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
-	-Dgnutls=false \
-	-Dopenssl=true \
+	-Dgnutls=disabled \
+	-Dopenssl=enabled \
 	-Ddns-over-tls=openssl \
 	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 SYSTEMD_CONF_OPTS += \
-	-Dgnutls=true \
-	-Dopenssl=false \
+	-Dgnutls=enabled \
+	-Dopenssl=disabled \
 	-Ddns-over-tls=gnutls \
 	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += gnutls
 else
 SYSTEMD_CONF_OPTS += \
-	-Dgnutls=false \
-	-Dopenssl=false \
+	-Dgnutls=disabled \
+	-Dopenssl=disabled \
 	-Ddns-over-tls=false \
 	-Ddefault-dns-over-tls=no
 endif
@@ -583,15 +639,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
 SYSTEMD_DEPENDENCIES += tpm2-tss
-SYSTEMD_CONF_OPTS += -Dtpm2=true
+SYSTEMD_CONF_OPTS += -Dtpm2=enabled
 else
-SYSTEMD_CONF_OPTS += -Dtpm2=false
+SYSTEMD_CONF_OPTS += -Dtpm2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
-SYSTEMD_CONF_OPTS += -Defi=true -Dbootloader=true
+SYSTEMD_CONF_OPTS += -Defi=true -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
@@ -604,7 +660,7 @@ define SYSTEMD_INSTALL_BOOT_FILES
 endef
 
 else
-SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=false
+SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=disabled
 endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
@@ -654,6 +710,7 @@ define SYSTEMD_USERS
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
+	$(SYSTEMD_UPLOAD_USER)
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_OOMD_USER)
 	$(SYSTEMD_NETWORKD_USER)
@@ -800,14 +857,41 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
 
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FW_LOADER_USER_HELPER)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DMIID)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_BSG)
+
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
 
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+
 	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
 
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KCMP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCH_FQ_CODEL)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FAIR_GROUP_SCHED)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFS_BANDWIDTH)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EFIVAR_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EFI_PARTITION)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI_SYSFS)
+
+	$(call KCONFIG_DISABLE_OPT,CONFIG_RT_GROUP_SCHED)
 
 	$(SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS)
 endef
@@ -815,25 +899,26 @@ endef
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
-	-Dsplit-usr=false \
 	--prefix=/usr \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	-Dcreate-log-dirs=false \
+	-Dvcs-tag=false \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
+	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
-	-Dbootloader=false \
+	-Dbootloader=disabled \
 	-Defi=false \
 	-Dtpm=false \
 	-Denvironment-d=false \
 	-Dbinfmt=false \
-	-Drepart=false \
+	-Drepart=disabled \
 	-Dcoredump=false \
-	-Ddbus=false \
+	-Ddbus=disabled \
 	-Ddbus-interfaces-dir=no \
 	-Dpstore=false \
 	-Doomd=false \
@@ -841,55 +926,90 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhostnamed=false \
 	-Dlocaled=false \
 	-Dmachined=false \
-	-Dpasswdqc=false \
+	-Dpasswdqc=disabled \
 	-Dportabled=false \
 	-Dsysext=false \
-	-Dsysupdate=false \
+	-Dsysupdate=disabled \
+	-Dmountfsd=false \
 	-Duserdb=false \
-	-Dhomed=false \
+	-Dhomed=disabled \
 	-Dnetworkd=false \
 	-Dtimedated=false \
 	-Dtimesyncd=false \
-	-Dremote=false \
+	-Dremote=disabled \
 	-Dcreate-log-dirs=false \
+	-Dnsresourced=false \
 	-Dnss-myhostname=false \
-	-Dnss-mymachines=false \
-	-Dnss-resolve=false \
+	-Dnss-mymachines=disabled \
+	-Dnss-resolve=disabled \
 	-Dnss-systemd=false \
 	-Dfirstboot=false \
 	-Drandomseed=false \
 	-Dbacklight=false \
 	-Dvconsole=false \
+	-Dvmspawn=disabled \
 	-Dquotacheck=false \
 	-Dsysusers=false \
+	-Dstoragetm=false \
 	-Dtmpfiles=true \
-	-Dimportd=false \
+	-Dimportd=disabled \
 	-Dhwdb=true \
 	-Drfkill=false \
-	-Dman=false \
-	-Dhtml=false \
+	-Dman=disabled \
+	-Dhtml=disabled \
 	-Dsmack=false \
-	-Dpolkit=false \
-	-Dblkid=false \
+	-Dpolkit=disabled \
+	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
-	-Dzlib=false \
+	-Dzlib=disabled \
 	-Dgshadow=false \
 	-Dima=false \
 	-Dtests=false \
-	-Dglib=false \
-	-Dacl=false \
+	-Dfuzz-tests=false \
+	-Dinstall-tests=false \
+	-Dlog-message-verification=disabled \
+	-Dglib=disabled \
+	-Dlibarchive=disabled \
+	-Dacl=disabled \
 	-Dsysvinit-path='' \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dukify=false \
+	-Dukify=disabled \
 	-Danalyze=false \
-	-Dlibcryptsetup=false \
-	-Daudit=false \
-	-Dxenctrl=false \
-	-Dzstd=false
+	-Dbpf-framework=disabled \
+	-Dvmlinux-h=disabled \
+	-Dpwquality=disabled \
+	-Dmicrohttpd=disabled \
+	-Dqrencode=disabled \
+	-Dselinux=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Delfutils=disabled \
+	-Dlibiptc=disabled \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dxenctrl=disabled \
+	-Dlibidn2=disabled \
+	-Dlibidn=disabled \
+	-Dseccomp=disabled \
+	-Dxkbcommon=disabled \
+	-Dbzip2=disabled \
+	-Dzstd=disabled \
+	-Dlz4=disabled \
+	-Dpam=disabled \
+	-Dfdisk=disabled \
+	-Dkmod=disabled \
+	-Dxz=disabled \
+	-Dlibcurl=disabled \
+	-Dgcrypt=disabled \
+	-Dgnutls=disabled \
+	-Dopenssl=disabled \
+	-Dp11kit=disabled \
+	-Dlibfido2=disabled \
+	-Dpcre2=disabled
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \

--===============2601304770485707889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2601304770485707889==--

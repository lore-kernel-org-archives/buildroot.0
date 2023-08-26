Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D0EC8740
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4224183E5B;
	Thu,  7 Sep 2023 15:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4224183E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgtcvQSQkdow; Thu,  7 Sep 2023 15:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CA883EA3;
	Thu,  7 Sep 2023 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61CA883EA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 593DA1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 999B041D74
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 999B041D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deYjCIIEyrn4 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD1E41DC0
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD1E41DC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CC6F86A21; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 20:08:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4aa36a507c7321eabd4ba598750a05a37356d5fc
X-Git-Newrev: a2888f439cced45f48f35a51f2d4f9b0629ff28b
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.1CC6F86A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 8.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2888f439cced45f48f35a51f2d4f9b0629ff28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Replace no longer supported --with-git-submodules config option with
new --disable-download option.

Replace no longer supported --meson config option with --python config
option. The configure script expects --python to point to the python
interpreter with the meson installation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-install-keyboard-maps-only-if-necessary.patch | 38 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  8 ++---
 3 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
deleted file mode 100644
index 8ba7f3cf15..0000000000
--- a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@redhat.com>
-Date: Sun, 1 Jan 2023 21:00:57 -0300
-Subject: [PATCH] meson: install keyboard maps only if necessary
-
-They are required only for system emulation (i.e. have_system is true).
-
-Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/
-Signed-off-by: Carlos Santos <casantos@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- pc-bios/keymaps/meson.build | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
-index 158a3b410c..bff3083313 100644
---- a/pc-bios/keymaps/meson.build
-+++ b/pc-bios/keymaps/meson.build
-@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
-                        build_by_default: true,
-                        output: km,
-                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
--                       install: true,
-+                       install: have_system,
-                        install_dir: qemu_datadir / 'keymaps')
-   endforeach
- 
-@@ -56,4 +56,6 @@ else
-   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
- endif
- 
--install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
-+if have_system
-+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
-+endif
--- 
-2.31.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e71742c243..506afa8bf3 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09  qemu-8.0.3.tar.xz
+sha256  710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55  qemu-8.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b341d0220d..84166958bb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.3
+QEMU_VERSION = 8.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -272,7 +272,7 @@ define QEMU_CONFIGURE_CMDS
 			--prefix=/usr \
 			--cross-prefix=$(TARGET_CROSS) \
 			--audio-drv-list= \
-			--meson=$(HOST_DIR)/bin/meson \
+			--python=$(HOST_DIR)/bin/python3 \
 			--ninja=$(HOST_DIR)/bin/ninja \
 			--disable-alsa \
 			--disable-bpf \
@@ -313,7 +313,7 @@ define QEMU_CONFIGURE_CMDS
 			--enable-attr \
 			--enable-kvm \
 			--enable-vhost-net \
-			--with-git-submodules=ignore \
+			--disable-download \
 			--disable-hexagon-idef-parser \
 			$(QEMU_OPTS)
 endef
@@ -458,7 +458,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
-		--meson=$(HOST_DIR)/bin/meson \
+		--python=$(HOST_DIR)/bin/python3 \
 		--ninja=$(HOST_DIR)/bin/ninja \
 		--disable-alsa \
 		--disable-bpf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

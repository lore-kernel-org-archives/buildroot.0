Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B107AC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791A2605FD;
	Sat, 23 Mar 2024 20:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3vT6BXlSBs5; Sat, 23 Mar 2024 20:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A9C7606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A9C7606EB;
	Sat, 23 Mar 2024 20:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8F7B1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2F37606EB
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJLdB32jtujB for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 175B1605FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 175B1605FD
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05EAD8399B; Sat, 23 Mar 2024 20:37:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e9f161d4a7a68a041860e5855e98bee9d3a1498
X-Git-Newrev: 1f418a6d1412911a3853307752f774ebae888309
X-Patchwork-Hint: ignore
Message-Id: <20240323203718.05EAD8399B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpciaccess: fix static build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f418a6d1412911a3853307752f774ebae888309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version 0.18
in commit 136d4dfbe6126b5ed20237c571f599dfc163d110:

/home/autobuild/autobuild/instance-0/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc  -o src/libpciaccess.so.0.11.1 src/libpciaccess.so.0.11.1.p/common_bridge.c.o src/libpciaccess.so.0.11.1.p/common_iterator.c.o src/libpciaccess.so.0.11.1.p/common_init.c.o src/libpciaccess.so.0.11.1.p/common_interface.c.o src/libpciaccess.so.0.11.1.p/common_io.c.o src/libpciaccess.so.0.11.1.p/common_capability.c.o src/libpciaccess.so.0.11.1.p/common_device_name.c.o src/libpciaccess.so.0.11.1.p/common_map.c.o src/libpciaccess.so.0.11.1.p/linux_sysfs.c.o src/libpciaccess.so.0.11.1.p/linux_devmem.c.o src/libpciaccess.so.0.11.1.p/common_vgaarb.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libpciaccess.so.0 -static /home/autobuild/autobuild/instance-0/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libz.a -Wl,--end-group
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Fixes: 136d4dfbe6126b5ed20237c571f599dfc163d110
 - http://autobuild.buildroot.org/results/7604706f4f4ab96a485a1dabe7cb4c98a2ef27d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...w-building-static-library-not-just-shared.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
new file mode 100644
index 0000000000..df1b4b415a
--- /dev/null
+++ b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
@@ -0,0 +1,48 @@
+From ad7e9cb4b291a46812eea321f0634cfc46fb94e2 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 14 Mar 2024 13:55:55 -0700
+Subject: [PATCH] meson: allow building static library, not just shared
+
+Lets builders specify -Ddefault_library={shared,static,both}
+to control which types of libpciaccess library are built
+
+Closes: #20
+Reported-by: Maxime Gauduin (@alucryd)
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/ad7e9cb4b291a46812eea321f0634cfc46fb94e2
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitlab-ci.yml  | 2 +-
+ src/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
+index bcb75cf..185edc2 100644
+--- a/.gitlab-ci.yml
++++ b/.gitlab-ci.yml
+@@ -91,7 +91,7 @@ meson:
+       - MESON_OPTIONS: ['-Dzlib=disabled', '-Dzlib=enabled']
+   script:
+     - mkdir -p ../_inst
+-    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 $MESON_OPTIONS
++    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 -Ddefault_library=both $MESON_OPTIONS
+     - meson configure builddir
+     - ninja -C builddir test
+     - ninja -C builddir install
+diff --git a/src/meson.build b/src/meson.build
+index 24eee04..e319688 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -38,7 +38,7 @@ endif
+ 
+ inc_src = include_directories('.')
+ 
+-libpciaccess = shared_library(
++libpciaccess = library(
+   'pciaccess',
+   [
+     'common_bridge.c',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

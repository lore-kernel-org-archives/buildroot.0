Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F753C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C36E60B42;
	Sun,  7 Aug 2022 17:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C36E60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bf7qkbjGP8aB; Sun,  7 Aug 2022 17:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6697360B2B;
	Sun,  7 Aug 2022 17:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6697360B2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67FCF1BF96B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43CE260B2B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CE260B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJEsgQ2u71Nq for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FDBA60B26
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDBA60B26
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 998B186F9C; Sun,  7 Aug 2022 17:18:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 19:23:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efa5ff1489625eb862b1d7d161a169514cc9c881
X-Git-Newrev: fbf7d5542167c3fda8489f946ba487c0d9381f87
X-Patchwork-Hint: ignore
Message-Id: <20220807171817.998B186F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waffle: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbf7d5542167c3fda8489f946ba487c0d9381f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since bump of
wayland to version 1.20.0 in commit
f94ba5c31cf7f863e6fae996fc042a56e20118f3 thanks to
https://gitlab.freedesktop.org/mesa/waffle/-/commit/71d46212a9d23a951d5d38f0bfd1cdf1194c8c8e
and
https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_get_version'
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ../../lib/libwaffle-1.so.0.6.1: undefined reference to `wl_proxy_marshal_flags'

https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.7.0
https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.3
https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.2

Fixes:
 - http://autobuild.buildroot.org/results/1fb1540b0ae6037140f386f44d6e17735f0674c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rd-cflags-from-.pc-files-to-waffle-cflags.patch |  2 +
 ...02-wayland-fix-build-against-version-1-20.patch | 59 ++++++++++++++++++++++
 package/waffle/waffle.hash                         |  4 +-
 package/waffle/waffle.mk                           |  6 +--
 4 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
index 126aa93300..b2a1294f24 100644
--- a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
+++ b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
@@ -12,6 +12,8 @@ since CFLAGS defined by pc files are not used.
 EGL_NO_X11 is defined in CFLAGS from egl.pc.
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/111]
 ---
  src/waffle/CMakeLists.txt | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
new file mode 100644
index 0000000000..d3b66180ec
--- /dev/null
+++ b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
@@ -0,0 +1,59 @@
+From 2c33597245bb74f19104f0a858cd40e80b26991d Mon Sep 17 00:00:00 2001
+From: Philipp Zabel <p.zabel@pengutronix.de>
+Date: Fri, 17 Dec 2021 13:46:40 +0100
+Subject: [PATCH] wayland: fix build against version 1.20
+
+Wayland 1.20 introduces two new symbols wl_proxy_marshal_flags and
+wl_proxy_marshal_array_flags, which need to be wrapped as well.
+
+Closes: https://gitlab.freedesktop.org/mesa/waffle/-/issues/76
+Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
+[Retrieved from:
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/waffle/wayland/wayland_sym.h     | 18 ++++++++++++++++++
+ src/waffle/wayland/wayland_wrapper.h |  2 ++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/src/waffle/wayland/wayland_sym.h b/src/waffle/wayland/wayland_sym.h
+index 3d48625..4c6ac8d 100644
+--- a/src/waffle/wayland/wayland_sym.h
++++ b/src/waffle/wayland/wayland_sym.h
+@@ -26,3 +26,21 @@ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor,
+ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned,
+                    (struct wl_proxy *proxy, uint32_t opcode,
+                     const struct wl_interface *interface, uint32_t version, ...))
++
++WAFFLE_WAYLAND_SYM(struct wl_proxy *,
++                   wl_proxy_marshal_flags,
++                   (struct wl_proxy * p,
++                    uint32_t opcode,
++                    const struct wl_interface *interface,
++                    uint32_t version,
++                    uint32_t flags,
++                    ...))
++
++WAFFLE_WAYLAND_SYM(struct wl_proxy *,
++                   wl_proxy_marshal_array_flags,
++                   (struct wl_proxy * p,
++                    uint32_t opcode,
++                    const struct wl_interface *interface,
++                    uint32_t version,
++                    uint32_t flags,
++                    union wl_argument *args))
+diff --git a/src/waffle/wayland/wayland_wrapper.h b/src/waffle/wayland/wayland_wrapper.h
+index 4af2f64..6addf4f 100644
+--- a/src/waffle/wayland/wayland_wrapper.h
++++ b/src/waffle/wayland/wayland_wrapper.h
+@@ -65,5 +65,7 @@ struct wl_display;
+ #define wl_proxy_marshal (*wfl_wl_proxy_marshal)
+ #define wl_proxy_marshal_constructor (*wfl_wl_proxy_marshal_constructor)
+ #define wl_proxy_marshal_constructor_versioned (*wfl_wl_proxy_marshal_constructor_versioned)
++#define wl_proxy_marshal_flags (*wfl_wl_proxy_marshal_flags)
++#define wl_proxy_marshal_array_flags (*wfl_wl_proxy_marshal_array_flags)
+ 
+ #include <wayland-client-protocol.h>
+-- 
+GitLab
+
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index 84821312c1..8968dd6fd3 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,3 +1,5 @@
+# From https://gitlab.freedesktop.org/mesa/waffle/uploads/42030b1cc0f81fd738152104e1811919/waffle-1.7.0.sha256sums
+sha256  69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3  waffle-1.7.0.tar.xz
+
 # Locally calculated
-sha256  234e65bdd2dd8f7d3bc8e9ad1a7cc80fce78a1deed3a04fe7f1d2c2edac0cd8a  waffle-v1.6.1.tar.bz2
 sha256  630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 3340dc1c60..87d44c4217 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = 1.6.1
-WAFFLE_SOURCE = waffle-v$(WAFFLE_VERSION).tar.bz2
-WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$(WAFFLE_VERSION)
+WAFFLE_VERSION = 1.7.0
+WAFFLE_SOURCE = waffle-$(WAFFLE_VERSION).tar.xz
+WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/uploads/9eaadda4ec2ed1d8a26ddefd2cfd16be
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

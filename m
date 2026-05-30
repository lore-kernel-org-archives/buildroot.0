Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C3CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2320E85ECB;
	Tue,  9 Jun 2026 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_Nb5i1_j_tO; Tue,  9 Jun 2026 13:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53AAA85E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010359;
	bh=y/gFCUz7cMEAAr+dSOkM5fwkaorjAbp6FCtFr6pt/uo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lFFe0Bw2Pv6NyOndTcIQ10bMgxhx4pui2ooQYeqs+83SbZp8bh26BzesFb2WDkL1e
	 2TbK/zfPX+x/0cy1lkkSi/zt9tApRVuHoOAiFh37odY/WiNYb3FYeaGbhkPZibM1kl
	 7kFMZ6OZH2BxpnP2zLDJ1wd4l4Qaj6vpwidN59q6pcOY0i4pOhCcnZGkv/Lz1VcVU8
	 HTUtnCRKY58ElUhFTThy110RQpmBHwYVw4cmKFwZRu7lr8eISVtlai4ob4YkQo4NqU
	 018naP9UbSieRm5CtemVDOSXM0FJ3bJU6ZGqsfeWOkRl+aj5msYnFk2y5WFRUTaZ3Y
	 SZ1z8eh4dd2wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53AAA85E9F;
	Tue,  9 Jun 2026 13:05:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B842EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D16542705
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRjKvsCYVvf4 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA704426FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA704426FC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 019B887E75; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:50:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35f52c7dc55898eaf063ff5782f3e17e8b228f99
X-Git-Newrev: 72a022ec2c5be7552403d5199ec8bd01e3a64641
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.019B887E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.11.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72a022ec2c5be7552403d5199ec8bd01e3a64641
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mesonbuild.com/Release-notes-for-1-11-0.html

Removed patch which is included in this bump.

Disabled the usage of ccache in mesa3d with BR2_PACKAGE_MESA3D_RUSTICL=y
due to upstream commit:
https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
(bisected https://github.com/mesonbuild/meson/compare/1.10.1...1.10.2 to
 find the offending commit, the same defconfig works with meson 1.10.1)

Without this change mesa3d configure is broken:

output/build/mesa3d-26.0.3/src/gallium/frontends/rusticl/meson.build:420:27:
 ERROR: No build machine compiler for 'src/gallium/frontends/rusticl/proc/lib.rs'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk                           |  6 +++
 ...d-do-not-fail-if-only-the-build-machine-u.patch | 45 ----------------------
 package/meson/meson.hash                           |  4 +-
 package/meson/meson.mk                             |  2 +-
 4 files changed, 9 insertions(+), 48 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d3874766d0..eec7a925a2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -71,6 +71,12 @@ MESA3D_CONF_OPTS += \
 	-Drust_std=2021 \
 	-Dmesa-clc-bundle-headers=enabled
 
+# meson does not allow ccache
+# https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
+MESA3D_CONF_ENV += \
+	CC_FOR_BUILD="$(HOSTCC_NOCCACHE)" \
+	CXX_FOR_BUILD="$(HOSTCXX_NOCCACHE)"
+
 MESA3D_MESON_EXTRA_BINARIES += \
 	rust=['$(HOST_DIR)/bin/rustc','--target=$(RUSTC_TARGET_NAME)'] \
 	rust_ld='$(TARGET_CROSS)gcc'
diff --git a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
deleted file mode 100644
index 22f9ace42e..0000000000
--- a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c1db93be859b360b64fe20d49a286278b56df64e Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Tue, 3 Feb 2026 12:56:36 +0100
-Subject: [PATCH] ninjabackend: do not fail if only the build machine uses C++
-
-This is caused by the introduction of the cpp_importstd option; while
-target_uses_import_std() tries to protect from the option not existing,
-this does not work if cpp_importstd exists but build.cpp_importstd does
-not, and get_option_for_target() wants to look at the latter.
-
-Just return false on a KeyError for simplicity.
-
-Fixes: #15497
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream: https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- mesonbuild/backend/ninjabackend.py | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
-index 42f24d47d..e0aaa39c4 100644
---- a/mesonbuild/backend/ninjabackend.py
-+++ b/mesonbuild/backend/ninjabackend.py
-@@ -3297,11 +3297,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47485'''))
-     def target_uses_import_std(self, target: build.BuildTarget) -> bool:
-         if 'cpp' not in target.compilers:
-             return False
--        if 'cpp_importstd' not in self.environment.coredata.optstore:
--            return False
--        if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'false':
-+        try:
-+            if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'true':
-+                return True
-+        except KeyError:
-             return False
--        return True
- 
-     def handle_cpp_import_std(self, target: build.BuildTarget, compiler):
-         istd_args = []
--- 
-2.47.3
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 7ac7c8364d..b2fff8974d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
-sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.11.1
+sha256  6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866  meson-1.11.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6b2a25f1dd..0a61cc9c0b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.10.1
+MESON_VERSION = 1.11.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

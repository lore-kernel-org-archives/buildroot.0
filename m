Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1859BC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D9A8237F;
	Mon, 20 Feb 2023 22:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D9A8237F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJT9ufnq-k9D; Mon, 20 Feb 2023 22:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC3A82339;
	Mon, 20 Feb 2023 22:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC3A82339
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55031BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7179A41719
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7179A41719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qKDNM8aTYIs for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBBE41194
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBBE41194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5961686495; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:12:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ed631bc7525356c2e086a307e93df7d71d2fdde7
X-Git-Newrev: d769cfc13f6c2544f8bc5b6339d23763319a2383
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.5961686495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/modem-manager: fix
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d769cfc13f6c2544f8bc5b6339d23763319a2383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following static build failure raised since bump to version
1.20.2 in commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:

FAILED: src/ModemManager
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-manage
 r.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a sr
 c/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/autob
 uild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'

Fixes:
 - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...son-Un-hardcode-building-a-shared-library.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
new file mode 100644
index 0000000000..e99396d0d1
--- /dev/null
+++ b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
@@ -0,0 +1,54 @@
+From a9651f2390d3691dc74bcdb24b69a043fb0aacae Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Dec 2022 10:18:32 +0100
+Subject: [PATCH] meson: Un-hardcode building a shared library
+
+Use library() instead of shared_library() to allow specifying which kind
+of library to build with "meson setup --default-library ..."
+
+This will avoid the following static build failure:
+
+FAILED: src/ModemManager
+/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-manag
 er.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a s
 rc/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/auto
 build/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
+/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998@free.fr: actual backport of upstreeam commit]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ libmm-glib/meson.build | 2 +-
+ plugins/meson.build    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libmm-glib/meson.build b/libmm-glib/meson.build
+index 42f8ac61..de668dab 100644
+--- a/libmm-glib/meson.build
++++ b/libmm-glib/meson.build
+@@ -129,7 +129,7 @@ deps = [include_dep]
+ 
+ libname = 'mm-glib'
+ 
+-libmm_glib = shared_library(
++libmm_glib = library(
+   libname,
+   version: mm_glib_version,
+   sources: sources,
+diff --git a/plugins/meson.build b/plugins/meson.build
+index f849bb53..9e081beb 100644
+--- a/plugins/meson.build
++++ b/plugins/meson.build
+@@ -18,7 +18,7 @@ if enable_tests
+     libmm_test_generated_dep
+   ]
+ 
+-  libmm_test_common = shared_library(
++  libmm_test_common = library(
+     'mm-test-common',
+     sources: sources,
+     include_directories: top_inc,
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

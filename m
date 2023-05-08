Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907E0C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE8084460;
	Mon,  8 May 2023 16:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE8084460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23prC2axJNNs; Mon,  8 May 2023 16:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA6881E12;
	Mon,  8 May 2023 16:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA6881E12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77B9B1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 515D7614E6
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 515D7614E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-fETpAKvU_g for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 546CF61392
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 546CF61392
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D8186145; Mon,  8 May 2023 16:05:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 17:51:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c3ca7bea1de76163aeef432412eb14551ed0581
X-Git-Newrev: 05f9c34ad0b6bb3ef719db3df5fb44e3d6a5c2aa
X-Patchwork-Hint: ignore
Message-Id: <20230508160516.42D8186145@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: re-enable atk-bridge
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

commit: https://git.buildroot.net/buildroot/commit/?id=05f9c34ad0b6bb3ef719db3df5fb44e3d6a5c2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The at-spi2-core and at-spi2-atk were merged, and are now built by default,
so this patch is no longer required.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998@free.fr:
  - rename remaining patch,
  - update .checkpackageignore
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  3 +-
 ...-dependency-from-gtk-encode-symbolic-svg.patch} |  0
 package/libgtk3/0001-disable-atk-bridge.patch      | 41 ----------------------
 3 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 94a32e0531..3ac032400b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -772,8 +772,7 @@ package/libgpgme/0001-Fix-build-without-threads.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
 package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
 package/libgtk2/0001-reduce-dependencies.patch Upstream
-package/libgtk3/0001-disable-atk-bridge.patch Upstream
-package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch Upstream
+package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch Upstream
 package/libhdhomerun/0001-dont-strip.patch Upstream
 package/libhid/0001-dont-fiddle-with-debug-flags.patch Upstream
 package/libhid/0002-no-newline-in-ldflags.patch Upstream
diff --git a/package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
similarity index 100%
rename from package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
rename to package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
deleted file mode 100644
index f3e9bff2ba..0000000000
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Remove atk-bridge support.
-
-atk-bridge doesn't seem useful for now in Buildroot and requires to
-add two new packages just for it: at-spi2-core and at-spi2-atk.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk/a11y/gtkaccessibility.c
-+++ b/gtk/a11y/gtkaccessibility.c
-@@ -37,10 +37,6 @@
- #include <gtk/gtktogglebutton.h>
- #include <gtk/gtkaccessible.h>
-
--#ifdef GDK_WINDOWING_X11
--#include <atk-bridge.h>
--#endif
--
- static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
-                                          guint                  n_param_values,
-                                          const GValue          *param_values,
-@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
-   _gtk_accessibility_override_atk_util ();
-   do_window_event_initialization ();
-
--#ifdef GDK_WINDOWING_X11
--  atk_bridge_adaptor_init (NULL, NULL);
--#endif
--
-   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
- }
---- a/meson.build
-+++ b/meson.build
-@@ -564,7 +564,7 @@ if x11_enabled
-   xfixes_dep     = dependency('xfixes', required: false)
-   xcomposite_dep = dependency('xcomposite', required: false)
-   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
--  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
-+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
- 
-   backend_immodules += ['xim']
- 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

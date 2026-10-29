Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBCE606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o6sJnSIS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6958F605F3;
	Fri, 30 Oct 2026 14:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRW7B9A3hxIq; Fri, 30 Oct 2026 14:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5357E60B63
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369957;
	b=X4EjEtYriLTgVhfTgxK+lfCQQ/ClxJVRw+edD3/SQ3qHixoNiGY9ZuglU5CvaTEp/QW4
	 iAa0DAko8G9zzgF8tqxIT1ubNvSmyRtmH//gmBp1usGB3QWz3bWSzTLbJzGDU4SXOAEmZ
	 wkjtIZ+TOa9oyjwigYLS2SPQLOJx5tKj3nzqi8ZOGgmlswHWSvIqbSOBf3Es0ARxN/o/Y
	 XjaeLNxoj6jGr6Ccp1W0kZmxefu9Q0FtCPdLPKW3CkP3Iu1nZUE3sNK9BBLym9Bvt5SLu
	 A61Lyn1vY4urgKP0Kri5yhMTdZtsbt4PQnxxS4tqh/thXXfTjVkyGjQqOarrZuD30tA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZwfsShkLaBA0rPP6MU4lGXxg7GDqF79Vyy6YKx18atc=;
	b=R8f29Wz4NLHi14toQFYUBINqG2SWpCanndFFadOBVjD6Oqt2jhm1gb8+R3Qf/IXd6TTa
	 xYisu8slzqgW6SJnl7DwLElTrz358onYZJaa+f5clpjnnzdD/I1FMjQum6bXMD47HE8rp
	 3xDfjFhitquASInhlqs067y7ZplOOpxKOhIoUIt2an4W1DIL8Auk1mo/dIiYPAMBqahUz
	 Aywdg+8FPRjiK9U5JW/yFGnIhKjqpLCd++5IBz0V9xhBS/F0EWdG1xX4iUph6dfZEI1zJ
	 acv0ML7PeSzumwCoGVVLT4PHjj6tgoeQCbg2yVqge8R+LNnXGsbZOivn9Sv8NnFRRQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369957;
	bh=ZwfsShkLaBA0rPP6MU4lGXxg7GDqF79Vyy6YKx18atc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o6sJnSIS7KWephBnT6xi+D5Zz1mcH98mQn3y3skHLKxLK7uLsiRlmigCG4N+tx912
	 fGaYtsWxyECl3WQD+M5dox5XFQ9Ju1BDqVZ1x5UCF/1rwK9+P951SPzBLhzSizJWIh
	 cZtLhVco6PZoHSP6mUkbrr1jJVcRoFSMurBeG/pjK/u/zOZtxG99kNlkgkWpTU/Eb1
	 yTkadS/M5FkjzWB+y+PV2zXNVhJ2X7uA/N1pgMzzAJgDjXt2RLxcy7ONsB5ihM2Jv0
	 B4fwHKCLex9jAPQwvxVuuyZ30jCcA07DPtdyiAf125H1ym7fASlKCkuslCGYW5cqWE
	 M+f4wQtnv8Itw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5357E60B63;
	Fri, 30 Oct 2026 14:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E6AB362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A944052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lz6sSV5r7nul for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8719440243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=UoCRgvexpFyqOSOhbu/o94qhkYFfrdM0+KZULCXdfENR96luURiDjJnpClH5LagO0YMQ
 WSBsQNIVmKOBwAgzEkfake9QLjuqF3Nrqaog9t9rjN1uykzzqTAUhjtylyBCMJ2j3W0Ft
 PPfwUXMnYWqPGNL3FPgeXvxJYAPWeaJxCUNP7szTeDLU5AbQaJLsCQmzAIoeG4WZ9J730
 eV/vbgv/t7Abolv+QvyR2oSNKUT5Tg65m9YPTqKN0egIvtTMAffonTiL2Kay/ZdA6C8iq
 2ngctURCPRX5Zh9qd6kqeniYbTU7jXyANTbPJmHu4/bnp1A+T2p7a9ed1whrtJQNeiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XjYcD4L1VVyogq+4VEoZj5ODgicpPlbPvBpc9U0kkCM=;
 b=a5+E+tGrQQ+n6LyLOY7C47q0ZdgBKi9oNiQkiO5tUx6ujftCicUOydseBdaY5X/AZVsf
 rnWpko86DqIBECmbDBBcYmIkJZ2cCecFpSb0qVX75COh6BFLZuQsHtdhVMGVfJ5ZD50kC
 Mx+MKpbcVXMPxo+JtQR/dItU3qahgM/WDwSUNQ9VbbHOi9NEkql28N0DHTL/vAc9avGG2
 +xTzunYIg+XxIWM8nCG+CBtUySllhVlHx4sLDPLEKa6tU2BPeITickXMVZ1Kr4S4ecrG7
 oJmqsWiN/R4FUprkqIs8bmkrqh6DbW1Eip30Ppln2c7DgqPGGe19r6qLt6LVkZV2PTg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8719440243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A57209D389; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: eb1c172600938b55916d6a00378ca14e481e063e
X-Git-Newrev: 8e933f125ab79fd8a1739b68ef9d4561946bc5db
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.A57209D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libfm: fix build
 with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2809330508677122031=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2809330508677122031==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e933f125ab79fd8a1739b68ef9d4561946bc5db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The build fails with gcc 14, first with:

action.c: In function ‘fm_load_all_actions’:
action.c:2050:25: error: assignment to ‘gchar **’ {aka ‘char **’} from incompatible pointer type ‘const gchar * const*’ {aka ‘const char * const*’}
[-Wincompatible-pointer-types]
 2050 |         _tmp2_ = _tmp1_ = g_get_system_data_dirs ();
      |                         ^

This is an issue in the pre-generated C code, generated from Vala so
we cannot easily fix it. Since it's apparently used for some "old
actions" code, we simply disable it.

Then the build fails with:

gtk/fm-dnd-dest.c:461:13: error: assignment to ‘GtkMenu *’ {aka ‘struct _GtkMenu *’} from incompatible pointer type ‘GtkWidget *’ {aka ‘struct _GtkWidget *’} [-Wincompatible-pointer-types]
      |             ^

and:

base/fm-dummy-monitor.c:48:22: error: assignment to ‘gboolean (*)(GFileMonitor *)’ {aka ‘int (*)(struct _GFileMonitor *)’} from incompatible pointer type ‘gboolean (*)(void)’ {aka ‘int (*)(void)’} [-Wincompatible-pointer-types]
      |                      ^

Both of which are fixed by backporting upstream patches.

There are no autobuilder failures, but the build failure can be
reproduced using:

 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2025.08-1.tar.xz"
 BR2_TOOLCHAIN_EXTERNAL_GCC_14=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TOOLCHAIN_EXTERNAL_OPENMP=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
 BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_PCMANFM=y

With this fix, libfm builds fine up to and including gcc 16.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1e10a14ddb93674d05f8b407020a0d330abb512c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...t-gcc14-Werror-incompatible-pointer-types.patch | 61 ++++++++++++++++++++++
 ...function-argument-fix-for-C23-conformance.patch | 35 +++++++++++++
 package/libfm/libfm.mk                             |  2 +-
 3 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/package/libfm/0002-FIX-support-gcc14-Werror-incompatible-pointer-types.patch b/package/libfm/0002-FIX-support-gcc14-Werror-incompatible-pointer-types.patch
new file mode 100644
index 0000000000..1d0bd6fe59
--- /dev/null
+++ b/package/libfm/0002-FIX-support-gcc14-Werror-incompatible-pointer-types.patch
@@ -0,0 +1,61 @@
+From 212de3e1f0072931a7862dfefe2ad818f622373b Mon Sep 17 00:00:00 2001
+From: Mamoru TASAKA <mtasaka@fedoraproject.org>
+Date: Fri, 1 Mar 2024 14:19:46 +0900
+Subject: [PATCH] FIX: support gcc14 -Werror=incompatible-pointer-types
+
+gcc14 now defaults to -Werror=incompatible-pointer-types .
+To support this, cast GTK related objects for assignment
+properly.
+
+Fixes #100 .
+
+Upstream: https://github.com/lxde/libfm/commit/fbcd183335729fa3e8dd6a837c13a23ff3271000
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gtk/exo/exo-icon-view.c | 2 +-
+ src/gtk/fm-dnd-dest.c       | 2 +-
+ src/gtk/fm-standard-view.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/gtk/exo/exo-icon-view.c b/src/gtk/exo/exo-icon-view.c
+index 3ce98099..79e1c7ab 100644
+--- a/src/gtk/exo/exo-icon-view.c
++++ b/src/gtk/exo/exo-icon-view.c
+@@ -2819,7 +2819,7 @@ exo_icon_view_key_press_event (GtkWidget   *widget,
+   /* allocate a new event to forward */
+   new_event = gdk_event_copy ((GdkEvent *) event);
+   g_object_unref (G_OBJECT (new_event->key.window));
+-  new_event->key.window = g_object_ref (G_OBJECT (gtk_widget_get_window (icon_view->priv->search_entry)));
++  new_event->key.window = GDK_WINDOW(g_object_ref (G_OBJECT (gtk_widget_get_window (icon_view->priv->search_entry))));
+ 
+   /* send the event to the search entry. If the "preedit-changed" signal is
+    * emitted during this event, priv->search_imcontext_changed will be set.
+diff --git a/src/gtk/fm-dnd-dest.c b/src/gtk/fm-dnd-dest.c
+index 95d310d3..ce752758 100644
+--- a/src/gtk/fm-dnd-dest.c
++++ b/src/gtk/fm-dnd-dest.c
+@@ -458,7 +458,7 @@ static GdkDragAction _ask_action_on_drop(GtkWidget *widget,
+             gtk_action_set_sensitive(act, FALSE);
+         }
+     }
+-    ri.menu = g_object_ref(gtk_ui_manager_get_widget(ui, "/popup"));
++    ri.menu = GTK_MENU(g_object_ref(gtk_ui_manager_get_widget(ui, "/popup")));
+     g_signal_connect(ri.menu, "selection-done", G_CALLBACK(gtk_widget_destroy), NULL);
+     unmap_handler = g_signal_connect(ri.menu, "unmap",
+                                      G_CALLBACK(run_unmap_handler), &ri);
+diff --git a/src/gtk/fm-standard-view.c b/src/gtk/fm-standard-view.c
+index e0ff5a06..df920254 100644
+--- a/src/gtk/fm-standard-view.c
++++ b/src/gtk/fm-standard-view.c
+@@ -637,7 +637,7 @@ static inline void create_icon_view(FmStandardView* fv, GList* sels)
+                                 "text", FM_FOLDER_MODEL_COL_NAME );
+     if(fv->renderer_text)
+         g_object_unref(fv->renderer_text);
+-    fv->renderer_text = g_object_ref_sink(render);
++    fv->renderer_text = FM_CELL_RENDERER_TEXT(g_object_ref_sink(render));
+     exo_icon_view_set_search_column((ExoIconView*)fv->view, FM_FOLDER_MODEL_COL_NAME);
+     g_signal_connect(fv->view, "item-activated", G_CALLBACK(on_icon_view_item_activated), fv);
+     g_signal_connect(fv->view, "selection-changed", G_CALLBACK(on_sel_changed), fv);
+-- 
+2.56.0
+
diff --git a/package/libfm/0003-FIX-function-argument-fix-for-C23-conformance.patch b/package/libfm/0003-FIX-function-argument-fix-for-C23-conformance.patch
new file mode 100644
index 0000000000..254ec6c129
--- /dev/null
+++ b/package/libfm/0003-FIX-function-argument-fix-for-C23-conformance.patch
@@ -0,0 +1,35 @@
+From 9e9ea4c131fcd611ae5a91c7f6a4d9cf63043442 Mon Sep 17 00:00:00 2001
+From: Mamoru TASAKA <mtasaka@fedoraproject.org>
+Date: Tue, 14 Jan 2025 18:00:03 +0900
+Subject: [PATCH] FIX: function argument fix for C23 conformance
+
+C23 now regards function declaration without a parameter list
+as that with no parameter (i.e. having `(void)`).
+
+Specify parameter list explicitly to make code C23
+conformant.
+
+Closes #106 .
+
+Upstream: https://github.com/lxde/libfm/commit/dff442bd58b61c8afdf8cbd17f918bcaed40ddc2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/base/fm-dummy-monitor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/fm-dummy-monitor.c b/src/base/fm-dummy-monitor.c
+index 6ece1fcc..cf1bcf89 100644
+--- a/src/base/fm-dummy-monitor.c
++++ b/src/base/fm-dummy-monitor.c
+@@ -37,7 +37,7 @@
+ 
+ G_DEFINE_TYPE(FmDummyMonitor, fm_dummy_monitor, G_TYPE_FILE_MONITOR);
+ 
+-static gboolean cancel()
++static gboolean cancel(GFileMonitor *)
+ {
+     return TRUE;
+ }
+-- 
+2.56.0
+
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 419fce59d8..a8a25513e6 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -13,7 +13,7 @@ LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
 # We're patching src/modules/Makefile.am
 LIBFM_AUTORECONF = YES
-LIBFM_CONF_OPTS = --with-gtk=3
+LIBFM_CONF_OPTS = --with-gtk=3 --disable-old-actions
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
 LIBFM_CONF_OPTS += --enable-exif

--===============2809330508677122031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2809330508677122031==--

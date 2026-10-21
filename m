Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A8606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DcExIxSl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7509C403EA;
	Wed, 21 Oct 2026 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVK_i7ujfFoi; Wed, 21 Oct 2026 20:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A25A4046C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613381;
	b=QYuy+YAzTbJ8dJLifCho4yKKxc7McsRu0EMIPOX+KZ6/KRRatWblDMo6vn/aFe1WfVYp
	 kK9emciJ7Qp1MGBlZdzgnsEKnCaP7+GgheaLbvPbBeiaUKNAjztlV4T5N5XoztIVr7+VL
	 GVTtW6FIAE+0xdwZtp4qFoZo1CBDUaTNJdUnl7YK+uYPdY2I/91CTdoXaqvcCuuX/NUnP
	 NzmvHpcGRvSJjR+WGCRwBFwmM6BtyJt4WrVEumnUSQFjZyZQrb70oZMQW8XBgkDcP5Mgz
	 u+8wZijG95zhUPcJQ8taiBL/poh2lEBQCphF4Q0aJVQYppX10zoD1BW5b+n5arWjQug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sPfkWPTdbCCbrMMQjGigGVJXuX2MWzvdGWAG/yRnI0U=;
	b=S8btJ16xsZ766Htdb1sMl9hecon5gJZGRiBK/qW29TzScoyanBqYrDQISqSXK9WOHqJF
	 Mxq72akTaN70y4vChXVhzbraPU0QNMJtwJgD0zXAnfgzgLKWcnbVA91pI5GGzs4yWjfXb
	 kP1nHzslmHm2NZYkVp/JV5dWj1FcaIjGEkzzIbG1+49Kpv54kkmUXph/3MaZKv9wBDcYb
	 yRtvMPrt+blGx0oXtYcCLdk2zTdt+my/bpdDbF90/3PyDiIXqmAZTWVQ2OJX+VexNKPR3
	 grzV/vG8o/VS9Hu/sDK4uzqsyX3P+PhbIzi3XMHC8CtzVRKaf/5BwtBgEZH+Jyot7HA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613381;
	bh=sPfkWPTdbCCbrMMQjGigGVJXuX2MWzvdGWAG/yRnI0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DcExIxSlDGpjjeutfn2Ig/S2rBKcA6hvtUmUJzCJRccofxLn4l2ixkY43+oYNJjHy
	 lqH+RmP8NnXuKWam+nVro1hjdxR4jD6xP/bb428QJBlIwFUkyZafzg1lchhWrQxPLN
	 eNnt8OlxHHm4LvZ5TLkuwxQE6dHH1KnC9u5tWQ9KibeHkB2Uh2nHLq0NuNhJgG7egD
	 7fZPMX6O9R7NX8aCYjQDsuoDkEqvfhYEqMwY0jpHbe/NaBD4Bz8JUbo+OkLIg9Uh54
	 +tG6gzTCpkkyZoH94UCjHTaQl6LnZoYi83JXuQsqUgF/+znsIDp79DvkxXgvMdBnmZ
	 MZ5nuJD6y6oUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A25A4046C;
	Wed, 21 Oct 2026 20:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FC395C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A951681E61
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_Pk6hcYOmZ4 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6614581E60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613379;
 b=P0OH4bVB+VQByBBFgc7x8VESSyJPsgDU1xveqlIhcvgos0AU5Edjp9LY4ioMi+xOaPsG
 xYHbiPYitMDaS/GY1NTpcD5I8TkIMsNacyFlGH3bFC2BR+O4liyWFibCjCNseLjg5fgZg
 p8rtg8KrIlZfk02LeCsDnSpw+4fcgBtGvsc/irV0c55ecNz9OnCdlUD+b0RYcJRbsMqaI
 /C78Ql26otzDhZCqiFIANrHK/ovJg70QgprG62uyu+oMXzID3NAEXF/vmfs7Ve8e6tGdM
 F150O/2oogFEW/DJXrxZDZMan/pjsfWxaWsveonE7G65uZE9CppFaNwa18ZUSfwM5gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613379;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VwDMFmECgP+OpmB3eMn4S8nuq6fQX9RlNKbMpJ2GVGo=;
 b=G/KZlmE9JIwRTru2d9oIP5tJOJp4rieFf7JICGWQew93j5bMWk9izVA7k+8GEApdIPfe
 gRwAITuDM5tN7KYOEUf93aOCik83LplZ89y2Cvplq//uFM0Ikpxdy1H9K47QAgIznfvdF
 bj5jDLdDFntI7hRGLYZeoBg5X7uvXaMMHnQRSozS6kS+YRu2UcgH0Kxji1HmliKaODWHc
 MysHW7l/ctSMaFH+u3sgr7GoZdPVJaAH/A2JyB13e58voBONzxOTPU3Uxyq3i61RED8N6
 xcjhUmEFxLGQ68/EtgHG5Po8MssNukimoFC1bqGp5d5qL3OLghKrSqNzMC5q1gTAJXg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6614581E60
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFCF399B2F; Wed, 21 Oct 2026 20:08:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:08:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05fcd8321eb78a56d088d9efed0fe857cdf17d7e
X-Git-Newrev: 1e10a14ddb93674d05f8b407020a0d330abb512c
X-Patchwork-Hint: ignore
Message-Id: <20261021200815.AFCF399B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfm: fix build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8487737826482824759=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8487737826482824759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e10a14ddb93674d05f8b407020a0d330abb512c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============8487737826482824759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8487737826482824759==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0446C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 865768471F;
	Thu, 10 Mar 2022 11:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TinEEtzyeGGB; Thu, 10 Mar 2022 11:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C34D8438F;
	Thu, 10 Mar 2022 11:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1362C1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 025C78438F
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lMS4G4T3ewm for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:41:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1118438B
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:41:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so3195188wmb.3
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g88mZ0AaBS8szeEtuJ/ZIwuvKlczT43b7OozAzWXxvo=;
 b=bwHliLFboE1ibYFXNoajSucwvPiZZZ1VcvvP1krJP8nYRnGZxeVkcbHqWLej361IQ+
 cAhKDbPGebsN4CLL6NoxgwGPkcSuC3NJExdFeqIGIyL1J2Q7E2tE9MIofMI8G7cy5jLf
 RwQ3rbUuCUB0EKiVSVgQnUFbG11QIF1ZUBUBqCNfEUrd8WYGec4OJmfgIwTvVqsZXE6i
 VE6NJsTTKJHWM7s1d1/3gTTG24ibf15IfbmCjgGNub22Qj/huYe+ZNj/ljgDPLITs1Iw
 96ko3WaSBlV5ceJRDr1uma71OWKU7sqhq78VJR7ymbkY/+G3U4/7yf8Ja741t+NrNOJn
 NAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g88mZ0AaBS8szeEtuJ/ZIwuvKlczT43b7OozAzWXxvo=;
 b=KcEiiK9QHrRvjLqI1OjkqWaaF1oq+AjDbmGUVC51QhKeP8xWZQIZiHv0fjx9v1DEN8
 6ufgINyO0gGwqBtjyh4y0RD1ICGmAofq5Wdp6Ts8geGI9LehwdTDrBqg8ocp8lk7kXFv
 8EFHfHH9TshVSN4XjNAICng5Iwf/zbZkGC0ZSrAzQCPQiPGimNAAxdl7WNOW+UtjmH8p
 yuVmfy2nOB8aw9UYcmYumHrXcOKedK/Ds3Mk0nbVGrkuPjj0RrjagrKFvaU+SeEV2kcd
 lVAikKj9MfpBQRgFlq9v/dElCcJJTBnDJSBrcpnOrhsqOIZNfNO1Yxlwobqbvuq7SK/2
 jqVQ==
X-Gm-Message-State: AOAM530cQwzy+TRUc/j+Lnb3WwAH63mddF6gWTrB6c86qS9Kw0e+oZOA
 Hgu8H/O8R2SrEjPbuSR6lM9FQA6i5AU=
X-Google-Smtp-Source: ABdhPJyvsnWLVeX3H/SIFdlcYa65TTuJf+jzuUB2OtXzXmJDFp643Z4/dccA5N7D1RprYZhGjEtJUA==
X-Received: by 2002:a1c:ed1a:0:b0:37f:a539:5d5e with SMTP id
 l26-20020a1ced1a000000b0037fa5395d5emr11364277wmh.37.1646912490234; 
 Thu, 10 Mar 2022 03:41:30 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003842f011bc5sm8047087wmq.2.2022.03.10.03.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:41:29 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:41:22 +0100
Message-Id: <20220310114122.919781-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libglib2: bump to version 2.70.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libglib2/0002-remove-cpp-requirement.patch          | 6 +++---
 ...03-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
 ...son.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 4 ++--
 package/libglib2/libglib2.hash                              | 4 ++--
 package/libglib2/libglib2.mk                                | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index 2f9522893..b5603c92f 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.70.0',
+   version : '2.70.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
+@@ -1696,20 +1695,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2330,7 +2315,6 @@ subdir('gobject')
+@@ -2339,7 +2324,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
diff --git a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index 67aea7982..e21239301 100644
--- a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -431,6 +431,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -435,6 +435,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      # building with -Wbad-function-cast.
      '-Wno-bad-function-cast',
      '-Wno-cast-function-type',
diff --git a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index a29587bd3..db77a7320 100644
--- a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -23,7 +23,7 @@ diff --git a/gio/meson.build b/gio/meson.build
 index 29473d26b..112d4ada9 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -831,6 +831,7 @@ pkg.generate(libgio,
+@@ -841,6 +841,7 @@ pkg.generate(libgio,
    variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
@@ -35,7 +35,7 @@ diff --git a/glib/meson.build b/glib/meson.build
 index f78f32969..6c5486699 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -377,6 +377,7 @@ pkg.generate(libglib,
+@@ -384,6 +384,7 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 580be3e08..f0f0cb55a 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.70/glib-2.70.0.sha256sum
-sha256  200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742  glib-2.70.0.tar.xz
+# https://download.gnome.org/sources/glib/2.70/glib-2.70.4.sha256sum
+sha256  ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33  glib-2.70.4.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d3cba1a8b..18f5b329c 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.70
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

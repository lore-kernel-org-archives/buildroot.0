Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB52C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1EDC40B81;
	Tue, 14 Jun 2022 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPOYhMpnIFIy; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9233640B73;
	Tue, 14 Jun 2022 16:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 516EA1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DDFA417CE
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brN4xZdql-dE for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:57:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 705F041684
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:57:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y19so18371178ejq.6
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6HmY+5kYwdwgQgprRXWJTZe7YO/jCUz8mLdJ072cTWU=;
 b=R5SvExRnGIKyMPZ8/oGvxr4JjlGQNIzjVBOWiGr/aPXlQsZ188X6g7EVr4kzJEw/ui
 zzQybDPYza6l7AabLblG614jOFH0T0dMBUhzqtTqf685d9MqKBYg2h4UF2ooVVMrLmki
 KHyuq9OP0N6hG7oSYSWMUbXvFtuK4/2sHwwSDxoI0EBBZl5EBreuoe556JBugg/v/PJ+
 b+pDZuhgO1ONYp0zGGhPdkuEQtb8C1hoG53oVlkXpVh+pLE1Rjt5E2BIEEBcaIXMBFqV
 murAJYMSfTD2xWnU3PCFCcnY7WGbKFCqHc41HcHPYHOYN9dNXUK14kq/SWoqNZxlUTlL
 ZU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6HmY+5kYwdwgQgprRXWJTZe7YO/jCUz8mLdJ072cTWU=;
 b=HawjPyJZ7MgRe7MKqytlnErZl+Uz9RgM/qc7WHAI2BltILg9aqW1OknFMW/t1kq5hH
 X7i8qPp7Jbmfdt0R4uh8z07xBO4zW/+dpR36svM669WUa5GtZPuZ+RsMPYOhAd3/mGPw
 7rJHPvHMhll7AxKG2GZjq+s9Ab0Zi2LJ0lLFUGJ9jCUM8IOkReZDt9gOJHMT5OntybmE
 IxmWbRuoG3wwwA1jeO5EAjfckwAj5jkC2prFY4uKyCfUzdqCfbuEbtOa1KiExMPMeJPJ
 ox1Edy2vPhIbQG6ER1eUPtyIj/LD8hoRdy31nlBIX5XXyFxIn+Br1S2xVENAX9eUB1+A
 BOIg==
X-Gm-Message-State: AOAM532W16MIo8TQvRoCbK3IkuXfvTdfx8Azvkf6VaJuHQ4Nu5DbHFKZ
 ty3hA10/8X68TGCofi47T2b7tw==
X-Google-Smtp-Source: ABdhPJwOltnkEkWCZ4F5UOdiyDrF2tuvJQ2HafsBPdDqEcOCmTTgMyqFr3KfNdUf7bSt3qHAUp+WCQ==
X-Received: by 2002:a17:906:c347:b0:718:ca61:e7b7 with SMTP id
 ci7-20020a170906c34700b00718ca61e7b7mr5163891ejb.746.1655225843587; 
 Tue, 14 Jun 2022 09:57:23 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 eg43-20020a05640228ab00b0042db87b5ff4sm7263824edb.88.2022.06.14.09.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:57:22 -0700 (PDT)
Message-ID: <f9384ee8-107d-fdba-93b4-201e2fd1256a@mind.be>
Date: Tue, 14 Jun 2022 18:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220610213741.3849566-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610213741.3849566-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmediaart: bump to version
 1.9.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2022 23:37, Fabrice Fontaine wrote:
> - Drop all patches (already in version)
> - unit_tests option has been renamed tests:
>    https://gitlab.gnome.org/GNOME/libmediaart/-/commit/1b0be1d5bea76c1d02a7afebc431844e933ed4a8
> 
> https://gitlab.gnome.org/GNOME/libmediaart/-/blob/1.9.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-meson-add-introspection-option.patch | 87 -------------------
>   .../0002-meson-add-unit_tests-option.patch    | 48 ----------
>   ...t-meson.build-replace-shared_library.patch | 35 --------
>   package/libmediaart/libmediaart.hash          |  4 +-
>   package/libmediaart/libmediaart.mk            |  4 +-
>   5 files changed, 4 insertions(+), 174 deletions(-)
>   delete mode 100644 package/libmediaart/0001-meson-add-introspection-option.patch
>   delete mode 100644 package/libmediaart/0002-meson-add-unit_tests-option.patch
>   delete mode 100644 package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> 
> diff --git a/package/libmediaart/0001-meson-add-introspection-option.patch b/package/libmediaart/0001-meson-add-introspection-option.patch
> deleted file mode 100644
> index 2b849040fe..0000000000
> --- a/package/libmediaart/0001-meson-add-introspection-option.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From ee7d8736af172cd5ad71a0bd511c39daf401e3f6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 5 Oct 2021 23:35:26 +0200
> -Subject: [PATCH] meson: add introspection option
> -
> -Add introspection option
> -
> -Fix #3
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.gnome.org/GNOME/libmediaart/-/merge_requests/14]
> ----
> - libmediaart/meson.build | 42 +++++++++++++++++++++--------------------
> - meson_options.txt       |  2 ++
> - 2 files changed, 24 insertions(+), 20 deletions(-)
> -
> -diff --git a/libmediaart/meson.build b/libmediaart/meson.build
> -index 56e00ab..2f44e63 100644
> ---- a/libmediaart/meson.build
> -+++ b/libmediaart/meson.build
> -@@ -41,28 +41,30 @@ libmediaart = shared_library(
> -   install: true,
> - )
> -
> --gir_args = [
> --  '--quiet',
> --  '-DLIBMEDIAART_COMPILATION',
> --]
> -+if get_option('introspection')
> -+  gir_args = [
> -+    '--quiet',
> -+    '-DLIBMEDIAART_COMPILATION',
> -+  ]
> -
> --libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
> --  sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
> --  nsversion: libmediaart_api_version,
> --  namespace: 'MediaArt',
> --  identifier_prefix: 'MediaArt',
> --  symbol_prefix: 'media_art',
> --  includes: ['Gio-2.0', 'GObject-2.0'],
> --  header: 'libmediaart/mediaart.h',
> --  export_packages: 'libmediaart-' + libmediaart_api_version,
> --  extra_args: gir_args,
> --  install: true
> --)
> -+  libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
> -+    sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
> -+    nsversion: libmediaart_api_version,
> -+    namespace: 'MediaArt',
> -+    identifier_prefix: 'MediaArt',
> -+    symbol_prefix: 'media_art',
> -+    includes: ['Gio-2.0', 'GObject-2.0'],
> -+    header: 'libmediaart/mediaart.h',
> -+    export_packages: 'libmediaart-' + libmediaart_api_version,
> -+    extra_args: gir_args,
> -+    install: true
> -+  )
> -
> --libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
> --  sources: libmediaart_gir_and_typelib[0],
> --  packages: 'gio-2.0',
> --  install: true)
> -+  libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
> -+    sources: libmediaart_gir_and_typelib[0],
> -+    packages: 'gio-2.0',
> -+    install: true)
> -+endif
> -
> - libmediaart_dep = declare_dependency(
> -   link_with: libmediaart,
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 3ef49ba..b8c51b1 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -1,5 +1,7 @@
> - option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'qt5'],
> -        description: 'Which image processing backend to use')
> -+option('introspection', type : 'boolean', value : 'true',
> -+       description : 'Enable / disable the GObject-Introspection integration')
> - option('gtk_doc',
> -   type: 'boolean',
> -   value: 'false',
> ---
> -2.33.0
> -
> diff --git a/package/libmediaart/0002-meson-add-unit_tests-option.patch b/package/libmediaart/0002-meson-add-unit_tests-option.patch
> deleted file mode 100644
> index 3519ff1984..0000000000
> --- a/package/libmediaart/0002-meson-add-unit_tests-option.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 01d94777d9d1906750db0e27e2e7b8f228ae4343 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 9 Oct 2021 23:45:53 +0200
> -Subject: [PATCH] meson: add unit_tests option
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:  not sent yet (waiting feedback on first patch)]
> ----
> - meson_options.txt |  2 ++
> - tests/meson.build | 14 ++++++++------
> - 2 files changed, 10 insertions(+), 6 deletions(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index b8c51b1..1172f93 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -2,6 +2,8 @@ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'q
> -        description: 'Which image processing backend to use')
> - option('introspection', type : 'boolean', value : 'true',
> -        description : 'Enable / disable the GObject-Introspection integration')
> -+option('unit_tests', type : 'boolean', value : 'true',
> -+       description : 'Enable / disable unit tests')
> - option('gtk_doc',
> -   type: 'boolean',
> -   value: 'false',
> -diff --git a/tests/meson.build b/tests/meson.build
> -index 28834c0..02c96a1 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -1,7 +1,9 @@
> --mediaart_test = executable('mediaart-test',
> --  'mediaarttest.c',
> --  dependencies: libmediaart_dep,
> --)
> -+if get_option('unit_tests')
> -+  mediaart_test = executable('mediaart-test',
> -+    'mediaarttest.c',
> -+    dependencies: libmediaart_dep,
> -+  )
> -
> --test('mediaart', mediaart_test,
> --     env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
> -+  test('mediaart', mediaart_test,
> -+       env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
> -+endif
> ---
> -2.33.0
> -
> diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> deleted file mode 100644
> index d4b377d327..0000000000
> --- a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 12 Dec 2021 20:14:54 +0100
> -Subject: [PATCH] libmediaart/meson.build: replace shared_library
> -
> -Replace shared_library by library call to avoid the following build
> -failure when building statically:
> -
> -/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> -__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libmediaart/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libmediaart/meson.build b/libmediaart/meson.build
> -index 2f44e63..1fd3b99 100644
> ---- a/libmediaart/meson.build
> -+++ b/libmediaart/meson.build
> -@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
> -
> - libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
> -
> --libmediaart = shared_library(
> -+libmediaart = library(
> -   'mediaart-' + libmediaart_api_version,
> -   libmediaart_sources, marshal[0], marshal[1],
> -   version: libmediaart_ltversion,
> ---
> -2.33.0
> -
> diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
> index d7115b20d4..ebc914526b 100644
> --- a/package/libmediaart/libmediaart.hash
> +++ b/package/libmediaart/libmediaart.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.5.sha256sum:
> -sha256  07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6  libmediaart-1.9.5.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
> +sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
>   
>   # Locally computed:
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
> diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
> index 77665fd95b..c66fa0ccad 100644
> --- a/package/libmediaart/libmediaart.mk
> +++ b/package/libmediaart/libmediaart.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBMEDIAART_VERSION_MAJOR = 1.9
> -LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).5
> +LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
>   LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
>   LIBMEDIAART_SITE = \
>   	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
> @@ -13,7 +13,7 @@ LIBMEDIAART_LICENSE = LGPL-2.1+
>   LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
>   LIBMEDIAART_INSTALL_STAGING = YES
>   LIBMEDIAART_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
> -LIBMEDIAART_CONF_OPTS = -Dunit_tests=false
> +LIBMEDIAART_CONF_OPTS = -Dtests=false
>   LIBMEDIAART_LDFLAGS = $(TARGET_NLS_LIBS)
>   
>   ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

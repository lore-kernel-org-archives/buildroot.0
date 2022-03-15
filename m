Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143FCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAFB4053E;
	Tue, 15 Mar 2022 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pV7KVuS9eouF; Tue, 15 Mar 2022 21:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD20040573;
	Tue, 15 Mar 2022 21:49:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7B61BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 294A78143F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acel1PLa1eYG for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:49:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD3B484187
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 21:49:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id t1so532650edc.3
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xX5KM9HB3pe3TNPJIDM+PNgCD+FdgVgob8g4uHOa5pA=;
 b=FcqopHO7tTpD15z/7EHZswR+jMpAtS5boKhQkK1L8FLS3omc3Bus1QWFsmXsHZWFvM
 pKyxQeoHLJRf+r/lPGDEiZ6w7Y1lW3+v9KyBIWCGZzMt6i1M09a6c1bvli+ZTSNnRWDz
 YrybPvC/3UYQkhvckQIhkyxARSM2Bwv/EOWbidyio4vgbG+JaKSmjjQ+qKB0hSwehTWD
 FVK/QA/OcMO+7fvYqZXnQn21XWeswy1x4+tbJgKZZLoVUDubLqnaGl82WafYDDHF8mxB
 wDuaOWIXPF6QDeJhPOa7/BpovqFgbkRa4JypJAAKTOSav1Vtos1EQtrNENGj8wDbnaiE
 aRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xX5KM9HB3pe3TNPJIDM+PNgCD+FdgVgob8g4uHOa5pA=;
 b=NrUHHYH3gyAvYWHsun9WLuTQMe2Rw8LvrKehsGhHmXj3yQLs6U1UhqMdlXOQT2o4O+
 EuDISlAdkBHD5qlRJY3J/fpdM4shS1A8K1tSPEaxpycZOEqarNGvJ2+9a4rQ0zYMguuo
 BFXAgX48rJl4qfv99AHRoxcT24GE5LmuX/s89jIc2xUn0wBKv0VBH1kNJlUZkBroeWJK
 EVPOYLFy9eEli3AdYLvyipAE2Q+vu6k86FY192sHQnyreMC6YPluQrLpkh9ljP9R8k56
 7QtM8nHbIVilZCsSkPyw9pu5M5FN9ZcSDekdfRcOd+KSyHLoDjEe09n9NbG69wVZiOhO
 GAdw==
X-Gm-Message-State: AOAM531St5G0mAxsb8d2IvZ6gDbawX1eVH5Jy7iliSBkgbaW0x0mKEzh
 FiG1HeSArOuEi7ljUCGSAzVtQw1cIu5TTQ==
X-Google-Smtp-Source: ABdhPJx+exu4bcWmQCui4dBNEZxC0KErU2RZGNHdO1E28L+Nb60mD221Ya7Me+3tVJNp5fFChNMzNA==
X-Received: by 2002:a05:6402:138c:b0:413:3d99:f2d6 with SMTP id
 b12-20020a056402138c00b004133d99f2d6mr26944483edv.189.1647380949870; 
 Tue, 15 Mar 2022 14:49:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a1709062bdb00b006da975173bfsm85031ejg.170.2022.03.15.14.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:49:09 -0700 (PDT)
Message-ID: <9b06cb4d-5616-8c9e-5686-5b3f66690605@mind.be>
Date: Tue, 15 Mar 2022 22:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114122.919781-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114122.919781-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump to version 2.70.4
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



On 10/03/2022 12:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libglib2/0002-remove-cpp-requirement.patch          | 6 +++---
>   ...03-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
>   ...son.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 4 ++--
>   package/libglib2/libglib2.hash                              | 4 ++--
>   package/libglib2/libglib2.mk                                | 2 +-
>   5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> index 2f9522893..b5603c92f 100644
> --- a/package/libglib2/0002-remove-cpp-requirement.patch
> +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
>   @@ -1,4 +1,4 @@
>   -project('glib', 'c', 'cpp',
>   +project('glib', 'c',
> -   version : '2.70.0',
> +   version : '2.70.4',
>      # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>      meson_version : '>= 0.49.2',
>   @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> @@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
>    
>    cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
>    
> -@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
> +@@ -1696,20 +1695,6 @@ if g_have_iso_c_varargs
>    #endif''')
>    endif
>    
> @@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
>    g_have_gnuc_varargs = cc.compiles('''
>      void some_func (void) {
>        int a(int p1, int p2, int p3);
> -@@ -2330,7 +2315,6 @@ subdir('gobject')
> +@@ -2339,7 +2324,6 @@ subdir('gobject')
>    subdir('gthread')
>    subdir('gmodule')
>    subdir('gio')
> diff --git a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> index 67aea7982..e21239301 100644
> --- a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> +++ b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> @@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
>   index 3c615b7..7cae4e8 100644
>   --- a/meson.build
>   +++ b/meson.build
> -@@ -431,6 +431,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +@@ -435,6 +435,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
>        # building with -Wbad-function-cast.
>        '-Wno-bad-function-cast',
>        '-Wno-cast-function-type',
> diff --git a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> index a29587bd3..db77a7320 100644
> --- a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> +++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> @@ -23,7 +23,7 @@ diff --git a/gio/meson.build b/gio/meson.build
>   index 29473d26b..112d4ada9 100644
>   --- a/gio/meson.build
>   +++ b/gio/meson.build
> -@@ -831,6 +831,7 @@ pkg.generate(libgio,
> +@@ -841,6 +841,7 @@ pkg.generate(libgio,
>      variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
>                   'schemasdir=' + join_paths('${datadir}', schemas_subdir),
>                   'bindir=' + join_paths('${prefix}', get_option('bindir')),
> @@ -35,7 +35,7 @@ diff --git a/glib/meson.build b/glib/meson.build
>   index f78f32969..6c5486699 100644
>   --- a/glib/meson.build
>   +++ b/glib/meson.build
> -@@ -377,6 +377,7 @@ pkg.generate(libglib,
> +@@ -384,6 +384,7 @@ pkg.generate(libglib,
>      subdirs : ['glib-2.0'],
>      extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
>      variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 580be3e08..f0f0cb55a 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.70/glib-2.70.0.sha256sum
> -sha256  200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742  glib-2.70.0.tar.xz
> +# https://download.gnome.org/sources/glib/2.70/glib-2.70.4.sha256sum
> +sha256  ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33  glib-2.70.4.tar.xz
>   # License files, locally calculated
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index d3cba1a8b..18f5b329c 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBGLIB2_VERSION_MAJOR = 2.70
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
>   LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>   LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>   LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

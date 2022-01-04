Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF6C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EB460B6A;
	Tue,  4 Jan 2022 17:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6k7f3BVNVzO; Tue,  4 Jan 2022 17:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B01F60B94;
	Tue,  4 Jan 2022 17:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC5A81BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BCA4091E
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0EXowLavmGH for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:50:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1081408CA
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:50:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y22so151533794edq.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qHjuteUguLuqIToSzGE6yQJgLGqb+j70aZrmSkcrxQo=;
 b=UJ1xsuf5j5uM5KTVefRXTDjn11VT826/0AExfUw4UnX17o5+VYpxB/azDaOTM+zpbd
 DK39Omi0kfB0NvEbUOGYiOskQ8Ww+txpP3qeBOQqROEA6Cl9OKNjoW109ASkkqeRsUNX
 KWfMv6+3jGyAA9DLfsoQyH7SKxKn/7N2AhMHxuaI49FG2cUoTOhOCrd7+NYfYq9wKmiw
 0xnVlfSCXXY7774aMhL8I9yCUNk8FXrPcvpVV4mqTgY6CWRGtF3xCaVsaiEO9lXGAByU
 090FVu3S95+OKPFp5htvZN8ke01aMxjSDzOQO5TflqM+4Z7/GbztIbEVf90CHbMdHX4g
 nTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qHjuteUguLuqIToSzGE6yQJgLGqb+j70aZrmSkcrxQo=;
 b=XlEHgsWaobZ8muPH3m9TB4R2pLXBG38RMoLuMLNK4Q5YnzcmZxl4SUcZ4LPqBQQ7jo
 5fKuI8RRb4RryqWv/xTCGC7STtNTD1sjVyKGSKRg28+ylZfTk0KNG8MQCHx571aYaRaT
 QXgX+t2Nvqsu1B+Uli/vu4HgxA8ZT6dTGtX23y+h73PohmqSspUP2LX2JptJRzzRTqWF
 lk0no2tAc4KjSpC25AY/Q+lz/UBu0jt00DqT+5M3Stq5enCYFyZIyuTBjY1eosesa4Wn
 5o1yG2Dww4+b0rgPFkXRDkYwy9OFKa0INauIvAtvtC963lgy3KTkRUGnslD9MH5GADnd
 ffbg==
X-Gm-Message-State: AOAM533ZBL7CqzLpE2Vl/a5Y5bURyVEMPqmI0Gd76x1W0MZAcD2SBl1r
 LmWXexkPLtLO251qATRw2Lf8lQ==
X-Google-Smtp-Source: ABdhPJxNrvShnrvR5shxN2ghPwIdg/SB0ZFDr4RWtMFkk9yXtbtvWFAx4YWG9Fnjs2hRW6tiCnhOgQ==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr49822475edd.35.1641318606819; 
 Tue, 04 Jan 2022 09:50:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ne31sm11742594ejc.48.2022.01.04.09.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:50:06 -0800 (PST)
Message-ID: <94b150cd-2e70-dc09-749e-cc567bc8db30@mind.be>
Date: Tue, 4 Jan 2022 18:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101220532.2057125-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101220532.2057125-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.12.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 23:05, Fabrice Fontaine wrote:
> Drop all patches (already in version)
> 
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.12.0/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-meson-add-tests-option.patch         | 46 --------------
>   ...002-meson-add-stack_protector-option.patch | 60 -------------------
>   .../0003-meson.build-make-C-optional.patch    | 39 ------------
>   package/usbredir/usbredir.hash                |  4 +-
>   package/usbredir/usbredir.mk                  |  2 +-
>   5 files changed, 3 insertions(+), 148 deletions(-)
>   delete mode 100644 package/usbredir/0001-meson-add-tests-option.patch
>   delete mode 100644 package/usbredir/0002-meson-add-stack_protector-option.patch
>   delete mode 100644 package/usbredir/0003-meson.build-make-C-optional.patch
> 
> diff --git a/package/usbredir/0001-meson-add-tests-option.patch b/package/usbredir/0001-meson-add-tests-option.patch
> deleted file mode 100644
> index b2df1587b1..0000000000
> --- a/package/usbredir/0001-meson-add-tests-option.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 8490a7ac101d4ee0a78c44b252d3b7a6c2508c74 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 21 Aug 2021 11:55:48 +0200
> -Subject: [PATCH] meson: add tests option
> -
> -Add tests option to allow the user to disable them
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://gitlab.freedesktop.org/spice/usbredir/-/commit/8490a7ac101d4ee0a78c44b252d3b7a6c2508c74]
> ----
> - meson.build       | 4 +++-
> - meson_options.txt | 5 +++++
> - 2 files changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 6e773a7..a6d21b8 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -106,7 +106,9 @@ if host_machine.system() != 'windows'
> -         subdir('fuzzing')
> -     endif
> - endif
> --subdir('tests')
> -+if get_option('tests').enabled()
> -+    subdir('tests')
> -+endif
> - subdir('data')
> -
> - summary(summary_info, bool_yn: true)
> -diff --git a/meson_options.txt b/meson_options.txt
> -index b35732b..63e8c85 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -21,3 +21,8 @@ option('tools',
> -     type : 'feature',
> -     value : 'enabled',
> -     description : 'Build usbredir\'s tools such as usbredirect')
> -+
> -+option('tests',
> -+    type : 'feature',
> -+    value : 'enabled',
> -+    description : 'Build usbredir\'s tests such as filter')
> ---
> -GitLab
> -
> diff --git a/package/usbredir/0002-meson-add-stack_protector-option.patch b/package/usbredir/0002-meson-add-stack_protector-option.patch
> deleted file mode 100644
> index 613e2714e3..0000000000
> --- a/package/usbredir/0002-meson-add-stack_protector-option.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 54cf1897ef3aa4d0a35b5f4eb1f5c6928b033af5 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 24 Sep 2021 17:24:43 +0200
> -Subject: [PATCH] meson: add stack_protector option
> -
> -Add stack_protector option to allow the user to disable it as some
> -embedded toolchains don't support it which will result in the following
> -build failure:
> -
> -/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
> -usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/53]
> ----
> - meson.build       | 6 +++++-
> - meson_options.txt | 5 +++++
> - 2 files changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index a6d21b8..4350f53 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -17,8 +17,12 @@ cc_flags = [
> - if host_machine.system() != 'windows'
> -     cc_flags += [
> - 	'-Wp,-D_FORTIFY_SOURCE=2',
> --	'-fstack-protector',
> -     ]
> -+    if get_option('stack_protector').enabled()
> -+        cc_flags += [
> -+	    '-fstack-protector',
> -+        ]
> -+    endif
> - endif
> -
> - # Check if we are building from .git
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 63e8c85..34dd392 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -17,6 +17,11 @@ option('fuzzing-install-dir',
> -     type : 'string',
> -     description : 'Installation directory for fuzzing binaries')
> -
> -+option('stack_protector',
> -+    type : 'feature',
> -+    value : 'enabled',
> -+    description : 'Build usbredir\'s with stack-protector')
> -+
> - option('tools',
> -     type : 'feature',
> -     value : 'enabled',
> ---
> -2.33.0
> -
> diff --git a/package/usbredir/0003-meson.build-make-C-optional.patch b/package/usbredir/0003-meson.build-make-C-optional.patch
> deleted file mode 100644
> index fe1ed3f698..0000000000
> --- a/package/usbredir/0003-meson.build-make-C-optional.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 55fc307d23d657b52433d1c8508467d0589754d5 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 16 Oct 2021 15:45:57 +0200
> -Subject: [PATCH] meson.build: make C++ optional
> -
> -Remove cpp from meson project statement to make C++ optional and avoid
> -the following build failure when the toolchain does not provide a C++
> -compiler:
> -
> -../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
> -The following exception(s) were encountered:
> -Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
> -
> -Indeed C++ is only required for fuzzing which is already handled by
> -meson through add_languages('cpp', required: true)
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/55]
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 49dbce4..ca19f22 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1,4 +1,4 @@
> --project('usbredir', 'c', 'cpp',
> -+project('usbredir', 'c',
> -     version: '0.11.0',
> -     license: 'LGPLv2.1+',
> -     meson_version : '>= 0.53',
> ---
> -2.33.0
> -
> diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
> index e11d4aa720..f738c36690 100644
> --- a/package/usbredir/usbredir.hash
> +++ b/package/usbredir/usbredir.hash
> @@ -1,5 +1,5 @@
> -# https://spice-space.org/download/usbredir/usbredir-0.11.0.tar.xz.sha256sum
> -sha256  72dd5f3aa90dfbc0510b5149bb5b1654c8f21fdc405dfce7b5dc163dcff19cba  usbredir-0.11.0.tar.xz
> +# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
> +sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
>   
>   # Hash for license files
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index 0a8dbf012d..6792a3e758 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -USBREDIR_VERSION = 0.11.0
> +USBREDIR_VERSION = 0.12.0
>   USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
>   USBREDIR_SITE = http://spice-space.org/download/usbredir
>   USBREDIR_LICENSE = LGPL-2.1+ (libraries)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

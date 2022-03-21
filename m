Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6CCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E127C40A5D;
	Mon, 21 Mar 2022 21:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIgBkH3aOq7P; Mon, 21 Mar 2022 21:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C834029B;
	Mon, 21 Mar 2022 21:32:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD5B21BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33C04029B
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GM9CmRKRJrk for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67CF40126
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:32:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u26so3906892eda.12
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+WQMernO8hiLJCDleBfMKt6WUF57ip7PwMKryZaaG4U=;
 b=MGJoO6opXxwxhAKvlfCaRa7jj4MHOxtt9TuVA3qxnX8Xt2hmsoxicoHgMa2hAxi7h6
 fga3JWwX2NJaw9YxQMVtk1Auyvhzg3VeH+OQe2xho8HF2ugDNEXcLXWcBZBkFOGO+DsI
 1ezeGbT3uQ3ggpbCtTYs3CAhPlRJpqx5QnvHi6MUnHsyXnT0l+EK+DHWLUrxFXR1BhwQ
 7md1ZJ/m83G3ULz8b4RWAkxAFznyiA6ImXgCrNlpCMeTJ9vP7TP/bebcflCdmwaURe2+
 rUGwxbFh8cZzNW+0Eo9IVXbrZw1+RdcuTNK2sKgIst0MMwTBP96u8YmPdjRoOeWYNFWW
 Bi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+WQMernO8hiLJCDleBfMKt6WUF57ip7PwMKryZaaG4U=;
 b=fYex2oYzQN7HvrxrcdTL9ROJ0EWXa2/TeDVvrpCbhRNvM7gbFEoDmk3OHLGJj+3G+p
 wZx87FXfROWQSkD0Up8JTZkeDpFeu/hjf+Iv0i2I3TyYdMjXKfh9hM91hJaozkxYCemy
 p+7knz09pR8xp4Le6SA50bIHqLmM5/WksJi/NqaBIZJZLKYv1/aFh2TstIBzGTk0oJGv
 3ZyB2uarH136jFYqIzbSs7aVrh3WiNR96ZmRY1kVJRXEkzhpvunfvYooKQdJ7otCSS/d
 XUQlknOc6MKqUB8wADqNs/aLpUCvbsG0szJmwqj4IdPvg6+6ibcFm5gJyvelY0bYSEuk
 DvbQ==
X-Gm-Message-State: AOAM532gpSu1t4w5CnwYhXG4hin0OOvx1jv5bUpB6aSYpjPSnJXso+T7
 +/qxmW+2BUGQJ0Q49osm+j2bEw==
X-Google-Smtp-Source: ABdhPJzCkFaAAoclPK4QWHJrFjzqpegbYJT/Pyb3zE661Iv0/bvqmY1bs5ggZGeEoll1r207P6nyww==
X-Received: by 2002:a50:d949:0:b0:418:ecfe:8c25 with SMTP id
 u9-20020a50d949000000b00418ecfe8c25mr25078522edj.156.1647898366022; 
 Mon, 21 Mar 2022 14:32:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbcd7c9656sm7347248ejc.172.2022.03.21.14.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:32:45 -0700 (PDT)
Message-ID: <bc8efa1c-2b83-1c88-104f-bb48aa05f4b2@mind.be>
Date: Mon, 21 Mar 2022 22:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220316060219.3448648-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220316060219.3448648-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix pkg-config
 search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 16/03/2022 07:02, James Hilliard wrote:
> Currently pillow doesn't correctly search pkg-config system paths
> for some libraries which can prevent some libraries from being
> properly detected/enabled in pillow.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
>   package/python-pillow/python-pillow.mk        | 23 +++----------
>   2 files changed, 37 insertions(+), 19 deletions(-)
>   create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> 
> diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> new file mode 100644
> index 0000000000..9f979b048f
> --- /dev/null
> +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> @@ -0,0 +1,33 @@
> +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 15 Mar 2022 23:31:59 -0600
> +Subject: [PATCH] Search pkg-config system libs/cflags.
> +
> +We need to search the system paths as well from pkg-config for
> +some packages to be found properly.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/python-pillow/Pillow/pull/6138]
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 3468b260..59d65ce2 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
> + def _pkg_config(name):
> +     try:
> +         command = os.environ.get("PKG_CONFIG", "pkg-config")
> +-        command_libs = [command, "--libs-only-L", name]
> +-        command_cflags = [command, "--cflags-only-I", name]
> ++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
> ++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]

  You gave an additional explanation why this is needed in the upstream PR:

Zlib and anything that has headers in the normal system libs/include folders 
seems to not get their headers picked up without this change.

I think this issue is mostly going to be something people hit when cross 
compiling since the prefix based system libs/include folder would probably work 
in most of the usual cases(searching in sys.prefix will not work when cross 
compiling since it points to the host toolchain prefix rather than the target 
toolchain sysroot prefix):


  However, that implies that either we have to make sure that sys.prefix is set 
correctly (i.e. point it to staging instead of host), or pillow is using 
sys.prefix incorrectly.

  Before that, still, I don't understand how this can be an issue. Unless if 
pillow also passes something like -nostdinc, our toolchain wrapper should make 
sure that staging/usr/include is in the search path.

  There also doesn't seem to be an autobuilder failure due to this... But maybe 
it builds successfully, just without some optional dependency? Please provide 
more details about the failure in the commit message.



> +         if not DEBUG:
> +             command_libs.append("--silence-errors")
> +             command_cflags.append("--silence-errors")
> +--
> +2.35.1
> +
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 901876e0ee..ef677855b2 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
>   PYTHON_PILLOW_CPE_ID_VENDOR = python
>   PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>   PYTHON_PILLOW_SETUP_TYPE = setuptools
> -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
> +PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"

  This change isn't explained in the commit message, and seems unrelated.

> +
> +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing

  The need for these two changes is also not clear at all from the commit message.


  I've marked the patch as Changes Requested.

  Regards,
  Arnout

>   
>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   PYTHON_PILLOW_DEPENDENCIES += freetype
> @@ -68,22 +71,4 @@ else
>   PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
>   endif
>   
> -define PYTHON_PILLOW_BUILD_CMDS
> -	cd $(PYTHON_PILLOW_BUILDDIR); \
> -		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
> -endef
> -
> -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
> -	cd $(PYTHON_PILLOW_BUILDDIR); \
> -		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -		$(PYTHON_PILLOW_BUILD_OPTS) install \
> -		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> -		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
> -endef
> -
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644ADC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 18:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A8486128F;
	Tue, 22 Mar 2022 18:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuM_2fNrLfeK; Tue, 22 Mar 2022 18:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDDAB61286;
	Tue, 22 Mar 2022 18:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCBC31BF9B2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC7B416BF
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JXTigxsDvpT for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 18:33:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7515C408A9
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 18:33:26 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z8so20397032oix.3
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mkfojei3atPeM7uQ6NBIDty7cffhRnKtcMx5tN18UsA=;
 b=JkSg2lvUk2WxezKX9MbgpRGqD1+7L2JZ4ZYZGc7aUVug/Q45oxqCeEBx/BGAM1Qzj1
 2w59cpkGL0hYObBqOhaiKuPkZJo8D7wVrTJTQ1N0WbPdhN20hdP1s3w/fVkAeJfu628S
 tS5VkNesmzrBs8w6QASYwArIadAYla8Ordf7W84pDQ4eg4O/KVlXaGvQJEgMUUxyRIhX
 Sg1hogOMzBwzfPfox75o319KHfx4gAzYpcLa5Kyve6ZKdFVbE3w5fBjAPjy73yDuqFx2
 F+WKTbXOnF0ygnTNy4wxRhAMKS6EIWVksmKGMNRyBP1SspD3xKB/Ml54vIf7TUjqjSeu
 cjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mkfojei3atPeM7uQ6NBIDty7cffhRnKtcMx5tN18UsA=;
 b=4P+jKEzOTUieqxO9d/O2irCc9ePZHG3dvfS9BJB9om3cf30aK7glpK9RlpTUfxzFDn
 Jk6FENFW1IKPMg0AJf/OVLasP4ZZ1ij7uusx0+M/PoaT+OOOzNVvsj9ekhcV1HQLPiVB
 QJyTsqZGVTHwQ5jlDFI3dLK4qGEdHQ0RpyxaGub7y5doVHdZEtN9PnxkQKAArgk3yZBi
 WhfcrB/Cimc76C5T/sLQHWwbuzBCarEHhBopvdyNew2Ol7T+ou0JJM82xLetWBceonCN
 CMmBujk4ogedhIiX05Bm3Phg54/BVRKzFfJRl/hC+QZrxMEmApjyjFqQ6UOgNEUFzEs6
 ofcA==
X-Gm-Message-State: AOAM532Hi7PhZ7iW7KWkHLt/stser1WdRrjsmKrf6TkH4JDPV9CbTvOg
 zH0TXGP3unJcoOa2JnUgC7t7oEKI3s9F0Xa6lOo=
X-Google-Smtp-Source: ABdhPJxEl6TUfRcJ1D43RwfN5BFy1ACNj+su4snrkVtaRuyLYsm7RmSqttdlYb0Fz70uSIB5slty/rA12SbD3ng7msI=
X-Received: by 2002:a54:450e:0:b0:2ef:3c3f:f61d with SMTP id
 l14-20020a54450e000000b002ef3c3ff61dmr2854625oil.99.1647974005215; Tue, 22
 Mar 2022 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220316060219.3448648-1-james.hilliard1@gmail.com>
 <bc8efa1c-2b83-1c88-104f-bb48aa05f4b2@mind.be>
 <CADvTj4oUr8TUjbATPG=qGrxMgdg5VcMyGCCM4VpWyExV9tVs4g@mail.gmail.com>
 <CA+_SqVZp+Bw6g7MoSTgKYJXX=g4cRKJb9yxQ2QudF4r2QHpadg@mail.gmail.com>
 <CA+_SqVabJYWuLev5edD6nPFMLQUYALi4DxKGRvZQDDkedQ=TYg@mail.gmail.com>
 <CA+_SqVYy6DXFsQ26VmAwhsjGjo232fqAH=WQbnMk9cJQwg=JzQ@mail.gmail.com>
In-Reply-To: <CA+_SqVYy6DXFsQ26VmAwhsjGjo232fqAH=WQbnMk9cJQwg=JzQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Mar 2022 12:33:14 -0600
Message-ID: <CADvTj4pY0bpzVxAG702JVWwPmLsYVuH_VyeYYjUJjnYYesof9A@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
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
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Mar 21, 2022 at 5:10 PM Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
>
>
>
> On Mon, Mar 21, 2022 at 11:35 PM Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>>
>>
>>
>> On Mon, Mar 21, 2022 at 11:10 PM Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>>>
>>>
>>>
>>> On Mon, Mar 21, 2022 at 10:56 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>
>>>> On Mon, Mar 21, 2022 at 3:32 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> >
>>>> >   Hi James,
>>>> >
>>>> > On 16/03/2022 07:02, James Hilliard wrote:
>>>> > > Currently pillow doesn't correctly search pkg-config system paths
>>>> > > for some libraries which can prevent some libraries from being
>>>> > > properly detected/enabled in pillow.
>>>> > >
>>>> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>> > > ---
>>>> > >   ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
>>>> > >   package/python-pillow/python-pillow.mk        | 23 +++----------
>>>> > >   2 files changed, 37 insertions(+), 19 deletions(-)
>>>> > >   create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
>>>> > >
>>>> > > diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
>>>> > > new file mode 100644
>>>> > > index 0000000000..9f979b048f
>>>> > > --- /dev/null
>>>> > > +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
>>>> > > @@ -0,0 +1,33 @@
>>>> > > +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
>>>> > > +From: James Hilliard <james.hilliard1@gmail.com>
>>>> > > +Date: Tue, 15 Mar 2022 23:31:59 -0600
>>>> > > +Subject: [PATCH] Search pkg-config system libs/cflags.
>>>> > > +
>>>> > > +We need to search the system paths as well from pkg-config for
>>>> > > +some packages to be found properly.
>>>> > > +
>>>> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>> > > +[Upstream status:
>>>> > > +https://github.com/python-pillow/Pillow/pull/6138]
>>>> > > +---
>>>> > > + setup.py | 4 ++--
>>>> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> > > +
>>>> > > +diff --git a/setup.py b/setup.py
>>>> > > +index 3468b260..59d65ce2 100755
>>>> > > +--- a/setup.py
>>>> > > ++++ b/setup.py
>>>> > > +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
>>>> > > + def _pkg_config(name):
>>>> > > +     try:
>>>> > > +         command = os.environ.get("PKG_CONFIG", "pkg-config")
>>>> > > +-        command_libs = [command, "--libs-only-L", name]
>>>> > > +-        command_cflags = [command, "--cflags-only-I", name]
>>>> > > ++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
>>>> > > ++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
>>>> >
>>>> >   You gave an additional explanation why this is needed in the upstream PR:
>>>> >
>>>> > Zlib and anything that has headers in the normal system libs/include folders
>>>> > seems to not get their headers picked up without this change.
>>>> >
>>>> > I think this issue is mostly going to be something people hit when cross
>>>> > compiling since the prefix based system libs/include folder would probably work
>>>> > in most of the usual cases(searching in sys.prefix will not work when cross
>>>> > compiling since it points to the host toolchain prefix rather than the target
>>>> > toolchain sysroot prefix):
>>>> >
>>>> >
>>>> >   However, that implies that either we have to make sure that sys.prefix is set
>>>> > correctly (i.e. point it to staging instead of host), or pillow is using
>>>> > sys.prefix incorrectly.
>>>>
>>>> I think pillow is using sys.prefix in a way that is not really cross compilation
>>>> compatible, however using pkg-config with sysm libs/cflags seems to be
>>>> sufficient
>>>> for it to pass its non-standard header checks.
>>>
>>>
>>> I remember having added the --disable-platform-guessing exactly to overcome this problem. All the setting should be provided by buildroot. Probably, the logic behind this is slightly changed, and the mechanism doesn't work anymore. I'll try to have a look.
>>
>>
>> Yes, basically the paths leaks some host directories:
>>
>> [...]
>> Checking for include file %s in %s ('libimagequant.h', '/usr/local/include')
>> Checking for include file %s in %s ('libimagequant.h', '/usr/include')
>>
>> Looking forward for a fix.
>
>
> I came to the conclusion that James setup.py patch is necessary, pillow doesn't use sys.prefix but builds the paths from the pkg-config output. Withouth the patch, include and libraries directories are wrong.
> It misses a piece anyway
>
> +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
> +PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS) install

https://patchwork.ozlabs.org/project/buildroot/patch/20220322182952.935255-1-james.hilliard1@gmail.com/

The install part isn't needed here since it will still get passed by
_BASE_INSTALL_TARGET_CMD.

See:
https://github.com/buildroot/buildroot/blob/eaa8fcf546d84e38990566e49f4730c530d2577c/package/pkg-python.mk#L199
https://github.com/buildroot/buildroot/blob/eaa8fcf546d84e38990566e49f4730c530d2577c/package/pkg-python.mk#L285

>
> target install options should match the build ones to have a correct library installation.
>
>>
>>>
>>>>
>>>>
>>>> >
>>>> >   Before that, still, I don't understand how this can be an issue. Unless if
>>>> > pillow also passes something like -nostdinc, our toolchain wrapper should make
>>>> > sure that staging/usr/include is in the search path.
>>>>
>>>> It's due to pillow having custom header checks like this:
>>>> https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633
>>>>
>>>> >
>>>> >   There also doesn't seem to be an autobuilder failure due to this... But maybe
>>>> > it builds successfully, just without some optional dependency? Please provide
>>>> > more details about the failure in the commit message.
>>>>
>>>> The failure was getting hidden by the non-standard build/install cmd
>>>> overrides it
>>>> would appear, it seemed pillow was getting built for the host instead
>>>> of the target with
>>>> those, I didn't investigate in too much detail as those custom
>>>> build/install overrides
>>>> are not actually needed.
>>>>
>>>> >
>>>> >
>>>> >
>>>> > > +         if not DEBUG:
>>>> > > +             command_libs.append("--silence-errors")
>>>> > > +             command_cflags.append("--silence-errors")
>>>> > > +--
>>>> > > +2.35.1
>>>> > > +
>>>> > > diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
>>>> > > index 901876e0ee..ef677855b2 100644
>>>> > > --- a/package/python-pillow/python-pillow.mk
>>>> > > +++ b/package/python-pillow/python-pillow.mk
>>>> > > @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
>>>> > >   PYTHON_PILLOW_CPE_ID_VENDOR = python
>>>> > >   PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>>>> > >   PYTHON_PILLOW_SETUP_TYPE = setuptools
>>>> > > -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
>>>> > > +PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"
>>>> >
>>>> >   This change isn't explained in the commit message, and seems unrelated.
>>>> >
>>>> > > +
>>>> > > +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
>>>> > > +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
>>>> >
>>>> >   The need for these two changes is also not clear at all from the commit message.
>>>> >
>>>> >
>>>> >   I've marked the patch as Changes Requested.
>>>> >
>>>> >   Regards,
>>>> >   Arnout
>>>> >
>>>> > >
>>>> > >   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>>>> > >   PYTHON_PILLOW_DEPENDENCIES += freetype
>>>> > > @@ -68,22 +71,4 @@ else
>>>> > >   PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
>>>> > >   endif
>>>> > >
>>>> > > -define PYTHON_PILLOW_BUILD_CMDS
>>>> > > -     cd $(PYTHON_PILLOW_BUILDDIR); \
>>>> > > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>>>> > > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>>>> > > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>>>> > > -             $(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
>>>> > > -endef
>>>> > > -
>>>> > > -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
>>>> > > -     cd $(PYTHON_PILLOW_BUILDDIR); \
>>>> > > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>>>> > > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>>>> > > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>>>> > > -             $(PYTHON_PILLOW_BUILD_OPTS) install \
>>>> > > -             $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
>>>> > > -             $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
>>>> > > -endef
>>>> > > -
>>>> > >   $(eval $(python-package))
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
>>>
>>>
>>> --
>>>
>>> Angelo Compagnucci
>>>
>>> Software Engineer
>>>
>>> angelo@amarulasolutions.com
>>> __________________________________
>>> Amarula Solutions SRL
>>>
>>> Via le Canevare 30, 31100 Treviso, Veneto, IT
>>>
>>> T. +39 (0)42 243 5310
>>> info@amarulasolutions.com
>>>
>>> www.amarulasolutions.com
>>>
>>> [`as] https://www.amarulasolutions.com|
>>
>>
>>
>> --
>>
>> Angelo Compagnucci
>>
>> Software Engineer
>>
>> angelo@amarulasolutions.com
>> __________________________________
>> Amarula Solutions SRL
>>
>> Via le Canevare 30, 31100 Treviso, Veneto, IT
>>
>> T. +39 (0)42 243 5310
>> info@amarulasolutions.com
>>
>> www.amarulasolutions.com
>>
>> [`as] https://www.amarulasolutions.com|
>
>
>
> --
>
> Angelo Compagnucci
>
> Software Engineer
>
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
>
> Via le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
> [`as] https://www.amarulasolutions.com|
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2AAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F80B40B90;
	Tue, 17 May 2022 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geRGiw7w6bSF; Tue, 17 May 2022 09:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC4AF40521;
	Tue, 17 May 2022 09:27:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4A651BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 09:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1F5940882
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 09:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuk-f0AlhmC4 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 09:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8151B4032E
 for <buildroot@buildroot.org>; Tue, 17 May 2022 09:27:16 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so23443945fac.9
 for <buildroot@buildroot.org>; Tue, 17 May 2022 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndbFkVNvPF0fqDVxCA4b0AF2uNj8H2XVO8R0ZJAMh7M=;
 b=pCsebO5IoUuv19cBnIJmqpUoyGLMUtalMobKQdERXkAjhPSkqbPP0mOq0cZ/iUySa9
 tGUuRURR2eBjBLgG5brrZmtm7n0hNyaeesRPld7eI9WTPZSmdrqsTeqNFugURl7tl8wW
 hfaCNqEuR8rMmkaICxEMJc8hD//3yDy5x7WxETnnktnkR8yTiK+XnnoAsjBMuy9V3ndz
 cX52/s0i1qZMKuQJW/tveObCb+2AAk+s43ix96hb7yxA/ELKFwipEIeYyHd3JPF0vMCX
 3lQdWpkFYKpvdRfnSgoJ/zYO+7zNVpX+3pJz05M8RMb+758nuD4GOdVKCBxNPPHb/0XQ
 HR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndbFkVNvPF0fqDVxCA4b0AF2uNj8H2XVO8R0ZJAMh7M=;
 b=vQgXU332Oe5ZiepUVurKoS/sr3lnKXovoDF86p0x5rp86BNtfeo/n5WnzWYdp22H0z
 DnuI6oByPED5t31uchv9/04OdXowy2oL/uy+tiM5kdJKo6nG3L0SJOLzY8LfuWdp3NAF
 S3VLREngpxO1T03VSeKTpZgJIEA9yCJbV5+o0ge18B7QaM2yh232azD7Y+QV4wbOSkkx
 R8HUWk4DD1sjBC80nlNz9ZhLhyyxT9ZG0U9uxbQ3PSbm6QjPZX/RVcgT3g7O5itNc84N
 8+FIqbbzqdQuqQIC5HZeZhGmbgYX578Fwmo9xA8Z7vEvhAMalRukLdSwpmCAp5CbeQnp
 rHbw==
X-Gm-Message-State: AOAM533LQ1Ls7bzMSiljRosLBkUjfEwcaX9XyiEZVcY/N2MMxKkLqaWE
 s/7QIKHgftBT/0OEduIRN+6mli/049gnhjqObLs=
X-Google-Smtp-Source: ABdhPJwKO35aYt+HNFy+dqLjLN0OEGvntNepsXR9Nxdbsi5n2uGLxevtoA3NNagGH/Cx3HRW00uwmBXXugACp9HJrck=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr16977455oaa.200.1652779635395; Tue, 17
 May 2022 02:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
 <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
In-Reply-To: <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 May 2022 03:27:04 -0600
Message-ID: <CADvTj4qtBNwvZw66NPhoKRLsKkJQjqFb9tMo_4qyi-B+GThDxg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v8 5/5] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 17, 2022 at 1:35 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Hi,
>
> On 15/02/2022 02.53, James Hilliard wrote:
> > We need to use the separate package for the chromium submodule
> > which has python3 support patches.
> >
> > We also need to apply a patch to qt5webengine to allow building with
> > python3.
> >
> > Drop a patch which is now upstream.
> >
> > We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
> > from a repository archive instead of a release archive.
> >
> > We need to add some new required dependencies to qt5webengine so that
> > it will build.
> >
> > Switch libraries to system libraries instead of bundled when possible.
> >
> > Migrate unsupported WEBENGINE_CONFIG to new config flag option.
> >
> > Override feature detection using config override flags to ensure we
> > get the expected features enabled/disabled as autodetection logic
> > may otherwise disable features without throwing build errors.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I tried applying patch 1, 2, 3 and 5 (which took some effort as there
> seems to be some DOS newlines confusing patchwork) and did a test build
> for 32bit ARM:
>
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_ARM_INSTRUCTIONS_THUMB2=y
> BR2_CCACHE=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5WEBENGINE=y
>
> But that fails building v8_snapshot/gen-regexp-special-case. Notice the
> -m32 that get passed:
>
> [19941/21833] LINK v8_snapshot/gen-regexp-special-case
> FAILED: v8_snapshot/gen-regexp-special-case
> /home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/host-bin/python
> "../../3rdparty/chromium/build/toolchain/gcc_li
>
>                                  nk_wrapper.py"
> --output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie
> -Wl,--fatal-warnings -Wl,--build-id=sha1 -fP
>
>                               IC -Wl,-z,noexecstack -Wl,-z,relro
> -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -pie -Wl,--disable-new-dtags
> -Wl,-O2 -Wl,--gc-se
>
>      ctions -L/usr/lib -o "v8_snapshot/gen-regexp-special-case"
> -Wl,--start-group @"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,--
>
>                                                       end-group  -ldl
> -lpthread -lrt -licui18n -licuuc -licudata
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicui18n.a when searching for -licui18n
> /usr/bin/ld: cannot find -licui18n
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so
> when searching for -licuuc
> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.a
> when searching for -licuuc
> /usr/bin/ld: cannot find -licuuc
> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so
> when searching for -licuuc
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicudata.a when searching for -licudata
> /usr/bin/ld: cannot find -licudata
> /usr/bin/ld: skipping incompatible
> /usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
> collect2: error: ld returned 1 exit status
> [19945/21833] CXX v8_snapshot/obj/v8/v8_libsampler/sampler.o
> ninja: build stopped: subcommand failed.
> make[5]: *** [Makefile.gn_run:362: run_ninja] Error 1
> make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
> make[3]: *** [Makefile:79: sub-core-make_first] Error 2
> make[2]: *** [Makefile:49: sub-src-make_first] Error 2
> make[1]: *** [package/pkg-generic.mk:293:
> /home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/.stamp_built]
> Error 2
>
>
> Any ideas? Notice that I did NOT apply patch 4 yet.

I think patch 4 was needed for fixing some linker issues with pkg-config
resolved dependencies like icu.

>
> > ---
> > Changes v7 -> v8:
> >    - add missing BR2_PACKAGE_QT5BASE_HARFBUZZ select
> >
> > Changes v5 -> v6:
> >    - switch to python3
> >    - fix up config flags and rebase
> >
> > Changes v3 -> v4:
> >    - linker fixes
> >
> > Changes v2 -> v3:
> >    - add kconfig entries
> > ---
> >   package/qt5/qt5.mk                            |    1 -
> >   .../0002-Add-python3-build-support.patch      |  168 +++
> >   ...m-breakpad-fix-build-with-glibc-2.34.patch |   76 --
> >   package/qt5/qt5webengine/Config.in            |   14 +
> >   .../qt5/qt5webengine/host-python-wrapper.in   |    3 +
> >   package/qt5/qt5webengine/qt5webengine.hash    | 1001 +----------------
> >   package/qt5/qt5webengine/qt5webengine.mk      |  160 ++-
> >   7 files changed, 323 insertions(+), 1100 deletions(-)
> >   create mode 100644 package/qt5/qt5webengine/0002-Add-python3-build-support.patch
> >   delete mode 100644 package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
> >   create mode 100644 package/qt5/qt5webengine/host-python-wrapper.in
> --
> Bye, Peter Korsgaard
>
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

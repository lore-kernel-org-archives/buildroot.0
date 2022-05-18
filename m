Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C66C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 11:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93ED983FA6;
	Wed, 18 May 2022 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8HWLA7pKKnf; Wed, 18 May 2022 11:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D5F84060;
	Wed, 18 May 2022 11:38:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBC9D1BF364
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 11:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B8B60B1F
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 11:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOhBmcTtvCms for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 11:37:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CADE60808
 for <buildroot@buildroot.org>; Wed, 18 May 2022 11:37:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e28so1710214wra.10
 for <buildroot@buildroot.org>; Wed, 18 May 2022 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CJBz3RYkai2wmeUjoq8GXoP36KK+S+UJ/g3H/COYnyw=;
 b=LptwJRsWnRnZfE/GCSuJnOFpVGtLhGjdjeEgcby8VK7xVBJQ4luKaAdMEdofQSByow
 ctTGCKulHTq8Bg6tI5VfRJg2Bvc9/DC9hWoWitkyTVVq2bQsiFoLYQ4yeB3zOpHw6F2X
 4qi29JFvvX1SiFebVYBBIK51j0R/mYSTo6UzUrVTFaI1R73OjDIV01oNLJX/wUehGjeJ
 QGdpQefydum3pRqeOfmMQvfGsCnKEuR+UMAsIqZj2HYbb56nygNX97wG95WeeDYg7Pc8
 StC6h2rX5drZjHIXSQMpwHKwZ9ptMYZ4MaDJXCeUT5mwoyuK5sFWUsTcgaNDXUiANU4v
 HWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CJBz3RYkai2wmeUjoq8GXoP36KK+S+UJ/g3H/COYnyw=;
 b=ebfCzUKiU/tM2l/+iEZCya449n3pbotSdJIH3A3XkQ/QVCUdydDr456LVLKWk2KAvh
 rsYNUmD+6/jI7u3sFQdTCishivQIfCppoqW2ycVczz4WpOmjs72+E0Hh472bQRajOaGZ
 r9M/yfv5gjZawMkr8g0j9wf+d0JJRqWljYLzEVb9TfK1PRLTd0QB8SB8v+hDPsCY1uvI
 hP/eO8CVYUSewy+m1tFuyDA2wgJeiFSpBujVawvG6vVX1r1CAh/or0rTgwphRj2WLalq
 lkd5PmGm4bp7HwDEih9/of+X5U5dknjvn/1uZP7BB80EN5cWcS9LtGMGm9YS/UcpWOin
 FSBw==
X-Gm-Message-State: AOAM530EShvMQ5Bsf5DRwZysq0YnZ+1/XrmK6OoWfcIXqi6f58trzfm5
 MfSnvo7liBAr7gICkUDwM3B70KPdZQk4fCpylQEkP5jAwrzVB0bx
X-Google-Smtp-Source: ABdhPJys2N4qbslOfghTcEH7cOcK37ZodqijK8pJQQsVncFLu+TVZBOTk1m7Ek0lmLWzsuX4nzeMWpg6OrLbnLaKUnM=
X-Received: by 2002:a5d:480c:0:b0:20e:6133:132 with SMTP id
 l12-20020a5d480c000000b0020e61330132mr2184398wrq.593.1652873874205; Wed, 18
 May 2022 04:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:371:0:0:0:0 with HTTP; Wed, 18 May 2022 04:37:52
 -0700 (PDT)
From: Dillan Jackson <dillanjackson45@gmail.com>
Date: Wed, 18 May 2022 04:37:52 -0700
Message-ID: <CAOgdC_V2co0mr-cn+FOJGsDPd1Rq9Qfc5QqhDGdgzjgWAcZ2uQ@mail.gmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: [Buildroot] Dillan Jackson needs access please help
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
Content-Type: multipart/mixed; boundary="===============4809040800291213025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4809040800291213025==
Content-Type: multipart/alternative; boundary="000000000000216e6105df47b0af"

--000000000000216e6105df47b0af
Content-Type: text/plain; charset="UTF-8"

On Tuesday, May 17, 2022, <buildroot-request@buildroot.org> wrote:

> Send buildroot mailing list submissions to
>         buildroot@buildroot.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.buildroot.org/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
>         buildroot-request@buildroot.org
>
> You can reach the person managing the list at
>         buildroot-owner@buildroot.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>    1. Re: [PATCH 1/1] package/pinentry: add missing
>       !BR2_ARM_CPU_ARMV4 dependency (Thomas Petazzoni)
>    2. Re: [PATCH 1/1] package/gst1-imx: add missing
>       BR2_INSTALL_LIBSTDCPP dependency (Thomas Petazzoni)
>    3. [git commit] package/gcc: restrict hs4x_rel31 to arc gcc fork
>       (Yann E. MORIN)
>    4. [git commit] package/gstreamer1/gst1-imx: add missing
>       BR2_INSTALL_LIBSTDCPP dependency (Thomas Petazzoni)
>    5. Re: [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc fork
>       (Yann E. MORIN)
>    6. Re: [PATCH 1/1] boot/sun20i-d1-spl: update to latest commit
>       882671 (Peter Korsgaard)
>    7. [PATCH 1/1] package/python-flask: bump to version 2.1.2
>       (James Hilliard)
>    8. [PATCH 1/1] package/python-werkzeug: bump to version 2.1.2
>       (James Hilliard)
>    9. Re: [PATCH v1 1/1] package/xr819-xradio: enable on riscv
>       architecture (Peter Korsgaard)
>   10. [git commit] boot/sun20i-d1-spl: update to latest commit
>       882671 (Peter Korsgaard)
>   11. [git commit] package/xr819-xradio: enable on riscv
>       architecture (Peter Korsgaard)
>   12. [git commit] package/libite: bump version to v2.5.2
>       (Peter Korsgaard)
>   13. [PATCH 1/1] package/python-itsdangerous: bump to version
>       2.1.2 (James Hilliard)
>   14. [PATCH 1/1] package/python-click: bump to version 8.1.3
>       (James Hilliard)
>   15. [PATCH 1/1] package/python-flask-wtf: bump to version 1.0.1
>       (James Hilliard)
>   16. Re: [PATCH 1/1] package/ola: add missing python-numpy
>       dependencies (Thomas Petazzoni)
>   17. [PATCH 1/1] package/python-flask-sqlalchemy: bump to version
>       2.5.1 (James Hilliard)
>   18. [PATCH 1/1] package/python-flask-login: bump to version 0.6.1
>       (James Hilliard)
>   19. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Yann E. MORIN)
>   20. [git commit] fs/squashfs: needs more test cases (Yann E. MORIN)
>   21. [PATCH] package/python-service-identity: add missing
>       python-six runtime dependency (Romain Naour)
>   22. [git commit] package/alchemy: add host-pkgconf dependency
>       (Yann E. MORIN)
>   23. Re: [PATCH 1/1] package/alchemy: add host-pkgconf dependency
>       (Yann E. MORIN)
>   24. Re: selftests/sgx (Peter Seiderer)
>   25. [git commit] package/python-avro: fix capitalizations of
>       Parse (Yann E. MORIN)
>   26. Re: [PATCH] package/python-avro: fix capitalizations of Parse
>       (Yann E. MORIN)
>   27. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Linus)
>   28. Re: [PATCH 1/1] package/pango: propagate reverse dependencies
>       (Thomas Petazzoni)
>   29. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Yann E. MORIN)
>   30. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Linus)
>   31. [git commit] package/ola: add missing python-numpy
>       dependencies (Thomas Petazzoni)
>   32. [git commit] package/pango: propagate reverse dependencies
>       (Thomas Petazzoni)
>   33. [git commit] package/grpc: propagate reverse dependencies
>       (Thomas Petazzoni)
>   34. [PATCH 1/1] package/optee-client: fix build without plugins
>       (Fabrice Fontaine)
>   35. Re: [PATCH 1/1] package/grpc: propagate reverse dependencies
>       (Thomas Petazzoni)
>   36. Re: [PATCH] configs/qemu_ppc64le_powernv8: use linux kernel
>       5.17.7 and binutils 2.36.1 (Romain Naour)
>   37. [PATCH 1/4] package/python-typeguard: new package (James Hilliard)
>   38. [PATCH 2/4] package/python-mypy-extensions: new package
>       (James Hilliard)
>   39. [PATCH 3/4] package/python-typing-inspect: new package
>       (James Hilliard)
>   40. [PATCH 4/4] package/python-flask-jsonrpc: bump to version
>       2.2.1 (James Hilliard)
>   41. [PATCH 1/1] package/python-flask-expects-json: bump to
>       version 1.7.0 (James Hilliard)
>   42. Re: [PATCH 1/1] package/python-jinja2: bump to version 3.1.2
>       (James Hilliard)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 17 May 2022 21:56:33 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: James Hilliard <james.hilliard1@gmail.com>
> Cc: buildroot@buildroot.org, Alexey Brodkin
>         <Alexey.Brodkin@synopsys.com>, "Arnout Vandecappelle
> (Essensium/Mind)"
>         <arnout@mind.be>
> Subject: Re: [Buildroot] [PATCH 1/1] package/pinentry: add missing
>         !BR2_ARM_CPU_ARMV4 dependency
> Message-ID: <20220517215633.216b348e@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> Hello James,
>
> On Sat, 14 May 2022 16:42:00 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Propagate this missing BR2_PACKAGE_QT5 dependency.
> >
> > Fixes:
> > WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5
> >   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] &&
> BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_ARM_CPU_ARMV4 [=y] &&
> !BR2_STATIC_LIBS [=n]
> >   Selected by [y]:
> >   - BR2_PACKAGE_PINENTRY_QT5 [=y] && BR2_PACKAGE_PINENTRY [=y] &&
> BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] &&
> BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_arc [=n] && !BR2_STATIC_LIBS [=n]
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I have applied, but after also updating the Config.in comment with this
> new dependency:
>
> comment "pinentry-qt5 needs a host gcc >= 5.0, and a toolchain w/ wchar,
> NPTL, gcc >= 5.0, C++, dynamic library"
>         depends on !BR2_arc
>         depends on !BR2_ARM_CPU_ARMV4
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>                 !BR2_TOOLCHAIN_HAS_THREADS_NPTL ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>                 BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_5
>
> However, I noticed that the !BR2_arc dependency no longer makes sense.
> It was dropped from Qt5 in commit
> 16ffc6549465cb5d68b751f10603e8b0363bf9b0.
>
> This means that commit 16ffc6549465cb5d68b751f10603e8b0363bf9b0 did not
> properly drop this !BR2_arc dependency from reverse dependencies of
> Qt5. Reviewing this shows that package/wireshark also had a !BR2_arc
> dependency due to Qt5, which probably should be dropped.
>
> It would be good to fix that as well.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 17 May 2022 21:59:24 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: James Hilliard <james.hilliard1@gmail.com>
> Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>
> Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-imx: add missing
>         BR2_INSTALL_LIBSTDCPP dependency
> Message-ID: <20220517215924.133d18c6@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> Hello James,
>
> On Sat, 14 May 2022 16:57:32 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> > WARNING: unmet direct dependencies detected for
> BR2_PACKAGE_GST1_PLUGINS_BAD
> >   Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_INSTALL_LIBSTDCPP
> [=n]
> >   Selected by [y]:
> >   - BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC [=y] && BR2_PACKAGE_GSTREAMER1
> [=y] && BR2_PACKAGE_GST1_IMX [=y]
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> The commit title prefix should have been package/gstreamer1/gst1-imx.
>
> But more importantly, you had forgotten to add a Config.in comment
> about this C++ dependency.
>
> I've fixed both issues, and applied. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 17 May 2022 21:59:23 +0200
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/gcc: restrict hs4x_rel31 to
>         arc gcc fork
> Message-ID: <20220517194839.BC17C85F4A@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> 770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> All the ARC variants are supported by upstream gcc, except for the
> HS48 rel31 (hs4x_rel31) which is only supported by the ARC fork.
>
> Fixes:
> http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9
> 432e0c53b5
> http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153
> faca4b32c2
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/gcc/Config.in.host | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index f6b9b4fa9d..2b12035c4b 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
>         # upstream gcc. C-SKY gcc upstream support not tested
>         # with upstream binutils and glibc.
>         depends on !BR2_csky
> +       # ARC HS48 rel 31 only supported by gcc arc fork.
> +       depends on !BR2_archs4x_rel31
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>
>  config BR2_GCC_VERSION_10_X
> @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
>         # upstream gcc. C-SKY gcc upstream support not tested
>         # with upstream binutils and glibc.
>         depends on !BR2_csky
> +       # ARC HS48 rel 31 only supported by gcc arc fork.
> +       depends on !BR2_archs4x_rel31
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>
>  config BR2_GCC_VERSION_11_X
> @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
>         # that need to be reverted since gcc 8.4, 9.3 and 10.1.
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
>         depends on !BR2_sparc
> +       # ARC HS48 rel 31 only supported by gcc arc fork.
> +       depends on !BR2_archs4x_rel31
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>
>  endchoice
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 17 May 2022 22:00:38 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/gstreamer1/gst1-imx: add
>         missing BR2_INSTALL_LIBSTDCPP dependency
> Message-ID: <20220517194939.46B8385F51@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> 198244b3c31029aa16ae69e1661f1e1cd173b03f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fixes:
> WARNING: unmet direct dependencies detected for
> BR2_PACKAGE_GST1_PLUGINS_BAD
>   Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC [=y] && BR2_PACKAGE_GSTREAMER1 [=y]
> && BR2_PACKAGE_GST1_IMX [=y]
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gstreamer1/gst1-imx/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/gstreamer1/gst1-imx/Config.in
> b/package/gstreamer1/gst1-imx/Config.in
> index 41ef8548c5..bd1f8d41f2 100644
> --- a/package/gstreamer1/gst1-imx/Config.in
> +++ b/package/gstreamer1/gst1-imx/Config.in
> @@ -81,10 +81,14 @@ comment "imxvpu needs the VPU imxvpuapi library"
>
>  config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
>         bool "imxv4l2videosrc"
> +       depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
>         select BR2_PACKAGE_GST1_PLUGINS_BAD
>         help
>           Elements for V4L2 capture
>
> +comment "imxv4l2videosrc needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> +
>  config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
>         bool "imxv4l2videosink"
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 #
> V4L2_COLORSPACE_DEFAULT
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 17 May 2022 22:00:44 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot@buildroot.org, ARC Maintainers
>         <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to
>         arc gcc fork
> Message-ID: <20220517200044.GR1597494@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Romain, All,
>
> On 2022-05-15 21:36 +0200, Romain Naour spake thusly:
> > ARC hs4x_rel31 cpu is not supported by upstream gcc version.
> > Only the generic HS48 processor (BR2_archs4x) is supported
> > by upstream gcc.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9
> 432e0c53b5
> > http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153
> faca4b32c2
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: ARC Maintainers <arc-buildroot@synopsys.com>
>
> Applied to master, after rewording the commit log as we discussed on
> IRC. Thanks!
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/gcc/Config.in.host | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> > index f6b9b4fa9d..2b12035c4b 100644
> > --- a/package/gcc/Config.in.host
> > +++ b/package/gcc/Config.in.host
> > @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
> >       # upstream gcc. C-SKY gcc upstream support not tested
> >       # with upstream binutils and glibc.
> >       depends on !BR2_csky
> > +     # ARC HS48 rel 31 only supported by gcc arc fork.
> > +     depends on !BR2_archs4x_rel31
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> >
> >  config BR2_GCC_VERSION_10_X
> > @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
> >       # upstream gcc. C-SKY gcc upstream support not tested
> >       # with upstream binutils and glibc.
> >       depends on !BR2_csky
> > +     # ARC HS48 rel 31 only supported by gcc arc fork.
> > +     depends on !BR2_archs4x_rel31
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> >
> >  config BR2_GCC_VERSION_11_X
> > @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
> >       # that need to be reverted since gcc 8.4, 9.3 and 10.1.
> >       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> >       depends on !BR2_sparc
> > +     # ARC HS48 rel 31 only supported by gcc arc fork.
> > +     depends on !BR2_archs4x_rel31
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> >
> >  endchoice
> > --
> > 2.35.3
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>
>
> ------------------------------
>
> Message: 6
> Date: Tue, 17 May 2022 22:04:35 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Christian Stewart <christian@paral.in>
> Cc: buildroot@buildroot.org,  "Yann E . MORIN"
>         <yann.morin.1998@free.fr>, Thomas Petazzoni
>         <thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] [PATCH 1/1] boot/sun20i-d1-spl: update to
>         latest commit 882671
> Message-ID: <87ilq43oz0.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Signed-off-by: Christian Stewart <christian@paral.in>
>  > ---
>  >  boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
>  >  boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 7
> Date: Tue, 17 May 2022 14:09:23 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Yegor Yefremov <yegorslists@googlemail.com>, Asaf Kahlon
>         <asafka7@gmail.com>, Lionel Flandrin <lionel@svkt.org>, James
> Hilliard
>         <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
>         2.1.2
> Message-ID: <20220517200923.1516695-1-james.hilliard1@gmail.com>
>
> License hash change due to license title syntax change:
> https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e
> 06dd83a189
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask/python-flask.hash | 13 ++++++-------
>  package/python-flask/python-flask.mk   |  4 ++--
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/package/python-flask/python-flask.hash
> b/package/python-flask/python-flask.hash
> index c6ccd633f8..5f19a450a1 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,7 +1,6 @@
> -# From https://pypi.org/project/Flask/#copy-hash-modal-
> 911ffb67-fe84-4e25-a1a9-f4c745a0a980
> -md5
> <https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980-md5>
> 0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
> -sha256 4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060
> Flask-1.1.2.tar.gz
> -
> -# License files
> -sha256 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> -sha256 0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150
> docs/license.rst
> +# md5, sha256 from https://pypi.org/pypi/flask/json
> +md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
> +sha256  315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477
> Flask-2.1.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> +sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d
> docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/
> python-flask.mk
> index 077aa600b8..b684aff480 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_FLASK_VERSION = 1.1.2
> +PYTHON_FLASK_VERSION = 2.1.2
>  PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/
> cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d3/3c/
> 94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b
>  PYTHON_FLASK_SETUP_TYPE = setuptools
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 8
> Date: Tue, 17 May 2022 14:12:49 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Asaf Kahlon <asafka7@gmail.com>, Yegor Yefremov
>         <yegorslists@googlemail.com>, James Hilliard
>         <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to
>         version 2.1.2
> Message-ID: <20220517201249.1518358-1-james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-werkzeug/python-werkzeug.hash | 6 +++---
>  package/python-werkzeug/python-werkzeug.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-werkzeug/python-werkzeug.hash
> b/package/python-werkzeug/python-werkzeug.hash
> index 1d6de8a0c7..73fa6b5630 100644
> --- a/package/python-werkzeug/python-werkzeug.hash
> +++ b/package/python-werkzeug/python-werkzeug.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/werkzeug/json
> -md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
> -sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c
> Werkzeug-1.0.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
> +md5  5835c8738b8081c53367cbcc5db8784c  Werkzeug-2.1.2.tar.gz
> +sha256  1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6
> Werkzeug-2.1.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b
> LICENSE.rst
> diff --git a/package/python-werkzeug/python-werkzeug.mk
> b/package/python-werkzeug/python-werkzeug.mk
> index fe9b87af1d..9b32fdf097 100644
> --- a/package/python-werkzeug/python-werkzeug.mk
> +++ b/package/python-werkzeug/python-werkzeug.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_WERKZEUG_VERSION = 1.0.1
> +PYTHON_WERKZEUG_VERSION = 2.1.2
>  PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
> -PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/
> a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
> +PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/cf/
> 97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b
>  PYTHON_WERKZEUG_SETUP_TYPE = setuptools
>  PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
>  PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 9
> Date: Tue, 17 May 2022 22:15:11 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Christian Stewart <christian@paral.in>
> Cc: buildroot@buildroot.org,  "Yann E . MORIN"
>         <yann.morin.1998@free.fr>, Thomas Petazzoni
>         <thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] [PATCH v1 1/1] package/xr819-xradio: enable
>         on riscv architecture
> Message-ID: <87ee0r531s.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Signed-off-by: Christian Stewart <christian@paral.in>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 10
> Date: Tue, 17 May 2022 22:15:22 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] boot/sun20i-d1-spl: update to latest
>         commit 882671
> Message-ID: <20220517200442.DDCE085F72@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> d0cbd53ac4a054e94bc7f055bd4087f21a317f5e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
>  boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
> b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
> index bb2fd66c28..11d17a9a16 100644
> --- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
> +++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  3ef28affd35a37675d91d3ac50b85e3dfa356420005f69713df73c85798ff1d8
> sun20i-d1-spl-4da9c518c124d6f6123bf274e449514863df3646.tar.gz
> +sha256  08e2d0574e58c99734cd1d9ea89b86464242bf2db4f6769b23803bf9dcdac3c4
> sun20i-d1-spl-882671fcf53137aaafc3a94fa32e682cb7b921f1.tar.gz
> diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/
> sun20i-d1-spl.mk
> index 3580ea4c25..6bcea0fa96 100644
> --- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
> +++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
> @@ -5,7 +5,7 @@
>  ###########################################################
> #####################
>
>  # Commit on the 'mainline' branch
> -SUN20I_D1_SPL_VERSION = 4da9c518c124d6f6123bf274e449514863df3646
> +SUN20I_D1_SPL_VERSION = 882671fcf53137aaafc3a94fa32e682cb7b921f1
>  SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(
> SUN20I_D1_SPL_VERSION))
>  SUN20I_D1_SPL_INSTALL_TARGET = NO
>  SUN20I_D1_SPL_INSTALL_IMAGES = YES
>
>
> ------------------------------
>
> Message: 11
> Date: Tue, 17 May 2022 22:15:22 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/xr819-xradio: enable on
>         riscv architecture
> Message-ID: <20220517200442.F3B7785F77@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> e8fb79c8664234d0eb4ce73feb848a63f4d35543
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/xr819-xradio/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.
> in
> index 3d2dedf29e..b8acd71bfc 100644
> --- a/package/xr819-xradio/Config.in
> +++ b/package/xr819-xradio/Config.in
> @@ -1,7 +1,8 @@
>  config BR2_PACKAGE_XR819_XRADIO
>         bool "xr819-xradio"
>         depends on BR2_LINUX_KERNEL
> -       depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
> +       depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
> +               BR2_aarch64_be || BR2_riscv
>         help
>           Wireless driver for SDIO WiFi chip XR819
>
>
>
> ------------------------------
>
> Message: 12
> Date: Tue, 17 May 2022 22:15:22 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/libite: bump version to
>         v2.5.2
> Message-ID: <20220517200442.E8C8F85F50@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> fbd93825978e749f081d2c0bb3b3d6fb7c5324bc
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Changes:
>  - Add printf format attribute hint to all vararg functions. This will
>    help users of these functions by telling CC what to look for
>
> Fixes:
>  - Fix fisdir() segfault on GNU/Hurd
>  - Fix touch() on Debian/kFreeBSD, use creat() instead of mknod()
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libite/libite.hash | 2 +-
>  package/libite/libite.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libite/libite.hash b/package/libite/libite.hash
> index 1dec65bd6b..8b622d87a9 100644
> --- a/package/libite/libite.hash
> +++ b/package/libite/libite.hash
> @@ -1,5 +1,5 @@
>  # Upstream .sha256 from GitHub
> -sha256  5278fa0ca933727c78f4e05082cea58256d9302afac30bad0c3760cf2a18ef8f
> libite-2.5.1.tar.xz
> +sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5
> libite-2.5.2.tar.xz
>
>  # Locally calculated
>  sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f
> LICENSE
> diff --git a/package/libite/libite.mk b/package/libite/libite.mk
> index 185ffe77de..66a8253c62 100644
> --- a/package/libite/libite.mk
> +++ b/package/libite/libite.mk
> @@ -4,7 +4,7 @@
>  #
>  ###########################################################
> #####################
>
> -LIBITE_VERSION = 2.5.1
> +LIBITE_VERSION = 2.5.2
>  LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
>  LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(
> LIBITE_VERSION)
>  LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
>
>
> ------------------------------
>
> Message: 13
> Date: Tue, 17 May 2022 14:15:50 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Yegor Yefremov <yegorslists@googlemail.com>, Asaf Kahlon
>         <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to
>         version 2.1.2
> Message-ID: <20220517201550.1519884-1-james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-itsdangerous/python-itsdangerous.hash | 4 ++--
>  package/python-itsdangerous/python-itsdangerous.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-itsdangerous/python-itsdangerous.hash
> b/package/python-itsdangerous/python-itsdangerous.hash
> index dad4ec0800..071544e5bd 100644
> --- a/package/python-itsdangerous/python-itsdangerous.hash
> +++ b/package/python-itsdangerous/python-itsdangerous.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
> -md5  996b9763d1b4bd0edd6eb86f0a490629  itsdangerous-2.0.1.tar.gz
> -sha256  9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0
> itsdangerous-2.0.1.tar.gz
> +md5  c1bc730ddf53b8374eaa823f24eb6438  itsdangerous-2.1.2.tar.gz
> +sha256  5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a
> itsdangerous-2.1.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7
> LICENSE.rst
>  sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4
> docs/license.rst
> diff --git a/package/python-itsdangerous/python-itsdangerous.mk
> b/package/python-itsdangerous/python-itsdangerous.mk
> index c53bc6b9ba..d7a1344e0a 100644
> --- a/package/python-itsdangerous/python-itsdangerous.mk
> +++ b/package/python-itsdangerous/python-itsdangerous.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_ITSDANGEROUS_VERSION = 2.0.1
> +PYTHON_ITSDANGEROUS_VERSION = 2.1.2
>  PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_
> ITSDANGEROUS_VERSION).tar.gz
> -PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/58/66/
> d6c5859dcac92b442626427a8c7a42322068c5cd5d4a463ce78b93f730b7
> +PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/7f/a1/
> d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08
>  PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
>  PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
>  PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 14
> Date: Tue, 17 May 2022 14:19:16 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Yegor Yefremov <yegorslists@googlemail.com>, Mauro Condarelli
>         <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>, James
> Hilliard
>         <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version
>         8.1.3
> Message-ID: <20220517201916.1521398-1-james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-click/python-click.hash | 6 +++---
>  package/python-click/python-click.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-click/python-click.hash
> b/package/python-click/python-click.hash
> index fb6e457ad5..81d19c419e 100644
> --- a/package/python-click/python-click.hash
> +++ b/package/python-click/python-click.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/click/json
> -md5  53692f62cb99a1a10c59248f1776d9c0  click-7.1.2.tar.gz
> -sha256  d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a
> click-7.1.2.tar.gz
> -# Locally computed sha256
> +md5  a804b085de7a3ff96968e38e0f6f2e05  click-8.1.3.tar.gz
> +sha256  7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e
> click-8.1.3.tar.gz
> +# Locally computed sha256 checksums
>  sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d
> LICENSE.rst
> diff --git a/package/python-click/python-click.mk b/package/python-click/
> python-click.mk
> index a829257f5e..6444d0148e 100644
> --- a/package/python-click/python-click.mk
> +++ b/package/python-click/python-click.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_CLICK_VERSION = 7.1.2
> +PYTHON_CLICK_VERSION = 8.1.3
>  PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
> -PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/27/6f/
> be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e
> +PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/59/87/
> 84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8
>  PYTHON_CLICK_LICENSE = BSD-3-Clause
>  PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
>  PYTHON_CLICK_SETUP_TYPE = setuptools
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 15
> Date: Tue, 17 May 2022 14:24:22 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Yegor Yefremov <yegorslists@googlemail.com>, Peter Seiderer
>         <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>, James
> Hilliard
>         <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to
>         version 1.0.1
> Message-ID: <20220517202422.1522574-1-james.hilliard1@gmail.com>
>
> License moved and hash changed due to rename and removal of authors:
> https://github.com/wtforms/flask-wtf/commit/d37c22b42202ccf4c8f96c445ceafe
> 72c4c5ed46
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-wtf/python-flask-wtf.hash | 6 +++---
>  package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/python-flask-wtf/python-flask-wtf.hash
> b/package/python-flask-wtf/python-flask-wtf.hash
> index 848d6d7783..01e4290950 100644
> --- a/package/python-flask-wtf/python-flask-wtf.hash
> +++ b/package/python-flask-wtf/python-flask-wtf.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
> -md5  920a5a476ecfb751952b5048cc05fcf8  Flask-WTF-0.15.1.tar.gz
> -sha256  ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc
> Flask-WTF-0.15.1.tar.gz
> +md5  d86dbc0befe30fd577a623a51689b900  Flask-WTF-1.0.1.tar.gz
> +sha256  34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9
> Flask-WTF-1.0.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350
> LICENSE
> +sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62
> LICENSE.rst
> diff --git a/package/python-flask-wtf/python-flask-wtf.mk
> b/package/python-flask-wtf/python-flask-wtf.mk
> index e2078103f5..97291e1b26 100644
> --- a/package/python-flask-wtf/python-flask-wtf.mk
> +++ b/package/python-flask-wtf/python-flask-wtf.mk
> @@ -4,11 +4,11 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_FLASK_WTF_VERSION = 0.15.1
> +PYTHON_FLASK_WTF_VERSION = 1.0.1
>  PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
> -PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9c/b5/
> 4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3
> +PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/d9/38/
> d4798dd05be711d666e1befb08b1d3db57bd146d1a14d15657f60c88b446
>  PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
> -PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
> +PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
>  PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
>
>  $(eval $(python-package))
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 16
> Date: Tue, 17 May 2022 22:27:38 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: James Hilliard <james.hilliard1@gmail.com>
> Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
> Subject: Re: [Buildroot] [PATCH 1/1] package/ola: add missing
>         python-numpy dependencies
> Message-ID: <20220517222738.532f7bab@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> On Sat, 14 May 2022 16:34:08 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> > WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
> >   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] &&
> BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC
> [=n] || BR2_TOOLCHAIN_USES_MUSL [=n])
> >   Selected by [y]:
> >   - BR2_PACKAGE_OLA_RDM_TESTS [=y] && BR2_PACKAGE_OLA [=y] &&
> BR2_PACKAGE_OLA_PYTHON_BINDINGS [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> [=y]
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/ola/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied to master after adding the appropriate Config.in comment about
> this dependency.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 17
> Date: Tue, 17 May 2022 14:28:05 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: Yegor Yefremov <yegorslists@googlemail.com>, Asaf Kahlon
>         <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump
>         to version 2.5.1
> Message-ID: <20220517202805.1524501-1-james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash    | 6 +++---
>  package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk  | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> index f1fe9775f5..4c2a701eb3 100644
> --- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> +++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
> -md5    1f5781cf3e1a2b1aabda47a5b20d2073  Flask-SQLAlchemy-2.4.1.tar.gz
> -sha256 6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d
> Flask-SQLAlchemy-2.4.1.tar.gz
> +md5  dcb6b62248ced71dab183f2cb2778583  Flask-SQLAlchemy-2.5.1.tar.gz
> +sha256  2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912
> Flask-SQLAlchemy-2.5.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> +sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> index c6d0094b41..b1d00ad6c0 100644
> --- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> +++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_FLASK_SQLALCHEMY_VERSION = 2.4.1
> +PYTHON_FLASK_SQLALCHEMY_VERSION = 2.5.1
>  PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_
> FLASK_SQLALCHEMY_VERSION).tar.gz
> -PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.
> org/packages/52/7a/35bacbedafdc652d5198b80eb22eac
> ccae0c97a49740a45da828b05cc37b
> +PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.
> org/packages/35/f0/39dd2d8e7e5223f78a5206d7020dc0
> e16718a964acfb3564d89e9798ab9b
>  PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
>  PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 18
> Date: Tue, 17 May 2022 14:32:35 -0600
> From: James Hilliard <james.hilliard1@gmail.com>
> To: buildroot@buildroot.org
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>, Asaf
>         Kahlon <asafka7@gmail.com>, Yegor Yefremov
>         <yegorslists@googlemail.com>, James Hilliard
>         <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to
>         version 0.6.1
> Message-ID: <20220517203235.1525998-1-james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-login/python-flask-login.hash | 9 ++++-----
>  package/python-flask-login/python-flask-login.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/package/python-flask-login/python-flask-login.hash
> b/package/python-flask-login/python-flask-login.hash
> index 9ff1f82a09..d11e37cce8 100644
> --- a/package/python-flask-login/python-flask-login.hash
> +++ b/package/python-flask-login/python-flask-login.hash
> @@ -1,6 +1,5 @@
> -# From https://pypi.org/project/Flask-Login/#copy-hash-modal-
> 8bb2ac58-b80a-4793-84d4-4f32b92976d9
> -md5
> <https://pypi.org/project/Flask-Login/#copy-hash-modal-8bb2ac58-b80a-4793-84d4-4f32b92976d9-md5>
> a2d94aa6ae935345ebc68eb3cbb5fccd  Flask-Login-0.5.0.tar.gz
> -sha256  6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b
> Flask-Login-0.5.0.tar.gz
> -
> -# License files
> +# md5, sha256 from https://pypi.org/pypi/flask-login/json
> +md5  0a1576eab473c2a8bb576348333d5ef5  Flask-Login-0.6.1.tar.gz
> +sha256  1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c
> Flask-Login-0.6.1.tar.gz
> +# Locally computed sha256 checksums
>  sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b
> LICENSE
> diff --git a/package/python-flask-login/python-flask-login.mk
> b/package/python-flask-login/python-flask-login.mk
> index efb63b262b..9a11fde542 100644
> --- a/package/python-flask-login/python-flask-login.mk
> +++ b/package/python-flask-login/python-flask-login.mk
> @@ -4,9 +4,9 @@
>  #
>  ###########################################################
> #####################
>
> -PYTHON_FLASK_LOGIN_VERSION = 0.5.0
> +PYTHON_FLASK_LOGIN_VERSION = 0.6.1
>  PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_
> LOGIN_VERSION).tar.gz
> -PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/f9/01/
> f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d
> +PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/3c/0a/
> e376d599eb6a8999b803a8d390e32451e43a346dbe540350dad48be0069c
>  PYTHON_FLASK_LOGIN_LICENSE = MIT
>  PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
>  PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 19
> Date: Tue, 17 May 2022 22:40:27 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Linus Kaschulla <linus@cosmos-ink.net>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test
>         cases
> Message-ID: <20220517204027.GS1597494@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Linus, All,
>
> On 2022-05-17 14:19 +0000, Linus Kaschulla via buildroot spake thusly:
> > For the new patch, adding block size options (commit 555f8dfd),
> > Yann E. MORIN requested updated testcases that specifically ensure
> > the extreme blocksizes (4K and 1024K) don't cause issues.
> >
> > This patch splits the current test case in 2, testing with both
> > block sizes and ensuring the block size was applied in the same
> > fashion as for the specified compression.
> >
> > Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> > ---
> >  support/testing/tests/fs/test_squashfs.py | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/support/testing/tests/fs/test_squashfs.py
> b/support/testing/tests/fs/test_squashfs.py
> > index a914f5aac7..07239fcce2 100644
> > --- a/support/testing/tests/fs/test_squashfs.py
> > +++ b/support/testing/tests/fs/test_squashfs.py
> > @@ -3,13 +3,15 @@ import os
> >  import infra.basetest
> >
> >
> > -class TestSquashfs(infra.basetest.BRTest):
> > +class TestSquashfsMinBlocksize(infra.basetest.BRTest):
>
> In fact I think we need to keep the existing test that uses the default
> value too.
>
> >      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> >          """
> >          BR2_TARGET_ROOTFS_SQUASHFS=y
> > +        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
> >          BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> >          # BR2_TARGET_ROOTFS_TAR is not set
> >          """
> > +    expected_blocksize_in_bytes = 1024 * 4
> >
> >      def test_run(self):
> >          unsquashfs_cmd = ["host/bin/unsquashfs", "-s",
> "images/rootfs.squashfs"]
> > @@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.BRTest):
> >          self.assertEqual(out[0],
> >                           "Found a valid SQUASHFS 4:0 superblock on
> images/rootfs.squashfs.")
> >          self.assertEqual(out[3], "Compression lzo")
> > +        self.assertEqual(out[4], "Block size {}".format(self.expected_
> blocksize_in_bytes))
> >
> >          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> >          infra.img_round_power2(img)
> > @@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.BRTest):
> >
> >          cmd = "mount | grep '/dev/root on / type squashfs'"
> >          self.assertRunOk(cmd)
> > +
>
>     $ make check-flake8
>     WARNING: support/testing/tests/fs/test_squashfs.py:40:1: E302
> expected 2 blank lines, found 1
>
> Yes, like check-package, this is 100% totally undocumented. :-]
>
> So, I've restored the original test that checks the default, and two new
> tersts that check the min and max, and I fixed the flake8 issue.
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > +# Reusing TestSquashfsMinBlocksize's test_run(), but change
> > +# blocksize in config the maxium to ensure all extemes work.
> > +class TestSquashfsMaxBlocksize(TestSquashfsMinBlocksize):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        BR2_TARGET_ROOTFS_SQUASHFS=y
> > +        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
> > +        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        """
> > +    expected_blocksize_in_bytes = 1024 * 1024
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>
>
> ------------------------------
>
> Message: 20
> Date: Tue, 17 May 2022 22:40:45 +0200
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] fs/squashfs: needs more test cases
> Message-ID: <20220517202947.81E3985F81@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> 001e0aab23c832579b6a5c046db8f5b0716cea61
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> For the new patch, adding block size options (commit 555f8dfd),
> Yann E. MORIN requested updated testcases that specifically ensure
> the extreme blocksizes (4K and 1024K) don't cause issues.
>
> This patch splits the current test case in 2, testing with both
> block sizes and ensuring the block size was applied in the same
> fashion as for the specified compression.
>
> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> [yann.morin.1998@free.fr: keep exisitng test with default size]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/testing/tests/fs/test_squashfs.py | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/support/testing/tests/fs/test_squashfs.py
> b/support/testing/tests/fs/test_squashfs.py
> index a914f5aac7..0ceb4cab58 100644
> --- a/support/testing/tests/fs/test_squashfs.py
> +++ b/support/testing/tests/fs/test_squashfs.py
> @@ -10,6 +10,7 @@ class TestSquashfs(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
> +    expected_blocksize_in_bytes = 128*1024
>
>      def test_run(self):
>          unsquashfs_cmd = ["host/bin/unsquashfs", "-s",
> "images/rootfs.squashfs"]
> @@ -18,6 +19,7 @@ class TestSquashfs(infra.basetest.BRTest):
>          self.assertEqual(out[0],
>                           "Found a valid SQUASHFS 4:0 superblock on
> images/rootfs.squashfs.")
>          self.assertEqual(out[3], "Compression lzo")
> +        self.assertEqual(out[4], "Block size {}".format(self.expected_
> blocksize_in_bytes))
>
>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
>          infra.img_round_power2(img)
> @@ -31,3 +33,25 @@ class TestSquashfs(infra.basetest.BRTest):
>
>          cmd = "mount | grep '/dev/root on / type squashfs'"
>          self.assertRunOk(cmd)
> +
> +
> +class TestSquashfsMinBlocksize(TestSquashfs):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_SQUASHFS=y
> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
> +        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    expected_blocksize_in_bytes = 4*1024
> +
> +
> +class TestSquashfsMaxBlocksize(TestSquashfs):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_SQUASHFS=y
> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
> +        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    expected_blocksize_in_bytes = 1024*1024
>
>
> ------------------------------
>
> Message: 21
> Date: Tue, 17 May 2022 22:43:17 +0200
> From: Romain Naour <romain.naour@gmail.com>
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@gmail.com>
> Subject: [Buildroot] [PATCH] package/python-service-identity: add
>         missing python-six runtime dependency
> Message-ID: <20220517204317.198644-1-romain.naour@gmail.com>
>
> python-service-identity 21.1.0 release requires python-six at runtime [1].
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841098
>
> [1] https://github.com/pyca/service-identity/commit/
> 705f4af829adf4d1b6e44250d8039635a73199d5
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/python-service-identity/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-service-identity/Config.in
> b/package/python-service-identity/Config.in
> index d6ca060562..09ebd97a65 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>         select BR2_PACKAGE_PYTHON_PYASN1 # runtime
>         select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
>         select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
>         help
>           Service identity verification for pyOpenSSL.
>
> --
> 2.35.3
>
>
>
> ------------------------------
>
> Message: 22
> Date: Tue, 17 May 2022 22:44:06 +0200
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/alchemy: add host-pkgconf
>         dependency
> Message-ID: <20220517203344.59DCD85F8A@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> 837e3128687a1c892ff796b80b26edc4b1186d73
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> host-pkgconf is a mandatory dependency since the addition of the package
> in commit 7f1f3f87868fa333833dbba9f4f07adc338b34ed resulting in the
> following ulog build failure:
>
> /home/buildroot/autobuild/run/instance-0/output-1/per-
> package/ulog/host/opt/alchemy/check.mk:36: *** 'pkg-config' is required.
> Stop.
>
> An other option would be to set TARGET_OS to baremetal but it could have
> unexpected side-effects such as removing -fPIC for arm targets
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c731fe0e9bdbfce0823f9c48641f1e
> d710fa6125
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/alchemy/alchemy.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
> index 18cdd0a645..10d1068ac4 100644
> --- a/package/alchemy/alchemy.mk
> +++ b/package/alchemy/alchemy.mk
> @@ -8,7 +8,7 @@ ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de7adaaecfbc
>  ALCHEMY_SITE = $(call github,Parrot-Developers,
> alchemy,$(ALCHEMY_VERSION))
>  ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
>  ALCHEMY_LICENSE_FILES = COPYING README
> -HOST_ALCHEMY_DEPENDENCIES = host-python3
> +HOST_ALCHEMY_DEPENDENCIES = host-pkgconf host-python3
>
>  ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
>  ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
> @@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV = \
>         ALCHEMY_HOME=$(ALCHEMY_HOME) \
>         ALCHEMY_WORKSPACE_DIR="$(@D)" \
>         ALCHEMY_TARGET_OUT=alchemy-out \
> +       PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
>         TARGET_OS=linux \
>         TARGET_OS_FLAVOUR=buildroot \
>         TARGET_CROSS="$(TARGET_CROSS)" \
>
>
> ------------------------------
>
> Message: 23
> Date: Tue, 17 May 2022 22:45:48 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: buildroot@buildroot.org, Herv? Codina <herve.codina@bootlin.com>
> Subject: Re: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf
>         dependency
> Message-ID: <20220517204548.GT1597494@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Fabrice, All,
>
> On 2022-05-13 22:28 +0200, Fabrice Fontaine spake thusly:
> > host-pkgconf is a mandatory dependency since the addition of the package
> > in commit 7f1f3f87868fa333833dbba9f4f07adc338b34ed resulting in the
> > following ulog build failure:
> >
> > /home/buildroot/autobuild/run/instance-0/output-1/per-
> package/ulog/host/opt/alchemy/check.mk:36: *** 'pkg-config' is required.
> Stop.
> >
> > An other option would be to set TARGET_OS to baremetal but it could have
> > unexpected side-effects such as removing -fPIC for arm targets
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c731fe0e9bdbfce0823f9c48641f1e
> d710fa6125
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/alchemy/alchemy.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
> > index 18cdd0a645..10d1068ac4 100644
> > --- a/package/alchemy/alchemy.mk
> > +++ b/package/alchemy/alchemy.mk
> > @@ -8,7 +8,7 @@ ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de
> 7adaaecfbc
> >  ALCHEMY_SITE = $(call github,Parrot-Developers,
> alchemy,$(ALCHEMY_VERSION))
> >  ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
> >  ALCHEMY_LICENSE_FILES = COPYING README
> > -HOST_ALCHEMY_DEPENDENCIES = host-python3
> > +HOST_ALCHEMY_DEPENDENCIES = host-pkgconf host-python3
> >
> >  ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
> >  ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
> > @@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV = \
> >       ALCHEMY_HOME=$(ALCHEMY_HOME) \
> >       ALCHEMY_WORKSPACE_DIR="$(@D)" \
> >       ALCHEMY_TARGET_OUT=alchemy-out \
> > +     PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
> >       TARGET_OS=linux \
> >       TARGET_OS_FLAVOUR=buildroot \
> >       TARGET_CROSS="$(TARGET_CROSS)" \
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>
>
> ------------------------------
>
> Message: 24
> Date: Tue, 17 May 2022 22:48:09 +0200
> From: Peter Seiderer <ps.report@gmx.net>
> To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] selftests/sgx
> Message-ID: <20220517224809.21f77949@gmx.net>
> Content-Type: text/plain; charset=UTF-8
>
> Hello Jarkko,
>
> On Tue, 17 May 2022 20:06:51 +0300, Jarkko Sakkinen <
> jarkko.sakkinen@iki.fi> wrote:
>
> > On Sun, 2022-05-08 at 23:38 +0200, Peter Seiderer wrote:
> > > Hello Jarkko,
> > >
> > > On Sat, 07 May 2022 23:03:57 +0300, Jarkko Sakkinen <
> jarkko.sakkinen@iki.fi> wrote:
> > >
> > > > Hi,
> > > >
> > > > When specifying "BR2_PACKAGE_LINUX_TOOLS_SELFTESTS=y", for some
> reason
> > > > tools/testing/selftests/sgx/ build results, i.e. "sgx:test_sgx", does
> > > > not get included to the rootfs image, nor is it listed in?
> > > > kselftest-list.txt.
> > > >
> > > > If I manually compile and install selftests, it does get included.
> Any
> > > > ideas what could be wrong?
> > >
> > > For which architecture do you (cross) compile (what is your target
> architecture)?
> > >
> > > According to e.g. [1]:
> > >
> > > [...]
> > > ? 7 CAN_BUILD_X86_64 := $(shell ../x86/check_cc.sh $(CC) \
> > > ? 8??
> > > [...]
> > > ?19 TEST_CUSTOM_PROGS := $(OUTPUT)/test_sgx
> > > ?20
> > > ?21 ifeq ($(CAN_BUILD_X86_64), 1)
> > > ?22 all: $(TEST_CUSTOM_PROGS) $(OUTPUT)/test_encl.elf
> > > ?23 endif
> > > [...]
> >
> > Hi,
> >
> > My config is contained fully here:
> >
> > https://github.com/jarkkojs/buildroot-sgx/blob/master/
> configs/sgx_x86_64_defconfig
> >
> > And my kernel config is here:
> >
> > https://github.com/jarkkojs/buildroot-sgx/blob/master/
> board/sgx/x86_64/linux.config
> >
> > I.e. can be built with "make sgx_x86_64_defconfig && make".
> >
>
> The original error message from linux-5.17.7/tools/testing/selftests/sgx
> is
> (Note: no global failure in linux-tools/selftests in case one or more of
> the
> test case compiles fail):
>
>   .../host/bin/x86_64-buildroot-linux-gnu-gcc -Wall -Werror -g
> -I../../../../tools/include -fPIC -z noexecstack -c sigstruct.c -o
> .../build/linux-5.17.7/tools/testing/selftests/kselftest/sgx/sigstruct.o
>   sigstruct.c:15:10: fatal error: openssl/err.h: No such file or directory
>      15 | #include <openssl/err.h>
>         |          ^~~~~~~~~~~~~~~
>   compilation terminated.
>
> You need to enable 'BR2_PACKAGE_OPENSSL' in your defconfig and apply
> the following buildroot patch:
>
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -18,6 +18,10 @@ endif
>
>  SELFTESTS_DEPENDENCIES = libcap-ng popt
>
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SELFTESTS_DEPENDENCIES += openssl
> +endif
> +
>  SELFTESTS_MAKE_FLAGS = \
>         $(LINUX_MAKE_FLAGS) \
>         ARCH=$(SELFTESTS_ARCH)
>
>
> Regards,
> Peter
>
>
> > > test_sgx is only compiled for x86_64 (and/or CAN_BUILD_X86_64 is
> true)...
> > >
> > > Regards,
> > > Peter
> >
> > BR, Jarkko
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
>
> ------------------------------
>
> Message: 25
> Date: Tue, 17 May 2022 22:50:33 +0200
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/python-avro: fix
>         capitalizations of Parse
> Message-ID: <20220517204033.AB52385F91@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=
> 5468cf1095f236fc01f16015a7cf6cfeee69fe55
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> python-avro 1.11.0 deprecated schema.Parse [1] and actually error
> out when used.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770
>
> [1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24
> be8cdfa9d8
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/testing/tests/package/sample_python_avro.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/support/testing/tests/package/sample_python_avro.py
> b/support/testing/tests/package/sample_python_avro.py
> index 79d2dcdb22..46363ad2bf 100644
> --- a/support/testing/tests/package/sample_python_avro.py
> +++ b/support/testing/tests/package/sample_python_avro.py
> @@ -1,8 +1,8 @@
>  from io import BytesIO
> -from avro.schema import Parse
> +from avro.schema import parse
>  from avro.io import DatumReader, BinaryDecoder
>
> -schema = Parse("""{
> +schema = parse("""{
>  "namespace": "org.buildroot.package.python_avro",
>  "type": "record",
>  "name": "Developer",
>
>
> ------------------------------
>
> Message: 26
> Date: Tue, 17 May 2022 22:52:31 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/python-avro: fix
>         capitalizations of Parse
> Message-ID: <20220517205231.GU1597494@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Romain, All,
>
> On 2022-05-14 17:05 +0200, Romain Naour spake thusly:
> > python-avro 1.11.0 deprecated schema.Parse [1] and actually error
> > out when used.
> >
> > Fixes:
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770
> >
> > [1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24
> be8cdfa9d8
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  support/testing/tests/package/sample_python_avro.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/support/testing/tests/package/sample_python_avro.py
> b/support/testing/tests/package/sample_python_avro.py
> > index 79d2dcdb22..46363ad2bf 100644
> > --- a/support/testing/tests/package/sample_python_avro.py
> > +++ b/support/testing/tests/package/sample_python_avro.py
> > @@ -1,8 +1,8 @@
> >  from io import BytesIO
> > -from avro.schema import Parse
> > +from avro.schema import parse
> >  from avro.io import DatumReader, BinaryDecoder
> >
> > -schema = Parse("""{
> > +schema = parse("""{
> >  "namespace": "org.buildroot.package.python_avro",
> >  "type": "record",
> >  "name": "Developer",
> > --
> > 2.35.3
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>
>
> ------------------------------
>
> Message: 27
> Date: Tue, 17 May 2022 22:56:24 +0200
> From: Linus < <linus@cosmos-ink.net>

--000000000000216e6105df47b0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, May 17, 2022,  &lt;<a href=3D"mailto:buildroot-request@=
buildroot.org">buildroot-request@buildroot.org</a>&gt; wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Send buildroot mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot@buildroot.org" targ=
et=3D"_blank">buildroot@buildroot.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" target=3D"_blank">https://lists.buildroot.org/<wbr>mail=
man/listinfo/buildroot</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot-request@buildroot.o=
rg" target=3D"_blank">buildroot-request@buildroot.<wbr>org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot-owner@buildroot.org=
" target=3D"_blank">buildroot-owner@buildroot.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of buildroot digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. Re: [PATCH 1/1] package/pinentry: add missing<br>
=C2=A0 =C2=A0 =C2=A0 !BR2_ARM_CPU_ARMV4 dependency (Thomas Petazzoni)<br>
=C2=A0 =C2=A02. Re: [PATCH 1/1] package/gst1-imx: add missing<br>
=C2=A0 =C2=A0 =C2=A0 BR2_INSTALL_LIBSTDCPP dependency (Thomas Petazzoni)<br=
>
=C2=A0 =C2=A03. [git commit] package/gcc: restrict hs4x_rel31 to arc gcc fo=
rk<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 =C2=A04. [git commit] package/gstreamer1/gst1-imx: add missing<br>
=C2=A0 =C2=A0 =C2=A0 BR2_INSTALL_LIBSTDCPP dependency (Thomas Petazzoni)<br=
>
=C2=A0 =C2=A05. Re: [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc for=
k<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 =C2=A06. Re: [PATCH 1/1] boot/sun20i-d1-spl: update to latest commit=
<br>
=C2=A0 =C2=A0 =C2=A0 882671 (Peter Korsgaard)<br>
=C2=A0 =C2=A07. [PATCH 1/1] package/python-flask: bump to version 2.1.2<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 =C2=A08. [PATCH 1/1] package/python-werkzeug: bump to version 2.1.2<=
br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 =C2=A09. Re: [PATCH v1 1/1] package/xr819-xradio: enable on riscv<br=
>
=C2=A0 =C2=A0 =C2=A0 architecture (Peter Korsgaard)<br>
=C2=A0 10. [git commit] boot/sun20i-d1-spl: update to latest commit<br>
=C2=A0 =C2=A0 =C2=A0 882671 (Peter Korsgaard)<br>
=C2=A0 11. [git commit] package/xr819-xradio: enable on riscv<br>
=C2=A0 =C2=A0 =C2=A0 architecture (Peter Korsgaard)<br>
=C2=A0 12. [git commit] package/libite: bump version to v2.5.2<br>
=C2=A0 =C2=A0 =C2=A0 (Peter Korsgaard)<br>
=C2=A0 13. [PATCH 1/1] package/python-itsdangerous: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 2.1.2 (James Hilliard)<br>
=C2=A0 14. [PATCH 1/1] package/python-click: bump to version 8.1.3<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 15. [PATCH 1/1] package/python-flask-wtf: bump to version 1.0.1<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 16. Re: [PATCH 1/1] package/ola: add missing python-numpy<br>
=C2=A0 =C2=A0 =C2=A0 dependencies (Thomas Petazzoni)<br>
=C2=A0 17. [PATCH 1/1] package/python-flask-<wbr>sqlalchemy: bump to versio=
n<br>
=C2=A0 =C2=A0 =C2=A0 2.5.1 (James Hilliard)<br>
=C2=A0 18. [PATCH 1/1] package/python-flask-login: bump to version 0.6.1<br=
>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 19. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Yann E. MORI=
N)<br>
=C2=A0 20. [git commit] fs/squashfs: needs more test cases (Yann E. MORIN)<=
br>
=C2=A0 21. [PATCH] package/python-service-<wbr>identity: add missing<br>
=C2=A0 =C2=A0 =C2=A0 python-six runtime dependency (Romain Naour)<br>
=C2=A0 22. [git commit] package/alchemy: add host-pkgconf dependency<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 23. Re: [PATCH 1/1] package/alchemy: add host-pkgconf dependency<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 24. Re: selftests/sgx (Peter Seiderer)<br>
=C2=A0 25. [git commit] package/python-avro: fix capitalizations of<br>
=C2=A0 =C2=A0 =C2=A0 Parse (Yann E. MORIN)<br>
=C2=A0 26. Re: [PATCH] package/python-avro: fix capitalizations of Parse<br=
>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 27. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Linus)<br>
=C2=A0 28. Re: [PATCH 1/1] package/pango: propagate reverse dependencies<br=
>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 29. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Yann E. MORI=
N)<br>
=C2=A0 30. Re: [PATCH 1/1] fs/squashfs: needs more test cases (Linus)<br>
=C2=A0 31. [git commit] package/ola: add missing python-numpy<br>
=C2=A0 =C2=A0 =C2=A0 dependencies (Thomas Petazzoni)<br>
=C2=A0 32. [git commit] package/pango: propagate reverse dependencies<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 33. [git commit] package/grpc: propagate reverse dependencies<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 34. [PATCH 1/1] package/optee-client: fix build without plugins<br>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
=C2=A0 35. Re: [PATCH 1/1] package/grpc: propagate reverse dependencies<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 36. Re: [PATCH] configs/qemu_ppc64le_powernv8: use linux kernel<br>
=C2=A0 =C2=A0 =C2=A0 5.17.7 and binutils 2.36.1 (Romain Naour)<br>
=C2=A0 37. [PATCH 1/4] package/python-typeguard: new package (James Hilliar=
d)<br>
=C2=A0 38. [PATCH 2/4] package/python-mypy-<wbr>extensions: new package<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 39. [PATCH 3/4] package/python-typing-inspect: new package<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
=C2=A0 40. [PATCH 4/4] package/python-flask-jsonrpc: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 2.2.1 (James Hilliard)<br>
=C2=A0 41. [PATCH 1/1] package/python-flask-expects-<wbr>json: bump to<br>
=C2=A0 =C2=A0 =C2=A0 version 1.7.0 (James Hilliard)<br>
=C2=A0 42. Re: [PATCH 1/1] package/python-jinja2: bump to version 3.1.2<br>
=C2=A0 =C2=A0 =C2=A0 (James Hilliard)<br>
<br>
<br>
------------------------------<wbr>------------------------------<wbr>-----=
-----<br>
<br>
Message: 1<br>
Date: Tue, 17 May 2022 21:56:33 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=
=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Alexey Brodkin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:Alexey.Brodkin@synopsys.c=
om" target=3D"_blank">Alexey.Brodkin@synopsys.com</a>&gt;, &quot;Arnout Van=
decappelle (Essensium/Mind)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:arnout@mind.be" target=3D=
"_blank">arnout@mind.be</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/pinentry: add missing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 !BR2_ARM_CPU_ARMV4 dependency<br>
Message-ID: &lt;20220517215633.216b348e@<wbr>windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
Hello James,<br>
<br>
On Sat, 14 May 2022 16:42:00 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Propagate this missing BR2_PACKAGE_QT5 dependency.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5<br>
&gt;=C2=A0 =C2=A0Depends on [n]: BR2_INSTALL_LIBSTDCPP [=3Dy] &amp;&amp; BR=
2_USE_WCHAR [=3Dy] &amp;&amp; BR2_TOOLCHAIN_HAS_THREADS_NPTL [=3Dy] &amp;&a=
mp; BR2_HOST_GCC_AT_LEAST_5 [=3Dy] &amp;&amp; BR2_TOOLCHAIN_GCC_AT_LEAST_5 =
[=3Dy] &amp;&amp; !BR2_ARM_CPU_ARMV4 [=3Dy] &amp;&amp; !BR2_STATIC_LIBS [=
=3Dn]<br>
&gt;=C2=A0 =C2=A0Selected by [y]:<br>
&gt;=C2=A0 =C2=A0- BR2_PACKAGE_PINENTRY_QT5 [=3Dy] &amp;&amp; BR2_PACKAGE_P=
INENTRY [=3Dy] &amp;&amp; BR2_INSTALL_LIBSTDCPP [=3Dy] &amp;&amp; BR2_USE_W=
CHAR [=3Dy] &amp;&amp; BR2_TOOLCHAIN_HAS_THREADS_NPTL [=3Dy] &amp;&amp; BR2=
_HOST_GCC_AT_LEAST_5 [=3Dy] &amp;&amp; BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=3Dy] =
&amp;&amp; !BR2_arc [=3Dn] &amp;&amp; !BR2_STATIC_LIBS [=3Dn]<br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
<br>
I have applied, but after also updating the Config.in comment with this<br>
new dependency:<br>
<br>
comment &quot;pinentry-qt5 needs a host gcc &gt;=3D 5.0, and a toolchain w/=
 wchar, NPTL, gcc &gt;=3D 5.0, C++, dynamic library&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_arc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_ARM_CPU_ARMV4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_W=
CHAR || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !BR2_TOOLCHAIN_HAS_=
THREADS_<wbr>NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_STATIC_LIBS || =
!BR2_HOST_GCC_AT_LEAST_5<br>
<br>
However, I noticed that the !BR2_arc dependency no longer makes sense.<br>
It was dropped from Qt5 in commit<br>
16ffc6549465cb5d68b751f10603e8<wbr>b0363bf9b0.<br>
<br>
This means that commit 16ffc6549465cb5d68b751f10603e8<wbr>b0363bf9b0 did no=
t<br>
properly drop this !BR2_arc dependency from reverse dependencies of<br>
Qt5. Reviewing this shows that package/wireshark also had a !BR2_arc<br>
dependency due to Qt5, which probably should be dropped.<br>
<br>
It would be good to fix that as well.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" target=3D"_blank">https://bootlin.com</a><b=
r>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Tue, 17 May 2022 21:59:24 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=
=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Gary Bisson &lt;<a href=3D"mailto:bisson.gary@gmail.com"=
 target=3D"_blank">bisson.gary@gmail.com</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-imx: add missing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_INSTALL_LIBSTDCPP dependency<br>
Message-ID: &lt;20220517215924.133d18c6@<wbr>windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
Hello James,<br>
<br>
On Sat, 14 May 2022 16:57:32 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fixes:<br>
&gt; WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGI=
NS_BAD<br>
&gt;=C2=A0 =C2=A0Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=3Dy] &amp;&amp; B=
R2_INSTALL_LIBSTDCPP [=3Dn]<br>
&gt;=C2=A0 =C2=A0Selected by [y]:<br>
&gt;=C2=A0 =C2=A0- BR2_PACKAGE_GST1_IMX_<wbr>V4L2VIDEOSRC [=3Dy] &amp;&amp;=
 BR2_PACKAGE_GSTREAMER1 [=3Dy] &amp;&amp; BR2_PACKAGE_GST1_IMX [=3Dy]<br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
<br>
The commit title prefix should have been package/gstreamer1/gst1-imx.<br>
<br>
But more importantly, you had forgotten to add a Config.in comment<br>
about this C++ dependency.<br>
<br>
I&#39;ve fixed both issues, and applied. Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" target=3D"_blank">https://bootlin.com</a><b=
r>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Tue, 17 May 2022 21:59:23 +0200<br>
From: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=
=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/gcc: restrict hs4x_rel31 to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arc gcc fork<br>
Message-ID: &lt;<a href=3D"mailto:20220517194839.BC17C85F4A@busybox.osuosl.=
org" target=3D"_blank">20220517194839.BC17C85F4A@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D770c9e5=
ce3de4ef1743948898a37e9a2ad76ca8f" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>770c9e5ce3de4ef1743948898a37e9<wbr>a2a=
d76ca8f</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
All the ARC variants are supported by upstream gcc, except for the<br>
HS48 rel31 (hs4x_rel31) which is only supported by the ARC fork.<br>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9=
f9ce9432e0c53b5" target=3D"_blank">http://autobuild.buildroot.<wbr>net/resu=
lts/<wbr>357a74d53af96d4b868a9d5b9f9ce9<wbr>432e0c53b5</a><br>
<a href=3D"http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65a=
ca153faca4b32c2" target=3D"_blank">http://autobuild.buildroot.<wbr>net/resu=
lts/<wbr>bcdf160a3d5ffcccd4402f65aca153<wbr>faca4b32c2</a><br>
<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" t=
arget=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
Cc: ARC Maintainers &lt;<a href=3D"mailto:arc-buildroot@synopsys.com" targe=
t=3D"_blank">arc-buildroot@synopsys.com</a>&gt;<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
---<br>
=C2=A0package/gcc/Config.in.host | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host<br>
index f6b9b4fa9d..2b12035c4b 100644<br>
--- a/package/gcc/Config.in.host<br>
+++ b/package/gcc/Config.in.host<br>
@@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # upstream gcc. C-SKY gcc upstream support not =
tested<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with upstream binutils and glibc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_csky<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc for=
k.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_TOOLCHAIN_GCC_AT_LEAST_9<br>
<br>
=C2=A0config BR2_GCC_VERSION_10_X<br>
@@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # upstream gcc. C-SKY gcc upstream support not =
tested<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with upstream binutils and glibc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_csky<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc for=
k.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_TOOLCHAIN_GCC_AT_LEAST_10<br>
<br>
=C2=A0config BR2_GCC_VERSION_11_X<br>
@@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that need to be reverted since gcc 8.4, 9.3 a=
nd 10.1.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://gcc.gnu.org/bugzilla/show_=
bug.cgi?id=3D98784" target=3D"_blank">https://gcc.gnu.org/bugzilla/<wbr>sho=
w_bug.cgi?id=3D98784</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_sparc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc for=
k.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_TOOLCHAIN_GCC_AT_LEAST_11<br>
<br>
=C2=A0endchoice<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Tue, 17 May 2022 22:00:38 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-imx: add<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing BR2_INSTALL_LIBSTDCPP dependency<br>
Message-ID: &lt;<a href=3D"mailto:20220517194939.46B8385F51@busybox.osuosl.=
org" target=3D"_blank">20220517194939.46B8385F51@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D198244b=
3c31029aa16ae69e1661f1e1cd173b03f" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>198244b3c31029aa16ae69e1661f1e<wbr>1cd=
173b03f</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
Fixes:<br>
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BA=
D<br>
=C2=A0 Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=3Dy] &amp;&amp; BR2_INSTALL=
_LIBSTDCPP [=3Dn]<br>
=C2=A0 Selected by [y]:<br>
=C2=A0 - BR2_PACKAGE_GST1_IMX_<wbr>V4L2VIDEOSRC [=3Dy] &amp;&amp; BR2_PACKA=
GE_GSTREAMER1 [=3Dy] &amp;&amp; BR2_PACKAGE_GST1_IMX [=3Dy]<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/gstreamer1/gst1-imx/<wbr>Config.in | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/package/gstreamer1/gst1-imx/<wbr>Config.in b/package/gstreamer=
1/gst1-imx/<wbr>Config.in<br>
index 41ef8548c5..bd1f8d41f2 100644<br>
--- a/package/gstreamer1/gst1-imx/<wbr>Config.in<br>
+++ b/package/gstreamer1/gst1-imx/<wbr>Config.in<br>
@@ -81,10 +81,14 @@ comment &quot;imxvpu needs the VPU imxvpuapi library&qu=
ot;<br>
<br>
=C2=A0config BR2_PACKAGE_GST1_IMX_<wbr>V4L2VIDEOSRC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;imxv4l2videosrc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins=
-bad<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_GST1_PLUGINS_BAD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Elements for V4L2 capture<br>
<br>
+comment &quot;imxv4l2videosrc needs a toolchain w/ C++&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP<br>
+<br>
=C2=A0config BR2_PACKAGE_GST1_IMX_<wbr>V4L2VIDEOSINK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;imxv4l2videosink&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HEADERS_AT_<wbr>LEAST_=
4_2 # V4L2_COLORSPACE_DEFAULT<br>
<br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Tue, 17 May 2022 22:00:44 +0200<br>
From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1998@free.=
fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_b=
lank">romain.naour@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, ARC Maintainers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:arc-buildroot@synopsys.co=
m" target=3D"_blank">arc-buildroot@synopsys.com</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arc gcc fork<br>
Message-ID: &lt;20220517200044.GR1597494@<wbr>scaer&gt;<br>
Content-Type: text/plain; charset=3Dutf-8<br>
<br>
Romain, All,<br>
<br>
On 2022-05-15 21:36 +0200, Romain Naour spake thusly:<br>
&gt; ARC hs4x_rel31 cpu is not supported by upstream gcc version.<br>
&gt; Only the generic HS48 processor (BR2_archs4x) is supported<br>
&gt; by upstream gcc.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/357a74d53af96d4b868a=
9d5b9f9ce9432e0c53b5" target=3D"_blank">http://autobuild.buildroot.<wbr>net=
/results/<wbr>357a74d53af96d4b868a9d5b9f9ce9<wbr>432e0c53b5</a><br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd440=
2f65aca153faca4b32c2" target=3D"_blank">http://autobuild.buildroot.<wbr>net=
/results/<wbr>bcdf160a3d5ffcccd4402f65aca153<wbr>faca4b32c2</a><br>
&gt; <br>
&gt; Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.c=
om" target=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
&gt; Cc: ARC Maintainers &lt;<a href=3D"mailto:arc-buildroot@synopsys.com" =
target=3D"_blank">arc-buildroot@synopsys.com</a>&gt;<br>
<br>
Applied to master, after rewording the commit log as we discussed on<br>
IRC. Thanks!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/gcc/Config.in.host | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host<b=
r>
&gt; index f6b9b4fa9d..2b12035c4b 100644<br>
&gt; --- a/package/gcc/Config.in.host<br>
&gt; +++ b/package/gcc/Config.in.host<br>
&gt; @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# upstream gcc. C-SKY gcc upstream support n=
ot tested<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# with upstream binutils and glibc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_csky<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc fork.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_TOOLCHAIN_GCC_AT_LEAST_9<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_GCC_VERSION_10_X<br>
&gt; @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# upstream gcc. C-SKY gcc upstream support n=
ot tested<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# with upstream binutils and glibc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_csky<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc fork.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_TOOLCHAIN_GCC_AT_LEAST_10<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_GCC_VERSION_11_X<br>
&gt; @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# that need to be reverted since gcc 8.4, 9.=
3 and 10.1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://gcc.gnu.org/bugzilla/sh=
ow_bug.cgi?id=3D98784" target=3D"_blank">https://gcc.gnu.org/bugzilla/<wbr>=
show_bug.cgi?id=3D98784</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_sparc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# ARC HS48 rel 31 only supported by gcc arc fork.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_archs4x_rel31<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_TOOLCHAIN_GCC_AT_LEAST_11<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 endchoice<br>
&gt; -- <br>
&gt; 2.35.3<br>
&gt; <br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
-- <br>
.-----------------.-----------<wbr>---------.------------------.-<wbr>-----=
--------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" target=3D"_blank">http://ymorin.=
is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=
=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;-----------------------------<wbr>-^-------^------------------^-<wbr>-=
------------------&#39;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 6<br>
Date: Tue, 17 May 2022 22:04:35 +0200<br>
From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"=
_blank">peter@korsgaard.com</a>&gt;<br>
To: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D"_=
blank">christian@paral.in</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>,=C2=A0 &quot;Yann E . MORIN&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yann.morin.1998@free.fr" =
target=3D"_blank">yann.morin.1998@free.fr</a>&gt;, Thomas Petazzoni<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] boot/sun20i-d1-spl: update to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 latest commit 882671<br>
Message-ID: &lt;<a href=3D"mailto:87ilq43oz0.fsf@dell.be.48ers.dk" target=
=3D"_blank">87ilq43oz0.fsf@dell.be.48ers.<wbr>dk</a>&gt;<br>
Content-Type: text/plain<br>
<br>
&gt;&gt;&gt;&gt;&gt; &quot;Christian&quot; =3D=3D Christian Stewart &lt;<a =
href=3D"mailto:christian@paral.in" target=3D"_blank">christian@paral.in</a>=
&gt; writes:<br>
<br>
=C2=A0&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian=
@paral.in" target=3D"_blank">christian@paral.in</a>&gt;<br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 boot/sun20i-d1-spl/sun20i-d1-<wbr>spl.hash | 2 +-<br>
=C2=A0&gt;=C2=A0 boot/sun20i-d1-spl/<a href=3D"http://sun20i-d1-spl.mk" tar=
get=3D"_blank">sun20i-d1-<wbr>spl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A0&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Committed, thanks.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
<br>
------------------------------<br>
<br>
Message: 7<br>
Date: Tue, 17 May 2022 14:09:23 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com" target=
=3D"_blank">yegorslists@googlemail.com</a>&gt;, Asaf Kahlon<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:asafka7@gmail.com" target=
=3D"_blank">asafka7@gmail.com</a>&gt;, Lionel Flandrin &lt;<a href=3D"mailt=
o:lionel@svkt.org" target=3D"_blank">lionel@svkt.org</a>&gt;, James Hilliar=
d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:james.hilliard1@gmail.com=
" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2.1.2<br>
Message-ID: &lt;<a href=3D"mailto:20220517200923.1516695-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517200923.1516695-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
License hash change due to license title syntax change:<br>
<a href=3D"https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889=
ae463e06dd83a189" target=3D"_blank">https://github.com/pallets/<wbr>flask/c=
ommit/<wbr>9e7d3a6b694b27f997266889ae463e<wbr>06dd83a189</a><br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-flask/python-<wbr>flask.hash | 13 ++++++-------<br>
=C2=A0package/python-flask/<a href=3D"http://python-flask.mk" target=3D"_bl=
ank">python-<wbr>flask.mk</a>=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A02 files changed, 8 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/package/python-flask/python-<wbr>flask.hash b/package/python-f=
lask/python-<wbr>flask.hash<br>
index c6ccd633f8..5f19a450a1 100644<br>
--- a/package/python-flask/python-<wbr>flask.hash<br>
+++ b/package/python-flask/python-<wbr>flask.hash<br>
@@ -1,7 +1,6 @@<br>
-# From <a href=3D"https://pypi.org/project/Flask/#copy-hash-modal-911ffb67=
-fe84-4e25-a1a9-f4c745a0a980-md5" target=3D"_blank">https://pypi.org/projec=
t/<wbr>Flask/#copy-hash-modal-<wbr>911ffb67-fe84-4e25-a1a9-<wbr>f4c745a0a98=
0<br>
-md5</a>=C2=A0 0da4145d172993cd28a6c619630cc1<wbr>9c=C2=A0 Flask-1.1.2.tar.=
gz<br>
-sha256 4efa1ae2d7c9865af48986de8aeb85<wbr>04bf32c7f3d6fdc9353d34b21f4b12<w=
br>7060=C2=A0 Flask-1.1.2.tar.gz<br>
-<br>
-# License files<br>
-sha256 489a8e1108509ed98a37bb983e11e0<wbr>f7e1d31f0bd8f99a79c8448e7ff37d<w=
br>07ea=C2=A0 LICENSE.rst<br>
-sha256 0ef3ae025f4a398761079f0d687ff3<wbr>d66f4fef3a32ac2607318e909c0cba<w=
br>9150=C2=A0 docs/license.rst<br>
+# md5, sha256 from <a href=3D"https://pypi.org/pypi/flask/json" target=3D"=
_blank">https://pypi.org/pypi/flask/<wbr>json</a><br>
+md5=C2=A0 93f1832e5be704ef6ff2a4124579cd<wbr>85=C2=A0 Flask-2.1.2.tar.gz<b=
r>
+sha256=C2=A0 315ded2ddf8a6281567edb27393010<wbr>fe3406188bafbfe65a3339d578=
7d89<wbr>e477=C2=A0 Flask-2.1.2.tar.gz<br>
+# Locally computed sha256 checksums<br>
+sha256=C2=A0 489a8e1108509ed98a37bb983e11e0<wbr>f7e1d31f0bd8f99a79c8448e7f=
f37d<wbr>07ea=C2=A0 LICENSE.rst<br>
+sha256=C2=A0 7535eac513edd12fb8e33f203c6a40<wbr>3549629e34b363418cdbd6c6ea=
5464<wbr>515d=C2=A0 docs/license.rst<br>
diff --git a/package/python-flask/<a href=3D"http://python-flask.mk" target=
=3D"_blank">python-<wbr>flask.mk</a> b/package/python-flask/<a href=3D"http=
://python-flask.mk" target=3D"_blank">python-<wbr>flask.mk</a><br>
index 077aa600b8..b684aff480 100644<br>
--- a/package/python-flask/<a href=3D"http://python-flask.mk" target=3D"_bl=
ank">python-<wbr>flask.mk</a><br>
+++ b/package/python-flask/<a href=3D"http://python-flask.mk" target=3D"_bl=
ank">python-<wbr>flask.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_FLASK_VERSION =3D 1.1.2<br>
+PYTHON_FLASK_VERSION =3D 2.1.2<br>
=C2=A0PYTHON_FLASK_SOURCE =3D Flask-$(PYTHON_FLASK_VERSION).<wbr>tar.gz<br>
-PYTHON_FLASK_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/4=
e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d" target=
=3D"_blank">https://files.pythonhosted.<wbr>org/packages/4e/0b/<wbr>cb02268=
c90e67545a0e3a37ea1ca3d<wbr>45de3aca43ceb7dbf1712fb5127d5d</a><br>
+PYTHON_FLASK_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/d=
3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b" target=
=3D"_blank">https://files.pythonhosted.<wbr>org/packages/d3/3c/<wbr>94f38d4=
db919a9326a706ad56f05a7<wbr>e6f0c8f7b7d93e2997cca54d3bc14b</a><br>
=C2=A0PYTHON_FLASK_SETUP_TYPE =3D setuptools<br>
=C2=A0PYTHON_FLASK_LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_FLASK_LICENSE_FILES =3D LICENSE.rst docs/license.rst<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 8<br>
Date: Tue, 17 May 2022 14:12:49 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Asaf Kahlon &lt;<a href=3D"mailto:asafka7@gmail.com" target=3D"_blank">=
asafka7@gmail.com</a>&gt;, Yegor Yefremov<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yegorslists@googlemail.co=
m" target=3D"_blank">yegorslists@googlemail.com</a>&gt;, James Hilliard<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:james.hilliard1@gmail.com=
" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 2.1.2<br>
Message-ID: &lt;<a href=3D"mailto:20220517201249.1518358-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517201249.1518358-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-werkzeug/<wbr>python-werkzeug.hash | 6 +++---<br>
=C2=A0package/python-werkzeug/<a href=3D"http://python-werkzeug.mk" target=
=3D"_blank">pytho<wbr>n-werkzeug.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/python-werkzeug/<wbr>python-werkzeug.hash b/package/py=
thon-werkzeug/<wbr>python-werkzeug.hash<br>
index 1d6de8a0c7..73fa6b5630 100644<br>
--- a/package/python-werkzeug/<wbr>python-werkzeug.hash<br>
+++ b/package/python-werkzeug/<wbr>python-werkzeug.hash<br>
@@ -1,5 +1,5 @@<br>
-# md5, sha256 from <a href=3D"https://pypi.org/pypi/werkzeug/json" target=
=3D"_blank">https://pypi.org/pypi/<wbr>werkzeug/json</a><br>
-md5=C2=A0 5d499cfdd30de5d9c946994783772e<wbr>fd=C2=A0 Werkzeug-1.0.1.tar.g=
z<br>
-sha256=C2=A0 6c80b1e5ad3665290ea39320b91e1b<wbr>e1e0d5f60652b964a3070216de=
83d2<wbr>e47c=C2=A0 Werkzeug-1.0.1.tar.gz<br>
+# md5, sha256 from <a href=3D"https://pypi.org/pypi/Werkzeug/json" target=
=3D"_blank">https://pypi.org/pypi/<wbr>Werkzeug/json</a><br>
+md5=C2=A0 5835c8738b8081c53367cbcc5db878<wbr>4c=C2=A0 Werkzeug-2.1.2.tar.g=
z<br>
+sha256=C2=A0 1ce08e8093ed67d638d63879fd1ba3<wbr>735817f7a80de3674d293f5984=
f25f<wbr>b6e6=C2=A0 Werkzeug-2.1.2.tar.gz<br>
=C2=A0# Locally computed sha256 checksums<br>
=C2=A0sha256=C2=A0 3b49dcee4105eb37bac10faf1be260<wbr>408fe85d252b8e9df2e09=
79fc1e094<wbr>437b=C2=A0 LICENSE.rst<br>
diff --git a/package/python-werkzeug/<a href=3D"http://python-werkzeug.mk" =
target=3D"_blank">pyth<wbr>on-werkzeug.mk</a> b/package/python-werkzeug/<a =
href=3D"http://python-werkzeug.mk" target=3D"_blank">pyth<wbr>on-werkzeug.m=
k</a><br>
index fe9b87af1d..9b32fdf097 100644<br>
--- a/package/python-werkzeug/<a href=3D"http://python-werkzeug.mk" target=
=3D"_blank">pyth<wbr>on-werkzeug.mk</a><br>
+++ b/package/python-werkzeug/<a href=3D"http://python-werkzeug.mk" target=
=3D"_blank">pyth<wbr>on-werkzeug.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_WERKZEUG_VERSION =3D 1.0.1<br>
+PYTHON_WERKZEUG_VERSION =3D 2.1.2<br>
=C2=A0PYTHON_WERKZEUG_SOURCE =3D Werkzeug-$(PYTHON_WERKZEUG_<wbr>VERSION).t=
ar.gz<br>
-PYTHON_WERKZEUG_SITE =3D <a href=3D"https://files.pythonhosted.org/package=
s/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04" targe=
t=3D"_blank">https://files.pythonhosted.<wbr>org/packages/10/27/<wbr>a33329=
150147594eff0ea4c33c2036<wbr>c0eadd933141055be0ff911f7f8d04</a><br>
+PYTHON_WERKZEUG_SITE =3D <a href=3D"https://files.pythonhosted.org/package=
s/10/cf/97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b" targe=
t=3D"_blank">https://files.pythonhosted.<wbr>org/packages/10/cf/<wbr>97eb1a=
3847c01ae53e8376bc211455<wbr>55ac95279523a935963dc8ff96c50b</a><br>
=C2=A0PYTHON_WERKZEUG_SETUP_TYPE =3D setuptools<br>
=C2=A0PYTHON_WERKZEUG_LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_WERKZEUG_LICENSE_FILES =3D LICENSE.rst<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 9<br>
Date: Tue, 17 May 2022 22:15:11 +0200<br>
From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"=
_blank">peter@korsgaard.com</a>&gt;<br>
To: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D"_=
blank">christian@paral.in</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>,=C2=A0 &quot;Yann E . MORIN&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yann.morin.1998@free.fr" =
target=3D"_blank">yann.morin.1998@free.fr</a>&gt;, Thomas Petazzoni<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xr819-xradio: enable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 on riscv architecture<br>
Message-ID: &lt;<a href=3D"mailto:87ee0r531s.fsf@dell.be.48ers.dk" target=
=3D"_blank">87ee0r531s.fsf@dell.be.48ers.<wbr>dk</a>&gt;<br>
Content-Type: text/plain<br>
<br>
&gt;&gt;&gt;&gt;&gt; &quot;Christian&quot; =3D=3D Christian Stewart &lt;<a =
href=3D"mailto:christian@paral.in" target=3D"_blank">christian@paral.in</a>=
&gt; writes:<br>
<br>
=C2=A0&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian=
@paral.in" target=3D"_blank">christian@paral.in</a>&gt;<br>
<br>
Committed, thanks.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
<br>
------------------------------<br>
<br>
Message: 10<br>
Date: Tue, 17 May 2022 22:15:22 +0200<br>
From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"=
_blank">peter@korsgaard.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] boot/sun20i-d1-spl: update to latest<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 commit 882671<br>
Message-ID: &lt;<a href=3D"mailto:20220517200442.DDCE085F72@busybox.osuosl.=
org" target=3D"_blank">20220517200442.DDCE085F72@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Dd0cbd53=
ac4a054e94bc7f055bd4087f21a317f5e" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>d0cbd53ac4a054e94bc7f055bd4087<wbr>f21=
a317f5e</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0boot/sun20i-d1-spl/sun20i-d1-<wbr>spl.hash | 2 +-<br>
=C2=A0boot/sun20i-d1-spl/<a href=3D"http://sun20i-d1-spl.mk" target=3D"_bla=
nk">sun20i-d1-<wbr>spl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/boot/sun20i-d1-spl/sun20i-<wbr>d1-spl.hash b/boot/sun20i-d1-sp=
l/sun20i-<wbr>d1-spl.hash<br>
index bb2fd66c28..11d17a9a16 100644<br>
--- a/boot/sun20i-d1-spl/sun20i-<wbr>d1-spl.hash<br>
+++ b/boot/sun20i-d1-spl/sun20i-<wbr>d1-spl.hash<br>
@@ -1,2 +1,2 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 3ef28affd35a37675d91d3ac50b85e<wbr>3dfa356420005f69713df73c85=
798f<wbr>f1d8=C2=A0 sun20i-d1-spl-<wbr>4da9c518c124d6f6123bf274e44951<wbr>4=
863df3646.tar.gz<br>
+sha256=C2=A0 08e2d0574e58c99734cd1d9ea89b86<wbr>464242bf2db4f6769b23803bf9=
dcda<wbr>c3c4=C2=A0 sun20i-d1-spl-<wbr>882671fcf53137aaafc3a94fa32e68<wbr>2=
cb7b921f1.tar.gz<br>
diff --git a/boot/sun20i-d1-spl/<a href=3D"http://sun20i-d1-spl.mk" target=
=3D"_blank">sun20i-<wbr>d1-spl.mk</a> b/boot/sun20i-d1-spl/<a href=3D"http:=
//sun20i-d1-spl.mk" target=3D"_blank">sun20i-<wbr>d1-spl.mk</a><br>
index 3580ea4c25..6bcea0fa96 100644<br>
--- a/boot/sun20i-d1-spl/<a href=3D"http://sun20i-d1-spl.mk" target=3D"_bla=
nk">sun20i-<wbr>d1-spl.mk</a><br>
+++ b/boot/sun20i-d1-spl/<a href=3D"http://sun20i-d1-spl.mk" target=3D"_bla=
nk">sun20i-<wbr>d1-spl.mk</a><br>
@@ -5,7 +5,7 @@<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
=C2=A0# Commit on the &#39;mainline&#39; branch<br>
-SUN20I_D1_SPL_VERSION =3D 4da9c518c124d6f6123bf274e44951<wbr>4863df3646<br=
>
+SUN20I_D1_SPL_VERSION =3D 882671fcf53137aaafc3a94fa32e68<wbr>2cb7b921f1<br=
>
=C2=A0SUN20I_D1_SPL_SITE =3D $(call github,smaeul,sun20i_d1_spl,$(<wbr>SUN2=
0I_D1_SPL_VERSION))<br>
=C2=A0SUN20I_D1_SPL_INSTALL_TARGET =3D NO<br>
=C2=A0SUN20I_D1_SPL_INSTALL_IMAGES =3D YES<br>
<br>
<br>
------------------------------<br>
<br>
Message: 11<br>
Date: Tue, 17 May 2022 22:15:22 +0200<br>
From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"=
_blank">peter@korsgaard.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/xr819-xradio: enable on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv architecture<br>
Message-ID: &lt;<a href=3D"mailto:20220517200442.F3B7785F77@busybox.osuosl.=
org" target=3D"_blank">20220517200442.F3B7785F77@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3De8fb79c=
8664234d0eb4ce73feb848a63f4d35543" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>e8fb79c8664234d0eb4ce73feb848a<wbr>63f=
4d35543</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/xr819-xradio/Config.<wbr>in | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/xr819-xradio/Config.<wbr>in b/package/xr819-xradio/Con=
fig.<wbr>in<br>
index 3d2dedf29e..b8acd71bfc 100644<br>
--- a/package/xr819-xradio/Config.<wbr>in<br>
+++ b/package/xr819-xradio/Config.<wbr>in<br>
@@ -1,7 +1,8 @@<br>
=C2=A0config BR2_PACKAGE_XR819_XRADIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;xr819-xradio&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_LINUX_KERNEL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_arm || BR2_armeb || BR2_aarch64 =
|| BR2_aarch64_be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_arm || BR2_armeb || BR2_aarch64 =
|| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_aarch64_be || B=
R2_riscv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Wireless driver for SDIO WiFi chip XR819=
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 12<br>
Date: Tue, 17 May 2022 22:15:22 +0200<br>
From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"=
_blank">peter@korsgaard.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/libite: bump version to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 v2.5.2<br>
Message-ID: &lt;<a href=3D"mailto:20220517200442.E8C8F85F50@busybox.osuosl.=
org" target=3D"_blank">20220517200442.E8C8F85F50@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Dfbd9382=
5978e749f081d2c0bb3b3d6fb7c5324bc" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>fbd93825978e749f081d2c0bb3b3d6<wbr>fb7=
c5324bc</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
Changes:<br>
=C2=A0- Add printf format attribute hint to all vararg functions. This will=
<br>
=C2=A0 =C2=A0help users of these functions by telling CC what to look for<b=
r>
<br>
Fixes:<br>
=C2=A0- Fix fisdir() segfault on GNU/Hurd<br>
=C2=A0- Fix touch() on Debian/kFreeBSD, use creat() instead of mknod()<br>
<br>
Signed-off-by: Joachim Wiberg &lt;<a href=3D"mailto:troglobit@gmail.com" ta=
rget=3D"_blank">troglobit@gmail.com</a>&gt;<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/libite/libite.hash | 2 +-<br>
=C2=A0package/libite/<a href=3D"http://libite.mk" target=3D"_blank">libite.=
mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libite/libite.hash b/package/libite/libite.hash<br>
index 1dec65bd6b..8b622d87a9 100644<br>
--- a/package/libite/libite.hash<br>
+++ b/package/libite/libite.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Upstream .sha256 from GitHub<br>
-sha256=C2=A0 5278fa0ca933727c78f4e05082cea5<wbr>8256d9302afac30bad0c3760cf=
2a18<wbr>ef8f=C2=A0 libite-2.5.1.tar.xz<br>
+sha256=C2=A0 baa9bf9931427ef5e9ddfc5b721399<wbr>81047a8d0d3c03a534d9716de3=
8cf1<wbr>8bb5=C2=A0 libite-2.5.2.tar.xz<br>
<br>
=C2=A0# Locally calculated<br>
=C2=A0sha256=C2=A0 20db0601195f708d68ff7907907b3c<wbr>d3b25808efa8332e064b1=
1f00c839a<wbr>5d2f=C2=A0 LICENSE<br>
diff --git a/package/libite/<a href=3D"http://libite.mk" target=3D"_blank">=
libite.mk</a> b/package/libite/<a href=3D"http://libite.mk" target=3D"_blan=
k">libite.mk</a><br>
index 185ffe77de..66a8253c62 100644<br>
--- a/package/libite/<a href=3D"http://libite.mk" target=3D"_blank">libite.=
mk</a><br>
+++ b/package/libite/<a href=3D"http://libite.mk" target=3D"_blank">libite.=
mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-LIBITE_VERSION =3D 2.5.1<br>
+LIBITE_VERSION =3D 2.5.2<br>
=C2=A0LIBITE_SOURCE =3D libite-$(LIBITE_VERSION).tar.<wbr>xz<br>
=C2=A0LIBITE_SITE =3D <a href=3D"https://github.com/troglobit/libite/releas=
es/download/v$(LIBITE_VERSION)" target=3D"_blank">https://github.com/troglo=
bit/<wbr>libite/releases/download/v$(<wbr>LIBITE_VERSION)</a><br>
=C2=A0LIBITE_LICENSE =3D MIT, X11, ISC, BSD-2-Clause<br>
<br>
<br>
------------------------------<br>
<br>
Message: 13<br>
Date: Tue, 17 May 2022 14:15:50 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com" target=
=3D"_blank">yegorslists@googlemail.com</a>&gt;, Asaf Kahlon<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:asafka7@gmail.com" target=
=3D"_blank">asafka7@gmail.com</a>&gt;, James Hilliard &lt;<a href=3D"mailto=
:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>=
&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 2.1.2<br>
Message-ID: &lt;<a href=3D"mailto:20220517201550.1519884-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517201550.1519884-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-itsdangerous/<wbr>python-itsdangerous.hash | 4 ++--<br=
>
=C2=A0package/python-itsdangerous/<a href=3D"http://python-itsdangerous.mk"=
 target=3D"_blank">p<wbr>ython-itsdangerous.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/package/python-itsdangerous/<wbr>python-itsdangerous.hash b/pa=
ckage/python-itsdangerous/<wbr>python-itsdangerous.hash<br>
index dad4ec0800..071544e5bd 100644<br>
--- a/package/python-itsdangerous/<wbr>python-itsdangerous.hash<br>
+++ b/package/python-itsdangerous/<wbr>python-itsdangerous.hash<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# md5, sha256 from <a href=3D"https://pypi.org/pypi/itsdangerous/json=
" target=3D"_blank">https://pypi.org/pypi/<wbr>itsdangerous/json</a><br>
-md5=C2=A0 996b9763d1b4bd0edd6eb86f0a4906<wbr>29=C2=A0 itsdangerous-2.0.1.t=
ar.gz<br>
-sha256=C2=A0 9e724d68fc22902a1435351f84c3fb<wbr>8623f303fffcc566a4cb952df8=
c572<wbr>cff0=C2=A0 itsdangerous-2.0.1.tar.gz<br>
+md5=C2=A0 c1bc730ddf53b8374eaa823f24eb64<wbr>38=C2=A0 itsdangerous-2.1.2.t=
ar.gz<br>
+sha256=C2=A0 5dbbc68b317e5e42f327f902176354<wbr>5dc3fc3bfe22e6deb96aaf1fc3=
8874<wbr>156a=C2=A0 itsdangerous-2.1.2.tar.gz<br>
=C2=A0# Locally computed sha256 checksums<br>
=C2=A0sha256=C2=A0 63af09891b6be8ad1a4252ed43af0f<wbr>4efba7fc948e228367bed=
7f3c5ae0b<wbr>09d7=C2=A0 LICENSE.rst<br>
=C2=A0sha256=C2=A0 c9362a7258a11c84a8f7e825ccbbb5<wbr>c425c6fc02368d3aee649=
4533fb99b<wbr>a1f4=C2=A0 docs/license.rst<br>
diff --git a/package/python-itsdangerous/<a href=3D"http://python-itsdanger=
ous.mk" target=3D"_blank"><wbr>python-itsdangerous.mk</a> b/package/python-=
itsdangerous/<a href=3D"http://python-itsdangerous.mk" target=3D"_blank"><w=
br>python-itsdangerous.mk</a><br>
index c53bc6b9ba..d7a1344e0a 100644<br>
--- a/package/python-itsdangerous/<a href=3D"http://python-itsdangerous.mk"=
 target=3D"_blank"><wbr>python-itsdangerous.mk</a><br>
+++ b/package/python-itsdangerous/<a href=3D"http://python-itsdangerous.mk"=
 target=3D"_blank"><wbr>python-itsdangerous.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_ITSDANGEROUS_VERSION =3D 2.0.1<br>
+PYTHON_ITSDANGEROUS_VERSION =3D 2.1.2<br>
=C2=A0PYTHON_ITSDANGEROUS_SOURCE =3D itsdangerous-$(PYTHON_<wbr>ITSDANGEROU=
S_VERSION).tar.gz<br>
-PYTHON_ITSDANGEROUS_SITE =3D <a href=3D"https://files.pythonhosted.org/pac=
kages/58/66/d6c5859dcac92b442626427a8c7a42322068c5cd5d4a463ce78b93f730b7" t=
arget=3D"_blank">https://files.pythonhosted.<wbr>org/packages/58/66/<wbr>d6=
c5859dcac92b442626427a8c7a42<wbr>322068c5cd5d4a463ce78b93f730b7</a><br>
+PYTHON_ITSDANGEROUS_SITE =3D <a href=3D"https://files.pythonhosted.org/pac=
kages/7f/a1/d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08" t=
arget=3D"_blank">https://files.pythonhosted.<wbr>org/packages/7f/a1/<wbr>d3=
fb83e7a61fa0c0d3d08ad0a94ddb<wbr>eff3731c05212617dff3a94e097f08</a><br>
=C2=A0PYTHON_ITSDANGEROUS_SETUP_<wbr>TYPE =3D setuptools<br>
=C2=A0PYTHON_ITSDANGEROUS_LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_ITSDANGEROUS_LICENSE_<wbr>FILES =3D LICENSE.rst docs/license.r=
st<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 14<br>
Date: Tue, 17 May 2022 14:19:16 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com" target=
=3D"_blank">yegorslists@googlemail.com</a>&gt;, Mauro Condarelli<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:mc5686@mclink.it" target=
=3D"_blank">mc5686@mclink.it</a>&gt;, Asaf Kahlon &lt;<a href=3D"mailto:asa=
fka7@gmail.com" target=3D"_blank">asafka7@gmail.com</a>&gt;, James Hilliard=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:james.hilliard1@gmail.com=
" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8.1.3<br>
Message-ID: &lt;<a href=3D"mailto:20220517201916.1521398-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517201916.1521398-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-click/python-<wbr>click.hash | 6 +++---<br>
=C2=A0package/python-click/<a href=3D"http://python-click.mk" target=3D"_bl=
ank">python-<wbr>click.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/python-click/python-<wbr>click.hash b/package/python-c=
lick/python-<wbr>click.hash<br>
index fb6e457ad5..81d19c419e 100644<br>
--- a/package/python-click/python-<wbr>click.hash<br>
+++ b/package/python-click/python-<wbr>click.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# md5, sha256 from <a href=3D"https://pypi.org/pypi/click/json" targe=
t=3D"_blank">https://pypi.org/pypi/click/<wbr>json</a><br>
-md5=C2=A0 53692f62cb99a1a10c59248f1776d9<wbr>c0=C2=A0 click-7.1.2.tar.gz<b=
r>
-sha256=C2=A0 d2b5255c7c6349bc1bd1e59e08cd12<wbr>acbbd63ce649f2588755783aa9=
4dfb<wbr>6b1a=C2=A0 click-7.1.2.tar.gz<br>
-# Locally computed sha256<br>
+md5=C2=A0 a804b085de7a3ff96968e38e0f6f2e<wbr>05=C2=A0 click-8.1.3.tar.gz<b=
r>
+sha256=C2=A0 7682dc8afb30297001674575ea00d1<wbr>814d808d6a36af415a82bd481d=
37ba<wbr>7b8e=C2=A0 click-8.1.3.tar.gz<br>
+# Locally computed sha256 checksums<br>
=C2=A0sha256=C2=A0 9a8ad106a394e853bfe21f42f4e72d<wbr>592819a22805d991b5f32=
75029292b<wbr>658d=C2=A0 LICENSE.rst<br>
diff --git a/package/python-click/<a href=3D"http://python-click.mk" target=
=3D"_blank">python-<wbr>click.mk</a> b/package/python-click/<a href=3D"http=
://python-click.mk" target=3D"_blank">python-<wbr>click.mk</a><br>
index a829257f5e..6444d0148e 100644<br>
--- a/package/python-click/<a href=3D"http://python-click.mk" target=3D"_bl=
ank">python-<wbr>click.mk</a><br>
+++ b/package/python-click/<a href=3D"http://python-click.mk" target=3D"_bl=
ank">python-<wbr>click.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_CLICK_VERSION =3D 7.1.2<br>
+PYTHON_CLICK_VERSION =3D 8.1.3<br>
=C2=A0PYTHON_CLICK_SOURCE =3D click-$(PYTHON_CLICK_VERSION).<wbr>tar.gz<br>
-PYTHON_CLICK_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/2=
7/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e" target=
=3D"_blank">https://files.pythonhosted.<wbr>org/packages/27/6f/<wbr>be940c8=
b1f1d69daceeb0032fee6c3<wbr>4d7bd70e3e649ccac0951500b4720e</a><br>
+PYTHON_CLICK_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/5=
9/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8" target=
=3D"_blank">https://files.pythonhosted.<wbr>org/packages/59/87/<wbr>84326af=
34517fca8c58418d148f240<wbr>3df25303e02736832403587318e9e8</a><br>
=C2=A0PYTHON_CLICK_LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_CLICK_LICENSE_FILES =3D LICENSE.rst<br>
=C2=A0PYTHON_CLICK_SETUP_TYPE =3D setuptools<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 15<br>
Date: Tue, 17 May 2022 14:24:22 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com" target=
=3D"_blank">yegorslists@googlemail.com</a>&gt;, Peter Seiderer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:ps.report@gmx.net" target=
=3D"_blank">ps.report@gmx.net</a>&gt;, Asaf Kahlon &lt;<a href=3D"mailto:as=
afka7@gmail.com" target=3D"_blank">asafka7@gmail.com</a>&gt;, James Hilliar=
d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:james.hilliard1@gmail.com=
" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 1.0.1<br>
Message-ID: &lt;<a href=3D"mailto:20220517202422.1522574-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517202422.1522574-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
License moved and hash changed due to rename and removal of authors:<br>
<a href=3D"https://github.com/wtforms/flask-wtf/commit/d37c22b42202ccf4c8f9=
6c445ceafe72c4c5ed46" target=3D"_blank">https://github.com/wtforms/<wbr>fla=
sk-wtf/commit/<wbr>d37c22b42202ccf4c8f96c445ceafe<wbr>72c4c5ed46</a><br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-flask-wtf/<wbr>python-flask-wtf.hash | 6 +++---<br>
=C2=A0package/python-flask-wtf/<a href=3D"http://python-flask-wtf.mk" targe=
t=3D"_blank">pyth<wbr>on-flask-wtf.mk</a>=C2=A0 =C2=A0| 6 +++---<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/package/python-flask-wtf/<wbr>python-flask-wtf.hash b/package/=
python-flask-wtf/<wbr>python-flask-wtf.hash<br>
index 848d6d7783..01e4290950 100644<br>
--- a/package/python-flask-wtf/<wbr>python-flask-wtf.hash<br>
+++ b/package/python-flask-wtf/<wbr>python-flask-wtf.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# md5, sha256 from <a href=3D"https://pypi.org/pypi/flask-wtf/json" t=
arget=3D"_blank">https://pypi.org/pypi/flask-<wbr>wtf/json</a><br>
-md5=C2=A0 920a5a476ecfb751952b5048cc05fc<wbr>f8=C2=A0 Flask-WTF-0.15.1.tar=
.gz<br>
-sha256=C2=A0 ff177185f891302dc253437fe63081<wbr>e7a46a4e99aca61dfe086fb23e=
54ff<wbr>f2dc=C2=A0 Flask-WTF-0.15.1.tar.gz<br>
+md5=C2=A0 d86dbc0befe30fd577a623a51689b9<wbr>00=C2=A0 Flask-WTF-1.0.1.tar.=
gz<br>
+sha256=C2=A0 34fe5c6fee0f69b50e30f81a3b7ea1<wbr>6aa1492a771fe9ad0974d16461=
0c09<wbr>a6c9=C2=A0 Flask-WTF-1.0.1.tar.gz<br>
=C2=A0# Locally computed sha256 checksums<br>
-sha256=C2=A0 a075f8d98acfdb05dd98716242b9e2<wbr>c1b3ab98722926b3c4cf6c916a=
c14e<wbr>8350=C2=A0 LICENSE<br>
+sha256=C2=A0 d5f19036451578cb36eeef04c99ebf<wbr>7d7ca2e70dcf043636519bc420=
e15a<wbr>7c62=C2=A0 LICENSE.rst<br>
diff --git a/package/python-flask-wtf/<a href=3D"http://python-flask-wtf.mk=
" target=3D"_blank">pyt<wbr>hon-flask-wtf.mk</a> b/package/python-flask-wtf=
/<a href=3D"http://python-flask-wtf.mk" target=3D"_blank">pyt<wbr>hon-flask=
-wtf.mk</a><br>
index e2078103f5..97291e1b26 100644<br>
--- a/package/python-flask-wtf/<a href=3D"http://python-flask-wtf.mk" targe=
t=3D"_blank">pyt<wbr>hon-flask-wtf.mk</a><br>
+++ b/package/python-flask-wtf/<a href=3D"http://python-flask-wtf.mk" targe=
t=3D"_blank">pyt<wbr>hon-flask-wtf.mk</a><br>
@@ -4,11 +4,11 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_FLASK_WTF_VERSION =3D 0.15.1<br>
+PYTHON_FLASK_WTF_VERSION =3D 1.0.1<br>
=C2=A0PYTHON_FLASK_WTF_SOURCE =3D Flask-WTF-$(PYTHON_FLASK_WTF_<wbr>VERSION=
).tar.gz<br>
-PYTHON_FLASK_WTF_SITE =3D <a href=3D"https://files.pythonhosted.org/packag=
es/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3" targ=
et=3D"_blank">https://files.pythonhosted.<wbr>org/packages/9c/b5/<wbr>4b48c=
ece7b31aac2beab115330c297<wbr>8ef4deee3aeb0dd1037c9b7a71b8c3</a><br>
+PYTHON_FLASK_WTF_SITE =3D <a href=3D"https://files.pythonhosted.org/packag=
es/d9/38/d4798dd05be711d666e1befb08b1d3db57bd146d1a14d15657f60c88b446" targ=
et=3D"_blank">https://files.pythonhosted.<wbr>org/packages/d9/38/<wbr>d4798=
dd05be711d666e1befb08b1d3<wbr>db57bd146d1a14d15657f60c88b446</a><br>
=C2=A0PYTHON_FLASK_WTF_LICENSE =3D BSD-3-Clause<br>
-PYTHON_FLASK_WTF_LICENSE_<wbr>FILES =3D LICENSE<br>
+PYTHON_FLASK_WTF_LICENSE_<wbr>FILES =3D LICENSE.rst<br>
=C2=A0PYTHON_FLASK_WTF_SETUP_TYPE =3D setuptools<br>
<br>
=C2=A0$(eval $(python-package))<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 16<br>
Date: Tue, 17 May 2022 22:27:38 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=
=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" targe=
t=3D"_blank">ju.o@free.fr</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: add missing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-numpy dependencies<br>
Message-ID: &lt;20220517222738.532f7bab@<wbr>windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
On Sat, 14 May 2022 16:34:08 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fixes:<br>
&gt; WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUM=
PY<br>
&gt;=C2=A0 =C2=A0Depends on [n]: BR2_PACKAGE_PYTHON3 [=3Dy] &amp;&amp; BR2_=
PACKAGE_PYTHON_NUMPY_ARCH_<wbr>SUPPORTS [=3Dy] &amp;&amp; (BR2_TOOLCHAIN_US=
ES_GLIBC [=3Dn] || BR2_TOOLCHAIN_USES_MUSL [=3Dn])<br>
&gt;=C2=A0 =C2=A0Selected by [y]:<br>
&gt;=C2=A0 =C2=A0- BR2_PACKAGE_OLA_RDM_TESTS [=3Dy] &amp;&amp; BR2_PACKAGE_=
OLA [=3Dy] &amp;&amp; BR2_PACKAGE_OLA_PYTHON_<wbr>BINDINGS [=3Dy] &amp;&amp=
; BR2_PACKAGE_PYTHON_NUMPY_ARCH_<wbr>SUPPORTS [=3Dy]<br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/ola/Config.in | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
Applied to master after adding the appropriate Config.in comment about<br>
this dependency.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" target=3D"_blank">https://bootlin.com</a><b=
r>
<br>
<br>
------------------------------<br>
<br>
Message: 17<br>
Date: Tue, 17 May 2022 14:28:05 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com" target=
=3D"_blank">yegorslists@googlemail.com</a>&gt;, Asaf Kahlon<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:asafka7@gmail.com" target=
=3D"_blank">asafka7@gmail.com</a>&gt;, James Hilliard &lt;<a href=3D"mailto=
:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>=
&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-flask-<wbr>sqlalchemy: bump=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to version 2.5.1<br>
Message-ID: &lt;<a href=3D"mailto:20220517202805.1524501-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517202805.1524501-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python-flask-sqlalchemy/<wbr>python-flask-sqlalchemy.hash=C2=A0 =
=C2=A0 | 6 +++---<br>
=C2=A0package/python-flask-<wbr>sqlalchemy/<a href=3D"http://python-flask-s=
qlalchemy.mk" target=3D"_blank">python-flask-<wbr>sqlalchemy.mk</a>=C2=A0 |=
 4 ++--<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/python-flask-<wbr>sqlalchemy/python-flask-<wbr>sqlalch=
emy.hash b/package/python-flask-<wbr>sqlalchemy/python-flask-<wbr>sqlalchem=
y.hash<br>
index f1fe9775f5..4c2a701eb3 100644<br>
--- a/package/python-flask-<wbr>sqlalchemy/python-flask-<wbr>sqlalchemy.has=
h<br>
+++ b/package/python-flask-<wbr>sqlalchemy/python-flask-<wbr>sqlalchemy.has=
h<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# md5, sha256 from <a href=3D"https://pypi.org/pypi/flask-sqlalchemy/=
json" target=3D"_blank">https://pypi.org/pypi/flask-<wbr>sqlalchemy/json</a=
><br>
-md5=C2=A0 =C2=A0 1f5781cf3e1a2b1aabda47a5b20d20<wbr>73=C2=A0 Flask-SQLAlch=
emy-2.4.1.tar.gz<br>
-sha256 6974785d913666587949f7c2946f70<wbr>01e4fa2cb2d19f4e69ead02e4b8f50<w=
br>b33d=C2=A0 Flask-SQLAlchemy-2.4.1.tar.gz<br>
+md5=C2=A0 dcb6b62248ced71dab183f2cb27785<wbr>83=C2=A0 Flask-SQLAlchemy-2.5=
.1.tar.gz<br>
+sha256=C2=A0 2bda44b43e7cacb15d4e05ff3cc1f8<wbr>bc97936cc464623424102bfc2c=
35e9<wbr>5912=C2=A0 Flask-SQLAlchemy-2.5.1.tar.gz<br>
=C2=A0# Locally computed sha256 checksums<br>
-sha256 489a8e1108509ed98a37bb983e11e0<wbr>f7e1d31f0bd8f99a79c8448e7ff37d<w=
br>07ea=C2=A0 LICENSE.rst<br>
+sha256=C2=A0 489a8e1108509ed98a37bb983e11e0<wbr>f7e1d31f0bd8f99a79c8448e7f=
f37d<wbr>07ea=C2=A0 LICENSE.rst<br>
diff --git a/package/python-flask-<wbr>sqlalchemy/<a href=3D"http://python-=
flask-sqlalchemy.mk" target=3D"_blank">python-flask-<wbr>sqlalchemy.mk</a> =
b/package/python-flask-<wbr>sqlalchemy/<a href=3D"http://python-flask-sqlal=
chemy.mk" target=3D"_blank">python-flask-<wbr>sqlalchemy.mk</a><br>
index c6d0094b41..b1d00ad6c0 100644<br>
--- a/package/python-flask-<wbr>sqlalchemy/<a href=3D"http://python-flask-s=
qlalchemy.mk" target=3D"_blank">python-flask-<wbr>sqlalchemy.mk</a><br>
+++ b/package/python-flask-<wbr>sqlalchemy/<a href=3D"http://python-flask-s=
qlalchemy.mk" target=3D"_blank">python-flask-<wbr>sqlalchemy.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_FLASK_SQLALCHEMY_<wbr>VERSION =3D 2.4.1<br>
+PYTHON_FLASK_SQLALCHEMY_<wbr>VERSION =3D 2.5.1<br>
=C2=A0PYTHON_FLASK_SQLALCHEMY_<wbr>SOURCE =3D Flask-SQLAlchemy-$(PYTHON_<wb=
r>FLASK_SQLALCHEMY_VERSION).tar.<wbr>gz<br>
-PYTHON_FLASK_SQLALCHEMY_SITE =3D <a href=3D"https://files.pythonhosted.org=
/packages/52/7a/35bacbedafdc652d5198b80eb22eacccae0c97a49740a45da828b05cc37=
b" target=3D"_blank">https://files.pythonhosted.<wbr>org/packages/52/7a/<wb=
r>35bacbedafdc652d5198b80eb22eac<wbr>ccae0c97a49740a45da828b05cc37b</a><br>
+PYTHON_FLASK_SQLALCHEMY_SITE =3D <a href=3D"https://files.pythonhosted.org=
/packages/35/f0/39dd2d8e7e5223f78a5206d7020dc0e16718a964acfb3564d89e9798ab9=
b" target=3D"_blank">https://files.pythonhosted.<wbr>org/packages/35/f0/<wb=
r>39dd2d8e7e5223f78a5206d7020dc0<wbr>e16718a964acfb3564d89e9798ab9b</a><br>
=C2=A0PYTHON_FLASK_SQLALCHEMY_<wbr>SETUP_TYPE =3D setuptools<br>
=C2=A0PYTHON_FLASK_SQLALCHEMY_<wbr>LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_FLASK_SQLALCHEMY_<wbr>LICENSE_FILES =3D LICENSE.rst<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 18<br>
Date: Tue, 17 May 2022 14:32:35 -0600<br>
From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targe=
t=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: S?bastien Szymanski &lt;<a href=3D"mailto:sebastien.szymanski@armadeus.=
com" target=3D"_blank">sebastien.szymanski@armadeus.<wbr>com</a>&gt;, Asaf<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Kahlon &lt;<a href=3D"mailto:asafka7@gmail.com"=
 target=3D"_blank">asafka7@gmail.com</a>&gt;, Yegor Yefremov<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yegorslists@googlemail.co=
m" target=3D"_blank">yegorslists@googlemail.com</a>&gt;, James Hilliard<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:james.hilliard1@gmail.com=
" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 0.6.1<br>
Message-ID: &lt;<a href=3D"mailto:20220517203235.1525998-1-james.hilliard1@=
gmail.com" target=3D"_blank">20220517203235.1525998-1-<wbr>james.hilliard1@=
gmail.com</a>&gt;<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-flask-login/<wbr>python-flask-login.hash | 9 ++++-----=
<br>
=C2=A0package/python-flask-login/<a href=3D"http://python-flask-login.mk" t=
arget=3D"_blank">py<wbr>thon-flask-login.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 6 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/package/python-flask-login/<wbr>python-flask-login.hash b/pack=
age/python-flask-login/<wbr>python-flask-login.hash<br>
index 9ff1f82a09..d11e37cce8 100644<br>
--- a/package/python-flask-login/<wbr>python-flask-login.hash<br>
+++ b/package/python-flask-login/<wbr>python-flask-login.hash<br>
@@ -1,6 +1,5 @@<br>
-# From <a href=3D"https://pypi.org/project/Flask-Login/#copy-hash-modal-8b=
b2ac58-b80a-4793-84d4-4f32b92976d9-md5" target=3D"_blank">https://pypi.org/=
project/<wbr>Flask-Login/#copy-hash-modal-<wbr>8bb2ac58-b80a-4793-84d4-<wbr=
>4f32b92976d9<br>
-md5</a>=C2=A0 a2d94aa6ae935345ebc68eb3cbb5fc<wbr>cd=C2=A0 Flask-Login-0.5.=
0.tar.gz<br>
-sha256=C2=A0 6d33aef15b5bcead780acc339464aa<wbr>e8a6e28f13c90d8b1cf9de8b54=
9d1c<wbr>0b4b=C2=A0 Flask-Login-0.5.0.tar.gz<br>
-<br>
-# License files<br>
+# md5, sha256 from <a href=3D"https://pypi.org/pypi/flask-login/json" targ=
et=3D"_blank">https://pypi.org/pypi/flask-<wbr>login/json</a><br>
+md5=C2=A0 0a1576eab473c2a8bb576348333d5e<wbr>f5=C2=A0 Flask-Login-0.6.1.ta=
r.gz<br>
+sha256=C2=A0 1306d474a270a036d6fd14f45640c4<wbr>d77355e4f1c67ca4331b372d34=
4899<wbr>7b8c=C2=A0 Flask-Login-0.6.1.tar.gz<br>
+# Locally computed sha256 checksums<br>
=C2=A0sha256=C2=A0 7a9dfb9c5da204ed1370f3b62c13e2<wbr>992a12da1da707f47e156=
897eeb434<wbr>4e5b=C2=A0 LICENSE<br>
diff --git a/package/python-flask-login/<a href=3D"http://python-flask-logi=
n.mk" target=3D"_blank">p<wbr>ython-flask-login.mk</a> b/package/python-fla=
sk-login/<a href=3D"http://python-flask-login.mk" target=3D"_blank">p<wbr>y=
thon-flask-login.mk</a><br>
index efb63b262b..9a11fde542 100644<br>
--- a/package/python-flask-login/<a href=3D"http://python-flask-login.mk" t=
arget=3D"_blank">p<wbr>ython-flask-login.mk</a><br>
+++ b/package/python-flask-login/<a href=3D"http://python-flask-login.mk" t=
arget=3D"_blank">p<wbr>ython-flask-login.mk</a><br>
@@ -4,9 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#############################<wbr>##############################<wbr>=
#####################<br>
<br>
-PYTHON_FLASK_LOGIN_VERSION =3D 0.5.0<br>
+PYTHON_FLASK_LOGIN_VERSION =3D 0.6.1<br>
=C2=A0PYTHON_FLASK_LOGIN_SOURCE =3D Flask-Login-$(PYTHON_FLASK_<wbr>LOGIN_V=
ERSION).tar.gz<br>
-PYTHON_FLASK_LOGIN_SITE =3D <a href=3D"https://files.pythonhosted.org/pack=
ages/f9/01/f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d" ta=
rget=3D"_blank">https://files.pythonhosted.<wbr>org/packages/f9/01/<wbr>f6c=
0a3a654ca125cf9cd273314c03a<wbr>8bc6a47bf861765c8c1d375e15a28d</a><br>
+PYTHON_FLASK_LOGIN_SITE =3D <a href=3D"https://files.pythonhosted.org/pack=
ages/3c/0a/e376d599eb6a8999b803a8d390e32451e43a346dbe540350dad48be0069c" ta=
rget=3D"_blank">https://files.pythonhosted.<wbr>org/packages/3c/0a/<wbr>e37=
6d599eb6a8999b803a8d390e324<wbr>51e43a346dbe540350dad48be0069c</a><br>
=C2=A0PYTHON_FLASK_LOGIN_LICENSE =3D MIT<br>
=C2=A0PYTHON_FLASK_LOGIN_LICENSE_<wbr>FILES =3D LICENSE<br>
=C2=A0PYTHON_FLASK_LOGIN_SETUP_TYPE =3D setuptools<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 19<br>
Date: Tue, 17 May 2022 22:40:27 +0200<br>
From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1998@free.=
fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: Linus Kaschulla &lt;<a href=3D"mailto:linus@cosmos-ink.net" target=3D"_=
blank">linus@cosmos-ink.net</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cases<br>
Message-ID: &lt;20220517204027.GS1597494@<wbr>scaer&gt;<br>
Content-Type: text/plain; charset=3Dutf-8<br>
<br>
Linus, All,<br>
<br>
On 2022-05-17 14:19 +0000, Linus Kaschulla via buildroot spake thusly:<br>
&gt; For the new patch, adding block size options (commit 555f8dfd),<br>
&gt; Yann E. MORIN requested updated testcases that specifically ensure<br>
&gt; the extreme blocksizes (4K and 1024K) don&#39;t cause issues.<br>
&gt; <br>
&gt; This patch splits the current test case in 2, testing with both<br>
&gt; block sizes and ensuring the block size was applied in the same<br>
&gt; fashion as for the specified compression.<br>
&gt; <br>
&gt; Signed-off-by: Linus Kaschulla &lt;<a href=3D"mailto:linus@cosmos-ink.=
net" target=3D"_blank">linus@cosmos-ink.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 support/testing/tests/fs/test_<wbr>squashfs.py | 17 ++++++++++++=
++++-<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/support/testing/tests/fs/<wbr>test_squashfs.py b/support/=
testing/tests/fs/<wbr>test_squashfs.py<br>
&gt; index a914f5aac7..07239fcce2 100644<br>
&gt; --- a/support/testing/tests/fs/<wbr>test_squashfs.py<br>
&gt; +++ b/support/testing/tests/fs/<wbr>test_squashfs.py<br>
&gt; @@ -3,13 +3,15 @@ import os<br>
&gt;=C2=A0 import infra.basetest<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
&gt; +class TestSquashfsMinBlocksize(<wbr>infra.basetest.BRTest):<br>
<br>
In fact I think we need to keep the existing test that uses the default<br>
value too.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 config =3D infra.basetest.BASIC_<wbr>TOOLCHAIN_CON=
FIG + \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS_BS_<wbr>4K=3Dy=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS4_<wbr>LZO=
=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 expected_blocksize_in_bytes =3D 1024 * 4<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_run(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsquashfs_cmd =3D [&quot;host/bin/u=
nsquashfs&quot;, &quot;-s&quot;, &quot;images/rootfs.squashfs&quot;]<br>
&gt; @@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(out[0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Found a valid SQUASHFS 4:0 superblock on i=
mages/rootfs.squashfs.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(out[3], &quot;Compr=
ession lzo&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(out[4], &quot;Block size=
 {}&quot;.format(self.expected_<wbr>blocksize_in_bytes))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 img =3D os.path.join(self.builddir, =
&quot;images&quot;, &quot;rootfs.squashfs&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 infra.img_round_power2(img)<br>
&gt; @@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mount | grep &#39;/dev=
/root on / type squashfs&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(cmd)<br>
&gt; +<br>
<br>
=C2=A0 =C2=A0 $ make check-flake8<br>
=C2=A0 =C2=A0 WARNING: support/testing/tests/fs/test_<wbr>squashfs.py:40:1:=
 E302 expected 2 blank lines, found 1<br>
<br>
Yes, like check-package, this is 100% totally undocumented. :-]<br>
<br>
So, I&#39;ve restored the original test that checks the default, and two ne=
w<br>
tersts that check the min and max, and I fixed the flake8 issue.<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; +# Reusing TestSquashfsMinBlocksize&#39;s test_run(), but change<br>
&gt; +# blocksize in config the maxium to ensure all extemes work.<br>
&gt; +class TestSquashfsMaxBlocksize(<wbr>TestSquashfsMinBlocksize):<br>
&gt; +=C2=A0 =C2=A0 config =3D infra.basetest.BASIC_<wbr>TOOLCHAIN_CONFIG +=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS_BS_<wbr>1024K=
=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS4_<wbr>LZO=3Dy<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 expected_blocksize_in_bytes =3D 1024 * 1024<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
-- <br>
.-----------------.-----------<wbr>---------.------------------.-<wbr>-----=
--------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" target=3D"_blank">http://ymorin.=
is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=
=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;-----------------------------<wbr>-^-------^------------------^-<wbr>-=
------------------&#39;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 20<br>
Date: Tue, 17 May 2022 22:40:45 +0200<br>
From: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=
=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] fs/squashfs: needs more test cases<br>
Message-ID: &lt;<a href=3D"mailto:20220517202947.81E3985F81@busybox.osuosl.=
org" target=3D"_blank">20220517202947.81E3985F81@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D001e0aa=
b23c832579b6a5c046db8f5b0716cea61" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>001e0aab23c832579b6a5c046db8f5<wbr>b07=
16cea61</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
For the new patch, adding block size options (commit 555f8dfd),<br>
Yann E. MORIN requested updated testcases that specifically ensure<br>
the extreme blocksizes (4K and 1024K) don&#39;t cause issues.<br>
<br>
This patch splits the current test case in 2, testing with both<br>
block sizes and ensuring the block size was applied in the same<br>
fashion as for the specified compression.<br>
<br>
Signed-off-by: Linus Kaschulla &lt;<a href=3D"mailto:linus@cosmos-ink.net" =
target=3D"_blank">linus@cosmos-ink.net</a>&gt;<br>
[<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.19=
98@free.fr</a>: keep exisitng test with default size]<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
---<br>
=C2=A0support/testing/tests/fs/<wbr>test_squashfs.py | 24 +++++++++++++++++=
+++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
<br>
diff --git a/support/testing/tests/fs/<wbr>test_squashfs.py b/support/testi=
ng/tests/fs/<wbr>test_squashfs.py<br>
index a914f5aac7..0ceb4cab58 100644<br>
--- a/support/testing/tests/fs/<wbr>test_squashfs.py<br>
+++ b/support/testing/tests/fs/<wbr>test_squashfs.py<br>
@@ -10,6 +10,7 @@ class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_SQUASHFS4_<wbr>LZO=3Dy<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# BR2_TARGET_ROOTFS_TAR is not set<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 expected_blocksize_in_bytes =3D 128*1024<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_run(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsquashfs_cmd =3D [&quot;host/bin/unsqua=
shfs&quot;, &quot;-s&quot;, &quot;images/rootfs.squashfs&quot;]<br>
@@ -18,6 +19,7 @@ class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(out[0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Found a valid SQUASHFS 4:0 superblock on images/roo=
tfs.squashfs.&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(out[3], &quot;Compressio=
n lzo&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(out[4], &quot;Block size {}&q=
uot;.format(self.expected_<wbr>blocksize_in_bytes))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img =3D os.path.join(self.builddir, &quot=
;images&quot;, &quot;rootfs.squashfs&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.img_round_power2(img)<br>
@@ -31,3 +33,25 @@ class TestSquashfs(infra.basetest.<wbr>BRTest):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;mount | grep &#39;/dev/root=
 on / type squashfs&#39;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertRunOk(cmd)<br>
+<br>
+<br>
+class TestSquashfsMinBlocksize(<wbr>TestSquashfs):<br>
+=C2=A0 =C2=A0 config =3D infra.basetest.BASIC_<wbr>TOOLCHAIN_CONFIG + \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS_BS_<wbr>4K=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS4_<wbr>LZO=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 expected_blocksize_in_bytes =3D 4*1024<br>
+<br>
+<br>
+class TestSquashfsMaxBlocksize(<wbr>TestSquashfs):<br>
+=C2=A0 =C2=A0 config =3D infra.basetest.BASIC_<wbr>TOOLCHAIN_CONFIG + \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS_BS_<wbr>1024K=3Dy<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TARGET_ROOTFS_SQUASHFS4_<wbr>LZO=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 expected_blocksize_in_bytes =3D 1024*1024<br>
<br>
<br>
------------------------------<br>
<br>
Message: 21<br>
Date: Tue, 17 May 2022 22:43:17 +0200<br>
From: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"=
_blank">romain.naour@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_b=
lank">romain.naour@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH] package/python-service-<wbr>identity: add<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing python-six runtime dependency<br>
Message-ID: &lt;<a href=3D"mailto:20220517204317.198644-1-romain.naour@gmai=
l.com" target=3D"_blank">20220517204317.198644-1-<wbr>romain.naour@gmail.co=
m</a>&gt;<br>
<br>
python-service-identity 21.1.0 release requires python-six at runtime [1].<=
br>
<br>
Fixes:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841098" ta=
rget=3D"_blank">https://gitlab.com/buildroot.<wbr>org/buildroot/-/jobs/<wbr=
>2459841098</a><br>
<br>
[1] <a href=3D"https://github.com/pyca/service-identity/commit/705f4af829ad=
f4d1b6e44250d8039635a73199d5" target=3D"_blank">https://github.com/pyca/<wb=
r>service-identity/commit/<wbr>705f4af829adf4d1b6e44250d80396<wbr>35a73199d=
5</a><br>
<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" t=
arget=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-service-<wbr>identity/Config.in | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/python-service-<wbr>identity/Config.in b/package/pytho=
n-service-<wbr>identity/Config.in<br>
index d6ca060562..09ebd97a65 100644<br>
--- a/package/python-service-<wbr>identity/Config.in<br>
+++ b/package/python-service-<wbr>identity/Config.in<br>
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_<wbr>IDENTITY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_PYASN1 # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_PYASN1_<wbr>MODULES #=
 runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_SIX # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Service identity verification for pyOpen=
SSL.<br>
<br>
-- <br>
2.35.3<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 22<br>
Date: Tue, 17 May 2022 22:44:06 +0200<br>
From: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=
=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/alchemy: add host-pkgconf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependency<br>
Message-ID: &lt;<a href=3D"mailto:20220517203344.59DCD85F8A@busybox.osuosl.=
org" target=3D"_blank">20220517203344.59DCD85F8A@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D837e312=
8687a1c892ff796b80b26edc4b1186d73" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>837e3128687a1c892ff796b80b26ed<wbr>c4b=
1186d73</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
host-pkgconf is a mandatory dependency since the addition of the package<br=
>
in commit 7f1f3f87868fa333833dbba9f4f07a<wbr>dc338b34ed resulting in the<br=
>
following ulog build failure:<br>
<br>
/home/buildroot/autobuild/run/<wbr>instance-0/output-1/per-<wbr>package/ulo=
g/host/opt/alchemy/<a href=3D"http://check.mk:36" target=3D"_blank"><wbr>ch=
eck.mk:36</a>: *** &#39;pkg-config&#39; is required.=C2=A0 Stop.<br>
<br>
An other option would be to set TARGET_OS to baremetal but it could have<br=
>
unexpected side-effects such as removing -fPIC for arm targets<br>
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.org/results/c731fe0e9bdbfce08=
23f9c48641f1ed710fa6125" target=3D"_blank">http://autobuild.buildroot.<wbr>=
org/results/<wbr>c731fe0e9bdbfce0823f9c48641f1e<wbr>d710fa6125</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
Reviewed-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" tar=
get=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
Reviewed-by: Herve Codina &lt;<a href=3D"mailto:herve.codina@bootlin.com" t=
arget=3D"_blank">herve.codina@bootlin.com</a>&gt;<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
---<br>
=C2=A0package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">alche=
my.mk</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank=
">alchemy.mk</a> b/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"=
_blank">alchemy.mk</a><br>
index 18cdd0a645..10d1068ac4 100644<br>
--- a/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">alche=
my.mk</a><br>
+++ b/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">alche=
my.mk</a><br>
@@ -8,7 +8,7 @@ ALCHEMY_VERSION =3D d95b3c38cd37814a1b98d0bbf813de<wbr>7ada=
aecfbc<br>
=C2=A0ALCHEMY_SITE =3D $(call github,Parrot-Developers,<wbr>alchemy,$(ALCHE=
MY_VERSION))<br>
=C2=A0ALCHEMY_LICENSE =3D BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)<br>
=C2=A0ALCHEMY_LICENSE_FILES =3D COPYING README<br>
-HOST_ALCHEMY_DEPENDENCIES =3D host-python3<br>
+HOST_ALCHEMY_DEPENDENCIES =3D host-pkgconf host-python3<br>
<br>
=C2=A0ALCHEMY_HOME =3D $(HOST_DIR)/opt/alchemy<br>
=C2=A0ALCHEMY_SDK_BASEDIR =3D $(STAGING_DIR)/usr/lib/<wbr>alchemy/sdk<br>
@@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ALCHEMY_HOME=3D$(ALCHEMY_HOME) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ALCHEMY_WORKSPACE_DIR=3D&quot;$(@D)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ALCHEMY_TARGET_OUT=3Dalchemy-out \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PKGCONFIG_BIN=3D$(PKG_CONFIG_<wbr>HOST_BINARY) =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_OS=3Dlinux \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_OS_FLAVOUR=3Dbuildroot \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_CROSS=3D&quot;$(TARGET_CROSS)&quot; \<br=
>
<br>
<br>
------------------------------<br>
<br>
Message: 23<br>
Date: Tue, 17 May 2022 22:45:48 +0200<br>
From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1998@free.=
fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" targ=
et=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Herv? Codina &lt;<a href=3D"mailto:herve.codina@bootlin.=
com" target=3D"_blank">herve.codina@bootlin.com</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependency<br>
Message-ID: &lt;20220517204548.GT1597494@<wbr>scaer&gt;<br>
Content-Type: text/plain; charset=3Dutf-8<br>
<br>
Fabrice, All,<br>
<br>
On 2022-05-13 22:28 +0200, Fabrice Fontaine spake thusly:<br>
&gt; host-pkgconf is a mandatory dependency since the addition of the packa=
ge<br>
&gt; in commit 7f1f3f87868fa333833dbba9f4f07a<wbr>dc338b34ed resulting in t=
he<br>
&gt; following ulog build failure:<br>
&gt; <br>
&gt; /home/buildroot/autobuild/run/<wbr>instance-0/output-1/per-<wbr>packag=
e/ulog/host/opt/alchemy/<a href=3D"http://check.mk:36" target=3D"_blank"><w=
br>check.mk:36</a>: *** &#39;pkg-config&#39; is required.=C2=A0 Stop.<br>
&gt; <br>
&gt; An other option would be to set TARGET_OS to baremetal but it could ha=
ve<br>
&gt; unexpected side-effects such as removing -fPIC for arm targets<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/c731fe0e9bdb=
fce0823f9c48641f1ed710fa6125" target=3D"_blank">http://autobuild.buildroot.=
<wbr>org/results/<wbr>c731fe0e9bdbfce0823f9c48641f1e<wbr>d710fa6125</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">=
alchemy.mk</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_=
blank">alchemy.mk</a> b/package/alchemy/<a href=3D"http://alchemy.mk" targe=
t=3D"_blank">alchemy.mk</a><br>
&gt; index 18cdd0a645..10d1068ac4 100644<br>
&gt; --- a/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">=
alchemy.mk</a><br>
&gt; +++ b/package/alchemy/<a href=3D"http://alchemy.mk" target=3D"_blank">=
alchemy.mk</a><br>
&gt; @@ -8,7 +8,7 @@ ALCHEMY_VERSION =3D d95b3c38cd37814a1b98d0bbf813de<wbr=
>7adaaecfbc<br>
&gt;=C2=A0 ALCHEMY_SITE =3D $(call github,Parrot-Developers,<wbr>alchemy,$(=
ALCHEMY_VERSION))<br>
&gt;=C2=A0 ALCHEMY_LICENSE =3D BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)<br=
>
&gt;=C2=A0 ALCHEMY_LICENSE_FILES =3D COPYING README<br>
&gt; -HOST_ALCHEMY_DEPENDENCIES =3D host-python3<br>
&gt; +HOST_ALCHEMY_DEPENDENCIES =3D host-pkgconf host-python3<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ALCHEMY_HOME =3D $(HOST_DIR)/opt/alchemy<br>
&gt;=C2=A0 ALCHEMY_SDK_BASEDIR =3D $(STAGING_DIR)/usr/lib/<wbr>alchemy/sdk<=
br>
&gt; @@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ALCHEMY_HOME=3D$(ALCHEMY_HOME) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ALCHEMY_WORKSPACE_DIR=3D&quot;$(@D)&quot; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ALCHEMY_TARGET_OUT=3Dalchemy-<wbr>out \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PKGCONFIG_BIN=3D$(PKG_CONFIG_<wbr>HOST_BINARY) \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_OS=3Dlinux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_OS_FLAVOUR=3Dbuildroot \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_CROSS=3D&quot;$(TARGET_CROSS)<wbr>&qu=
ot; \<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
-- <br>
.-----------------.-----------<wbr>---------.------------------.-<wbr>-----=
--------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" target=3D"_blank">http://ymorin.=
is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=
=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;-----------------------------<wbr>-^-------^------------------^-<wbr>-=
------------------&#39;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 24<br>
Date: Tue, 17 May 2022 22:48:09 +0200<br>
From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" target=3D"_bl=
ank">ps.report@gmx.net</a>&gt;<br>
To: Jarkko Sakkinen &lt;<a href=3D"mailto:jarkko.sakkinen@iki.fi" target=3D=
"_blank">jarkko.sakkinen@iki.fi</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] selftests/sgx<br>
Message-ID: &lt;<a href=3D"mailto:20220517224809.21f77949@gmx.net" target=
=3D"_blank">20220517224809.21f77949@gmx.<wbr>net</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
Hello Jarkko,<br>
<br>
On Tue, 17 May 2022 20:06:51 +0300, Jarkko Sakkinen &lt;<a href=3D"mailto:j=
arkko.sakkinen@iki.fi" target=3D"_blank">jarkko.sakkinen@iki.fi</a>&gt; wro=
te:<br>
<br>
&gt; On Sun, 2022-05-08 at 23:38 +0200, Peter Seiderer wrote:<br>
&gt; &gt; Hello Jarkko,<br>
&gt; &gt; <br>
&gt; &gt; On Sat, 07 May 2022 23:03:57 +0300, Jarkko Sakkinen &lt;<a href=
=3D"mailto:jarkko.sakkinen@iki.fi" target=3D"_blank">jarkko.sakkinen@iki.fi=
</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; When specifying &quot;BR2_PACKAGE_LINUX_TOOLS_<wbr>SELFTESTS=
=3Dy&quot;, for some reason<br>
&gt; &gt; &gt; tools/testing/selftests/sgx/ build results, i.e. &quot;sgx:t=
est_sgx&quot;, does<br>
&gt; &gt; &gt; not get included to the rootfs image, nor is it listed in?<b=
r>
&gt; &gt; &gt; kselftest-list.txt.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If I manually compile and install selftests, it does get inc=
luded. Any<br>
&gt; &gt; &gt; ideas what could be wrong?=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; For which architecture do you (cross) compile (what is your targe=
t architecture)?<br>
&gt; &gt; <br>
&gt; &gt; According to e.g. [1]:<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; ? 7 CAN_BUILD_X86_64 :=3D $(shell ../x86/check_cc.sh $(CC) \<br>
&gt; &gt; ? 8?? <br>
&gt; &gt; [...]<br>
&gt; &gt; ?19 TEST_CUSTOM_PROGS :=3D $(OUTPUT)/test_sgx<br>
&gt; &gt; ?20 <br>
&gt; &gt; ?21 ifeq ($(CAN_BUILD_X86_64), 1)<br>
&gt; &gt; ?22 all: $(TEST_CUSTOM_PROGS) $(OUTPUT)/test_encl.elf<br>
&gt; &gt; ?23 endif<br>
&gt; &gt; [...]=C2=A0 <br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; My config is contained fully here:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/jarkkojs/buildroot-sgx/blob/master/confi=
gs/sgx_x86_64_defconfig" target=3D"_blank">https://github.com/jarkkojs/<wbr=
>buildroot-sgx/blob/master/<wbr>configs/sgx_x86_64_defconfig</a><br>
&gt; <br>
&gt; And my kernel config is here:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/jarkkojs/buildroot-sgx/blob/master/board=
/sgx/x86_64/linux.config" target=3D"_blank">https://github.com/jarkkojs/<wb=
r>buildroot-sgx/blob/master/<wbr>board/sgx/x86_64/linux.config</a><br>
&gt; <br>
&gt; I.e. can be built with &quot;make sgx_x86_64_defconfig &amp;&amp; make=
&quot;.<br>
&gt; <br>
<br>
The original error message from linux-5.17.7/tools/testing/<wbr>selftests/s=
gx is<br>
(Note: no global failure in linux-tools/selftests in case one or more of th=
e<br>
test case compiles fail):<br>
<br>
=C2=A0 .../host/bin/x86_64-buildroot-<wbr>linux-gnu-gcc -Wall -Werror -g -I=
../../../../tools/include -fPIC -z noexecstack -c sigstruct.c -o .../build/=
linux-5.17.7/tools/<wbr>testing/selftests/kselftest/<wbr>sgx/sigstruct.o<br=
>
=C2=A0 sigstruct.c:15:10: fatal error: openssl/err.h: No such file or direc=
tory<br>
=C2=A0 =C2=A0 =C2=A015 | #include &lt;openssl/err.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~<br>
=C2=A0 compilation terminated.<br>
<br>
You need to enable &#39;BR2_PACKAGE_OPENSSL&#39; in your defconfig and appl=
y<br>
the following buildroot patch:<br>
<br>
--- a/package/linux-tools/<a href=3D"http://linux-tool-selftests.mk.in" tar=
get=3D"_blank">linux-<wbr>tool-selftests.mk.in</a><br>
+++ b/package/linux-tools/<a href=3D"http://linux-tool-selftests.mk.in" tar=
get=3D"_blank">linux-<wbr>tool-selftests.mk.in</a><br>
@@ -18,6 +18,10 @@ endif<br>
<br>
=C2=A0SELFTESTS_DEPENDENCIES =3D libcap-ng popt<br>
<br>
+ifeq ($(BR2_PACKAGE_OPENSSL),y)<br>
+SELFTESTS_DEPENDENCIES +=3D openssl<br>
+endif<br>
+<br>
=C2=A0SELFTESTS_MAKE_FLAGS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LINUX_MAKE_FLAGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCH=3D$(SELFTESTS_ARCH)<br>
<br>
<br>
Regards,<br>
Peter<br>
<br>
<br>
&gt; &gt; test_sgx is only compiled for x86_64 (and/or CAN_BUILD_X86_64 is =
true)...<br>
&gt; &gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Peter=C2=A0 <br>
&gt; <br>
&gt; BR, Jarkko<br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 25<br>
Date: Tue, 17 May 2022 22:50:33 +0200<br>
From: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=
=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/python-avro: fix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 capitalizations of Parse<br>
Message-ID: &lt;<a href=3D"mailto:20220517204033.AB52385F91@busybox.osuosl.=
org" target=3D"_blank">20220517204033.AB52385F91@<wbr>busybox.osuosl.org</a=
>&gt;<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D5468cf1=
095f236fc01f16015a7cf6cfeee69fe55" target=3D"_blank">https://git.buildroot.=
net/<wbr>buildroot/commit/?id=3D<wbr>5468cf1095f236fc01f16015a7cf6c<wbr>fee=
e69fe55</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" target=3D"_blank">https://git.buildroot.net/<wbr>buildroot/comm=
it/?id=3Drefs/<wbr>heads/master</a><br>
<br>
python-avro 1.11.0 deprecated schema.Parse [1] and actually error<br>
out when used.<br>
<br>
Fixes:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770" ta=
rget=3D"_blank">https://gitlab.com/buildroot.<wbr>org/buildroot/-/jobs/<wbr=
>2429013770</a><br>
<br>
[1] <a href=3D"https://github.com/apache/avro/commit/3e79dfec8461fb0157f068=
cff7ba24be8cdfa9d8" target=3D"_blank">https://github.com/apache/<wbr>avro/c=
ommit/<wbr>3e79dfec8461fb0157f068cff7ba24<wbr>be8cdfa9d8</a><br>
<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" t=
arget=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
---<br>
=C2=A0support/testing/tests/<wbr>package/sample_python_avro.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/support/testing/tests/<wbr>package/sample_python_avro.py b/sup=
port/testing/tests/<wbr>package/sample_python_avro.py<br>
index 79d2dcdb22..46363ad2bf 100644<br>
--- a/support/testing/tests/<wbr>package/sample_python_avro.py<br>
+++ b/support/testing/tests/<wbr>package/sample_python_avro.py<br>
@@ -1,8 +1,8 @@<br>
=C2=A0from io import BytesIO<br>
-from avro.schema import Parse<br>
+from avro.schema import parse<br>
=C2=A0from <a href=3D"http://avro.io" target=3D"_blank">avro.io</a> import =
DatumReader, BinaryDecoder<br>
<br>
-schema =3D Parse(&quot;&quot;&quot;{<br>
+schema =3D parse(&quot;&quot;&quot;{<br>
=C2=A0&quot;namespace&quot;: &quot;org.buildroot.package.python_<wbr>avro&q=
uot;,<br>
=C2=A0&quot;type&quot;: &quot;record&quot;,<br>
=C2=A0&quot;name&quot;: &quot;Developer&quot;,<br>
<br>
<br>
------------------------------<br>
<br>
Message: 26<br>
Date: Tue, 17 May 2022 22:52:31 +0200<br>
From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1998@free.=
fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_b=
lank">romain.naour@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] [PATCH] package/python-avro: fix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 capitalizations of Parse<br>
Message-ID: &lt;20220517205231.GU1597494@<wbr>scaer&gt;<br>
Content-Type: text/plain; charset=3Dutf-8<br>
<br>
Romain, All,<br>
<br>
On 2022-05-14 17:05 +0200, Romain Naour spake thusly:<br>
&gt; python-avro 1.11.0 deprecated schema.Parse [1] and actually error<br>
&gt; out when used.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/242901377=
0" target=3D"_blank">https://gitlab.com/buildroot.<wbr>org/buildroot/-/jobs=
/<wbr>2429013770</a><br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/apache/avro/commit/3e79dfec8461fb015=
7f068cff7ba24be8cdfa9d8" target=3D"_blank">https://github.com/apache/<wbr>a=
vro/commit/<wbr>3e79dfec8461fb0157f068cff7ba24<wbr>be8cdfa9d8</a><br>
&gt; <br>
&gt; Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.c=
om" target=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 support/testing/tests/package/<wbr>sample_python_avro.py | 4 ++-=
-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/support/testing/tests/<wbr>package/sample_python_avro.py =
b/support/testing/tests/<wbr>package/sample_python_avro.py<br>
&gt; index 79d2dcdb22..46363ad2bf 100644<br>
&gt; --- a/support/testing/tests/<wbr>package/sample_python_avro.py<br>
&gt; +++ b/support/testing/tests/<wbr>package/sample_python_avro.py<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt;=C2=A0 from io import BytesIO<br>
&gt; -from avro.schema import Parse<br>
&gt; +from avro.schema import parse<br>
&gt;=C2=A0 from <a href=3D"http://avro.io" target=3D"_blank">avro.io</a> im=
port DatumReader, BinaryDecoder<br>
&gt;=C2=A0 <br>
&gt; -schema =3D Parse(&quot;&quot;&quot;{<br>
&gt; +schema =3D parse(&quot;&quot;&quot;{<br>
&gt;=C2=A0 &quot;namespace&quot;: &quot;org.buildroot.package.python_<wbr>a=
vro&quot;,<br>
&gt;=C2=A0 &quot;type&quot;: &quot;record&quot;,<br>
&gt;=C2=A0 &quot;name&quot;: &quot;Developer&quot;,<br>
&gt; -- <br>
&gt; 2.35.3<br>
&gt; <br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
-- <br>
.-----------------.-----------<wbr>---------.------------------.-<wbr>-----=
--------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" target=3D"_blank">http://ymorin.=
is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=
=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;-----------------------------<wbr>-^-------^------------------^-<wbr>-=
------------------&#39;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 27<br>
Date: Tue, 17 May 2022 22:56:24 +0200<br>
From: Linus &lt;<a href=3D"mailto:linus@cosmos-ink.net" target=3D"_blank"><=
/a></blockquote>

--000000000000216e6105df47b0af--

--===============4809040800291213025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4809040800291213025==--

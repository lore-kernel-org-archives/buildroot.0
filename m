Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86443C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 11:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A60607B5;
	Sun,  7 Aug 2022 11:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A60607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7iqUK7Gukqi; Sun,  7 Aug 2022 11:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1317A607CA;
	Sun,  7 Aug 2022 11:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1317A607CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 898001BF42E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 11:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED1E407D7
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 11:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED1E407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fVoLSdU43Fg for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 11:47:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072C0400B0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 072C0400B0
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 11:47:30 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id d139so5119873iof.4
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 04:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=jdW+B29GdyL3oL0PlsdVIlbo91emdha1kruuWJyzKwk=;
 b=GfJmda1QVIxzhuTPduYuyTvlAyiZ2nbdCnO6PFzaKPmkQ7Y45uldAXuxZD74aPU5bo
 i+9CbSf+xtaK8Api6F12Z+mIOYoVyHgLItYlhE4x6sDoorBfuysio8/zDPDQUBHz9NCS
 TaJfYZFVQq0/0XF1uSMOKRQQ55kHrVeHbLzv1AcyauXOl3zH3b5F9OyFbqawqi/qUvFU
 c1BH6ovFL3l8qWoKhWSfopIcthhDRcFp0TeznfnRmmOEN/Q08isFyAayR6ikODuLzJ8u
 9h2dMsf7kvUt0O0LdBLK93Bp/iZOkfkC+k2Opo9uFD7ulJfFxcp/iZuBZbXfNZbsK2mk
 FrFQ==
X-Gm-Message-State: ACgBeo1jB/9wb/0QzO0ywT81vkpB3Z/X/XH2+J9htySeag+WjCDFMiZ1
 k+dJ4ZFJ0mUdhJjNBqx2uS89TM/KfOFom2j0Q5Q1lbDzttBbiw==
X-Google-Smtp-Source: AA6agR7kUyJ/s8vUs9tcM6Psst+TMT4EDQ1npu6ouEcV4y1kI13D0/t8Kx7jAHvbpY3FWkoZBr7qOcX+Ccnphxe4fr8=
X-Received: by 2002:a05:6602:1587:b0:67c:b28:6e90 with SMTP id
 e7-20020a056602158700b0067c0b286e90mr5924731iow.16.1659872848668; Sun, 07 Aug
 2022 04:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.5450.1659866172.92745.buildroot@buildroot.org>
In-Reply-To: <mailman.5450.1659866172.92745.buildroot@buildroot.org>
From: Dillan Jackson <dillanjackson45@gmail.com>
Date: Sun, 7 Aug 2022 04:47:17 -0700
Message-ID: <CAOgdC_VcaYiYTZij9USZaOpWF0tSbuo5k93hRPmQCmENXgiAEw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc;
 bh=jdW+B29GdyL3oL0PlsdVIlbo91emdha1kruuWJyzKwk=;
 b=eYa5jWDgtpMZq4skmOQq9ExmXxBDCUTTjSYcJnSceVOq/gF81No8L3TZ+vPZgRdBC/
 pQkwe+ADCMMVLtoE8SEtr+NrwX/pt5k/fgQ1o8irXsAsnSZfYE/9FRaT2UmUf136zpa2
 H9Z7zFlx1RgJwcmVYUHY8T28H+GhKk5e1kcGdB3QSomphrDC4EiWHrBSIGeYMson2GL6
 QKfzFomD7PaA0l6hKoKvNQPrh6FDC6aaZzJFIL86pHAOdIu+7rRTECsmLuaJi+FStZGM
 NHLaZfDd38LbVP1OiNqmv+GXIo6qZkgfNV8jV2ryND+ucwXJbRNkx5jaDh0txiqbe3X7
 gexw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eYa5jWDg
Subject: [Buildroot] =?utf-8?q?I=E2=80=99m_under_attack_please_get_me_use?=
	=?utf-8?b?ciBuYW1lIGxvZ2luIGFuZCBwcml2YWN5LyQkJCQkJCYk?=
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
Content-Type: multipart/mixed; boundary="===============1185496580382117020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1185496580382117020==
Content-Type: multipart/alternative; boundary="000000000000846de005e5a54320"

--000000000000846de005e5a54320
Content-Type: text/plain; charset="UTF-8"

My kids need dad

On Sun, Aug 7, 2022 at 2:56 AM <buildroot-request@buildroot.org> wrote:

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
>    1. [git commit] package/runc: bump to version 1.1.3
>       (Thomas Petazzoni)
>    2. [git commit] package/containerd: security bump to 1.6.6
>       (Thomas Petazzoni)
>    3. [git commit] package/docker-engine: bump to version 20.10.17
>       (Thomas Petazzoni)
>    4. [git commit] package/docker-cli: bump to version 20.10.17
>       (Thomas Petazzoni)
>    5. Re: [PATCH 1/1] package/runc: bump to version 1.1.3
>       (Thomas Petazzoni)
>    6. Re: [PATCH v1 1/2] package/docker-cli: bump to version
>       20.10.17 (Thomas Petazzoni)
>    7. Re: [PATCH 1/1] package/containerd: security bump to 1.6.6
>       (Thomas Petazzoni)
>    8. Re: [PATCH v2 1/2] support/scripts/pkg-stats: move to
>       procedurally generated row/column clases (Thomas Petazzoni)
>    9. Re: [PATCH v1 2/2] support/scripts/pkg-stats: optimize CSS
>       selector usage (Thomas Petazzoni)
>   10. [PATCH 1/2] support/scripts/pkg-stats: remove useless
>       escaping of double quotes (Thomas Petazzoni)
>   11. [PATCH 2/2] support/scripts/pkg-stats: remove remaining
>       double quote escaping (Thomas Petazzoni)
>   12. [git commit] package/pkg-meson.mk: add support for fortran
>       cross-compilation (Thomas Petazzoni)
>   13. Re: OpenCV modules headers not in the SDK (Giulio Benetti)
>   14. [PATCH 1/1] package/python-scipy: add CPE variables
>       (Fabrice Fontaine)
>   15. [git commit] package/pkg-meson.mk: fix handling of fortran
>       compiler flags (Thomas Petazzoni)
>   16. Re: [RFC v3 1/2] package/pkg-meson.mk: support fortran
>       cross-compilation (Thomas Petazzoni)
>   17. Re: [PATCH] package/libnss: fix build failure due to missing
>       missing libnspr in link list (Thomas Petazzoni)
>   18. [git commit] package/cryptsetup: fix host building trying to
>       call asciidoctor (Thomas Petazzoni)
>   19. Re: [PATCH] package/cryptsetup: fix host building trying to
>       call asciidoctor (Thomas Petazzoni)
>   20. [PATCH 2/2] package/syslog-ng: work around gcc bug 101915
>       (Giulio Benetti)
>   21. [PATCH 1/2] toolchain/Config.in: update gcc bug 101915
>       comment (Giulio Benetti)
>   22. [git commit] package/python-scipy: add CPE variables
>       (Thomas Petazzoni)
>   23. Re: [PATCH 1/1] package/python-scipy: add CPE variables
>       (Thomas Petazzoni)
>   24. Re: Buildroot defconfigs about to be removed (Heiko Thiery)
>   25. Re: OpenCV modules headers not in the SDK (Giulio Benetti)
>   26. [PATCH] package/mali-driver: fix build failure with Linux
>       version >= 5.15 (Giulio Benetti)
>   27. [PATCH v4 1/5] package/pkg-python: add
>       pyo3(setuptools-rust/maturin) infrastructure (James Hilliard)
>   28. [PATCH v4 2/5] package/python-maturin: migrate to
>       setuptools-rust infrastructure (James Hilliard)
>   29. [PATCH v4 3/5] package/python-cryptography: migrate to
>       setuptools-rust infrastructure (James Hilliard)
>   30. [PATCH v4 4/5] package/python-orjson: migrate to maturin
>       infrastructure (James Hilliard)
>   31. [PATCH v4 5/5] package/python-rtoml: migrate to
>       setuptools-rust infrastructure (James Hilliard)
>   32. [git commit] package/libfreeimage: fix patch CRLF line
>       endings (Yann E. MORIN)
>   33. [PATCH 1/1] package/lapack: fix build without BUILD_COMPLEX
>       (Fabrice Fontaine)
>   34. Re: OpenCV modules headers not in the SDK (Stefano Cottafavi)
>   35. Re: [PATCH v3] package/ccache: bump version to 4.6.1
>       (Dominik Michael Rauh)
>   36. [PATCH v4] package/ccache: bump version to 4.6.1
>       (Dominik Michael Rauh)
>   37. [PATCH 1/1] package/boost: fix silent build (Fabrice Fontaine)
>   38. [PATCH 1/1] package/dump1090: fix dependencies (Fabrice Fontaine)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sat, 6 Aug 2022 23:24:58 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/runc: bump to version 1.1.3
> Message-ID: <20220806211114.BDC7086EC0@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=72b613e3540751ade71431536c3d02a76e25d667
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This is the third release of the 1.1.z series of runc, and contains various
> minor improvements and bugfixes.
>
> https://github.com/opencontainers/runc/releases/tag/v1.1.3
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index f8133d13c1..d94a0c20ca 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc7640f6
> runc-1.1.2.tar.gz
> +sha256  fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533a63
> runc-1.1.3.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243
> LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index b87d07acca..aef52de618 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -RUNC_VERSION = 1.1.2
> +RUNC_VERSION = 1.1.3
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
>  RUNC_LICENSE_FILES = LICENSE
>
>
> ------------------------------
>
> Message: 2
> Date: Sat, 6 Aug 2022 23:25:10 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/containerd: security bump to
>         1.6.6
> Message-ID: <20220806211114.E4B3586EC3@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=7e7ae463d177ac6f3a9b0d22d3c34cd81a867d39
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> v1.6.2 -> v1.6.6:
>
> The third patch release for containerd 1.6 includes various fixes and
> updates.
>
> https://github.com/containerd/containerd/releases/tag/v1.6.3
>
> The fourth patch release for containerd 1.6 includes two fixes for CNI and
> SELinux.
>
> https://github.com/containerd/containerd/releases/tag/v1.6.4
>
> The fifth patch release for containerd 1.6 includes a few fixes.
>
> https://github.com/containerd/containerd/releases/tag/v1.6.5
>
> The sixth patch release for containerd 1.6 includes a fix for
> CVE-2022-31030.
>
> https://github.com/containerd/containerd/releases/tag/v1.6.6
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/containerd/containerd.hash
> b/package/containerd/containerd.hash
> index eb9f2894a9..c0c926f2e4 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de344b0
> containerd-1.6.2.tar.gz
> +sha256  27afb673c20d53aa5c31aec07b38eb7e4dc911e7e1f0c76fac9513bbf070bd24
> containerd-1.6.6.tar.gz
>  sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4
> LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/
> containerd.mk
> index 36f2db4125..80952914e6 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -CONTAINERD_VERSION = 1.6.2
> +CONTAINERD_VERSION = 1.6.6
>  CONTAINERD_SITE = $(call
> github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
>
>
> ------------------------------
>
> Message: 3
> Date: Sat, 6 Aug 2022 23:25:05 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/docker-engine: bump to
>         version 20.10.17
> Message-ID: <20220806211114.D744986E4F@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=5349010f7657c9597c04bfbea6157840a4a2993c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/docker-engine/docker-engine.hash
> b/package/docker-engine/docker-engine.hash
> index d4fe83a806..2cf2f4a75e 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  dbe1ae342351108b7b30232c4bce0559c81ad9fb6c978d7c8425d6aa53e476c1
> docker-engine-20.10.14.tar.gz
> +sha256  061cf8579aa3c813c353c80fa480744e2f6cca2e6392f546bd0942a6a10c7a14
> docker-engine-20.10.17.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8
> LICENSE
> diff --git a/package/docker-engine/docker-engine.mk
> b/package/docker-engine/docker-engine.mk
> index 3aef31599f..293af1858c 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -DOCKER_ENGINE_VERSION = 20.10.14
> +DOCKER_ENGINE_VERSION = 20.10.17
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>
>  DOCKER_ENGINE_LICENSE = Apache-2.0
>
>
> ------------------------------
>
> Message: 4
> Date: Sat, 6 Aug 2022 23:25:02 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/docker-cli: bump to version
>         20.10.17
> Message-ID: <20220806211114.CAE1786EC1@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=c48aebea8c75d00edfd9788cd9e2b4a4c69ec402
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/docker-cli/docker-cli.hash | 2 +-
>  package/docker-cli/docker-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/docker-cli/docker-cli.hash
> b/package/docker-cli/docker-cli.hash
> index 9a07acf89f..87c5d949c6 100644
> --- a/package/docker-cli/docker-cli.hash
> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  bda289b27b18675d6a6ff07568453768fe68c16c27b5e52724e46896d5464a55
> docker-cli-20.10.14.tar.gz
> +sha256  ab2b59c2302017fea9ad2f70827e8a6f0204b557ce28e66bcb80fea262c9fbdc
> docker-cli-20.10.17.tar.gz
>  sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0
> LICENSE
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/
> docker-cli.mk
> index c7458f85dd..75507ed48e 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -DOCKER_CLI_VERSION = 20.10.14
> +DOCKER_CLI_VERSION = 20.10.17
>  DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
>
>  DOCKER_CLI_LICENSE = Apache-2.0
>
>
> ------------------------------
>
> Message: 5
> Date: Sat, 6 Aug 2022 23:25:41 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Christian Stewart via buildroot <buildroot@buildroot.org>
> Cc: Christian Stewart <christian@paral.in>, "Yann E . MORIN"
>         <yann.morin.1998@free.fr>
> Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump to version
>         1.1.3
> Message-ID: <20220806232541.7cc9bf7c@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> On Wed,  3 Aug 2022 22:40:37 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > This is the third release of the 1.1.z series of runc, and contains
> various
> > minor improvements and bugfixes.
> >
> > https://github.com/opencontainers/runc/releases/tag/v1.1.3
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---
> >  package/runc/runc.hash | 2 +-
> >  package/runc/runc.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks.
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
> Message: 6
> Date: Sat, 6 Aug 2022 23:25:51 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Christian Stewart via buildroot <buildroot@buildroot.org>
> Cc: Christian Stewart <christian@paral.in>, "Yann E . MORIN"
>         <yann.morin.1998@free.fr>
> Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-cli: bump to
>         version 20.10.17
> Message-ID: <20220806232551.5b06fd3d@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> On Wed,  3 Aug 2022 22:43:40 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---
> >  package/docker-cli/docker-cli.hash | 2 +-
> >  package/docker-cli/docker-cli.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Both applied, thanks!
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
> Message: 7
> Date: Sat, 6 Aug 2022 23:25:57 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Christian Stewart via buildroot <buildroot@buildroot.org>
> Cc: Christian Stewart <christian@paral.in>, "Yann E . MORIN"
>         <yann.morin.1998@free.fr>
> Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump
>         to 1.6.6
> Message-ID: <20220806232557.547ee1c8@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> On Wed,  3 Aug 2022 22:47:36 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > v1.6.2 -> v1.6.6:
> >
> > The third patch release for containerd 1.6 includes various fixes and
> updates.
> >
> > https://github.com/containerd/containerd/releases/tag/v1.6.3
> >
> > The fourth patch release for containerd 1.6 includes two fixes for CNI
> and SELinux.
> >
> > https://github.com/containerd/containerd/releases/tag/v1.6.4
> >
> > The fifth patch release for containerd 1.6 includes a few fixes.
> >
> > https://github.com/containerd/containerd/releases/tag/v1.6.5
> >
> > The sixth patch release for containerd 1.6 includes a fix for
> > CVE-2022-31030.
> >
> > https://github.com/containerd/containerd/releases/tag/v1.6.6
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---
> >  package/containerd/containerd.hash | 2 +-
> >  package/containerd/containerd.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks.
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
> Message: 8
> Date: Sat, 6 Aug 2022 23:51:27 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Sen Hastings <sen@phobosdpl.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats:
>         move to procedurally generated row/column clases
> Message-ID: <20220806235127.220d5546@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> Hello,
>
> On Fri,  5 Aug 2022 15:01:13 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
>
> > Rather than having pre-baked classes in the markup for sorting purposes,
> > all the cells in package-grid are iterated over at load time and given
> > a row/column class.
> >
> > example:
> https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html
> >
> > Signed-off-by: Sen Hastings <sen@phobosdpl.com>
>
> I am probably not versed enough into HTML/CSS/JS sorcery, but I don't
> understand the benefit of this. Could you explain a bit more?
>
> >  function sortGrid(sortLabel){
> >       let i = 0;
> >       let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray =
> [], pkgNumSortArray = [];
> > @@ -774,14 +785,11 @@ function sortGrid(sortLabel){
> >       const styleSheet = styleElement.sheet;
> >
> >          columnValues.shift();
> > -        columnValues.forEach((listing) => {
> > +     columnValues.forEach((listing) => {
>
> This is a spurious change.
>
> >          if (fieldText == "see all " + fieldTotal + triangleDown){
> > -             field.firstElementChild.innerText = "see less " +
> fieldTotal + triangleUp;
> > +                field.firstElementChild.innerText = "see less " +
> fieldTotal + triangleUp;
>
> This is also a spurious change.
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
> Message: 9
> Date: Sat, 6 Aug 2022 23:55:57 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Sen Hastings <sen@phobosdpl.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH v1 2/2] support/scripts/pkg-stats:
>         optimize CSS selector usage
> Message-ID: <20220806235557.5d498b6d@windsurf>
> Content-Type: text/plain; charset=US-ASCII
>
> Hello Sen,
>
> On Fri,  5 Aug 2022 15:01:14 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
>
> > Having lots of CSS selector declarations adds up, especially at 70k+
> > elements.
> >
> > This reduces the number of CSS selectors printed in the markup
> > to the bare minimum, by using pseudo-classes and tag names as selectors.
>
> Not sure how this works. Is there a significant size benefit? Sometimes
> having a dumb but obvious solution is better than having a smart but
> convoluted solution.
>
> > +div {
> > +  text-align: center;
> > +  border: solid 1px gray;
> > +}
> > +#results-grid div{
> > +  text-align: left;
> > +}
> > +#package-grid div:nth-child(13n+1), #package-grid
> div:nth-child(13n+13)  {
> > +  text-align: left;
> > +}
> > +#package-grid div:nth-child(13){
> > +  text-align: center;
>
> What is this 13 magic number?
>
> Also, unrelated to this, when I look at the currently generated HTML,
> it looks odd. I see things like this:
>
>   <div
> id="upstream_url__package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream"
> class="centered upstream_url data
> _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream
> good_url"><a href="https://github.com/xbmc/audiodecoder.vgmstream
> ">Link</a></div>
>
> Why do we have these crazy id values now? why does the class property
> contain a value such as
> _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream?
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
> Message: 10
> Date: Sat,  6 Aug 2022 23:56:40 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Cc: Sen Hastings <sen@phobosdpl.com>, Thomas Petazzoni
>         <thomas.petazzoni@bootlin.com>
> Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: remove
>         useless escaping of double quotes
> Message-ID: <20220806215641.471770-1-thomas.petazzoni@bootlin.com>
>
> Within single-quoted f-strings, and within triple double quoted
> strings, escaping all the double quotes is completely useless and
> makes the code more difficult to read. Get rid of all this useless
> escaping.
>
> The renderer HTML is exactly identical before/after this commit.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 100 +++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index d32abd7225..572757b7ea 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -886,7 +886,7 @@ function expandField(fieldId){
>
>  <body>
>
> -<a href=\"#results\">Results</a><br/>
> +<a href="#results">Results</a><br/>
>
>  """  # noqa - tabs and spaces
>
> @@ -920,8 +920,8 @@ def boolean_str(b):
>
>  def dump_html_pkg(f, pkg):
>      pkg_css_class = pkg.path.replace("/", "_")[:-3]
> -    f.write(f'<div id=\"package__{pkg_css_class}\" \
> -        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
> +    f.write(f'<div id="package__{pkg_css_class}" \
> +        class="package data _{pkg_css_class}">{pkg.path}</div>\n')
>      # Patch count
>      data_field_id = f'patch_count__{pkg_css_class}'
>      div_class = ["centered patch_count data"]
> @@ -932,8 +932,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("somepatches")
>      else:
>          div_class.append("lotsofpatches")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}
> \
> -        \">{str(pkg.patch_count)}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{str(pkg.patch_count)}</div>\n')
>
>      # Infrastructure
>      data_field_id = f'infrastructure__{pkg_css_class}'
> @@ -944,8 +944,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("wrong")
>      else:
>          div_class.append("correct")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}
> \
> -        \">{infra_str(pkg.infras)}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{infra_str(pkg.infras)}</div>\n')
>
>      # License
>      data_field_id = f'license__{pkg_css_class}'
> @@ -955,8 +955,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}
> \
> -        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
>
>      # License files
>      data_field_id = f'license_files__{pkg_css_class}'
> @@ -966,8 +966,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}
> \
> -        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
>
>      # Hash
>      data_field_id = f'hash_file__{pkg_css_class}'
> @@ -977,8 +977,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}
> \
> -        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
>
>      # Current version
>      data_field_id = f'current_version__{pkg_css_class}'
> @@ -986,8 +986,8 @@ def dump_html_pkg(f, pkg):
>          current_version = pkg.current_version[:20] + "..."
>      else:
>          current_version = pkg.current_version
> -    f.write(f'  <div id=\"{data_field_id}\" \
> -        class=\"centered current_version data
> _{pkg_css_class}\">{current_version}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" \
> +        class="centered current_version data
> _{pkg_css_class}">{current_version}</div>\n')
>
>      # Latest version
>      data_field_id = f'latest_version__{pkg_css_class}'
> @@ -1020,7 +1020,7 @@ def dump_html_pkg(f, pkg):
>          else:
>              latest_version_text += "found by guess"
>
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">{latest_version_text}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">{latest_version_text}</div>\n')
>
>      # Warnings
>      data_field_id = f'warnings__{pkg_css_class}'
> @@ -1030,7 +1030,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">{pkg.warnings}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">{pkg.warnings}</div>\n')
>
>      # URL status
>      data_field_id = f'upstream_url__{pkg_css_class}'
> @@ -1045,7 +1045,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          div_class.append("good_url")
>          url_str = "<a href=\"%s\">Link</a>" % pkg.url
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">{url_str}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">{url_str}</div>\n')
>
>      # CVEs
>      data_field_id = f'cves__{pkg_css_class}'
> @@ -1061,11 +1061,11 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cve-ok")
>      else:
>          div_class.append("cve-unknown")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">\n')
>      if len(pkg.cves) > 10:
>          cve_total = len(pkg.cves) + 1
> -        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
> -        class=\"see-more centered cve_ignored\">see all ({cve_total})
> &#9662;</div>\n')
> +        f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
> +        class="see-more centered cve_ignored">see all ({cve_total})
> &#9662;</div>\n')
>      if pkg.is_status_error("cve"):
>          for cve in pkg.cves:
>              f.write("   <a href=\"
> https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve,
> cve))
> @@ -1083,7 +1083,7 @@ def dump_html_pkg(f, pkg):
>      div_class.append(f'_{pkg_css_class}')
>      if pkg.ignored_cves:
>          div_class.append("cve_ignored")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">\n')
>      for ignored_cve in pkg.ignored_cves:
>          f.write("    <a href=\"
> https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" %
> (ignored_cve, ignored_cve))
>      f.write("  </div>\n")
> @@ -1100,7 +1100,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cpe-ok")
>      else:
>          div_class.append("cpe-unknown")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{"
> ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">\n')
>      if pkg.cpeid:
>          cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
>          cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin +
> "<wbr>")
> @@ -1121,33 +1121,33 @@ def dump_html_pkg(f, pkg):
>
>  def dump_html_all_pkgs(f, packages):
>      f.write("""
> -<div id=\"package-grid\">
> -<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
> -     class=\"package data label\"><span>Package</span><span></span></div>
> -<div style="grid-column: 2;" onclick="sortGrid(this.id)"
> id=\"patch_count\"
> -     class=\"centered patch_count data label\"><span>Patch
> count</span><span></span></div>
> -<div style="grid-column: 3;" onclick="sortGrid(this.id)"
> id=\"infrastructure\"
> -     class=\"centered infrastructure data
> label\">Infrastructure<span></span></div>
> -<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
> -     class=\"centered license data
> label\"><span>License</span><span></span></div>
> -<div style="grid-column: 5;" onclick="sortGrid(this.id)"
> id=\"license_files\"
> -     class=\"centered license_files data label\"><span>License
> files</span><span></span></div>
> -<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
> -     class=\"centered hash_file data label\"><span>Hash
> file</span><span></span></div>
> -<div style="grid-column: 7;" onclick="sortGrid(this.id)"
> id=\"current_version\"
> -     class=\"centered current_version data label\"><span>Current
> version</span><span></span></div>
> -<div style="grid-column: 8;" onclick="sortGrid(this.id)"
> id=\"latest_version\"
> -     class=\"centered latest_version data label\"><span>Latest
> version</span><span></span></div>
> -<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
> -     class=\"centered warnings data
> label\"><span>Warnings</span><span></span></div>
> -<div style="grid-column: 10;" onclick="sortGrid(this.id)"
> id=\"upstream_url\"
> -     class=\"centered upstream_url data label\"><span>Upstream
> URL</span><span></span></div>
> -<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
> -     class=\"centered cves data
> label\"><span>CVEs</span><span></span></div>
> -<div style="grid-column: 12;" onclick="sortGrid(this.id)"
> id=\"ignored_cves\"
> -     class=\"centered ignored_cves data label\"><span>CVEs
> Ignored</span><span></span></div>
> -<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
> -     class=\"centered cpe_id data label\"><span>CPE
> ID</span><span></span></div>
> +<div id="package-grid">
> +<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
> +     class="package data label"><span>Package</span><span></span></div>
> +<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
> +     class="centered patch_count data label"><span>Patch
> count</span><span></span></div>
> +<div style="grid-column: 3;" onclick="sortGrid(this.id)"
> id="infrastructure"
> +     class="centered infrastructure data
> label">Infrastructure<span></span></div>
> +<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
> +     class="centered license data
> label"><span>License</span><span></span></div>
> +<div style="grid-column: 5;" onclick="sortGrid(this.id)"
> id="license_files"
> +     class="centered license_files data label"><span>License
> files</span><span></span></div>
> +<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
> +     class="centered hash_file data label"><span>Hash
> file</span><span></span></div>
> +<div style="grid-column: 7;" onclick="sortGrid(this.id)"
> id="current_version"
> +     class="centered current_version data label"><span>Current
> version</span><span></span></div>
> +<div style="grid-column: 8;" onclick="sortGrid(this.id)"
> id="latest_version"
> +     class="centered latest_version data label"><span>Latest
> version</span><span></span></div>
> +<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
> +     class="centered warnings data
> label"><span>Warnings</span><span></span></div>
> +<div style="grid-column: 10;" onclick="sortGrid(this.id)"
> id="upstream_url"
> +     class="centered upstream_url data label"><span>Upstream
> URL</span><span></span></div>
> +<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
> +     class="centered cves data label"><span>CVEs</span><span></span></div>
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)"
> id="ignored_cves"
> +     class="centered ignored_cves data label"><span>CVEs
> Ignored</span><span></span></div>
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
> +     class="centered cpe_id data label"><span>CPE
> ID</span><span></span></div>
>  """)
>      for pkg in sorted(packages):
>          dump_html_pkg(f, pkg)
> --
> 2.37.1
>
>
>
> ------------------------------
>
> Message: 11
> Date: Sat,  6 Aug 2022 23:56:41 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Cc: Sen Hastings <sen@phobosdpl.com>, Thomas Petazzoni
>         <thomas.petazzoni@bootlin.com>
> Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: remove
>         remaining double quote escaping
> Message-ID: <20220806215641.471770-2-thomas.petazzoni@bootlin.com>
>
> This is done either by switching to single quoted f-strings, triple
> double quoted f-strings when needed, or simply single-quoted strings.
>
> The renderer HTML is exactly identical before/after this commit.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 67 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 572757b7ea..aa3b49c809 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1010,13 +1010,12 @@ def dump_html_pkg(f, pkg):
>          if pkg.latest_version['version'] is None:
>              latest_version_text = "<b>Found, but no version</b>"
>          else:
> -            latest_version_text = "<a href=\"
> https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
> -                (pkg.latest_version['id'],
> str(pkg.latest_version['version']))
> +            latest_version_text = f"""<a href="
> https://release-monitoring.org/project/{pkg.latest_version['id']}
> "><b>{str(pkg.latest_version['version'])}</b></a>"""
>
>          latest_version_text += "<br/>"
>
>          if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
> -            latest_version_text += "found by <a href=\"
> https://release-monitoring.org/distro/Buildroot/\">distro</a>"
> +            latest_version_text += f'found by <a href="
> https://release-monitoring.org/distro/Buildroot/">distro</a>'
>          else:
>              latest_version_text += "found by guess"
>
> @@ -1041,10 +1040,10 @@ def dump_html_pkg(f, pkg):
>          div_class.append("missing_url")
>      if pkg.status['url'][0] == "error":
>          div_class.append("invalid_url")
> -        url_str = "<a href=\"%s\">%s</a>" % (pkg.url,
> pkg.status['url'][1])
> +        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
>      else:
>          div_class.append("good_url")
> -        url_str = "<a href=\"%s\">Link</a>" % pkg.url
> +        url_str = f'<a href="{pkg.url}">Link</a>'
>      f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">{url_str}</div>\n')
>
>      # CVEs
> @@ -1068,11 +1067,11 @@ def dump_html_pkg(f, pkg):
>          class="see-more centered cve_ignored">see all ({cve_total})
> &#9662;</div>\n')
>      if pkg.is_status_error("cve"):
>          for cve in pkg.cves:
> -            f.write("   <a href=\"
> https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve,
> cve))
> +            f.write(f'   <a href="
> https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
>          for cve in pkg.unsure_cves:
> -            f.write("   <a href=\"
> https://security-tracker.debian.org/tracker/%s\">%s
> <i>(unsure)</i></a><br/>\n" % (cve, cve))
> +            f.write(f'   <a href="
> https://security-tracker.debian.org/tracker/{cve}">{cve}
> <i>(unsure)</i></a><br/>\n')
>      elif pkg.is_status_na("cve"):
> -        f.write("    %s" % pkg.status['cve'][1])
> +        f.write(f"""    {pkg.status['cve'][1]}""")
>      else:
>          f.write("    N/A\n")
>      f.write("  </div>\n")
> @@ -1085,7 +1084,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cve_ignored")
>      f.write(f'  <div id="{data_field_id}" class="{"
> ".join(div_class)}">\n')
>      for ignored_cve in pkg.ignored_cves:
> -        f.write("    <a href=\"
> https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" %
> (ignored_cve, ignored_cve))
> +        f.write(f'    <a href="
> https://security-tracker.debian.org/tracker/{ignored_cve}
> ">{ignored_cve}</a><br/>\n')
>      f.write("  </div>\n")
>
>      # CPE ID
> @@ -1108,11 +1107,9 @@ def dump_html_pkg(f, pkg):
>      if not pkg.is_status_ok("cpe"):
>          if pkg.is_actual_package and pkg.current_version:
>              if pkg.cpeid:
> -                f.write("  <br/>%s <a href=\"
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n"
> %  # noqa: E501
> -                        (pkg.status['cpe'][1],
> ":".join(pkg.cpeid.split(":")[0:5])))
> +                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""")
> # noqa: E501
>              else:
> -                f.write("  %s <a href=\"
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n"
> %  # noqa: E501
> -                        (pkg.status['cpe'][1], pkg.name))
> +                f.write(f"""  {pkg.status['cpe'][1]} <a href="
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")
> # noqa: E501
>          else:
>              f.write("  %s\n" % pkg.status['cpe'][1])
>
> @@ -1155,49 +1152,49 @@ def dump_html_all_pkgs(f, packages):
>
>
>  def dump_html_stats(f, stats):
> -    f.write("<a id=\"results\"></a>\n")
> -    f.write("<div class=\"data\" id=\"results-grid\">\n")
> +    f.write('<a id="results"></a>\n')
> +    f.write('<div class="data" id="results-grid">\n')
>      infras = [infra[6:] for infra in stats.keys() if
> infra.startswith("infra-")]
>      for infra in infras:
> -        f.write(" <div class=\"data\">Packages using the <i>%s</i>
> infrastructure</div><div class=\"data\">%s</div>\n" %
> +        f.write(' <div class="data">Packages using the <i>%s</i>
> infrastructure</div><div class="data">%s</div>\n' %
>                  (infra, stats["infra-%s" % infra]))
> -    f.write(" <div class=\"data\">Packages having license
> information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having license
> information</div><div class="data">%s</div>\n' %
>              stats["license"])
> -    f.write(" <div class=\"data\">Packages not having license
> information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having license
> information</div><div class="data">%s</div>\n' %
>              stats["no-license"])
> -    f.write(" <div class=\"data\">Packages having license files
> information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having license files
> information</div><div class="data">%s</div>\n' %
>              stats["license-files"])
> -    f.write(" <div class=\"data\">Packages not having license files
> information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having license files
> information</div><div class="data">%s</div>\n' %
>              stats["no-license-files"])
> -    f.write(" <div class=\"data\">Packages having a hash file</div><div
> class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having a hash file</div><div
> class="data">%s</div>\n' %
>              stats["hash"])
> -    f.write(" <div class=\"data\">Packages not having a hash
> file</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having a hash file</div><div
> class="data">%s</div>\n' %
>              stats["no-hash"])
> -    f.write(" <div class=\"data\">Total number of patches</div><div
> class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Total number of patches</div><div
> class="data">%s</div>\n' %
>              stats["patches"])
> -    f.write("<div class=\"data\">Packages having a mapping on <i>
> release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages having a mapping on <i>
> release-monitoring.org</i></div><div class="data">%s</div>\n' %
>              stats["rmo-mapping"])
> -    f.write("<div class=\"data\">Packages lacking a mapping on <i>
> release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages lacking a mapping on <i>
> release-monitoring.org</i></div><div class="data">%s</div>\n' %
>              stats["rmo-no-mapping"])
> -    f.write("<div class=\"data\">Packages that are up-to-date</div><div
> class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages that are up-to-date</div><div
> class="data">%s</div>\n' %
>              stats["version-uptodate"])
> -    f.write("<div class=\"data\">Packages that are not
> up-to-date</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages that are not up-to-date</div><div
> class="data">%s</div>\n' %
>              stats["version-not-uptodate"])
> -    f.write("<div class=\"data\">Packages with no known upstream
> version</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages with no known upstream
> version</div><div class="data">%s</div>\n' %
>              stats["version-unknown"])
> -    f.write("<div class=\"data\">Packages affected by CVEs</div><div
> class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages affected by CVEs</div><div
> class="data">%s</div>\n' %
>              stats["pkg-cves"])
> -    f.write("<div class=\"data\">Total number of CVEs affecting all
> packages</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Total number of CVEs affecting all
> packages</div><div class="data">%s</div>\n' %
>              stats["total-cves"])
> -    f.write("<div class=\"data\">Packages affected by unsure
> CVEs</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages affected by unsure CVEs</div><div
> class="data">%s</div>\n' %
>              stats["pkg-unsure-cves"])
> -    f.write("<div class=\"data\">Total number of unsure CVEs affecting
> all packages</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Total number of unsure CVEs affecting all
> packages</div><div class="data">%s</div>\n' %
>              stats["total-unsure-cves"])
> -    f.write("<div class=\"data\">Packages with CPE ID</div><div
> class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages with CPE ID</div><div
> class="data">%s</div>\n' %
>              stats["cpe-id"])
> -    f.write("<div class=\"data\">Packages without CPE ID</div><div
> class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages without CPE ID</div><div
> class="data">%s</div>\n' %
>              stats["no-cpe-id"])
> -    f.write("</div>\n")
> +    f.write('</div>\n')
>
>
>  def dump_html_gen_info(f, date, commit):
> --
> 2.37.1
>
>
>
> ------------------------------
>
> Message: 12
> Date: Sat, 6 Aug 2022 23:57:44 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/pkg-meson.mk: add support
>         for fortran cross-compilation
> Message-ID: <20220806214425.4DA8F86ECA@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=88dd3fcd7277fdb61c911d7ae454df886e423377
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> python-scipy is moving to a meson build infrastructure, and requires
> fortran cross-compilation. This commit extends the cross-compilation
> configuration file generated for use by meson to add the "fortran",
> "fortran_args" and "fortran_link_args" properties.
>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-meson.mk                   | 2 ++
>  support/misc/cross-compilation.conf.in | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 156b005fdd..32d41170f3 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -76,10 +76,12 @@ define PKG_MESON_CROSSCONFIG_SED
>          -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
>          -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
>          -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> +        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
>          -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
>          -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
>          -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
>          -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call
> LOWERCASE,$(BR2_ENDIAN)))%g" \
> +        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip
> $(2))))%g" \
>          -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip
> $(1))))%g" \
>          -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip
> $(3))))%g" \
>          -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip
> $(2))))%g" \
> diff --git a/support/misc/cross-compilation.conf.in b/support/misc/
> cross-compilation.conf.in
> index 235e5a8495..7053df472b 100644
> --- a/support/misc/cross-compilation.conf.in
> +++ b/support/misc/cross-compilation.conf.in
> @@ -9,6 +9,7 @@ cpp = '@TARGET_CXX@'
>  ar = '@TARGET_AR@'
>  strip = '@TARGET_STRIP@'
>  cmake = '@BR2_CMAKE@'
> +fortran = '@TARGET_FC@'
>  pkgconfig = '@PKGCONF_HOST_BINARY@'
>  g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>  g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> @@ -18,6 +19,8 @@ c_args = [@TARGET_CFLAGS@]
>  c_link_args = [@TARGET_LDFLAGS@]
>  cpp_args = [@TARGET_CXXFLAGS@]
>  cpp_link_args = [@TARGET_LDFLAGS@]
> +fortran_args = [@TARGET_FCFLAGS@]
> +fortran_link_args = [@TARGET_LDFLAGS@]
>  wrap_mode = 'nodownload'
>  cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
>
>
>
> ------------------------------
>
> Message: 13
> Date: Sat, 6 Aug 2022 23:54:17 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
> Message-ID:
>         <8aafffc2-748f-becd-cac3-da7a3fad44be@benettiengineering.com>
> Content-Type: text/plain; charset=UTF-8; format=flowed
>
> Hi Stefano,
>
> On 06/08/22 20:15, Stefano Cottafavi wrote:
> > Hi Giulio,
> > thanks for the quick reply. Here's the defconfig
> > https://pastebin.com/Xsh5d4HG <https://pastebin.com/Xsh5d4HG>
> > For the sake of completeness I didn't remove any of the lines, but some
> > are specific to my out-of-tree folder and overlays, so you might want to
> > get rid of those.
> >
> > I'm currently building the 2022.05.1 tag with SHA
> > 2e399893b4f60f1e103228df6e4439d4e4ac3dd5
>
> Thank you. I'm building it right now. The package opencv4.mk looks
> correct because it does have OPENCV4_INSTALL_STAGING = YES, and that
> should install the header files. If there is a bug it could be inside
> opencv4 cmake itself.
>
> By the way, I guess the problem you're experience is that you after
> building the Buildroot's defconfig you try to build another application
> (i.e. a qt5 application) that requires opencv4 and it can't find the
> headers, right?
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>
> > Looking forward to your insights.
> >
> > Best
> > Stefano
> >
> > On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti
> > <giulio.benetti@benettiengineering.com
> > <mailto:giulio.benetti@benettiengineering.com>> wrote:
> >
> >     Hi Stefano,
> >
> >>     Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi
> >>     <stefano.cottafavi@gmail.com <mailto:stefano.cottafavi@gmail.com>>
> >>     ha scritto:
> >>
> >>     ?
> >>     Hi all,
> >>     I've successfully built Buildroot 2022.05 for the Raspberry Pi4
> >>     adding support for Qt5 and OpenCV (including objdetect module
> >>     amongst few other).
> >>     I've also managed to generate?the SDK for such a build however I
> >>     can't find the header files of those OpenCV modules anywhere in
> >>     the SDK.
> >>
> >>     Is this expected or a bug?
> >
> >     It looks like a bug. Can you please pastebin your specific defconfig?
> >
> >     You can obtain it moving to your output folder and ?issuing:
> >     $ make savedeconfig
> >     then you obtain a file called defconfig so copy and paste it on
> >     pastebin and provide here
> >     the link to the pastebin and also the SHA1 commit of your Buildroot
> >     git or the specific version.
> >
> >     This way we can help you.
> >
> >     Best regards
> >     ?
> >     Giulio Benetti
> >     CEO/CTO@Benetti Engineering sas
> >
> >>
> >>     Cheers,
> >>     Stefano
> >>     _______________________________________________
> >>     buildroot mailing list
> >>     buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> >>     https://lists.buildroot.org/mailman/listinfo/buildroot
> >>     <https://lists.buildroot.org/mailman/listinfo/buildroot>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
>
> ------------------------------
>
> Message: 14
> Date: Sun,  7 Aug 2022 02:05:37 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>, Yegor
>         Yefremov <yegorslists@googlemail.com>, Asaf Kahlon
>         <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
> Fabrice
>         Fontaine <fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/python-scipy: add CPE
>         variables
> Message-ID: <20220807000537.182514-1-fontaine.fabrice@gmail.com>
>
> cpe:2.3:a:scipy:scipy is a valid CPE identifier for this package:
>
>
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ascipy%3Ascipy
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-scipy/python-scipy.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/
> python-scipy.mk
> index b5006a2e15..a8c23c6c88 100644
> --- a/package/python-scipy/python-scipy.mk
> +++ b/package/python-scipy/python-scipy.mk
> @@ -22,6 +22,8 @@ PYTHON_SCIPY_LICENSE_FILES = \
>         scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
>         scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
>         scipy/spatial/qhull_src/COPYING.txt
> +PYTHON_SCIPY_CPE_ID_VENDOR = scipy
> +PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
>  PYTHON_SCIPY_DEPENDENCIES += \
>         host-python-numpy \
>         host-python-pythran \
> --
> 2.35.1
>
>
>
> ------------------------------
>
> Message: 15
> Date: Sun, 7 Aug 2022 00:01:42 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/pkg-meson.mk: fix handling
>         of fortran compiler flags
> Message-ID: <20220806215604.E11BF86ECF@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=cd933d676f210789730ecb25b23d902620d72072
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Commit
> 88dd3fcd7277fdb61c911d7ae454df886e423377 ("package/ <http://pkg-meson.mk>

--000000000000846de005e5a54320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">My kids need dad=C2=A0</div><div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 2:56 AM=
 &lt;<a href=3D"mailto:buildroot-request@buildroot.org">buildroot-request@b=
uildroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">Send buildroot mailin=
g list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot@buildroot.org" targ=
et=3D"_blank">buildroot@buildroot.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot-request@buildroot.o=
rg" target=3D"_blank">buildroot-request@buildroot.org</a><br>
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
=C2=A0 =C2=A01. [git commit] package/runc: bump to version 1.1.3<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A02. [git commit] package/containerd: security bump to 1.6.6<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A03. [git commit] package/docker-engine: bump to version 20.10.1=
7<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A04. [git commit] package/docker-cli: bump to version 20.10.17<b=
r>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A05. Re: [PATCH 1/1] package/runc: bump to version 1.1.3<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A06. Re: [PATCH v1 1/2] package/docker-cli: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 20.10.17 (Thomas Petazzoni)<br>
=C2=A0 =C2=A07. Re: [PATCH 1/1] package/containerd: security bump to 1.6.6<=
br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A08. Re: [PATCH v2 1/2] support/scripts/pkg-stats: move to<br>
=C2=A0 =C2=A0 =C2=A0 procedurally generated row/column clases (Thomas Petaz=
zoni)<br>
=C2=A0 =C2=A09. Re: [PATCH v1 2/2] support/scripts/pkg-stats: optimize CSS<=
br>
=C2=A0 =C2=A0 =C2=A0 selector usage (Thomas Petazzoni)<br>
=C2=A0 10. [PATCH 1/2] support/scripts/pkg-stats: remove useless<br>
=C2=A0 =C2=A0 =C2=A0 escaping of double quotes (Thomas Petazzoni)<br>
=C2=A0 11. [PATCH 2/2] support/scripts/pkg-stats: remove remaining<br>
=C2=A0 =C2=A0 =C2=A0 double quote escaping (Thomas Petazzoni)<br>
=C2=A0 12. [git commit] package/<a href=3D"http://pkg-meson.mk" rel=3D"nore=
ferrer" target=3D"_blank">pkg-meson.mk</a>: add support for fortran<br>
=C2=A0 =C2=A0 =C2=A0 cross-compilation (Thomas Petazzoni)<br>
=C2=A0 13. Re: OpenCV modules headers not in the SDK (Giulio Benetti)<br>
=C2=A0 14. [PATCH 1/1] package/python-scipy: add CPE variables<br>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
=C2=A0 15. [git commit] package/<a href=3D"http://pkg-meson.mk" rel=3D"nore=
ferrer" target=3D"_blank">pkg-meson.mk</a>: fix handling of fortran<br>
=C2=A0 =C2=A0 =C2=A0 compiler flags (Thomas Petazzoni)<br>
=C2=A0 16. Re: [RFC v3 1/2] package/<a href=3D"http://pkg-meson.mk" rel=3D"=
noreferrer" target=3D"_blank">pkg-meson.mk</a>: support fortran<br>
=C2=A0 =C2=A0 =C2=A0 cross-compilation (Thomas Petazzoni)<br>
=C2=A0 17. Re: [PATCH] package/libnss: fix build failure due to missing<br>
=C2=A0 =C2=A0 =C2=A0 missing libnspr in link list (Thomas Petazzoni)<br>
=C2=A0 18. [git commit] package/cryptsetup: fix host building trying to<br>
=C2=A0 =C2=A0 =C2=A0 call asciidoctor (Thomas Petazzoni)<br>
=C2=A0 19. Re: [PATCH] package/cryptsetup: fix host building trying to<br>
=C2=A0 =C2=A0 =C2=A0 call asciidoctor (Thomas Petazzoni)<br>
=C2=A0 20. [PATCH 2/2] package/syslog-ng: work around gcc bug 101915<br>
=C2=A0 =C2=A0 =C2=A0 (Giulio Benetti)<br>
=C2=A0 21. [PATCH 1/2] toolchain/Config.in: update gcc bug 101915<br>
=C2=A0 =C2=A0 =C2=A0 comment (Giulio Benetti)<br>
=C2=A0 22. [git commit] package/python-scipy: add CPE variables<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 23. Re: [PATCH 1/1] package/python-scipy: add CPE variables<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 24. Re: Buildroot defconfigs about to be removed (Heiko Thiery)<br>
=C2=A0 25. Re: OpenCV modules headers not in the SDK (Giulio Benetti)<br>
=C2=A0 26. [PATCH] package/mali-driver: fix build failure with Linux<br>
=C2=A0 =C2=A0 =C2=A0 version &gt;=3D 5.15 (Giulio Benetti)<br>
=C2=A0 27. [PATCH v4 1/5] package/pkg-python: add<br>
=C2=A0 =C2=A0 =C2=A0 pyo3(setuptools-rust/maturin) infrastructure (James Hi=
lliard)<br>
=C2=A0 28. [PATCH v4 2/5] package/python-maturin: migrate to<br>
=C2=A0 =C2=A0 =C2=A0 setuptools-rust infrastructure (James Hilliard)<br>
=C2=A0 29. [PATCH v4 3/5] package/python-cryptography: migrate to<br>
=C2=A0 =C2=A0 =C2=A0 setuptools-rust infrastructure (James Hilliard)<br>
=C2=A0 30. [PATCH v4 4/5] package/python-orjson: migrate to maturin<br>
=C2=A0 =C2=A0 =C2=A0 infrastructure (James Hilliard)<br>
=C2=A0 31. [PATCH v4 5/5] package/python-rtoml: migrate to<br>
=C2=A0 =C2=A0 =C2=A0 setuptools-rust infrastructure (James Hilliard)<br>
=C2=A0 32. [git commit] package/libfreeimage: fix patch CRLF line<br>
=C2=A0 =C2=A0 =C2=A0 endings (Yann E. MORIN)<br>
=C2=A0 33. [PATCH 1/1] package/lapack: fix build without BUILD_COMPLEX<br>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
=C2=A0 34. Re: OpenCV modules headers not in the SDK (Stefano Cottafavi)<br=
>
=C2=A0 35. Re: [PATCH v3] package/ccache: bump version to 4.6.1<br>
=C2=A0 =C2=A0 =C2=A0 (Dominik Michael Rauh)<br>
=C2=A0 36. [PATCH v4] package/ccache: bump version to 4.6.1<br>
=C2=A0 =C2=A0 =C2=A0 (Dominik Michael Rauh)<br>
=C2=A0 37. [PATCH 1/1] package/boost: fix silent build (Fabrice Fontaine)<b=
r>
=C2=A0 38. [PATCH 1/1] package/dump1090: fix dependencies (Fabrice Fontaine=
)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Sat, 6 Aug 2022 23:24:58 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/runc: bump to version 1.1.3<br>
Message-ID: &lt;<a href=3D"mailto:20220806211114.BDC7086EC0@busybox.osuosl.=
org" target=3D"_blank">20220806211114.BDC7086EC0@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D72b613e=
3540751ade71431536c3d02a76e25d667" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3D72b613e3540751ade71431536c3d0=
2a76e25d667</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
This is the third release of the 1.1.z series of runc, and contains various=
<br>
minor improvements and bugfixes.<br>
<br>
<a href=3D"https://github.com/opencontainers/runc/releases/tag/v1.1.3" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/runc/re=
leases/tag/v1.1.3</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/runc/runc.hash | 2 +-<br>
=C2=A0package/runc/<a href=3D"http://runc.mk" rel=3D"noreferrer" target=3D"=
_blank">runc.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/runc/runc.hash b/package/runc/runc.hash<br>
index f8133d13c1..d94a0c20ca 100644<br>
--- a/package/runc/runc.hash<br>
+++ b/package/runc/runc.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc764=
0f6=C2=A0 runc-1.1.2.tar.gz<br>
+sha256=C2=A0 fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533=
a63=C2=A0 runc-1.1.3.tar.gz<br>
=C2=A0sha256=C2=A0 552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690=
038a8243=C2=A0 LICENSE<br>
diff --git a/package/runc/<a href=3D"http://runc.mk" rel=3D"noreferrer" tar=
get=3D"_blank">runc.mk</a> b/package/runc/<a href=3D"http://runc.mk" rel=3D=
"noreferrer" target=3D"_blank">runc.mk</a><br>
index b87d07acca..aef52de618 100644<br>
--- a/package/runc/<a href=3D"http://runc.mk" rel=3D"noreferrer" target=3D"=
_blank">runc.mk</a><br>
+++ b/package/runc/<a href=3D"http://runc.mk" rel=3D"noreferrer" target=3D"=
_blank">runc.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-RUNC_VERSION =3D 1.1.2<br>
+RUNC_VERSION =3D 1.1.3<br>
=C2=A0RUNC_SITE =3D $(call github,opencontainers,runc,v$(RUNC_VERSION))<br>
=C2=A0RUNC_LICENSE =3D Apache-2.0, LGPL-2.1 (libseccomp)<br>
=C2=A0RUNC_LICENSE_FILES =3D LICENSE<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Sat, 6 Aug 2022 23:25:10 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/containerd: security bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1.6.6<br>
Message-ID: &lt;<a href=3D"mailto:20220806211114.E4B3586EC3@busybox.osuosl.=
org" target=3D"_blank">20220806211114.E4B3586EC3@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D7e7ae46=
3d177ac6f3a9b0d22d3c34cd81a867d39" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3D7e7ae463d177ac6f3a9b0d22d3c34=
cd81a867d39</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
v1.6.2 -&gt; v1.6.6:<br>
<br>
The third patch release for containerd 1.6 includes various fixes and updat=
es.<br>
<br>
<a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.3" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/containerd/containerd=
/releases/tag/v1.6.3</a><br>
<br>
The fourth patch release for containerd 1.6 includes two fixes for CNI and =
SELinux.<br>
<br>
<a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.4" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/containerd/containerd=
/releases/tag/v1.6.4</a><br>
<br>
The fifth patch release for containerd 1.6 includes a few fixes.<br>
<br>
<a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.5" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/containerd/containerd=
/releases/tag/v1.6.5</a><br>
<br>
The sixth patch release for containerd 1.6 includes a fix for<br>
CVE-2022-31030.<br>
<br>
<a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/containerd/containerd=
/releases/tag/v1.6.6</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/containerd/containerd.hash | 2 +-<br>
=C2=A0package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
" target=3D"_blank">containerd.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/containerd/containerd.hash b/package/containerd/contai=
nerd.hash<br>
index eb9f2894a9..c0c926f2e4 100644<br>
--- a/package/containerd/containerd.hash<br>
+++ b/package/containerd/containerd.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Computed locally<br>
-sha256=C2=A0 4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de34=
4b0=C2=A0 containerd-1.6.2.tar.gz<br>
+sha256=C2=A0 27afb673c20d53aa5c31aec07b38eb7e4dc911e7e1f0c76fac9513bbf070b=
d24=C2=A0 containerd-1.6.6.tar.gz<br>
=C2=A0sha256=C2=A0 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a=
30ada2b4=C2=A0 LICENSE<br>
diff --git a/package/containerd/<a href=3D"http://containerd.mk" rel=3D"nor=
eferrer" target=3D"_blank">containerd.mk</a> b/package/containerd/<a href=
=3D"http://containerd.mk" rel=3D"noreferrer" target=3D"_blank">containerd.m=
k</a><br>
index 36f2db4125..80952914e6 100644<br>
--- a/package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
" target=3D"_blank">containerd.mk</a><br>
+++ b/package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
" target=3D"_blank">containerd.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-CONTAINERD_VERSION =3D 1.6.2<br>
+CONTAINERD_VERSION =3D 1.6.6<br>
=C2=A0CONTAINERD_SITE =3D $(call github,containerd,containerd,v$(CONTAINERD=
_VERSION))<br>
=C2=A0CONTAINERD_LICENSE =3D Apache-2.0<br>
=C2=A0CONTAINERD_LICENSE_FILES =3D LICENSE<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Sat, 6 Aug 2022 23:25:05 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/docker-engine: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 20.10.17<br>
Message-ID: &lt;<a href=3D"mailto:20220806211114.D744986E4F@busybox.osuosl.=
org" target=3D"_blank">20220806211114.D744986E4F@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D5349010=
f7657c9597c04bfbea6157840a4a2993c" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3D5349010f7657c9597c04bfbea6157=
840a4a2993c</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/docker-engine/docker-engine.hash | 2 +-<br>
=C2=A0package/docker-engine/<a href=3D"http://docker-engine.mk" rel=3D"nore=
ferrer" target=3D"_blank">docker-engine.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engi=
ne/docker-engine.hash<br>
index d4fe83a806..2cf2f4a75e 100644<br>
--- a/package/docker-engine/docker-engine.hash<br>
+++ b/package/docker-engine/docker-engine.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 dbe1ae342351108b7b30232c4bce0559c81ad9fb6c978d7c8425d6aa53e47=
6c1=C2=A0 docker-engine-20.10.14.tar.gz<br>
+sha256=C2=A0 061cf8579aa3c813c353c80fa480744e2f6cca2e6392f546bd0942a6a10c7=
a14=C2=A0 docker-engine-20.10.17.tar.gz<br>
=C2=A0sha256=C2=A0 7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99f=
c37914a8=C2=A0 LICENSE<br>
diff --git a/package/docker-engine/<a href=3D"http://docker-engine.mk" rel=
=3D"noreferrer" target=3D"_blank">docker-engine.mk</a> b/package/docker-eng=
ine/<a href=3D"http://docker-engine.mk" rel=3D"noreferrer" target=3D"_blank=
">docker-engine.mk</a><br>
index 3aef31599f..293af1858c 100644<br>
--- a/package/docker-engine/<a href=3D"http://docker-engine.mk" rel=3D"nore=
ferrer" target=3D"_blank">docker-engine.mk</a><br>
+++ b/package/docker-engine/<a href=3D"http://docker-engine.mk" rel=3D"nore=
ferrer" target=3D"_blank">docker-engine.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-DOCKER_ENGINE_VERSION =3D 20.10.14<br>
+DOCKER_ENGINE_VERSION =3D 20.10.17<br>
=C2=A0DOCKER_ENGINE_SITE =3D $(call github,moby,moby,v$(DOCKER_ENGINE_VERSI=
ON))<br>
<br>
=C2=A0DOCKER_ENGINE_LICENSE =3D Apache-2.0<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Sat, 6 Aug 2022 23:25:02 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/docker-cli: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 20.10.17<br>
Message-ID: &lt;<a href=3D"mailto:20220806211114.CAE1786EC1@busybox.osuosl.=
org" target=3D"_blank">20220806211114.CAE1786EC1@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Dc48aebe=
a8c75d00edfd9788cd9e2b4a4c69ec402" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3Dc48aebea8c75d00edfd9788cd9e2b=
4a4c69ec402</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/docker-cli/docker-cli.hash | 2 +-<br>
=C2=A0package/docker-cli/<a href=3D"http://docker-cli.mk" rel=3D"noreferrer=
" target=3D"_blank">docker-cli.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker=
-cli.hash<br>
index 9a07acf89f..87c5d949c6 100644<br>
--- a/package/docker-cli/docker-cli.hash<br>
+++ b/package/docker-cli/docker-cli.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 bda289b27b18675d6a6ff07568453768fe68c16c27b5e52724e46896d5464=
a55=C2=A0 docker-cli-20.10.14.tar.gz<br>
+sha256=C2=A0 ab2b59c2302017fea9ad2f70827e8a6f0204b557ce28e66bcb80fea262c9f=
bdc=C2=A0 docker-cli-20.10.17.tar.gz<br>
=C2=A0sha256=C2=A0 2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157=
b8c10dc0=C2=A0 LICENSE<br>
diff --git a/package/docker-cli/<a href=3D"http://docker-cli.mk" rel=3D"nor=
eferrer" target=3D"_blank">docker-cli.mk</a> b/package/docker-cli/<a href=
=3D"http://docker-cli.mk" rel=3D"noreferrer" target=3D"_blank">docker-cli.m=
k</a><br>
index c7458f85dd..75507ed48e 100644<br>
--- a/package/docker-cli/<a href=3D"http://docker-cli.mk" rel=3D"noreferrer=
" target=3D"_blank">docker-cli.mk</a><br>
+++ b/package/docker-cli/<a href=3D"http://docker-cli.mk" rel=3D"noreferrer=
" target=3D"_blank">docker-cli.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-DOCKER_CLI_VERSION =3D 20.10.14<br>
+DOCKER_CLI_VERSION =3D 20.10.17<br>
=C2=A0DOCKER_CLI_SITE =3D $(call github,docker,cli,v$(DOCKER_CLI_VERSION))<=
br>
<br>
=C2=A0DOCKER_CLI_LICENSE =3D Apache-2.0<br>
<br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Sat, 6 Aug 2022 23:25:41 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
Cc: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D"_=
blank">christian@paral.in</a>&gt;, &quot;Yann E . MORIN&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yann.morin.1998@free.fr" =
target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump to version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1.1.3<br>
Message-ID: &lt;20220806232541.7cc9bf7c@windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
On Wed,=C2=A0 3 Aug 2022 22:40:37 -0700<br>
Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; This is the third release of the 1.1.z series of runc, and contains va=
rious<br>
&gt; minor improvements and bugfixes.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/opencontainers/runc/releases/tag/v1.1.3"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/run=
c/releases/tag/v1.1.3</a><br>
&gt; <br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral=
.in" target=3D"_blank">christian@paral.in</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/runc/runc.hash | 2 +-<br>
&gt;=C2=A0 package/runc/<a href=3D"http://runc.mk" rel=3D"noreferrer" targe=
t=3D"_blank">runc.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Applied to master, thanks.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Message: 6<br>
Date: Sat, 6 Aug 2022 23:25:51 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
Cc: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D"_=
blank">christian@paral.in</a>&gt;, &quot;Yann E . MORIN&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yann.morin.1998@free.fr" =
target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-cli: bump to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version 20.10.17<br>
Message-ID: &lt;20220806232551.5b06fd3d@windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
On Wed,=C2=A0 3 Aug 2022 22:43:40 -0700<br>
Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral=
.in" target=3D"_blank">christian@paral.in</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/docker-cli/docker-cli.hash | 2 +-<br>
&gt;=C2=A0 package/docker-cli/<a href=3D"http://docker-cli.mk" rel=3D"noref=
errer" target=3D"_blank">docker-cli.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Both applied, thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Message: 7<br>
Date: Sat, 6 Aug 2022 23:25:57 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
Cc: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D"_=
blank">christian@paral.in</a>&gt;, &quot;Yann E . MORIN&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yann.morin.1998@free.fr" =
target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to 1.6.6<br>
Message-ID: &lt;20220806232557.547ee1c8@windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
On Wed,=C2=A0 3 Aug 2022 22:47:36 -0700<br>
Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; v1.6.2 -&gt; v1.6.6:<br>
&gt; <br>
&gt; The third patch release for containerd 1.6 includes various fixes and =
updates.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.=
3" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/conta=
inerd/releases/tag/v1.6.3</a><br>
&gt; <br>
&gt; The fourth patch release for containerd 1.6 includes two fixes for CNI=
 and SELinux.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.=
4" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/conta=
inerd/releases/tag/v1.6.4</a><br>
&gt; <br>
&gt; The fifth patch release for containerd 1.6 includes a few fixes.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.=
5" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/conta=
inerd/releases/tag/v1.6.5</a><br>
&gt; <br>
&gt; The sixth patch release for containerd 1.6 includes a fix for<br>
&gt; CVE-2022-31030.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/containerd/containerd/releases/tag/v1.6.=
6" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/conta=
inerd/releases/tag/v1.6.6</a><br>
&gt; <br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral=
.in" target=3D"_blank">christian@paral.in</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/containerd/containerd.hash | 2 +-<br>
&gt;=C2=A0 package/containerd/<a href=3D"http://containerd.mk" rel=3D"noref=
errer" target=3D"_blank">containerd.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Applied to master, thanks.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Message: 8<br>
Date: Sat, 6 Aug 2022 23:51:27 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank"=
>sen@phobosdpl.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 move to procedurally generated row/column clase=
s<br>
Message-ID: &lt;20220806235127.220d5546@windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
Hello,<br>
<br>
On Fri,=C2=A0 5 Aug 2022 15:01:13 -0500<br>
Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank">sen=
@phobosdpl.com</a>&gt; wrote:<br>
<br>
&gt; Rather than having pre-baked classes in the markup for sorting purpose=
s,<br>
&gt; all the cells in package-grid are iterated over at load time and given=
<br>
&gt; a row/column class.<br>
&gt; <br>
&gt; example: <a href=3D"https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3=
ab3fdfea1e486c14871cfb2a.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html</a=
><br>
&gt; <br>
&gt; Signed-off-by: Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" t=
arget=3D"_blank">sen@phobosdpl.com</a>&gt;<br>
<br>
I am probably not versed enough into HTML/CSS/JS sorcery, but I don&#39;t<b=
r>
understand the benefit of this. Could you explain a bit more?<br>
<br>
&gt;=C2=A0 function sortGrid(sortLabel){<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let i =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let pkgSortArray =3D [], sortedPkgArray =3D =
[], pkgStringSortArray =3D [], pkgNumSortArray =3D [];<br>
&gt; @@ -774,14 +785,11 @@ function sortGrid(sortLabel){<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const styleSheet =3D styleElement.sheet;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 columnValues.shift();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 columnValues.forEach((listing) =3D&gt; {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0columnValues.forEach((listing) =3D&gt; {<br>
<br>
This is a spurious change.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fieldText =3D=3D &quot;see all &=
quot; + fieldTotal + triangleDown){<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0field.firstElementChi=
ld.innerText =3D &quot;see less &quot; + fieldTotal + triangleUp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field.firstEl=
ementChild.innerText =3D &quot;see less &quot; + fieldTotal + triangleUp;<b=
r>
<br>
This is also a spurious change.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Message: 9<br>
Date: Sat, 6 Aug 2022 23:55:57 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank"=
>sen@phobosdpl.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] [PATCH v1 2/2] support/scripts/pkg-stats:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 optimize CSS selector usage<br>
Message-ID: &lt;20220806235557.5d498b6d@windsurf&gt;<br>
Content-Type: text/plain; charset=3DUS-ASCII<br>
<br>
Hello Sen,<br>
<br>
On Fri,=C2=A0 5 Aug 2022 15:01:14 -0500<br>
Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank">sen=
@phobosdpl.com</a>&gt; wrote:<br>
<br>
&gt; Having lots of CSS selector declarations adds up, especially at 70k+<b=
r>
&gt; elements.<br>
&gt; <br>
&gt; This reduces the number of CSS selectors printed in the markup<br>
&gt; to the bare minimum, by using pseudo-classes and tag names as selector=
s.<br>
<br>
Not sure how this works. Is there a significant size benefit? Sometimes<br>
having a dumb but obvious solution is better than having a smart but<br>
convoluted solution.<br>
<br>
&gt; +div {<br>
&gt; +=C2=A0 text-align: center;<br>
&gt; +=C2=A0 border: solid 1px gray;<br>
&gt; +}<br>
&gt; +#results-grid div{<br>
&gt; +=C2=A0 text-align: left;<br>
&gt; +}<br>
&gt; +#package-grid div:nth-child(13n+1), #package-grid div:nth-child(13n+1=
3)=C2=A0 {<br>
&gt; +=C2=A0 text-align: left;<br>
&gt; +}<br>
&gt; +#package-grid div:nth-child(13){<br>
&gt; +=C2=A0 text-align: center;<br>
<br>
What is this 13 magic number?<br>
<br>
Also, unrelated to this, when I look at the currently generated HTML,<br>
it looks odd. I see things like this:<br>
<br>
=C2=A0 &lt;div id=3D&quot;upstream_url__package_kodi-audiodecoder-vgmstream=
_kodi-audiodecoder-vgmstream&quot; class=3D&quot;centered upstream_url data=
 _package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream good_url&=
quot;&gt;&lt;a href=3D&quot;<a href=3D"https://github.com/xbmc/audiodecoder=
.vgmstream" rel=3D"noreferrer" target=3D"_blank">https://github.com/xbmc/au=
diodecoder.vgmstream</a>&quot;&gt;Link&lt;/a&gt;&lt;/div&gt;<br>
<br>
Why do we have these crazy id values now? why does the class property<br>
contain a value such as<br>
_package_kodi-audiodecoder-vgmstream_kodi-audiodecoder-vgmstream?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Message: 10<br>
Date: Sat,=C2=A0 6 Aug 2022 23:56:40 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank"=
>sen@phobosdpl.com</a>&gt;, Thomas Petazzoni<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: remove<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 useless escaping of double quotes<br>
Message-ID: &lt;<a href=3D"mailto:20220806215641.471770-1-thomas.petazzoni@=
bootlin.com" target=3D"_blank">20220806215641.471770-1-thomas.petazzoni@boo=
tlin.com</a>&gt;<br>
<br>
Within single-quoted f-strings, and within triple double quoted<br>
strings, escaping all the double quotes is completely useless and<br>
makes the code more difficult to read. Get rid of all this useless<br>
escaping.<br>
<br>
The renderer HTML is exactly identical before/after this commit.<br>
<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0support/scripts/pkg-stats | 100 +++++++++++++++++++------------------=
-<br>
=C2=A01 file changed, 50 insertions(+), 50 deletions(-)<br>
<br>
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats<br>
index d32abd7225..572757b7ea 100755<br>
--- a/support/scripts/pkg-stats<br>
+++ b/support/scripts/pkg-stats<br>
@@ -886,7 +886,7 @@ function expandField(fieldId){<br>
<br>
=C2=A0&lt;body&gt;<br>
<br>
-&lt;a href=3D\&quot;#results\&quot;&gt;Results&lt;/a&gt;&lt;br/&gt;<br>
+&lt;a href=3D&quot;#results&quot;&gt;Results&lt;/a&gt;&lt;br/&gt;<br>
<br>
=C2=A0&quot;&quot;&quot;=C2=A0 # noqa - tabs and spaces<br>
<br>
@@ -920,8 +920,8 @@ def boolean_str(b):<br>
<br>
=C2=A0def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0pkg_css_class =3D pkg.path.replace(&quot;/&quot;, &quot=
;_&quot;)[:-3]<br>
-=C2=A0 =C2=A0 f.write(f&#39;&lt;div id=3D\&quot;package__{pkg_css_class}\&=
quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D\&quot;package data _{pkg_css_class}\&=
quot;&gt;{pkg.path}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;&lt;div id=3D&quot;package__{pkg_css_class}&qu=
ot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D&quot;package data _{pkg_css_class}&qu=
ot;&gt;{pkg.path}&lt;/div&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0# Patch count<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;patch_count__{pkg_css_class}&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0div_class =3D [&quot;centered patch_count data&quot;]<b=
r>
@@ -932,8 +932,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;somepatches&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;lotsofpatches&quot=
;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;&gt;{str(pkg.patch_count)}&lt;/div&gt;\=
n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;{str(pkg.patch_count)}&lt;/div&gt;\n=
&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Infrastructure<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;infrastructure__{pkg_css_class}=
&#39;<br>
@@ -944,8 +944,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;wrong&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;correct&quot;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;&gt;{infra_str(pkg.infras)}&lt;/div&gt;=
\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;{infra_str(pkg.infras)}&lt;/div&gt;\=
n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# License<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;license__{pkg_css_class}&#39;<b=
r>
@@ -955,8 +955,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;correct&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;wrong&quot;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;&gt;{boolean_str(pkg.is_status_ok(&quot=
;license&quot;))}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;{boolean_str(pkg.is_status_ok(&quot;=
license&quot;))}&lt;/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# License files<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;license_files__{pkg_css_class}&=
#39;<br>
@@ -966,8 +966,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;correct&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;wrong&quot;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;&gt;{boolean_str(pkg.is_status_ok(&quot=
;license-files&quot;))}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;{boolean_str(pkg.is_status_ok(&quot;=
license-files&quot;))}&lt;/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Hash<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;hash_file__{pkg_css_class}&#39;=
<br>
@@ -977,8 +977,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;correct&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;wrong&quot;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 \&quot;&gt;{boolean_str(pkg.is_status_ok(&quot=
;hash&quot;))}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;{boolean_str(pkg.is_status_ok(&quot;=
hash&quot;))}&lt;/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Current version<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;current_version__{pkg_css_class=
}&#39;<br>
@@ -986,8 +986,8 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current_version =3D pkg.current_version[:=
20] + &quot;...&quot;<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current_version =3D pkg.current_version<b=
r>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D\&quot;centered current_version data _=
{pkg_css_class}\&quot;&gt;{current_version}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D&quot;centered current_version data _{=
pkg_css_class}&quot;&gt;{current_version}&lt;/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Latest version<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;latest_version__{pkg_css_class}=
&#39;<br>
@@ -1020,7 +1020,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latest_version_text +=3D &q=
uot;found by guess&quot;<br>
<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;{latest_versio=
n_text}&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;{latest_version_te=
xt}&lt;/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Warnings<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;warnings__{pkg_css_class}&#39;<=
br>
@@ -1030,7 +1030,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;correct&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;wrong&quot;)<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;{pkg.warnings}=
&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;{pkg.warnings}&lt;=
/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# URL status<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;upstream_url__{pkg_css_class}&#=
39;<br>
@@ -1045,7 +1045,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;good_url&quot;)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url_str =3D &quot;&lt;a href=3D\&quot;%s\=
&quot;&gt;Link&lt;/a&gt;&quot; % pkg.url<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;{url_str}&lt;/=
div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;{url_str}&lt;/div&=
gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# CVEs<br>
=C2=A0 =C2=A0 =C2=A0data_field_id =3D f&#39;cves__{pkg_css_class}&#39;<br>
@@ -1061,11 +1061,11 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cve-ok&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cve-unknown&quot;)=
<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if len(pkg.cves) &gt; 10:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_total =3D len(pkg.cves) + 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&#39; &lt;div onclick=3D\&quot;expand=
Field(\&#39;{data_field_id}\&#39;)\&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D\&quot;see-more centered cve_ignored\&=
quot;&gt;see all ({cve_total}) &amp;#9662;&lt;/div&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&#39; &lt;div onclick=3D&quot;expandF=
ield(\&#39;{data_field_id}\&#39;)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 class=3D&quot;see-more centered cve_ignored&qu=
ot;&gt;see all ({cve_total}) &amp;#9662;&lt;/div&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if pkg.is_status_error(&quot;cve&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cve in pkg.cves:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 =C2=A0=
&lt;a href=3D\&quot;<a href=3D"https://security-tracker.debian.org/tracker/=
%s%5C" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian=
.org/tracker/%s\</a>&quot;&gt;%s&lt;/a&gt;&lt;br/&gt;\n&quot; % (cve, cve))=
<br>
@@ -1083,7 +1083,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0div_class.append(f&#39;_{pkg_css_class}&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if pkg.ignored_cves:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cve_ignored&quot;)=
<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0for ignored_cve in pkg.ignored_cves:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 =C2=A0 &lt;a href=3D=
\&quot;<a href=3D"https://security-tracker.debian.org/tracker/%s%5C" rel=3D=
"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tracker/=
%s\</a>&quot;&gt;%s&lt;/a&gt;&lt;br/&gt;\n&quot; % (ignored_cve, ignored_cv=
e))<br>
=C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 &lt;/div&gt;\n&quot;)<br>
@@ -1100,7 +1100,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cpe-ok&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cpe-unknown&quot;)=
<br>
-=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D\&quot;{data_field_id}\&qu=
ot; class=3D\&quot;{&quot; &quot;.join(div_class)}\&quot;&gt;\n&#39;)<br>
+=C2=A0 =C2=A0 f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}&quot=
; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if pkg.cpeid:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpeid_begin =3D &quot;:&quot;.join(pkg.cp=
eid.split(&quot;:&quot;)[0:4]) + &quot;:&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpeid_formatted =3D pkg.cpeid.replace(cpe=
id_begin, cpeid_begin + &quot;&lt;wbr&gt;&quot;)<br>
@@ -1121,33 +1121,33 @@ def dump_html_pkg(f, pkg):<br>
<br>
=C2=A0def dump_html_all_pkgs(f, packages):<br>
=C2=A0 =C2=A0 =C2=A0f.write(&quot;&quot;&quot;<br>
-&lt;div id=3D\&quot;package-grid\&quot;&gt;<br>
-&lt;div style=3D&quot;grid-column: 1;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;package\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;package data label\&quot;&gt;&lt;span&g=
t;Package&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 2;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;patch_count\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered patch_count data label\&quot;&=
gt;&lt;span&gt;Patch count&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt=
;<br>
-&lt;div style=3D&quot;grid-column: 3;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;infrastructure\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered infrastructure data label\&quo=
t;&gt;Infrastructure&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 4;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;license\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered license data label\&quot;&gt;&=
lt;span&gt;License&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 5;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;license_files\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered license_files data label\&quot=
;&gt;&lt;span&gt;License files&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/di=
v&gt;<br>
-&lt;div style=3D&quot;grid-column: 6;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;hash_file\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered hash_file data label\&quot;&gt=
;&lt;span&gt;Hash file&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br=
>
-&lt;div style=3D&quot;grid-column: 7;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;current_version\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered current_version data label\&qu=
ot;&gt;&lt;span&gt;Current version&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt=
;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 8;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;latest_version\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered latest_version data label\&quo=
t;&gt;&lt;span&gt;Latest version&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/=
div&gt;<br>
-&lt;div style=3D&quot;grid-column: 9;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D\&quot;warnings\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered warnings data label\&quot;&gt;=
&lt;span&gt;Warnings&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 10;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D\&quot;upstream_url\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered upstream_url data label\&quot;=
&gt;&lt;span&gt;Upstream URL&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&=
gt;<br>
-&lt;div style=3D&quot;grid-column: 11;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D\&quot;cves\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered cves data label\&quot;&gt;&lt;=
span&gt;CVEs&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
-&lt;div style=3D&quot;grid-column: 12;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D\&quot;ignored_cves\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered ignored_cves data label\&quot;=
&gt;&lt;span&gt;CVEs Ignored&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&=
gt;<br>
-&lt;div style=3D&quot;grid-column: 13;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D\&quot;cpe_id\&quot;<br>
-=C2=A0 =C2=A0 =C2=A0class=3D\&quot;centered cpe_id data label\&quot;&gt;&l=
t;span&gt;CPE ID&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div id=3D&quot;package-grid&quot;&gt;<br>
+&lt;div style=3D&quot;grid-column: 1;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;package&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;package data label&quot;&gt;&lt;span&gt;=
Package&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 2;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;patch_count&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered patch_count data label&quot;&gt=
;&lt;span&gt;Patch count&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<=
br>
+&lt;div style=3D&quot;grid-column: 3;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;infrastructure&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered infrastructure data label&quot;=
&gt;Infrastructure&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 4;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;license&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered license data label&quot;&gt;&lt=
;span&gt;License&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 5;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;license_files&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered license_files data label&quot;&=
gt;&lt;span&gt;License files&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&=
gt;<br>
+&lt;div style=3D&quot;grid-column: 6;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;hash_file&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered hash_file data label&quot;&gt;&=
lt;span&gt;Hash file&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 7;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;current_version&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered current_version data label&quot=
;&gt;&lt;span&gt;Current version&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/=
div&gt;<br>
+&lt;div style=3D&quot;grid-column: 8;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;latest_version&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered latest_version data label&quot;=
&gt;&lt;span&gt;Latest version&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/di=
v&gt;<br>
+&lt;div style=3D&quot;grid-column: 9;&quot; onclick=3D&quot;sortGrid(<a hr=
ef=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&quo=
t; id=3D&quot;warnings&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered warnings data label&quot;&gt;&l=
t;span&gt;Warnings&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 10;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D&quot;upstream_url&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered upstream_url data label&quot;&g=
t;&lt;span&gt;Upstream URL&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt=
;<br>
+&lt;div style=3D&quot;grid-column: 11;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D&quot;cves&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered cves data label&quot;&gt;&lt;sp=
an&gt;CVEs&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
+&lt;div style=3D&quot;grid-column: 12;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D&quot;ignored_cves&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered ignored_cves data label&quot;&g=
t;&lt;span&gt;CVEs Ignored&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt=
;<br>
+&lt;div style=3D&quot;grid-column: 13;&quot; onclick=3D&quot;sortGrid(<a h=
ref=3D"http://this.id" rel=3D"noreferrer" target=3D"_blank">this.id</a>)&qu=
ot; id=3D&quot;cpe_id&quot;<br>
+=C2=A0 =C2=A0 =C2=A0class=3D&quot;centered cpe_id data label&quot;&gt;&lt;=
span&gt;CPE ID&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/div&gt;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0for pkg in sorted(packages):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_html_pkg(f, pkg)<br>
-- <br>
2.37.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 11<br>
Date: Sat,=C2=A0 6 Aug 2022 23:56:41 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Sen Hastings &lt;<a href=3D"mailto:sen@phobosdpl.com" target=3D"_blank"=
>sen@phobosdpl.com</a>&gt;, Thomas Petazzoni<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: remove<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 remaining double quote escaping<br>
Message-ID: &lt;<a href=3D"mailto:20220806215641.471770-2-thomas.petazzoni@=
bootlin.com" target=3D"_blank">20220806215641.471770-2-thomas.petazzoni@boo=
tlin.com</a>&gt;<br>
<br>
This is done either by switching to single quoted f-strings, triple<br>
double quoted f-strings when needed, or simply single-quoted strings.<br>
<br>
The renderer HTML is exactly identical before/after this commit.<br>
<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0support/scripts/pkg-stats | 67 +++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 32 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats<br>
index 572757b7ea..aa3b49c809 100755<br>
--- a/support/scripts/pkg-stats<br>
+++ b/support/scripts/pkg-stats<br>
@@ -1010,13 +1010,12 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg.latest_version[&#39;version&#39;] =
is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latest_version_text =3D &qu=
ot;&lt;b&gt;Found, but no version&lt;/b&gt;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 latest_version_text =3D &quot;&l=
t;a href=3D\&quot;<a href=3D"https://release-monitoring.org/project/%s%5C" =
rel=3D"noreferrer" target=3D"_blank">https://release-monitoring.org/project=
/%s\</a>&quot;&gt;&lt;b&gt;%s&lt;/b&gt;&lt;/a&gt;&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkg.latest_versio=
n[&#39;id&#39;], str(pkg.latest_version[&#39;version&#39;]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 latest_version_text =3D f&quot;&=
quot;&quot;&lt;a href=3D&quot;<a href=3D"https://release-monitoring.org/pro=
ject/%7Bpkg.latest_version%5B&#39;id&#39;%5D%7D" rel=3D"noreferrer" target=
=3D"_blank">https://release-monitoring.org/project/{pkg.latest_version[&#39=
;id&#39;]}</a>&quot;&gt;&lt;b&gt;{str(pkg.latest_version[&#39;version&#39;]=
)}&lt;/b&gt;&lt;/a&gt;&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latest_version_text +=3D &quot;&lt;br/&gt=
;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg.latest_version[&#39;status&#39;] =
=3D=3D RM_API_STATUS_FOUND_BY_DISTRO:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 latest_version_text +=3D &quot;f=
ound by &lt;a href=3D\&quot;<a href=3D"https://release-monitoring.org/distr=
o/Buildroot/%5C" rel=3D"noreferrer" target=3D"_blank">https://release-monit=
oring.org/distro/Buildroot/\</a>&quot;&gt;distro&lt;/a&gt;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 latest_version_text +=3D f&#39;f=
ound by &lt;a href=3D&quot;<a href=3D"https://release-monitoring.org/distro=
/Buildroot/" rel=3D"noreferrer" target=3D"_blank">https://release-monitorin=
g.org/distro/Buildroot/</a>&quot;&gt;distro&lt;/a&gt;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latest_version_text +=3D &q=
uot;found by guess&quot;<br>
<br>
@@ -1041,10 +1040,10 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;missing_url&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0if pkg.status[&#39;url&#39;][0] =3D=3D &quot;error&quot=
;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;invalid_url&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_str =3D &quot;&lt;a href=3D\&quot;%s\&quot=
;&gt;%s&lt;/a&gt;&quot; % (pkg.url, pkg.status[&#39;url&#39;][1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_str =3D f&quot;&quot;&quot;&lt;a href=3D&q=
uot;{pkg.url}&quot;&gt;{pkg.status[&#39;url&#39;][1]}&lt;/a&gt;&quot;&quot;=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;good_url&quot;)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_str =3D &quot;&lt;a href=3D\&quot;%s\&quot=
;&gt;Link&lt;/a&gt;&quot; % pkg.url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_str =3D f&#39;&lt;a href=3D&quot;{pkg.url}=
&quot;&gt;Link&lt;/a&gt;&#39;<br>
=C2=A0 =C2=A0 =C2=A0f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}=
&quot; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;{url_str}&lt;=
/div&gt;\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# CVEs<br>
@@ -1068,11 +1067,11 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0class=3D&quot;see-more centered cve_ignor=
ed&quot;&gt;see all ({cve_total}) &amp;#9662;&lt;/div&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if pkg.is_status_error(&quot;cve&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cve in pkg.cves:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=A0 =C2=A0&lt;a=
 href=3D\&quot;<a href=3D"https://security-tracker.debian.org/tracker/%s%5C=
" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/=
tracker/%s\</a>&quot;&gt;%s&lt;/a&gt;&lt;br/&gt;\n&quot; % (cve, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&#39;=C2=A0 =C2=A0&lt;a=
 href=3D&quot;<a href=3D"https://security-tracker.debian.org/tracker/%7Bcve=
%7D" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/{cve}</a>&quot;&gt;{cve}&lt;/a&gt;&lt;br/&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cve in pkg.unsure_cves:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=A0 =C2=A0&lt;a=
 href=3D\&quot;<a href=3D"https://security-tracker.debian.org/tracker/%s%5C=
" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/=
tracker/%s\</a>&quot;&gt;%s &lt;i&gt;(unsure)&lt;/i&gt;&lt;/a&gt;&lt;br/&gt=
;\n&quot; % (cve, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&#39;=C2=A0 =C2=A0&lt;a=
 href=3D&quot;<a href=3D"https://security-tracker.debian.org/tracker/%7Bcve=
%7D" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/{cve}</a>&quot;&gt;{cve} &lt;i&gt;(unsure)&lt;/i&gt;&lt;/a&gt;&l=
t;br/&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0elif pkg.is_status_na(&quot;cve&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=A0 =C2=A0 %s&quot; % pkg.sta=
tus[&#39;cve&#39;][1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;&quot;&quot;=C2=A0 =C2=A0 {pkg.=
status[&#39;cve&#39;][1]}&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 =C2=A0 N/A\n&quot;)<=
br>
=C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 &lt;/div&gt;\n&quot;)<br>
@@ -1085,7 +1084,7 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_class.append(&quot;cve_ignored&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0f.write(f&#39;=C2=A0 &lt;div id=3D&quot;{data_field_id}=
&quot; class=3D&quot;{&quot; &quot;.join(div_class)}&quot;&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0for ignored_cve in pkg.ignored_cves:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=A0 =C2=A0 &lt;a href=3D\&quo=
t;<a href=3D"https://security-tracker.debian.org/tracker/%s%5C" rel=3D"nore=
ferrer" target=3D"_blank">https://security-tracker.debian.org/tracker/%s\</=
a>&quot;&gt;%s&lt;/a&gt;&lt;br/&gt;\n&quot; % (ignored_cve, ignored_cve))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&#39;=C2=A0 =C2=A0 &lt;a href=3D&quot=
;<a href=3D"https://security-tracker.debian.org/tracker/%7Bignored_cve%7D" =
rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tr=
acker/{ignored_cve}</a>&quot;&gt;{ignored_cve}&lt;/a&gt;&lt;br/&gt;\n&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 &lt;/div&gt;\n&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# CPE ID<br>
@@ -1108,11 +1107,9 @@ def dump_html_pkg(f, pkg):<br>
=C2=A0 =C2=A0 =C2=A0if not pkg.is_status_ok(&quot;cpe&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg.is_actual_package and pkg.current_=
version:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg.cpeid:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=
=A0 &lt;br/&gt;%s &lt;a href=3D\&quot;<a href=3D"https://nvd.nist.gov/produ=
cts/cpe/search/results?namingFormat=3D2.3&amp;keyword=3D%s%5C" rel=3D"noref=
errer" target=3D"_blank">https://nvd.nist.gov/products/cpe/search/results?n=
amingFormat=3D2.3&amp;keyword=3D%s\</a>&quot;&gt;(Search)&lt;/a&gt;\n&quot;=
 %=C2=A0 # noqa: E501<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (pkg.status[&#39;cpe&#39;][1], &quot;:&quot;.join(pkg.cpeid.spli=
t(&quot;:&quot;)[0:5])))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;&qu=
ot;&quot;=C2=A0 &lt;br/&gt;{pkg.status[&#39;cpe&#39;][1]} &lt;a href=3D&quo=
t;<a href=3D"https://nvd.nist.gov/products/cpe/search/results?namingFormat=
=3D2.3&amp;keyword=3D%7B" rel=3D"noreferrer" target=3D"_blank">https://nvd.=
nist.gov/products/cpe/search/results?namingFormat=3D2.3&amp;keyword=3D{</a>=
&quot;:&quot;.join(pkg.cpeid.split(&quot;:&quot;)[0:5])}&quot;&gt;(Search)&=
lt;/a&gt;\n&quot;&quot;&quot;) # noqa: E501<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;=C2=
=A0 %s &lt;a href=3D\&quot;<a href=3D"https://nvd.nist.gov/products/cpe/sea=
rch/results?namingFormat=3D2.3&amp;keyword=3D%s%5C" rel=3D"noreferrer" targ=
et=3D"_blank">https://nvd.nist.gov/products/cpe/search/results?namingFormat=
=3D2.3&amp;keyword=3D%s\</a>&quot;&gt;(Search)&lt;/a&gt;\n&quot; %=C2=A0 # =
noqa: E501<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (pkg.status[&#39;cpe&#39;][1], <a href=3D"http://pkg.name" rel=
=3D"noreferrer" target=3D"_blank">pkg.name</a>))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;&qu=
ot;&quot;=C2=A0 {pkg.status[&#39;cpe&#39;][1]} &lt;a href=3D&quot;<a href=
=3D"https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&amp=
;keyword=3D%7Bpkg.name%7D" rel=3D"noreferrer" target=3D"_blank">https://nvd=
.nist.gov/products/cpe/search/results?namingFormat=3D2.3&amp;keyword=3D{pkg=
.name}</a>&quot;&gt;(Search)&lt;/a&gt;\n&quot;&quot;&quot;)=C2=A0 # noqa: E=
501<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;=C2=A0 %s\n&q=
uot; % pkg.status[&#39;cpe&#39;][1])<br>
<br>
@@ -1155,49 +1152,49 @@ def dump_html_all_pkgs(f, packages):<br>
<br>
<br>
=C2=A0def dump_html_stats(f, stats):<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;a id=3D\&quot;results\&quot;&gt;&lt;/a&gt;=
\n&quot;)<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot; id=3D\&quot=
;results-grid\&quot;&gt;\n&quot;)<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;a id=3D&quot;results&quot;&gt;&lt;/a&gt;\n&=
#39;)<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot; id=3D&quot;res=
ults-grid&quot;&gt;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0infras =3D [infra[6:] for infra in stats.keys() if infr=
a.startswith(&quot;infra-&quot;)]<br>
=C2=A0 =C2=A0 =C2=A0for infra in infras:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&qu=
ot;&gt;Packages using the &lt;i&gt;%s&lt;/i&gt; infrastructure&lt;/div&gt;&=
lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;=
&gt;Packages using the &lt;i&gt;%s&lt;/i&gt; infrastructure&lt;/div&gt;&lt;=
div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(infra, stats=
[&quot;infra-%s&quot; % infra]))<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s having license information&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&=
gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages h=
aving license information&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s=
&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;license&quot;])=
<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s not having license information&lt;/div&gt;&lt;div class=3D\&quot;data\&qu=
ot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages n=
ot having license information&lt;/div&gt;&lt;div class=3D&quot;data&quot;&g=
t;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;no-license&quot=
;])<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s having license files information&lt;/div&gt;&lt;div class=3D\&quot;data\&=
quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages h=
aving license files information&lt;/div&gt;&lt;div class=3D&quot;data&quot;=
&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;license-files&q=
uot;])<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s not having license files information&lt;/div&gt;&lt;div class=3D\&quot;da=
ta\&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages n=
ot having license files information&lt;/div&gt;&lt;div class=3D&quot;data&q=
uot;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;no-license-file=
s&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s having a hash file&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt=
;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages h=
aving a hash file&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div=
&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;hash&quot;])<br=
>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Package=
s not having a hash file&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%=
s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Packages n=
ot having a hash file&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;=
/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;no-hash&quot;])=
<br>
-=C2=A0 =C2=A0 f.write(&quot; &lt;div class=3D\&quot;data\&quot;&gt;Total n=
umber of patches&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/di=
v&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39; &lt;div class=3D&quot;data&quot;&gt;Total numb=
er of patches&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;=
\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;patches&quot;])=
<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 having a mapping on &lt;i&gt;<a href=3D"http://release-monitoring.org" rel=
=3D"noreferrer" target=3D"_blank">release-monitoring.org</a>&lt;/i&gt;&lt;/=
div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages ha=
ving a mapping on &lt;i&gt;<a href=3D"http://release-monitoring.org" rel=3D=
"noreferrer" target=3D"_blank">release-monitoring.org</a>&lt;/i&gt;&lt;/div=
&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;rmo-mapping&quo=
t;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 lacking a mapping on &lt;i&gt;<a href=3D"http://release-monitoring.org" re=
l=3D"noreferrer" target=3D"_blank">release-monitoring.org</a>&lt;/i&gt;&lt;=
/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages la=
cking a mapping on &lt;i&gt;<a href=3D"http://release-monitoring.org" rel=
=3D"noreferrer" target=3D"_blank">release-monitoring.org</a>&lt;/i&gt;&lt;/=
div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;rmo-no-mapping&=
quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 that are up-to-date&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt=
;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages th=
at are up-to-date&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div=
&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;version-uptodat=
e&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 that are not up-to-date&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%=
s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages th=
at are not up-to-date&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;=
/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;version-not-upt=
odate&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 with no known upstream version&lt;/div&gt;&lt;div class=3D\&quot;data\&quo=
t;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages wi=
th no known upstream version&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt=
;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;version-unknown=
&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 affected by CVEs&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/d=
iv&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages af=
fected by CVEs&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt=
;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;pkg-cves&quot;]=
)<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Total nu=
mber of CVEs affecting all packages&lt;/div&gt;&lt;div class=3D\&quot;data\=
&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Total numbe=
r of CVEs affecting all packages&lt;/div&gt;&lt;div class=3D&quot;data&quot=
;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;total-cves&quot=
;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 affected by unsure CVEs&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%=
s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages af=
fected by unsure CVEs&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;=
/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;pkg-unsure-cves=
&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Total nu=
mber of unsure CVEs affecting all packages&lt;/div&gt;&lt;div class=3D\&quo=
t;data\&quot;&gt;%s&lt;/div&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Total numbe=
r of unsure CVEs affecting all packages&lt;/div&gt;&lt;div class=3D&quot;da=
ta&quot;&gt;%s&lt;/div&gt;\n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;total-unsure-cv=
es&quot;])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 with CPE ID&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/div&gt=
;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages wi=
th CPE ID&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;\n&#=
39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;cpe-id&quot;])<=
br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;div class=3D\&quot;data\&quot;&gt;Packages=
 without CPE ID&lt;/div&gt;&lt;div class=3D\&quot;data\&quot;&gt;%s&lt;/div=
&gt;\n&quot; %<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;div class=3D&quot;data&quot;&gt;Packages wi=
thout CPE ID&lt;/div&gt;&lt;div class=3D&quot;data&quot;&gt;%s&lt;/div&gt;\=
n&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;no-cpe-id&quot;=
])<br>
-=C2=A0 =C2=A0 f.write(&quot;&lt;/div&gt;\n&quot;)<br>
+=C2=A0 =C2=A0 f.write(&#39;&lt;/div&gt;\n&#39;)<br>
<br>
<br>
=C2=A0def dump_html_gen_info(f, date, commit):<br>
-- <br>
2.37.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 12<br>
Date: Sat, 6 Aug 2022 23:57:44 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/<a href=3D"http://pkg-meson.mk" r=
el=3D"noreferrer" target=3D"_blank">pkg-meson.mk</a>: add support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fortran cross-compilation<br>
Message-ID: &lt;<a href=3D"mailto:20220806214425.4DA8F86ECA@busybox.osuosl.=
org" target=3D"_blank">20220806214425.4DA8F86ECA@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D88dd3fc=
d7277fdb61c911d7ae454df886e423377" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3D88dd3fcd7277fdb61c911d7ae454d=
f886e423377</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
python-scipy is moving to a meson build infrastructure, and requires<br>
fortran cross-compilation. This commit extends the cross-compilation<br>
configuration file generated for use by meson to add the &quot;fortran&quot=
;,<br>
&quot;fortran_args&quot; and &quot;fortran_link_args&quot; properties.<br>
<br>
Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bressaix@g=
mail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0package/<a href=3D"http://pkg-meson.mk" rel=3D"noreferrer" target=3D"=
_blank">pkg-meson.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0support/misc/<a href=3D"http://cross-compilation.conf.in" rel=3D"nore=
ferrer" target=3D"_blank">cross-compilation.conf.in</a> | 3 +++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-meson.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-meson.mk</a> b/package/<a href=3D"http://pkg-meson.mk" r=
el=3D"noreferrer" target=3D"_blank">pkg-meson.mk</a><br>
index 156b005fdd..32d41170f3 100644<br>
--- a/package/<a href=3D"http://pkg-meson.mk" rel=3D"noreferrer" target=3D"=
_blank">pkg-meson.mk</a><br>
+++ b/package/<a href=3D"http://pkg-meson.mk" rel=3D"noreferrer" target=3D"=
_blank">pkg-meson.mk</a><br>
@@ -76,10 +76,12 @@ define PKG_MESON_CROSSCONFIG_SED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_CC@%$(TARGET_CC)%g&quo=
t; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_CXX@%$(TARGET_CXX)%g&q=
uot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_AR@%$(TARGET_AR)%g&quo=
t; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s%@TARGET_FC@%$(TARGET_FC)%g&quot; \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_STRIP@%$(TARGET_STRIP)=
%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_ARCH@%$(PKG_MESON_TARG=
ET_CPU_FAMILY)%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_CPU@%$(GCC_TARGET_CPU)=
%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_ENDIAN@%$(call qstrip,=
$(call LOWERCASE,$(BR2_ENDIAN)))%g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s%@TARGET_FCFLAGS@%$(call make-sq-com=
ma-list,$($(strip $(2))))%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_CFLAGS@%$(call make-sq=
-comma-list,$($(strip $(1))))%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_LDFLAGS@%$(call make-s=
q-comma-list,$($(strip $(3))))%g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s%@TARGET_CXXFLAGS@%$(call make-=
sq-comma-list,$($(strip $(2))))%g&quot; \<br>
diff --git a/support/misc/<a href=3D"http://cross-compilation.conf.in" rel=
=3D"noreferrer" target=3D"_blank">cross-compilation.conf.in</a> b/support/m=
isc/<a href=3D"http://cross-compilation.conf.in" rel=3D"noreferrer" target=
=3D"_blank">cross-compilation.conf.in</a><br>
index 235e5a8495..7053df472b 100644<br>
--- a/support/misc/<a href=3D"http://cross-compilation.conf.in" rel=3D"nore=
ferrer" target=3D"_blank">cross-compilation.conf.in</a><br>
+++ b/support/misc/<a href=3D"http://cross-compilation.conf.in" rel=3D"nore=
ferrer" target=3D"_blank">cross-compilation.conf.in</a><br>
@@ -9,6 +9,7 @@ cpp =3D &#39;@TARGET_CXX@&#39;<br>
=C2=A0ar =3D &#39;@TARGET_AR@&#39;<br>
=C2=A0strip =3D &#39;@TARGET_STRIP@&#39;<br>
=C2=A0cmake =3D &#39;@BR2_CMAKE@&#39;<br>
+fortran =3D &#39;@TARGET_FC@&#39;<br>
=C2=A0pkgconfig =3D &#39;@PKGCONF_HOST_BINARY@&#39;<br>
=C2=A0g-ir-compiler =3D &#39;@STAGING_DIR@/usr/bin/g-ir-compiler&#39;<br>
=C2=A0g-ir-scanner =3D &#39;@STAGING_DIR@/usr/bin/g-ir-scanner&#39;<br>
@@ -18,6 +19,8 @@ c_args =3D [@TARGET_CFLAGS@]<br>
=C2=A0c_link_args =3D [@TARGET_LDFLAGS@]<br>
=C2=A0cpp_args =3D [@TARGET_CXXFLAGS@]<br>
=C2=A0cpp_link_args =3D [@TARGET_LDFLAGS@]<br>
+fortran_args =3D [@TARGET_FCFLAGS@]<br>
+fortran_link_args =3D [@TARGET_LDFLAGS@]<br>
=C2=A0wrap_mode =3D &#39;nodownload&#39;<br>
=C2=A0cmake_prefix_path =3D &#39;@STAGING_DIR@/usr/lib/cmake&#39;<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 13<br>
Date: Sat, 6 Aug 2022 23:54:17 +0200<br>
From: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineerin=
g.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;<br>
To: Stefano Cottafavi &lt;<a href=3D"mailto:stefano.cottafavi@gmail.com" ta=
rget=3D"_blank">stefano.cottafavi@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:8aafffc2-748f-becd-cac3-d=
a7a3fad44be@benettiengineering.com" target=3D"_blank">8aafffc2-748f-becd-ca=
c3-da7a3fad44be@benettiengineering.com</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8; format=3Dflowed<br>
<br>
Hi Stefano,<br>
<br>
On 06/08/22 20:15, Stefano Cottafavi wrote:<br>
&gt; Hi Giulio,<br>
&gt; thanks for the quick reply. Here&#39;s the defconfig <br>
&gt; <a href=3D"https://pastebin.com/Xsh5d4HG" rel=3D"noreferrer" target=3D=
"_blank">https://pastebin.com/Xsh5d4HG</a> &lt;<a href=3D"https://pastebin.=
com/Xsh5d4HG" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/Xsh=
5d4HG</a>&gt;<br>
&gt; For the sake of completeness I didn&#39;t remove any of the lines, but=
 some <br>
&gt; are specific to my out-of-tree folder and overlays, so you might want =
to <br>
&gt; get rid of those.<br>
&gt; <br>
&gt; I&#39;m currently building the 2022.05.1 tag with SHA <br>
&gt; 2e399893b4f60f1e103228df6e4439d4e4ac3dd5<br>
<br>
Thank you. I&#39;m building it right now. The package <a href=3D"http://ope=
ncv4.mk" rel=3D"noreferrer" target=3D"_blank">opencv4.mk</a> looks<br>
correct because it does have OPENCV4_INSTALL_STAGING =3D YES, and that<br>
should install the header files. If there is a bug it could be inside<br>
opencv4 cmake itself.<br>
<br>
By the way, I guess the problem you&#39;re experience is that you after<br>
building the Buildroot&#39;s defconfig you try to build another application=
<br>
(i.e. a qt5 application) that requires opencv4 and it can&#39;t find the<br=
>
headers, right?<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
<br>
&gt; Looking forward to your insights.<br>
&gt; <br>
&gt; Best<br>
&gt; Stefano<br>
&gt; <br>
&gt; On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti <br>
&gt; &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com" target=3D=
"_blank">giulio.benetti@benettiengineering.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:giulio.benetti@benettiengineering.com" ta=
rget=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;&gt; wrote:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Stefano,<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Il giorno 6 ago 2022, alle ore 19:29, Stefano C=
ottafavi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:stefano.cottafavi@gmail.c=
om" target=3D"_blank">stefano.cottafavi@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:stefano.cottafavi@gmail.com" target=3D"_blank">stefano.cottafavi@gm=
ail.com</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ha scritto:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Hi all,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ve successfully built Buildroot 2022.05 f=
or the Raspberry Pi4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0adding support for Qt5 and OpenCV (including ob=
jdetect module<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0amongst few other).<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ve also managed to generate?the SDK for s=
uch a build however I<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t find the header files of those OpenCV=
 modules anywhere in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the SDK.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Is this expected or a bug?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It looks like a bug. Can you please pastebin your s=
pecific defconfig?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You can obtain it moving to your output folder and =
?issuing:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$ make savedeconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0then you obtain a file called defconfig so copy and=
 paste it on<br>
&gt;=C2=A0 =C2=A0 =C2=A0pastebin and provide here<br>
&gt;=C2=A0 =C2=A0 =C2=A0the link to the pastebin and also the SHA1 commit o=
f your Buildroot<br>
&gt;=C2=A0 =C2=A0 =C2=A0git or the specific version.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This way we can help you.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0?<br>
&gt;=C2=A0 =C2=A0 =C2=A0Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0CEO/CTO@Benetti Engineering sas<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0buildroot mailing list<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:buildroot@buildroot.org" targ=
et=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:buil=
droot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mail=
man/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.=
buildroot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 14<br>
Date: Sun,=C2=A0 7 Aug 2022 02:05:37 +0200<br>
From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" ta=
rget=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Cc: Guillaume William Brs &lt;<a href=3D"mailto:guillaume.bressaix@gmail.co=
m" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;, Yegor<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Yefremov &lt;<a href=3D"mailto:yegorslists@goog=
lemail.com" target=3D"_blank">yegorslists@googlemail.com</a>&gt;, Asaf Kahl=
on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:asafka7@gmail.com" target=
=3D"_blank">asafka7@gmail.com</a>&gt;, Jagan Teki &lt;<a href=3D"mailto:jag=
an@amarulasolutions.com" target=3D"_blank">jagan@amarulasolutions.com</a>&g=
t;, Fabrice<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
Subject: [Buildroot] [PATCH 1/1] package/python-scipy: add CPE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 variables<br>
Message-ID: &lt;<a href=3D"mailto:20220807000537.182514-1-fontaine.fabrice@=
gmail.com" target=3D"_blank">20220807000537.182514-1-fontaine.fabrice@gmail=
.com</a>&gt;<br>
<br>
cpe:2.3:a:scipy:scipy is a valid CPE identifier for this package:<br>
<br>
=C2=A0 <a href=3D"https://nvd.nist.gov/products/cpe/search/results?namingFo=
rmat=3D2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Ascipy%3Ascipy" rel=3D"noreferrer" =
target=3D"_blank">https://nvd.nist.gov/products/cpe/search/results?namingFo=
rmat=3D2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Ascipy%3Ascipy</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D=
"noreferrer" target=3D"_blank">python-scipy.mk</a> b/package/python-scipy/<=
a href=3D"http://python-scipy.mk" rel=3D"noreferrer" target=3D"_blank">pyth=
on-scipy.mk</a><br>
index b5006a2e15..a8c23c6c88 100644<br>
--- a/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a><br>
+++ b/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a><br>
@@ -22,6 +22,8 @@ PYTHON_SCIPY_LICENSE_FILES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scipy/sparse/linalg/_dsolve/SuperLU/License.txt=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYIN=
G \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scipy/spatial/qhull_src/COPYING.txt<br>
+PYTHON_SCIPY_CPE_ID_VENDOR =3D scipy<br>
+PYTHON_SCIPY_CPE_ID_PRODUCT =3D scipy<br>
=C2=A0PYTHON_SCIPY_DEPENDENCIES +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-numpy \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-pythran \<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 15<br>
Date: Sun, 7 Aug 2022 00:01:42 +0200<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [git commit] package/<a href=3D"http://pkg-meson.mk" r=
el=3D"noreferrer" target=3D"_blank">pkg-meson.mk</a>: fix handling<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of fortran compiler flags<br>
Message-ID: &lt;<a href=3D"mailto:20220806215604.E11BF86ECF@busybox.osuosl.=
org" target=3D"_blank">20220806215604.E11BF86ECF@busybox.osuosl.org</a>&gt;=
<br>
<br>
commit: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Dcd933d6=
76f210789730ecb25b23d902620d72072" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.buildroot.net/buildroot/commit/?id=3Dcd933d676f210789730ecb25b23d9=
02620d72072</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Commit<br>
88dd3fcd7277fdb61c911d7ae454df886e423377 (&quot;package/<a href=3D"http://p=
kg-meson.mk" rel=3D"noreferrer" target=3D"_blank"></a></blockquote></div></=
div>

--000000000000846de005e5a54320--


--===============1185496580382117020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1185496580382117020==--



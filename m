Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2542C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 17:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FF3A408C0;
	Mon,  4 Jul 2022 17:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF3A408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3bXTkElEF6l; Mon,  4 Jul 2022 17:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 489D240138;
	Mon,  4 Jul 2022 17:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 489D240138
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD10E1BF340
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 17:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979EC60A94
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 17:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979EC60A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1z4SXEcDnNA for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 17:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843CB60A88
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 843CB60A88
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 17:29:37 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 e14-20020a9d018e000000b00618ca3183a0so7393436ote.13
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 10:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8J5Kz/AbtH7sDnFV1pxEpBxoH4V8vB96w8TVN3zusIU=;
 b=YAZcLEHL7m1S4uNE7fPp5tOWJZnxovN0Cydq+6anKnBEgzBc+lkmwEUh1gRCEMAmCt
 5oXkl5WGGM4k/oOHraRTYRdFDrdyxEhxtmT5220Ltn3vJxiyJi6rrdj73B1uEQFL1igs
 M8tQQUn6V/jFH5HiFglT8q+Yn9q9TsjQ4nxqWnK4tSO+xarkCGGC85z/7J2E0A7yHNWX
 MLicj3MiIL+Pt6RbcfQEut6Xg/PTcpOwInPRScd2ZBYmrCwekz1pPTM23FH0SkxYrWmI
 yTw0W0id6PZ1lh5DkJwQkph1RGbyoOsHyDZU5LORYfGwdUMdHaH0dpCOyRb3jm5S/HH2
 glAw==
X-Gm-Message-State: AJIora+9vF5OQxpjc2VUPANR4zH0AW+AVxw3CUHQ/KS+QMKfm15t37vI
 uWOAuHj15pXx1Xa5nX6yZ9GQ+7A8OllAjbO2iYMzTeXT
X-Google-Smtp-Source: AGRyM1tumsc6kpHhvGuVRrfEN3yNBS9q0sXFH4UJ+aoywmRNu2hkJnn+kXZmcxcMwxm1Y+HHC/Hf0Ntw7sfTSUHTkFM=
X-Received: by 2002:a05:6830:61cc:b0:616:cba6:c72 with SMTP id
 cc12-20020a05683061cc00b00616cba60c72mr13207771otb.30.1656955776483; Mon, 04
 Jul 2022 10:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
In-Reply-To: <20220506104658.3174243-1-foss+buildroot@0leil.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 11:29:25 -0600
Message-ID: <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8J5Kz/AbtH7sDnFV1pxEpBxoH4V8vB96w8TVN3zusIU=;
 b=ZTehLVH7/XRUWMZwu8wctYChKlA9fO+mZPxIn3VZrhqSDw20X6VnHyfZ4EnDUP6cFu
 NA6Kdot2zn4RJF5Ph/RYCD+Eg/1sNrI8k6j8/8x5ikzLPqkeH4vF+SVSVLS3gx0qOIFS
 Yfx9sAl7T1Du7r4JCQL+x3NQaNQKRcWfDkhIKKqI38/4Ua131VSa5v6RjgBHRmcdJntt
 +/20niScrVXV5NnKc0DjIDy9uZ4C1EhTSxq5zqPWSLGYlpo5bJd1dcmA3LfOPDt614TB
 K8QsZ5L5ZphYqEotcCBV8Za3axUuO/QK1Ya5PW6gXwdO/dV1yQvEBjO+Vc39ut+dBZh5
 AhVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZTehLVH7
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Open-Source IPA shlibs need to be signed in order to be runnable within
> the same process, otherwise they are deemed Closed-Source and run in
> another process and communicate over IPC.

Why not just add an option to libcamera to disable signature
validation entirely?

It seems kinda pointless if one is not using closed source shlibs.

>
> The shlib installed on the target should be the same as the one signed
> by libcamera during package creation otherwise the signature won't match
> the shlib.
>
> Buildroot sanitizes RPATH in a post build process. meson gets rid of
> rpath while installing so we don't need to do it manually.
>
> Buildroot may strip symbols, so we need to do the same before signing.
> Since meson install target is also signing the IPA shlibs, let's strip
> them before this happens.
>
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>
> v2:
>  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
>  LIBCAMERA_INSTALL_TARGET_CMDS,
>  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
>  shouldn't,
>  - added --no-run-if-empty to xargs, in case no IPA is selected,
>  - removed stderr redirect and pipe to true to not hide useful
>  information or fail the build if strip does not work,
>
>  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 77381ab3ca..41d6a5abef 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
>  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
>  endif
>
> +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> +# same process, otherwise they are deemed Closed-Source and run in another
> +# process and communicate over IPC.
> +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> +# while installing so we don't need to do it manually here.
> +# Buildroot may strip symbols, so we need to do the same before signing
> +# otherwise the signature won't match the shlib on the rootfs. Since meson
> +# install target is signing the shlibs, we need to strip them before.
> +LIBCAMERA_STRIP_FIND_CMD = \
> +       find $(@D)/build/src/ipa \
> +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> +       -type f -name 'ipa_*.so' -print0

Wouldn't this make it difficult to analyze core dumps since we need unstripped
binaries for that?

> +
> +define LIBCAMERA_BUILD_STRIP_IPA_SO
> +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> +endef
> +
> +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> +
>  $(eval $(meson-package))
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

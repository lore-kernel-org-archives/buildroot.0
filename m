Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E3C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 23:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48082409E0;
	Sun,  9 Oct 2022 23:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48082409E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgknNOfCxr9a; Sun,  9 Oct 2022 23:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B67C4011A;
	Sun,  9 Oct 2022 23:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B67C4011A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E97F1BF342
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 23:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299CE828B3
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 23:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299CE828B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odiO1GjYZzGN for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 23:38:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2936582865
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2936582865
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 23:38:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id i6so3926531pli.12
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 16:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSNGk44tnOQDoKqCuuP/bo6xwumH/ILpnB6xBuTDgVI=;
 b=CyMXD6S5EiwBrgTwWbNf+pLqYp3yzOSQZiowzLEWiqtjzFl0XmPOrERAK+/E/qLsr7
 mAd8iB6S/AcXFV8sA1TiswRK6pt9Xoe1OeihdRGpUJqQA/flwesj7jl2qM1VlqfLoh7o
 E4pGxFAD0Pbdv05MNIf7S6Q345KnU4mhqQ69InnVYopaN2dw7yGxTl69M12TBl8llkmx
 KXRVf2G3PxBuZqDLxREHWU/Q9Hag4OUaQLrD5/+xqQPr+7zfBk8wyHmk1co5TdUAD3+4
 Rc5ga+nF0LO0XTzoDqJEQ/Eqx2Ry09AOQ/3M66oB9BxPgQPj+mdu3A5nn7YmJj7391hF
 /PRg==
X-Gm-Message-State: ACrzQf2o4LKrkBSObFgQwue0oeNLCjDG0lRDAHCpqv3s83yQcdcd/LPB
 +MFhoP1jnZL+i3LmhSokQhj2ZrpItbuPJG/8v39Ujzv9pCWtAQ==
X-Google-Smtp-Source: AMsMyM7I2R9iJliYlzVrjj+Y94H8zHcMTlol4b5Oj/ip3GK2AFaZv45nFjHyVsy+ASg8YwcxxDkxLajSZIli6c41LOI=
X-Received: by 2002:a17:902:d894:b0:179:e82d:a0a2 with SMTP id
 b20-20020a170902d89400b00179e82da0a2mr16622908plz.16.1665358679404; Sun, 09
 Oct 2022 16:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221009153521.12444-1-romain.naour@gmail.com>
In-Reply-To: <20221009153521.12444-1-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Oct 2022 19:37:47 -0400
Message-ID: <CADvTj4rNt5UFLkYpSvSPTiZHKgD0DB9LFp0yo-f_635mZrYE+Q@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VSNGk44tnOQDoKqCuuP/bo6xwumH/ILpnB6xBuTDgVI=;
 b=ZaxXEGbfIZKf8zEs+tJpM60wVbtEzJ1IRhbZpsnXONZy58r9b+lqmCXHucs50IJLUU
 kbNDr5W2M/UyfGXHXgb60/5RfN/zcz87ehgLKNDHHs7SmjpW+0uvTAx8xLvcqF4lXFQl
 GZsUc54JbAVHjidlMVwAFn9zbJHe5IaU/lF/rJsO3LSjvPNE5wD19GpOrtpoB66mFRBl
 +jt1dxVVNJs/E0fnmVdOE0Ym9eLy9S1Ns3KZ3G/+sPSt8Jy79eBs013oMmyFWbgSFVwf
 s+AFHHRFRZ39BAs4YdUWVrnIXezZgW7+5eEjgd/eaYvpuWsWw4wHZ0h8bUJFtmB2Lyhf
 rJ2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZaxXEGbf
Subject: Re: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 9, 2022 at 11:35 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Backport upstream commit for x86_64 builds with -Os reported by [1].
>
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=29576
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229902
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229956

I think this also fixes an issue in autobuilders, see:
https://patchwork.ozlabs.org/project/buildroot/patch/20220927031702.2918414-1-james.hilliard1@gmail.com/

http://autobuild.buildroot.net/results/5b4/5b442f95587ddc65a995bbd9e310c88a66c55b1f

>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

> ---
>  .../0002-x86-Fix-Os-build-BZ-29576.patch      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
>
> diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
> new file mode 100644
> index 0000000000..4470324f1c
> --- /dev/null
> +++ b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
> @@ -0,0 +1,48 @@
> +From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
> +Date: Wed, 21 Sep 2022 10:51:08 -0300
> +Subject: [PATCH] x86: Fix -Os build (BZ #29576)
> +
> +The compiler might transform __stpcpy calls (which are routed to
> +__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
> +multiarch implementation does not build any working symbol due
> +ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
> +
> +Checked on x86_64-linux-gnu.
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Tested-by: Carlos O'Donell <carlos@redhat.com>
> +
> +(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)

This is probably better than mine since I had applied from patchwork before
it was applied upstream.

> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> + create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
> +
> +diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
> +new file mode 100644
> +index 0000000000..19439c553d
> +--- /dev/null
> ++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
> +@@ -0,0 +1,18 @@
> ++/* Copyright (C) 2022 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include "../strcpy.S"
> +--
> +2.34.3
> +
> --
> 2.34.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

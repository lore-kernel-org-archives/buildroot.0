Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3B1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A3281A92;
	Sun,  9 Jan 2022 16:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3KIVvJVpo-u; Sun,  9 Jan 2022 16:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90628188A;
	Sun,  9 Jan 2022 16:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9340A1BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F7EB8140F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ULBKm6Psb1q for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 801618138A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:50:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so5861291wme.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OIn3ODwKveAQfwW1s1dwA8QfkerlCcNo8p6wVEFhgks=;
 b=YYA0/u2gW/rAYPJkxFsi09CQy3zVFruJ+OBAMPaVgTHZzoSxGCVIDzOQhVUx2hZEJ/
 2NR5aaKvM2LSQzXFcWlRxi843f+elBdR6urN5hHp+11mRhegJzJGc8jITnJa5oOHZ62+
 YQy3GhsSgaqnbKOKNe+UTdW+De9m6HcrUonDaa1ZbX+UrOPD8vwTpWYGVNXWY/+cJpuT
 M26exXhOOOHv/mCavkJqx/CUg8ae1cC2c4NIzQMKuuZ7lIQWvwB/pmcq9BzxCs9yMCL5
 OyJwx5qCWJsNkMowDESwcdeQOiuVVqZY5qKProZMFl4zVB4QSbOVThPmXGrWZ6uxCQB/
 RKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OIn3ODwKveAQfwW1s1dwA8QfkerlCcNo8p6wVEFhgks=;
 b=tFWM/gFqhkBsNGPiNgRuVaDf9/wq4ktCLmdqbGET6YUvPj41m3s+ynbBZtBBrlQQm/
 7hKY1JYWjh1/4+qUh1jTa0omnqA9iBjrpuBaHi6+1Gpxz+Zlr2RFNnVBaH+ZBGK8yfR6
 MMiRgEoGZUxozTGVMCINzTXZd/CTaKshYUMNA/R4TNhOCBG0uQBhQGPq88nkNhmdPq+I
 TEj2FkO4tIea/8lMj1jQFsZhegBMmwt4DYAicT+wjQjvqm3aRma59xCktsz14Fo0i+ya
 2tFJYBjjEz24rck9/55GFfIWE1VvOQMUXk1j0aJNcwlqo0SUnW5WCs6fwpkAIm94rqG9
 6mcA==
X-Gm-Message-State: AOAM532luLdE4LU1p0X0h6lHLhtjcP/jwOFkRgbCYrupvm8wfCKKnVzA
 6e4KsLLWksndkhbWXs/CEGmxrg==
X-Google-Smtp-Source: ABdhPJz7ls0JjcMF02tw5n3qQeQf/KWGZR5tm3GX7H2/3kH/2tpBDiiqBFT5lz6B8WbBHPZ8YELeYw==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr13725158wmq.63.1641747047623; 
 Sun, 09 Jan 2022 08:50:47 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id bd21sm4534958wmb.8.2022.01.09.08.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 08:50:47 -0800 (PST)
Message-ID: <3ed33c49-e94e-9573-450d-9bddd1fb9610@mind.be>
Date: Sun, 9 Jan 2022 17:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1595839612.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cover.1595839612.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 0/2 v4] package/libglvnd: introduce the GL
 vendor-neutral proxy (branch yem/libglvnd)
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
Cc: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2020 10:46, Yann E. MORIN wrote:
> Hello All!
> 
> This is a respin from the original series by Jakub, heavily massaged
> by me (Yann); thanks Jakub for your initial work! :-) What follows is
> Jakub's original cover letter (tweaked to drop the reference to other
> patches not include in this respin):
> 
> Here comes support for GLVND which is a GL Vendor-Neutral disaptches,
> initially proposed by NVidia, currently done within the Freedestop/
> RedHat project team as libglvnd.
> 
> It's useful not only for NVidia (they were first to adopt it though)
> but might be also beneficial for others, for example allowing you to
> deliver an image running on multiple machines with different GPUs and
> their respective OpenGL providers, which happens quite often on x86_64
> and was the major reason to implement it in Buildroot for me.
> 
> On the other hand, if your board has multiple GPUs it also helps a lot
> - for example when you have a "display" unit and "compute/accel"
> graphics units from different vendors. Happens on some ARM boards
> recently and there are already efforts to integrate it in these GL
> stacks.
> 
> The only EXT needed by GL provider is to implement GL_EXT_libglvnd
> which is a dummy extension allowing GL lib to "register" to let it
> receive GL calls.
> 
> In practive it's very simple, the libglvnd delivers its own set of
> "dummy" libraries:
> 
>    - libGL.so
>    - libGLX.so
>    - libOpenGL.so
>    - libEGL.so
> 
> and needs the actual providers to be present as they already are but
> with names like libGLX_nvidia.so.
> 
> It allows developers to link against vendor-neutral dummy libs and
> openGL contexts without thinking about target GPU too much as long as
> it supports desired GL/EGL standard.
> 
> Also delivers GL API headers (GL/gl.h, GL/egl.h, etc.) so removes need
> of mesa3d-headers in GLVND-supported drivers.
> 
> Currently it's supported by all Mesa-compatible drivers and NVidia. For
> simplicity sake, and to ease introduction of libglvnd, only mesa3d is
> converted to be compatible with libglvnd. Other providers, like NVidia,
> can be converted (or added!) in follow-up patches.
> 
> Changes v3 -> v4:
>    - bump to libglvnd 1.3.2
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 1640b0c1f967e394f87eb7a0ca04ae40aade11b4
> 
>    package/mbpfan: new package (2020-07-27 10:13:06 +0200)
> 
> 
> are available in the git repository at:
> 
>    https://git.busybox.net/~ymorin/git/buildroot
> 
> for you to fetch changes up to c48baa11cd0c06ec5af3fd4989306c3ec581d0e9
> 
>    package/mesa3d: make it aware of libglvnd and support it when present (2020-07-27 10:45:34 +0200)
> 
> 
> ----------------------------------------------------------------
> Jakub Skrzypnik (2):
>        package/libglvnd: new package
>        package/mesa3d: make it aware of libglvnd and support it when present

  Series (finally) applied to master, thanks.

  Jakub, I also added you to DEVELOPERS for the package.

  Regards,
  Arnout

> 
>   package/Config.in              |  1 +
>   package/libglvnd/Config.in     | 42 +++++++++++++++++++++++++++++++++
>   package/libglvnd/libglvnd.hash |  7 ++++++
>   package/libglvnd/libglvnd.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
>   package/mesa3d/Config.in       | 15 +++++++-----
>   package/mesa3d/mesa3d.mk       | 15 ++++++++----
>   6 files changed, 123 insertions(+), 10 deletions(-)
>   create mode 100644 package/libglvnd/Config.in
>   create mode 100644 package/libglvnd/libglvnd.hash
>   create mode 100644 package/libglvnd/libglvnd.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE689C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 05:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C38402E1;
	Tue, 22 Mar 2022 05:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBFMbfoPTiNw; Tue, 22 Mar 2022 05:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9184028A;
	Tue, 22 Mar 2022 05:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53F331BF31C
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B29A4028A
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJyvzXf_mgI5 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 05:38:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1CC40277
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 05:38:26 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r2so11808580ilh.0
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcBCmfW22QicRsqbfDAlaJcMvaIR8ddOMf9/c3dv1Bw=;
 b=Z9nzG2FXR5IgaZ21JoBsGZLT7gQCO2AcqoLuSrLNEQwBIpG7C1Aqvb/ljz05lLd9jO
 tNd2iRGioiczX6oKQWYF2Ke0M88W0XVNuFthAtXlaRnvCWitP5DneqaRpnrjQ9f3cnw2
 edbIJ17mQL7p//Xdef1HFy24e2zByXu87JJmMQLk1ZGhIomZ0rAMJbnxK+jJTuLB2vxJ
 XcpsD9J7XjiQCjnRB8kJM4Gms/q8b5BogZup46nFDeY6SYMqnFsj1CT1N2eokYYFmEjm
 4a8pV6UiSMaTT4rp6xvsnuqafnARmmRKSBoCnjowxWDi1HdWEBt6BUl2ZbhQCAH2P074
 C4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcBCmfW22QicRsqbfDAlaJcMvaIR8ddOMf9/c3dv1Bw=;
 b=lH3gIJHDDO5Ytt8ixqruNS1ayv4ZseANmf1H0fD5s0uZxBw1z7dSaVAU2ko2/isD/T
 6PhppiMVimhYwvg87y4YAwZ21yjEY64hogCAapwfiwbXXe7PzLAQPSEwyQf7IJlC3rgF
 8rcNoFmrLTVkGVjh/JqfjMybCFkwAu/E4PqoLdR8/J4JS61/GNofhBUl706unNoyZzcL
 c2BohK8QBEUwXHqirYG+a0eg9/WbeJFABJNCuAwqXXkSrMFp4yL6uYS2cSV4Jmt/6CIi
 sCK/pvOAouMr7nXhU/9naz4ZJ0/kv5Ag183xBcny6FTaT37dXCP+DuUwhKcc9pF+M+kP
 aOJQ==
X-Gm-Message-State: AOAM531KtW8CYugAH6veyeAabeQXiu3wt1ir20hPC3rsK0L7y6zs+K2i
 rh1kyhch26Fw6iAZxDz10bLbivYrlZBK5w==
X-Google-Smtp-Source: ABdhPJyjXgak0zqAWdf89JIZfd6LQL4X3Mcnde/HYiI5JfGroXTkChmE9TAEqlIXhJNOZ52QvgeupQ==
X-Received: by 2002:a05:6e02:1bc9:b0:2c8:2b30:dcb6 with SMTP id
 x9-20020a056e021bc900b002c82b30dcb6mr3569788ilv.282.1647927505113; 
 Mon, 21 Mar 2022 22:38:25 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52]) by smtp.gmail.com with ESMTPSA id
 i8-20020a0566022c8800b006463c801381sm10012849iow.48.2022.03.21.22.38.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 22:38:24 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id r2so19080962iod.9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:38:24 -0700 (PDT)
X-Received: by 2002:a05:6638:1922:b0:319:ac51:3db7 with SMTP id
 p34-20020a056638192200b00319ac513db7mr11768748jal.154.1647927504016; Mon, 21
 Mar 2022 22:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220322051448.2589854-1-christian@paral.in>
 <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
In-Reply-To: <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
Date: Mon, 21 Mar 2022 22:38:13 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r3UYhf=gnsDhpNOtwgT0fdSNT_dQhowiX-zE8CK=NrUA@mail.gmail.com>
Message-ID: <CA+h8R2r3UYhf=gnsDhpNOtwgT0fdSNT_dQhowiX-zE8CK=NrUA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Mon, Mar 21, 2022 at 10:18 PM Christian Stewart <christian@paral.in> wrote:
> On Mon, Mar 21, 2022 at 10:14 PM Christian Stewart <christian@paral.in> wrote:
> >
> > The latest Go release, version 1.18, is a significant release, including changes
> > to the language, implementation of the toolchain, runtime, and libraries.
> >
> > https://go.dev/doc/go1.18

> I should note that this upgrade also will change a lot of the Go
> package hashes...
>
> Due to the way the "go mod vendor" step works, there's some
> incompatibility with the go 1.17 vendor format:
>
> go: inconsistent vendoring in /build/containerd-1.5.9:
>         github.com/containerd/containerd: is marked as replaced in
> vendor/modules.txt, but not replaced in go.mod
>
>         To ignore the vendor directory, use -mod=readonly or -mod=mod.
>         To sync the vendor directory, run:
>                 go mod vendor
>
> We will need to update the hashes and the archives for these packages.

Something weird is going on here...

https://asciinema.org/a/guJyOQeqbG5PIL1daVYQoyyef

With containerd checked out at v1.6.1 with Go 1.18,

"go mod vendor" -> "go build"

... always results in the error shown above, even after deleting the
vendor/ tree.

This issue might be one with Go 1.18 itself.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

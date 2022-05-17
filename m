Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ED8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26BAB40133;
	Tue, 17 May 2022 19:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFU27W_X_eyp; Tue, 17 May 2022 19:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3E9400F2;
	Tue, 17 May 2022 19:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 320CC1BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 204E241A15
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ULN6WrzsgKt for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:40:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03D1F41A10
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:40:25 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y63so60174oia.7
 for <buildroot@buildroot.org>; Tue, 17 May 2022 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n91DnWcwCgUBvB28JH5B/XSryInw4NMYe4MftSD8hlg=;
 b=GMJdF004noQ5N1Fl9blDUTEVBPFDt2Cat3mmYf2yqnHfOAjhzFk/6M79hry6qaiwUB
 6acGVlM5fTEU/LhkZdNAXSd6gI4BjFgI32m8deHD8Z/zTXqZshvy8ZB2spgZ8KYbIBhe
 uaeSPRF41RYeolWruWjExX6DVT0g6qid+jVPUR7nFjDIdY0KsYdg+cSCr8FzevHOQxou
 ILcLajmkBU0ksQDUpGNZImj21+XjFfWT8Q1+KYrOYMLpfOC3e1C9Mprfce+Pj/rtUgZE
 pOdoqaO1vaonGdMjT3UpYw9xtE4D+Z6cEVE+t2HdIMyPRyReK0g1j2/BXMA9b5Erg4Js
 uiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n91DnWcwCgUBvB28JH5B/XSryInw4NMYe4MftSD8hlg=;
 b=lGtBcEwcGiDIwNTm8TFF3CkdAavDbSH6rCgu1sXd4Lk+mHUBg5UmarauZcEDA31Mz5
 hQX2FhfywnQEZv+O04DQXnzhFAbfhawIdu7eZo5tUmvG9uhRsm30WEKlHajqCGfrJvD7
 UGs7GCfK2p4VC0kKjvcJsGm1Wz9svJozyDvAvPtXUoKfRFRPaUyHdBArHOxLuSP2RkpC
 X2q+izpSBw1Mxw2H3GrSc5f0odkUKSGcataYLlZOVvcv/zndPyi0BZJyc+vkGaONQ80c
 thPoj6SRnS7Z9DKyzNThdU7Ml1CeWg1Ut+GiOUZmb8veEA6D02xX7m8ntZQq+EI+IqJ5
 KwVw==
X-Gm-Message-State: AOAM533uFr6JMwTqemJr3SyUHIzeGGtu6flYV3JjFIMXYEFOWzHW86wF
 awq7G0qh4huVEKCAFxite/O1OJdrULkAFynBQPyiJ/rU
X-Google-Smtp-Source: ABdhPJzvhEG5jfhesseFZBIjDyyTdcQBwkJBaRbc8H55WcD8GqdXg8BdAldJqIJHoHXtZuCnb1cCtG9wecH5e3I4NII=
X-Received: by 2002:a05:6808:178d:b0:326:3fe9:7f03 with SMTP id
 bg13-20020a056808178d00b003263fe97f03mr16078113oib.200.1652816424934; Tue, 17
 May 2022 12:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
 <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
 <CADvTj4qtBNwvZw66NPhoKRLsKkJQjqFb9tMo_4qyi-B+GThDxg@mail.gmail.com>
 <87r14s40wu.fsf@dell.be.48ers.dk>
In-Reply-To: <87r14s40wu.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 May 2022 13:40:12 -0600
Message-ID: <CADvTj4ohuiV+Ks3inWUiv9c-W+JT1obTHkUAEp4om6BQ2P4dUA@mail.gmail.com>
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

On Tue, May 17, 2022 at 9:46 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
> Hi,
>  >> But that fails building v8_snapshot/gen-regexp-special-case. Notice the
>  >> -m32 that get passed:
>  >>
>  >> [19941/21833] LINK v8_snapshot/gen-regexp-special-case
>  >> FAILED: v8_snapshot/gen-regexp-special-case
>  >> /home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/host-bin/python
>  >> "../../3rdparty/chromium/build/toolchain/gcc_li
>  >>
>  >> nk_wrapper.py"
>  >> --output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie
>  >> -Wl,--fatal-warnings -Wl,--build-id=sha1 -fP
>  >>
>  >> IC -Wl,-z,noexecstack -Wl,-z,relro
>  >> -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -pie -Wl,--disable-new-dtags
>  >> -Wl,-O2 -Wl,--gc-se
>  >>
>  >> ctions -L/usr/lib -o "v8_snapshot/gen-regexp-special-case"
>  >> -Wl,--start-group @"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,--
>  >>
>  >> end-group  -ldl
>  >> -lpthread -lrt -licui18n -licuuc -licudata
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicui18n.a when searching for -licui18n
>  >> /usr/bin/ld: cannot find -licui18n
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
>  >> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so
>  >> when searching for -licuuc
>  >> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.a
>  >> when searching for -licuuc
>  >> /usr/bin/ld: cannot find -licuuc
>  >> /usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so
>  >> when searching for -licuuc
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicudata.a when searching for -licudata
>  >> /usr/bin/ld: cannot find -licudata
>  >> /usr/bin/ld: skipping incompatible
>  >> /usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
>  >> collect2: error: ld returned 1 exit status
>  >> [19945/21833] CXX v8_snapshot/obj/v8/v8_libsampler/sampler.o
>  >> ninja: build stopped: subcommand failed.
>  >> make[5]: *** [Makefile.gn_run:362: run_ninja] Error 1
>  >> make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
>  >> make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>  >> make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>  >> make[1]: *** [package/pkg-generic.mk:293:
>  >> /home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/.stamp_built]
>  >> Error 2
>  >>
>  >>
>  >> Any ideas? Notice that I did NOT apply patch 4 yet.
>
>  > I think patch 4 was needed for fixing some linker issues with pkg-config
>  > resolved dependencies like icu.
>
> That unfortunately seems unrelated, because the build fails with the
> same error here after applying patch 4 :/
>
> From the command line passing -m32 to HOSTCC, it sounds like some cross
> compilation confusion to me.

Yeah, I recall there were a bunch of issues related to cross compile confusion,
guess I had missed this one, although I was mostly testing against aarch64.

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

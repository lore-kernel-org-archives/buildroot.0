Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F789C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F281441901;
	Tue, 22 Mar 2022 23:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFwUEmfkOOoJ; Tue, 22 Mar 2022 23:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AE7418EB;
	Tue, 22 Mar 2022 23:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EBFA1BF3DE
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A4A4612B8
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcVnYgdKAXZM for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:26:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5694760E83
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:26:00 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso54539fac.9
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOZ4EdrShjnturpdF+3X6A4C2X0mCUWxiot/36Ger3I=;
 b=TQ2dbWWrwhFVHGKSYTzTAZavWBkTHMYAEZsZCzQJ0ZVN/yiSmQTT744m74g/KObfjd
 fl/5qd73QjkG1lUVhqsEHxXdBxzqQMgr8O1IZElRolI/UX/0x8UF7hddnayyaBBUmUrt
 9aX69HKNj13qwZpHbFaof9kGYKnP/K5v3rDk9onwCFgGaoAgzgFhWayKCqsrjosXgiCL
 /7lXUWDR9C9Vr1Q6V81bcOqi4gBgbRFLboaX1yQxAKy7yEfMk23G70lnPSLcJY2JoOwM
 bj8O7fuOpYhmGhBM+15x6LzRvJfeP5WR4CjOmLvp3A7kIUh3nKiYQU4G6ei6ys8dIPNc
 IBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOZ4EdrShjnturpdF+3X6A4C2X0mCUWxiot/36Ger3I=;
 b=4IqdoADrlUXD1LKTIKWPbmBdScpRGmsqt6910L+KgGuhI7KaIwEICYtrhLP9/mSmvM
 SfqwYrDjKv3R+h8VcgylUeXrSjt5qroBlS8hUhmfNFIfCN/oiCgYwDtWdRN5hHYwa3yh
 LrKsG62+qET5eJSME6H4jmxz65bVJ5kV5gjmy6YgTzfF7P2rfIeVU6ItfT9/epXpcBSN
 Dm/FlvfMsgNLd7bmSG+JQ6Wr3sgYAHyjwfXlFALgTkSJhnpZs5rJLFURTVhMF40+GfjU
 ND7KrBIX1gkGbY7olUHeVX0eOrO1Teanhp9SFJGh6IgaOgv9eJuG+zGxMgzdA2eA6Qgq
 /nXA==
X-Gm-Message-State: AOAM5335btQ/zDdaWB3imdEkA0WuOZoPys+gh019N39bvlF+4MmRawJQ
 kAVqLnOkSPbCTwOwrvHouMWAn0ltY8naEV3Y/O4=
X-Google-Smtp-Source: ABdhPJwRUVRK4Qb9CHej9qiWKErcD4xAFL2XwzUXBVG21NoHFXGutyvhcFw0WFNJSlrEXhsvhjaTG+0tbnAIAk23TSM=
X-Received: by 2002:a05:6871:8ab:b0:dd:b74b:409a with SMTP id
 r43-20020a05687108ab00b000ddb74b409amr2719593oaq.200.1647991559287; Tue, 22
 Mar 2022 16:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
 <20210311142932.44985-4-matthew.weber@rockwellcollins.com>
 <CANQCQpYpXG2_1JQp=8VJHtfmAEqXRPfQid5qeeDVYkdVVpSSBQ@mail.gmail.com>
 <CANQCQpZGpLkvWwPpNPKjsygS83GBuTv6dDr63ePi0X7W+znLhg@mail.gmail.com>
 <dbf8d669-1d2e-4556-30f9-8a44e74942f8@mind.be>
In-Reply-To: <dbf8d669-1d2e-4556-30f9-8a44e74942f8@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Mar 2022 17:25:48 -0600
Message-ID: <CADvTj4p+VPAGUQBrO8HZLsuyD0eUeyAWwn8Jqga5rDGN34wymg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v11 4/9] package/libclc: bump version to
 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>,
 Matthew Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 18, 2021 at 3:04 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
>  I was going to apply this series to next...
>
> On 11/03/2021 20:37, Matthew Weber via buildroot wrote:
> [snip]
> >>> -# C++ compiler is used to build a small tool (prepare-builtins) for the host.
> >>> -# It must be built with the C++ compiler from the host.
> >>> +# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
> >>> +# llvm-config provided values
> >>>  #
> >>> -# The headers are installed in /usr/share and not /usr/include,
> >>> -# because they are needed at runtime on the target to build the OpenCL
> >>> -# kernels.
> >>> +# CMAKE_CXX_COMPILER has to be set to the host compiler to build a host
> >>> +# 'prepare_builtins' tool used during the build process
> >>>  LIBCLC_CONF_OPTS = \
> >>> -       --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
> >>> -       --prefix=/usr \
> >>> -       --includedir=/usr/share \
> >>> -       --pkgconfigdir=/usr/lib/pkgconfig \
> >>> -       --with-cxx-compiler=$(HOSTCXX_NOCCACHE)
> >>> +       -DCMAKE_CLC_COMPILER_FORCED=ON \
> >>> +       -DCMAKE_LLAsm_COMPILER_FORCED=ON \
> >>> +       -DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)"
> >
> > Looks like I have a couple of bugs (I didn't have opencl checked in menuconfig)
>
> ... but then I saw this. So I didn't. Instead, I've marked the series as Changes
> Requested. If you think it should be applied after all, please repost (or just
> update patchwork if unchanged).
>
>  Oh, and 12.0.0 has been released now...
>
> >
> > 1) mesa3d.mk needs MESA3D_MESON_EXTRA_BINARIES +=
> > llvm-config='$(STAGING_DIR)/bin/llvm-config' updated to point to the
>
>  Normally, the foo-config programs are script, so it's OK to use the one in
> staging. If it's an actual binary, we have to somehow patch it so it has target
> config but compiles for host.
>
>  I'd expect llvm and related to be cross-compile friendly though...
>
> > HOST_DIR llvm-config because it needs to be able to execute the tool.
> > However this doesn't work since then you get the
> > "host/lib/libLLVM-11.so when searching for -lLLVM-11 " error which
> > makes sense since that's the host llvm-config we pointed at.....
> > Unsure how to solve this one and we don't notice it in x86 builds.
> > When you enable the AMD Radeon to build for aarch64 you can cause this
> > error.
> >
> > 2) mesa3d doesn't quite build (pkgconfig can't find libclc).  I didn't
> > catch that CMAKE_INSTALL_PREFIX is getting ignored (we set it in the
> > pkg-cmake.mk infra) so the libclc.pc is getting installed in
> > $HOST_DIR/usr/local/share vs $HOST_DIR/usr/share .  I haven't been
> > able to figure out why the value doesn't take hold (ie after the
> > configuration step libclc-11.1.0/CMakeCache.txt still shows /usr/local
> > unless I force set the CMAKE_INSTALL_PREFIX value in
> > libclc-11.1.0/CMakeList.txt before project().
>
>  That *is* weird...

This should fix the CMAKE_INSTALL_PREFIX issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.2842266-5-james.hilliard1@gmail.com/

>
>  Regards,
>  Arnout
>
> >
> >
> > Matt
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

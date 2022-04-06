Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 02:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2BB40B1A;
	Wed,  6 Apr 2022 02:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8m_bofkDaqy; Wed,  6 Apr 2022 02:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 812EA40B07;
	Wed,  6 Apr 2022 02:05:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB9DA1BF296
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 02:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8BB2610A4
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 02:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alOboi07PE9L for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 02:05:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D405160B08
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 02:05:30 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t2so2180666qtw.9
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EojVYKrXHXECkMXR3vuYL1lJCqE04bUE3z34w9a0fX8=;
 b=bq4iky2zn8Goq3qSXt81ctOwMFaJDJLZwp6fpQTJH8Jxu/jyaFZKRE7KNWcqdBbSgb
 S9tnWQi963f7e+vggZy5FEIKuel4pgWWk1xg+Mb8gscNTPMeDQ2p5cqymn8vQjq1Lo3U
 xfoLBoCksZsscbnyCbH8oQelz4t+x2w5YBfuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EojVYKrXHXECkMXR3vuYL1lJCqE04bUE3z34w9a0fX8=;
 b=CsrJjsJ8VkHqnynsDoVNuti72F/vCEcCnSSqcPayDYitbBAsfgkiTocqaNA3tqJMbf
 2pFdBW1401J7fpJsPHUTLWOG3ZJQesVg56Ra2sE7xep0ZZaZVPAfCVspOUpf4tjIvZju
 EKvvI3NgLE7IWPa/+77EtQVXdTjMasgj6dv8W1YDXNyxm4WZ0q5CZa6v8WYWoUqcEprm
 RmMLwBTs3Ux2PERKv/TLaB88MtUdT0G//YjOi310zTFU4jlqhwIhg6PulIRYdk7/+Kyg
 ZSzhBWzxYEnAGi6QnDO/JHLioLcyGDMjiPEhblaqEL2jaPNYIBLemuh7Qx3rPECmxNCb
 2qEw==
X-Gm-Message-State: AOAM533EZj3/QKeT6yo+qVYvSjvakaoMeQxMscqDD4fL+M79UlfIW6Nd
 ykVk62rC94xmEbwbOdskxJZYuZHLz0G3J9HkyFs=
X-Google-Smtp-Source: ABdhPJwLFlHNn8aYd24HeJzc/BM16/dOe17O1+GPCfGwOiB2sfSeTx0Giy7c55/aXMBysDEGEltahLesIKJxNc7FaoM=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr5788209qtx.494.1649210729452; Tue, 05
 Apr 2022 19:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220404091256.683581-1-joel@jms.id.au>
 <2ddab288-a57a-18ed-c392-d6695dd68e89@mind.be>
 <20220405195545.GH2354230@scaer>
In-Reply-To: <20220405195545.GH2354230@scaer>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Apr 2022 02:05:17 +0000
Message-ID: <CACPK8XdO5j7QP==fPWwywp-m=FM9K9eOyLrpoNtvRHJrdq+M0w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Backport patch to fix
 linking on powerpc
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
Cc: fontaine.fabrice@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 5 Apr 2022 at 19:55, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Arnout, All,
>
> On 2022-04-04 22:17 +0200, Arnout Vandecappelle spake thusly:
> > On 04/04/2022 11:12, Joel Stanley wrote:
> > >Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the
> >  Peter just backported this one to 2022.02.x...
> > >Power8 optimisations off to fix a build issue. Instead apply a patch
> > >from the develop branch upstream to fix the issue.
> > >
> > >This patch is not yet in a released version of zlib-ng.
> > >
> > >Signed-off-by: Joel Stanley <joel@jms.id.au>
> >  Applied to master, thanks.
>
> Err... Why would we enable the POWER8 optimisations when the target is
> not a POWER8 ?
>
> Backporting the patch seems correct, but the enabling/disabling the
> optinisations should have stayed, I believe...

Taking a look at the cmake configuration, there's dozens of options
that provide optimisations. It looks like it does detection of
features:

    elseif(BASEARCH_PPC_FOUND)
        # Common arch detection code
        if(WITH_ALTIVEC)
            check_ppc_intrinsics()
        endif()
        if(WITH_POWER8)
            check_power8_intrinsics()
        endif()
        if(HAVE_VMX OR HAVE_POWER8_INTRIN)
            list(APPEND ZLIB_ARCH_HDRS ${ARCHDIR}/power_features.h)
            list(APPEND ZLIB_ARCH_SRCS ${ARCHDIR}/power_features.c)
...

        if(WITH_POWER8)
            if(HAVE_POWER8_INTRIN)
                add_definitions(-DPOWER8)
                add_definitions(-DPOWER_FEATURES)
                add_definitions(-DPOWER8_VSX_ADLER32)
                add_definitions(-DPOWER8_VSX_CHUNKSET)
                add_definitions(-DPOWER8_VSX_SLIDEHASH)
                set(POWER8_SRCS ${ARCHDIR}/adler32_power8.c
${ARCHDIR}/chunkset_power8.c ${ARCHDIR}/slide_hash_power8.c)
                if("${ARCH}" MATCHES "powerpc64(le)?")
                    add_definitions(-DPOWER8_VSX_CRC32)
                    list(APPEND POWER8_SRCS ${ARCHDIR}/crc32_power8.c)
                endif()
                list(APPEND ZLIB_ARCH_SRCS ${POWER8_SRCS})
                set_property(SOURCE ${POWER8_SRCS} PROPERTY
COMPILE_FLAGS "${POWER8FLAG} ${NOLTOFLAG}")
            else()
                set(WITH_POWER8 OFF)
            endif()


The check looks like this.

check_power8_intrinsics() {
    # Check whether features needed by POWER optimisations are available
    cat > $test.c << EOF
#include <sys/auxv.h>
int main() { return (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_2_07); }
EOF
    if test $buildpower8 -eq 1 && try $CC -c $CFLAGS -mcpu=power8 $test.c; then
        HAVE_POWER8_INTRIN=1
        echo "Check whether POWER8 instructions are available ...
Yes." | tee -a configure.log
    else
        HAVE_POWER8_INTRIN=0
        echo "Check whether POWER8 instructions are available ... No."
| tee -a configure.log
    fi
}

So as long as your compiler defines the PPC_FEATURE2_ARCH_2_07 in
auxv.h, and supports -mcpu=power8, it will build the code. The
application then does runtime checking of auxv to decide if the
optimisations should be used.

Setting WITH_POWER8=OFF on the command line will skip the checks, and
not build in the optimisations.

WITH_POWER8=ON has no effect as it's the default and the cmake logic
will turn it off if it detects the platform isn't capable.

From what I can see, there's a small binary size reduction to be had
by forcing Power8 off if your toolchain is power8 capable but you know
your platform isn't. I think this is the case for GCC built for
ppc64(le) but targeting a different CPU.

I suggest we let the zlib-ng build system do its thing to ease the
maintenance burden of keeping the flags up to date.

I also welcome someone double checking my analysis, as I may have
misunderstood something.

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

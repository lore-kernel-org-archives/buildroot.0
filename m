Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58169C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA3540B82;
	Wed, 11 May 2022 17:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5n-2d7dv1edN; Wed, 11 May 2022 17:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3BD740502;
	Wed, 11 May 2022 17:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 303461BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C1AF4026E
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aSiP7y-cnOP for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:13:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B114440002
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:13:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g6so5428588ejw.1
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mj2wXkvO8zpjJAJCwIbIA3t4NBoJl/nFUqqZhHbC3wM=;
 b=AmYdKQp5JhjHijLFy9kKsKBdyqFuOzXWGgMZf2a2UIuiqD/rDSsCXVXiDBtlYbstHR
 0nNjiUJPahxlF2TRcqZrzQVPfdS9ny43M0Ct09HY05q7W2RyHAV23uqPPJwYxx1Gd6DB
 egGbMl+ZJzHu7FPmtjeZ0g0Wg0hZkJ404GnQM3N8zcY6E4DZAOvrDq/FLVpKjTzHdUm1
 kTIpNkO+2mhDP5k6fknfq+6D8A5riPaFi9iaz1o6PJdYUGV6OnmTnPM19LaKYXd5A+J4
 uGUm0SlbR9dUbD7oJREAQtu/F6RoQn5GQqgz1pi7Ra4b9zHwVfHB5exlqkk3U8pmalkq
 8zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mj2wXkvO8zpjJAJCwIbIA3t4NBoJl/nFUqqZhHbC3wM=;
 b=p+eW06Ky/bqqbM812TMxMKHQTvynb4u0DPulKC0SDCYBm4Bcxi6fDEV6Bzvi5C7u16
 d2Rn0Cqk+mYgpXqSIhJu9YvLRUM0UDOHcazzI+2AiqMJcPlKpzLIcdCdS3umOJmt3xRz
 0VrGR8fiuED/h2cQ0Q7i/ivnq9xhx03jVialBRe8GrMZT6dahG6kqU7yuDAibsTBDBKx
 zdzU0gxPA60GcEaNOvKahbveOSzE+IPBJ/BxY6GF1D0ueuZazlhdOU8M3SCal4I7u8Yc
 zVw+HEukEx/H9JnPJHirePxCL4xJoWrmEohWb3WZvgD4FdmvzNlW1ZIn+LH2ajvLaiyH
 BA8w==
X-Gm-Message-State: AOAM532OE9KofLaKVR6zl+RPIHS0PFQDERgGj7xWur8KMdX6Yh3jTUl1
 /2Ms5hJDwiP5iHIlr2DzOWXWJQ==
X-Google-Smtp-Source: ABdhPJy9BQaArPGNaI46vixyQ9okPRrhyYPvfqwjkUg61dFssjypOOqfQOuRBm6VBBqqICSIrsY0ig==
X-Received: by 2002:a17:906:4fc6:b0:6f4:da16:4a09 with SMTP id
 i6-20020a1709064fc600b006f4da164a09mr25927365ejw.599.1652289212603; 
 Wed, 11 May 2022 10:13:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b006f3ef214db2sm1196074ejq.24.2022.05.11.10.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:13:32 -0700 (PDT)
Message-ID: <99cf8967-ae02-6526-9920-256b0e6adbb9@mind.be>
Date: Wed, 11 May 2022 19:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220506054651.2853406-1-james.hilliard1@gmail.com>
 <daca77a5-b780-3675-e43f-820f03bc9cda@mind.be>
 <CADvTj4ois8m4-w4=1AK0+5934R4BFhj=3=u8TUtWa_uRu+U=dg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4ois8m4-w4=1AK0+5934R4BFhj=3=u8TUtWa_uRu+U=dg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 21:55, James Hilliard wrote:
> On Tue, May 10, 2022 at 1:32 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 06/05/2022 07:46, James Hilliard wrote:
>>> It is currently possible to select BR2_STATIC_LIBS while
>>> BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
>>> toolchains that support BR2_STATIC_LIBS for the selected architecture.
>>
>>    Good catch!
>>
>>>
>>> Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS so that we can
>>> disable the selection of BR2_STATIC_LIBS when using an unsupported
>>> architecture.
>>>
>>> Fixes:
>>>    - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
>>>    - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
>>>    - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    Config.in                               |   2 +
>>>    toolchain/toolchain-buildroot/Config.in | 119 ++++++++++++++++++------
>>>    2 files changed, 90 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/Config.in b/Config.in
>>> index f0cd6f48ed..5daca3adce 100644
>>> --- a/Config.in
>>> +++ b/Config.in
>>> @@ -601,6 +601,8 @@ choice
>>>
>>>    config BR2_STATIC_LIBS
>>>        bool "static only"
>>> +     depends on !BR2_TOOLCHAIN_BUILDROOT || \
>>> +             BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
>>
>>    However, I don't think this is the right approach.
>>
>>    Instead, I think there should be a blind option
>> BR2_TOOLCHAIN_STATIC_LIBS_SUPPORTS that gets selected by toolchain that do
>> support static libs (i.e. using uClibc or musl), and remove all the 'depends on
>> !STATIC' from the toolchain options.
> 
> I'm not sure that's the best way to handle this, I think normally
> users will want to
> first select their build type(ie BR2_STATIC_LIBS) and then select the toolchain
> out of the ones that support their build type, this is just needed for
> preventing
> users from selecting a build type that does not have a valid toolchain for some
> architectures.
> 
> In menuconfig "build options" is above toolchain selection and the
> BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS option
> is mostly determined by the "target options" which is above "build options".

  Yeah, I don't think that that's OK. I think everything starting from 
BR2_ENABLE_DEBUG should instead go into the toolchain menu, or at least below 
the toolchain menu. And it should be renamed from "build options" to something 
else (though I don't know what). All those build options are fairly closely 
related to the toolchain choice. For example stack protector strong is only 
available in sufficiently recent GCC. And "Target optimizations", which really 
is a global build options like debug, is already in the toolchain menu.

  I realize thought that what I'm asking for is a much bigger change, and this 
patch is a fix so should be somewhat limited in scope.


  What do others think?

  Regards,
  Arnout

> 
> I was trying to avoid disabling BR2_STATIC_LIBS purely based on the specific
> toolchain selected.
> 
>>
>>    Regards,
>>    Arnout
>>
>>
>>>        help
>>>          Build and use only static libraries. No shared libraries will
>>>          be installed on the target. This potentially increases your
>>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
>>> index be89f68ab5..287253b11f 100644
>>> --- a/toolchain/toolchain-buildroot/Config.in
>>> +++ b/toolchain/toolchain-buildroot/Config.in
>>> @@ -20,6 +20,91 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>>>
>>>          If you're not sure, just leave the default "buildroot" value.
>>>
>>> +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
>>> +     bool
>>> +     default y if BR2_aarch64
>>> +     default y if BR2_aarch64_be
>>> +     default y if BR2_arcle
>>> +     default y if BR2_arceb
>>> +     default y if BR2_arm
>>> +     default y if BR2_armeb
>>> +     default y if BR2_i386
>>> +     default y if BR2_m68k
>>> +     default y if BR2_microblaze
>>> +     default y if BR2_mips
>>> +     default y if BR2_mipsel
>>> +     default y if BR2_mips64
>>> +     default y if BR2_mips64el
>>> +     default y if BR2_or1k
>>> +     default y if BR2_powerpc
>>> +     default y if BR2_RISCV_64
>>> +     default y if BR2_sh4
>>> +     default y if BR2_sh4eb
>>> +     default y if BR2_sparc
>>> +     default y if BR2_xtensa
>>> +     default y if BR2_x86_64
>>> +
>>> +config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
>>> +     bool
>>> +     default y if BR2_arm
>>> +     default y if BR2_armeb
>>> +     default y if BR2_aarch64
>>> +     default y if BR2_aarch64_be
>>> +     default y if BR2_i386
>>> +     default y if BR2_mips
>>> +     default y if BR2_mipsel
>>> +     default y if BR2_mips64
>>> +     default y if BR2_mips64el
>>> +     default y if BR2_powerpc
>>> +     default y if BR2_powerpc64
>>> +     default y if BR2_powerpc64le
>>> +     default y if BR2_riscv
>>> +     default y if BR2_s390x
>>> +     default y if BR2_sh
>>> +     default y if BR2_sparc64
>>> +     default y if BR2_x86_64
>>> +     default y if BR2_microblaze
>>> +     default y if BR2_nios2
>>> +     default y if BR2_arc && BR2_ARC_ATOMIC_EXT
>>> +     default y if BR2_csky
>>> +     depends on BR2_USE_MMU
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
>>> +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
>>> +     depends on !BR2_powerpc_SPE
>>> +     depends on BR2_RISCV_ISA_RVA || !BR2_riscv
>>> +
>>> +config BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
>>> +     bool
>>> +     default y if BR2_aarch64
>>> +     default y if BR2_arm
>>> +     default y if BR2_armeb
>>> +     default y if BR2_i386
>>> +     default y if BR2_microblaze
>>> +     default y if BR2_mips
>>> +     default y if BR2_mipsel
>>> +     default y if BR2_mips64
>>> +     default y if BR2_mips64el
>>> +     default y if BR2_or1k
>>> +     default y if BR2_powerpc
>>> +     default y if BR2_powerpc64
>>> +     default y if BR2_powerpc64le
>>> +     default y if BR2_RISCV_64
>>> +     default y if BR2_sh
>>> +     default y if BR2_x86_64
>>> +     depends on !BR2_powerpc_SPE # not supported, build breaks
>>> +     depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
>>> +     # sh2 nommu is supported by musl, but we don't have support
>>> +     # for it in Buildroot.
>>> +     depends on BR2_USE_MMU
>>> +
>>> +config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
>>> +     bool
>>> +     default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
>>> +     default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
>>> +
>>>    choice
>>>        prompt "C library"
>>>        default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>>> @@ -27,13 +112,7 @@ choice
>>>
>>>    config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>>>        bool "uClibc-ng"
>>> -     depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
>>> -                BR2_arm     || BR2_armeb    || \
>>> -                BR2_i386    || BR2_m68k   || BR2_microblaze || \
>>> -                BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>>> -                BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
>>> -                BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
>>> -                BR2_x86_64
>>> +     depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
>>>        select BR2_TOOLCHAIN_USES_UCLIBC
>>>        help
>>>          This option selects uClibc-ng as the C library for the
>>> @@ -43,22 +122,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>>>
>>>    config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>>>        bool "glibc"
>>> -     depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
>>> -                BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
>>> -                BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
>>> -                BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>>> -                BR2_riscv       || BR2_s390x      || BR2_sh          || \
>>> -                BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
>>> -                BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
>>> -     depends on BR2_USE_MMU
>>> +     depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
>>>        depends on !BR2_STATIC_LIBS
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
>>> -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
>>> -     depends on !BR2_powerpc_SPE
>>> -     depends on BR2_RISCV_ISA_RVA || !BR2_riscv
>>>        select BR2_TOOLCHAIN_USES_GLIBC
>>>        help
>>>          This option selects glibc as the C library for the
>>> @@ -82,15 +147,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
>>>
>>>    config BR2_TOOLCHAIN_BUILDROOT_MUSL
>>>        bool "musl"
>>> -     depends on BR2_aarch64     || BR2_arm   || BR2_armeb   || BR2_i386 || \
>>> -                BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
>>> -                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
>>> -                BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
>>> -     depends on !BR2_powerpc_SPE # not supported, build breaks
>>> -     depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
>>> -     # sh2 nommu is supported by musl, but we don't have support
>>> -     # for it in Buildroot.
>>> -     depends on BR2_USE_MMU
>>> +     depends on BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
>>>        select BR2_TOOLCHAIN_USES_MUSL
>>>        help
>>>          This option selects musl as the C library for the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

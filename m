Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D79C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320DE60F1A;
	Tue,  8 Feb 2022 20:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsd7VpJWBXVl; Tue,  8 Feb 2022 20:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271E460F1F;
	Tue,  8 Feb 2022 20:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62DF1BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC2F81771
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTipWUr_yIj8 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F63F8142D
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:49:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fy20so1394962ejc.0
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ZlJNyJJg15NfJXS/Nlyf3p6e1mtnbLmiwS4phrJzQI=;
 b=FBqh7M44/QUa4giDsA6tCD7yAw8ok9evrnyJ6wUmgWH+ZsNYSl/uOHQzX49UHJ27aC
 QS5FmzMKFg/PW2g9W+pDnvl46fbFKwF1SyN6u9xSvBwGzjKDkPIM7VkMv2VxjoYTIH5C
 SfHjyk3jjGk+AcP9jpIP/ooNKk81G/pVd2qYy20++RQhuGb32TqTRCBZzgFfqDom0vGW
 Dp/4fxz47VUPVP0rPFBAL+rKPceJpVkU5yTwhaE2ikyU0nN3Vr/in6KjtSfAeYJpqVGQ
 ZHskwvfl7J1qMDAqIF/waWuQ+Wz62o6ihZrgc/Vl0Lat/d8iOj1v4huT+brNJD9gs56R
 ToOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ZlJNyJJg15NfJXS/Nlyf3p6e1mtnbLmiwS4phrJzQI=;
 b=5r8sGueIuVV7aNi5h5OVo6Wd2W8EaXUxRBV3K6qsyFCmRUWC4hdlEdFdYQicFnH1uI
 MkIfMvtq1samFUwCPhKlkTeZuMACKBnQbKI0yJ0iFy450AlzOW5g5go785U7R6WCuglf
 uTBAtkjf0KtU7mfeNOz+RYGvRu0KRCPJoJWsfdOyYStbjclpD2fIB7UWUpE4NP5CrnbP
 ZUgoZUZCWaVuXGizm/xhbDrj3TckkoE9MH++pBCvFCw8znGOPaxqw1I8JurpwUJUvxxT
 yOp4GiGnSGX0D15U0QzxT/h7tWg7g2FKO+vVW9clUVsUpkIPl7D1RqmBrvu7kfjHoTnX
 z6ZQ==
X-Gm-Message-State: AOAM530kfEbyHWhr4ZP68EXVw05RSX/uRNE8TmHyViSw9pblzglncsPZ
 ZOiO7nqc2lPqDDc1ibPQQzJk4jcJkWugCw==
X-Google-Smtp-Source: ABdhPJw1JDU6fuIIU1lvwE//90FIH9Zz1ZnaXs46yamqIlCYyrPa4T4cNLgwEJN29Uiu0aExnWSFwg==
X-Received: by 2002:a17:906:5d0a:: with SMTP id
 g10mr4139184ejt.595.1644353389065; 
 Tue, 08 Feb 2022 12:49:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o3sm2439407edt.67.2022.02.08.12.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:49:48 -0800 (PST)
Message-ID: <ccf8bfcd-a4f9-9937-8b36-3ffd9b87a572@mind.be>
Date: Tue, 8 Feb 2022 21:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 0/7] Basic support for 64-bit kernel and
 32-bit userland
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 21:02, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Hello,
> 
> Even though there are already cases where a 64-bit kernel is combined with
> 32-bit userland, like MIPS64n32, that Buildroot can support out-of-the-box,
> there are other combinations that don't currently work.
> 
> At work, we have two such cases:
> - 64-bit x86_64 kernel with 32-bit i386 userspace
> - 64-bit aarch64 kernel with 32-bit arm userspace
> 
> This series adds basic support for these cases, with the limitation that the
> user still needs to know what they are doing.
> 
> Patch 1 is a general improvement and can land even if you don't agree
> with the rest.
> 
> Patch 2 handles the realization that 'KERNEL_ARCH' can mean two different
> things, and that we need two separate variables.
> 
> Patch 3 makes it possible for users to specify the kernel architecture that
> differs from the Buildroot notion of userspace architecture.
> 
> Patch 4 fixes the build of perf in this mixed 64-bit-kernel+32-bit-userspace
> case.
> 
> Patch 5 prepares host-qemu for the case of x86_64. I'm not very fond of the fact
> that this does not provide a generic solution.
> 
> Patch 6 adds a new qemu defconfig for x86_64 kernel and x86 userspace, that
> employs the new logic.
> 
> Finally patch 7 corrects LINUX_ARCH_PATH for sparc64, not directly related to
> this series but reported by Romain Naour during his review.
> 
> 
> As hinted above, users that would like to employ such scenarios still need to
> know what they are doing:
> 
> - the correct value of BR2_KERNEL_ARCH_OVERRIDE is to be known by the user
> 
> - the toolchain should be capable of generating both 64-bit (kernel) output as
>    well as 32-bit userspace output. This is typically done with a multilib
>    toolchain, where the default output is 64-bit so that the kernel build does
>    not require additional changes, while passing the correct '-mXXX' flag as
>    BR2_TARGET_OPTIMIZATION for the userspace compilations.
> 
> - it is not possible to create one multilib toolchain that supports Aarch64 and
>    (32-bit) ARM output. We have solved it by packaging two individual toolchains
>    in one archive, with symlinks at top-level to the 32-bit toolchain, and
>    some additional changes in Buildroot to make sure the 64-bit toolchain is
>    used where needed (kernel, bootloader)
> 
> - BR2_KERNEL_64_USERLAND_32 is not automatically passed.
> 
> 
> An alternative implementation would be to explicitly support certain
> combinations, but this is less flexible.

  So, I'm not entirely convinced about this approach. Here are my objections.

- At least for arm, you need an entirely different toolchain for the 32 and the 
64-bit variants. But even for x86, the Buildroot internal toolchain for x86_64 
doesn't support -m32. So for most users this is not even going to work.

- There is an alternative: two separate Buildroot configs, one for the kernel + 
modules, one for userspace.

- I don't think the flexibility is useful. I think it would be better to reuse 
the BR2_KERNEL_64_USERLAND_32 option. (E.g. add an option to Config.in.x86 when 
the arch is x86_64 to build a 32-bit userspace.) That way we can use it to pass 
-m32 where needed, to build an internal toolchain that supports it, and to check 
for the external toolchain if it supports it. Doesn't solve the issue for ARM, 
but it's a start.


  Also, I think we absolutely need to test this feature. At the very least, we'd 
need to config in the autobuilders that enables it, or enable it randomly in 
genrandconfig. Although I'm not sure if it tests anything if no kernel is built 
(let alone that it's not even booted).


  For now, I've left the rest of the series as New in patchwork, let's see what 
the others think.

  Regards,
  Arnout


> 
> Best regards,
> Thomas
> 
> Thomas De Schampheleire (7):
>    arch: move definition of KERNEL_ARCH to Config.in.<arch> files
>    core: introduce NORMALIZED_ARCH as non-kernel replacement for
>      KERNEL_ARCH
>    core: introduce BR2_KERNEL_ARCH_OVERRIDE
>    perf: fix compilation in case of i386 userspace with x86_64 kernel
>    package/qemu: add support for overridden KERNEL_ARCH=x86_64
>    configs: add new qemu defconfig 'x86_multilib'
>    linux/linux.mk: correct LINUX_ARCH_PATH for sparc64
> 
>   Makefile                                      | 22 ++-----
>   arch/Config.in                                | 18 ++++++
>   arch/Config.in.arc                            |  3 +
>   arch/Config.in.arm                            |  4 ++
>   arch/Config.in.csky                           |  3 +
>   arch/Config.in.m68k                           |  3 +
>   arch/Config.in.microblaze                     |  3 +
>   arch/Config.in.mips                           |  3 +
>   arch/Config.in.nds32                          |  3 +
>   arch/Config.in.nios2                          |  3 +
>   arch/Config.in.or1k                           |  3 +
>   arch/Config.in.powerpc                        |  3 +
>   arch/Config.in.riscv                          |  3 +
>   arch/Config.in.s390x                          |  3 +
>   arch/Config.in.sh                             |  3 +
>   arch/Config.in.sparc                          |  4 ++
>   arch/Config.in.x86                            |  4 ++
>   arch/Config.in.xtensa                         |  3 +
>   board/qemu/x86_multilib/linux.config          | 57 +++++++++++++++++++
>   board/qemu/x86_multilib/post-build.sh         | 11 ++++
>   board/qemu/x86_multilib/readme.txt            |  7 +++
>   boot/barebox/barebox.mk                       | 10 ++--
>   boot/uboot/uboot.mk                           |  6 +-
>   configs/qemu_x86_multilib_defconfig           | 26 +++++++++
>   linux/linux.mk                                |  2 +
>   package/busybox/busybox.mk                    |  2 +-
>   .../environment-setup/environment-setup.mk    |  2 +-
>   package/kvmtool/kvmtool.mk                    |  4 +-
>   package/libselinux/libselinux.mk              |  2 +-
>   package/linux-tools/linux-tool-perf.mk.in     |  7 ++-
>   .../linux-tools/linux-tool-selftests.mk.in    |  6 +-
>   package/olsr/olsr.mk                          |  4 +-
>   package/pciutils/pciutils.mk                  |  2 +-
>   package/qemu/qemu.mk                          |  3 +
>   package/uboot-tools/uboot-tools.mk            | 10 ++--
>   35 files changed, 210 insertions(+), 42 deletions(-)
>   create mode 100644 board/qemu/x86_multilib/linux.config
>   create mode 100755 board/qemu/x86_multilib/post-build.sh
>   create mode 100644 board/qemu/x86_multilib/readme.txt
>   create mode 100644 configs/qemu_x86_multilib_defconfig
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

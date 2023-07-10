Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDC4EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C15E941521;
	Mon, 10 Jul 2023 21:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15E941521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsqBTwCnueFz; Mon, 10 Jul 2023 21:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D764031E;
	Mon, 10 Jul 2023 21:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D764031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A29C1BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426A760F39
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426A760F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psdrKFK6QM_l for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:33:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7D560F17
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB7D560F17
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:33:12 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.132.92])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IyVJqFXqjFU54IyVJqmkFM; Mon, 10 Jul 2023 23:33:10 +0200
Message-ID: <0a47bc18-2889-a34b-5085-6fea80db62ce@benettiengineering.com>
Date: Mon, 10 Jul 2023 23:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20230710094148.308395-1-heiko.thiery@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230710094148.308395-1-heiko.thiery@gmail.com>
X-CMAE-Envelope: MS4xfNc/LnGQbMe8d4Lwqzwlkz4f53K/kMorhM0i0vd9hY9//URVmSAglxFB0fak/OuDi+TCQMBNfVf1Bjws9jGiHAs5D0xvINmNq8TN4pyj54cfrHI6lB2M
 VUPf17Az4HMrMkrCR12hbGyWL9RwMKugIyb41AToAbIO/NBDMxDYjIxJDOFqJyVZ1AeN7JutsMXNaun/OmRI/8dEpl8FGVmF0vEk35Rsq/pjo9acz4oGZ7M6
 s5hyl0DqlNOzuTLSPTIvfvShuKSTlf+i5gaNfvEIEJyvRdfPXadLQtnnrJZbkC/1SBjEWwcNzwn1CK09vqE9DnY7YDnCPZ5ClGCuKkZjKotF8dm1M0XhwreV
 MSzcBZDIGquMpBfva4YwOOnN3AGijKOPag+G+s0kXCErnSzMc/M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689024790; bh=8f3dRwNMGqGfySmc4/Jnu/FNOpk+WUTrW/V7EUtkqbg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JC3TVluWJSVRa/1mkngvyf56fvEb8f0xBH25QYWNfjy6rx/DpuNOUN9v89Efad/sR
 LDu51fTYWRYm1q/bbEvkV7xsIJ4RYeTQiSGz6gzpB04SWUmvfWFu0g5BgqSLTKrQc6
 nuBfyAddFWCgd0ewqdugfPjZ7tX5j69pldFhKsqbaUtoqb+N8XQeoRNo4wCzYk0LYs
 yxynagfXN640NhkazDFgwTkdhI1o5MV5My9Qxu+d+Gm+PuYFISIdiyeMS4SsCt5TTo
 9jYCrqCgVCnMpeYRdR51geRP/MqINbTyz3FBLzyvHmOO4NYap1GjeHKm7twR+G5y7B
 yNFHZfrLPaV+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JC3TVluW
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix build
 issue with binutils 2.39+
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

On 10/07/23 11:41, Heiko Thiery wrote:
> The new version of binutils introduces a new warning when linking. The
> new warninng is enabled by default. To fix the issue this warning is
> disabled by adding the patches to the arm-trusted-firmware package
> v{2.2..2.8}. This is a backport of an upstream commit [1]
> 
> Since there are too many defconfigs that use the arm-trusted-firmware
> package, it is not practical to create a global-patch-dir for all of them.
> Therefore the patches are only in the package directory.
> 
> [1] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996186
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996189
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996366

> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Thank you for the patch!

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
> v2: change the commit message to state why we add the patch to the
>      package directory
> ---
>   ...-add-support-for-new-binutils-versio.patch | 58 +++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>   7 files changed, 430 insertions(+)
>   create mode 100644 boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
>   create mode 100644 boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> 
> diff --git a/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
> new file mode 100644
> index 0000000000..2375de0eef
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
> @@ -0,0 +1,58 @@
> +From 5e1beb793c06352e87c46eca1144ff1fe8555103 Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Mon, 10 Jul 2023 10:43:03 +0200
> +Subject: [PATCH] [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 721246d51..5893cf422 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -297,11 +297,16 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS              +=      -z noexecstack
> ++
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> + TF_LDFLAGS		+=	--remove --info=unused,unusedsymbols
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS              +=      $(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS              +=      -O1
> + TF_LDFLAGS		+=	--gc-sections
> + endif
> + TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> +
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> +
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> +
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +--
> +2.30.2
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

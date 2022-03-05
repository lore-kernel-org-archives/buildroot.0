Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 09:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF4B60E3B;
	Sat,  5 Mar 2022 09:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxmhI2Et3BFF; Sat,  5 Mar 2022 09:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA3B60C2C;
	Sat,  5 Mar 2022 09:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41B411BF3EA
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 09:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D4254011F
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 09:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4sbib10-zcJ for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 09:18:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9784F40022
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 09:18:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c060:e225:3767:1339])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E89502003AE;
 Sat,  5 Mar 2022 10:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646471932;
 bh=kcfbjI/5cgvUntVFR4CBeIHF6pQnHiW3DZYtfJEkdx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKgk+nA3P2UgwFenJsTXzIK5O+6osslmd7Q9rhhpEK4L+RBI+HmVrCKcvjdvL5rSI
 7+AohtlS+ke/Be6SAWN+TsfeGX+YY86G5pWIaCldZ0x9s7T0pngeYdBMULiful+z0S
 q6ZAkEXXGh+5FWB257LXjMknXg2fQCnnRUBqJF/BON8d+748TVE0VWeSbbY+qk21vb
 sqCNhNhxsKcyNWiq0PC1VDM6tmiwPVqKJCKyXA/C8uuOA0fhuNYXuxmi8aqxvUSF2N
 6NDDn5F1XFPl3OCB+HRKvDfKWZ0B0FcC/+pe5S61beloQNSbArR7qp42liztgQ6hin
 GVrXDBUnSh0hw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Mar 2022 10:18:49 +0100
Date: Sat, 5 Mar 2022 10:18:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20220305091849.GB228549@scaer>
References: <20220305000052.491721-1-mmayer@broadcom.com>
 <20220305002209.493816-1-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220305002209.493816-1-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] linux: limit YYLTYPE kernel modification
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2022-03-04 16:22 -0800, Markus Mayer spake thusly:
> Commit 9b41b54be07711c10ad13ce157be272ed1cf402e addresses a build issue
> regarding re-defined YACC symbols. Unfortunately, this can break the
> build for older toolchains.
> 
> To prevent unintentional breakage, make the source code modification
> conditional on BR2_TOOLCHAIN_GCC_AT_LEAST_10. Also inform the user about
> the modification when it is performed, so it becomes more obvious what
> is happening in case of unforseen problems.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 940dc2849f..382a3f679e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -293,12 +293,15 @@ endef
>  
>  LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
>  
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)

That is wrong, because this is built with the _host_ compiler, not the
target compiler, and BR2_TOOLCHAIN_GCC_AT_LEAST_XX is about the target
compiler.

So, if we wanted to make that conditional, that would have to be
conditional on BR2_HOST_GCC_AT_LEAST_10 (we only have up to gcc-9 for
the host for now, so we'd need to add it for gcc-10 and 11; hint: search
for BR2_HOST_GCC_AT_LEAST_9, HOST_GCC_VERSION, HOSTCC_VERSION, and
HOSTCC_MAX_VERSION).

Furthermore, that is still wrong in your case: if you switch to a
distribution that has gcc 10 (so, as host compler!), then this fixup
will be applied again, and your build will break again, because your
kernel is (probably) missing the following commits (of the 29 that
touch scripts/dtc/ between 4.1 and e33a814e772c):

    $ git slog -G'YYLTYPE yylloc;' v4.1..e33a814e772cdc36436c8c188d8c42d019fda639 -- scripts/dtc/
    e33a814e772cd scripts/dtc: Remove redundant YYLOC global declaration
    e039139be8c25 scripts/dtc: generate lexer and parser during build instead of shipping
    4760597116e34 scripts/dtc: Update to upstream version 9d3649bd3be245c9

However, you still have a point: this is breaking older kernels that do
not have a recent-enough bundled dtc, whether they be built with a host
gcc 10+ or not...

Maybe we need to find a better heuristic to detect the case when we need
to apply the fix, but then I am afraid this is going to be a nightmare
of so many corner cases with vendor-specific franken-kernels.

I am not sure where to go from here, though...

>  # Older versions break on gcc 10+ because of redefined symbols
>  define LINUX_DROP_YYLLOC
> +	@echo "Removing 'YYLTYPE yylloc;' from kernel sources..."

There are so many fixes and tweaks we do without informing the user. If
we were to, the build would be even more verbose than it currently is.
Finding a reference to yylloc in the build log would just mean grepping
for it, so you would achieve about the same by running:

    $ make V=1

as that would print the fixup line.

Regards,
Yann E. MORIN.

>  	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
>  	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
>  endef
>  LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
> +endif
>  
>  # Older linux kernels use deprecated perl constructs in timeconst.pl
>  # that were removed for perl 5.22+ so it breaks on newer distributions
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

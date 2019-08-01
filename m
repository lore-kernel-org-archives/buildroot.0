From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 10:21:51 +0200
Subject: [Buildroot] 
 =?utf-8?b?562U5aSNOiAg562U5aSNOiBwYXRjaDogZml4IHdy?=
 =?utf-8?q?ong_sysroot_path_when_given_rsdk_toolchain?=
In-Reply-To: <14A4BC6FC7AB3340A49D24D6ACB7BED930707F@RS-MBS02.realsil.com.cn>
References: <14A4BC6FC7AB3340A49D24D6ACB7BED930620C@RS-MBS02.realsil.com.cn>
 <20180719153240.25e67cd9@windsurf>
 <14A4BC6FC7AB3340A49D24D6ACB7BED930633B@RS-MBS02.realsil.com.cn>
 <c6e54e61-fe51-262b-5c15-0df59f373a0e@mind.be>
 <14A4BC6FC7AB3340A49D24D6ACB7BED930707F@RS-MBS02.realsil.com.cn>
Message-ID: <f2212fb5-a14a-938e-d4e1-260999a05f8f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/07/2018 08:54, ??? wrote:
> Hi Arnout,
> 
> Thanks for confirming the problem.
> I pasted the patch with a refurbished commit msg as below.
> 
> From f884cb3ed9f920f8516fef0b3246b29751c25704 Mon Sep 17 00:00:00 2001
> From: Shawn Chen <shawn_chen@realsil.com.cn>
> Date: Mon, 23 Jul 2018 14:30:24 +0800
> Subject: [PATCH 1/1] toolchain: avoid unexpected regex substitution
> 
> Anchor the regex in toolchain_find_sysroot macro with a / to avoid
> unexpected substitution for Realtek mips toolchain, for which the libc.a
> path ends with 'mips-linux-uclibc/lib/libc.a'.
> 
> Signed-off-by: Shawn Chen <shawn_chen@realsil.com.cn>

 (Finally) applied to master, thanks.

 Regards,
 Arnout

> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8b2c283654..1ae099fd33 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -339,7 +339,7 @@ endef
>  #
>  # And variations on these.
>  define toolchain_find_sysroot
> -$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
> +$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:/(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
>  endef
>  
>  # Returns the lib subdirectory for the given compiler + flags (i.e
> 

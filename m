From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 01:02:14 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/mips: add the mips64 tuple
In-Reply-To: <1342268918-3235-2-git-send-email-gustavo@zacarias.com.ar>
References: <1342268918-3235-1-git-send-email-gustavo@zacarias.com.ar>
 <1342268918-3235-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120715010214.56f95807@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 09:28:38 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> We need to use mips64 in the tuple for 64-bit variants (N32, N64 and O64
> ABIs), otherwise we get assembly failures.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  target/Config.in.arch |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/target/Config.in.arch b/target/Config.in.arch
> index bad0f4c..ae90a1d 100644
> --- a/target/Config.in.arch
> +++ b/target/Config.in.arch
> @@ -600,6 +600,8 @@ config BR2_ARCH
>  	default "i686"		if BR2_x86_athlon_4
>  	default "m68k"		if BR2_m68k
>  	default "microblaze"	if BR2_microblaze
> +	default "mips64"	if (BR2_MIPS_ABI64 || BR2_MIPS_OABI64 || BR2_MIPS_ABI32) && BR2_mips
> +	default "mips64el"	if (BR2_MIPS_ABI64 || BR2_MIPS_OABI64 || BR2_MIPS_ABI32) && BR2_mipsel
>  	default "mips"		if BR2_mips
>  	default "mipsel"	if BR2_mipsel
>  	default "powerpc"	if BR2_powerpc

So basically all ABIs except o32 are mips64 ABIs ?

I think it would be good to add a help text below each ABI to explain
its use case, the bitness of the kernel, etc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

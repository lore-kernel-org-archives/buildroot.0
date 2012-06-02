From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jun 2012 00:17:32 +0200
Subject: [Buildroot] [PATCH v2 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <1338674987-2053-2-git-send-email-s.martin49@gmail.com>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
 <1338674987-2053-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20120603001732.0bfdec3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  3 Jun 2012 00:09:43 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> Selecting the target architecture variant automatically selects the
> appropriated set of features.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> diff --git a/target/Config.in.arch b/target/Config.in.arch
> index 25ff750..9908b58 100644
> --- a/target/Config.in.arch
> +++ b/target/Config.in.arch
> @@ -242,7 +242,7 @@ choice
>  	default BR2_mips_1 if BR2_mipsel
>  	help
>  	  Specific CPU variant to use
> -	
> +

Unrelated change.

> +# i386/x86_64 cpu features
> +config BR2_CPU_HAS_MMX
> +	bool
> +config BR2_CPU_HAS_SSE
> +	bool
> +config BR2_CPU_HAS_SSE2
> +	bool
> +config BR2_CPU_HAS_SSE3
> +	bool
> +config BR2_CPU_HAS_SSSE3
> +	bool
> +config BR2_CPU_HAS_SSE41
> +	bool
> +config BR2_CPU_HAS_SSE42
> +	bool
> +config BR2_CPU_HAS_SSE4
> +	bool
> +config BR2_CPU_HAS_SSE4A
> +	bool
> +config BR2_CPU_HAS_3DNOW
> +	bool
> +config BR2_CPU_HAS_ABM
> +	bool

Should we name those options BR2_X86_CPU_HAS_* ?

Otherwise, this looks good to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

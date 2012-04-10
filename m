From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Apr 2012 14:28:25 -0300
Subject: [Buildroot] [PATCH 3/5] toolchain: add m68k to the list of arch
 that can work without MMU
In-Reply-To: <881ef065c0099160e74e9fe8da3b3a5cafefa685.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
 <881ef065c0099160e74e9fe8da3b3a5cafefa685.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <70d7789fe4661f18c23eb41a1c62f7a2@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-10 13:10, Thomas Petazzoni wrote:

> The early m68k had no MMU, later m68k had MMUs, but Coldfires don't
> have MMU.
>
>  config BR2_USE_MMU
> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips ||
> BR2_mipsel || BR2_sh || BR2_xtensa
> +	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips ||
> BR2_mipsel || BR2_sh || BR2_xtensa || BR2_m68k
>  	default y if !BR2_bfin
>  	help
>  	  If your target has a MMU, you should say Y here.  If you

Maybe default y if !(BR2_bfin || BR2_m68k) ?
Since most people will target Coldfire rather than 68xxx.
A quick look says v4 and v5 have MMU though.
Regards.

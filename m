From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 22:11:26 +0200
Subject: [Buildroot] [PATCH] BR2_ARCH definition was missing for 32-bit
 AMD architecture variants.
In-Reply-To: <1309790240-25341-1-git-send-email-arnout@mind.be>
References: <1309790240-25341-1-git-send-email-arnout@mind.be>
Message-ID: <20110705221126.5912c201@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon,  4 Jul 2011 16:37:20 +0200,
"Arnout Vandecappelle (Essensium - Mind)" <arnout@mind.be> a ?crit :

> @@ -478,6 +478,13 @@ config BR2_ARCH
>  	default "i686"		if BR2_x86_pentiumpro
>  	default "i686"		if BR2_x86_nocona
>  	default "i686"		if BR2_x86_core2
> +	default "i686"		if BR2_x86_opteron
> +	default "i686"		if BR2_x86_opteron_sse3
> +	default "i686"		if BR2_x86_barcelona
> +	default "i686"		if BR2_x86_k6
> +	default "i686"		if BR2_x86_k6_2
> +	default "i686"		if BR2_x86_athlon
> +	default "i686"		if BR2_x86_athlon_4
>  	default "m68k"		if BR2_m68k
>  	default "mips"		if BR2_mips
>  	default "mipsel"	if BR2_mipsel

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This whole BR2_ARCH thing is a little nasty. For some archs, there is a
single entry (for example ARM), but for other archs (for example x86 or
x86_64) there are multiple entries. I would be tempted to replace all
the x86 entries by :

	default "i386"	if BR2_i386

but according to commit 6212c19a8fbe86bf6c9ab854bd9b0db4ecc8d5ba having
different BR2_ARCH is needed :

"""
allow people to build for i386/i486/i586/i686 targets since some
packages (like gcc) build differently based upon the host tuplet
"""

What do people think about this ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 01 May 2017 19:52:04 -0300
Subject: [Buildroot] [PATCH] config/raspberrypi3: use correct CPU
References: <20170501091104.3183-1-yann.morin.1998@free.fr>
Message-ID: <5907bc146298d_4601fe25a48093b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, May 01, 2017 at 06:11 AM, Yann E. MORIN wrote:

> We so far were using a Cortex-A7 as the CPU for the rpi3, as this was
> the closest we had available, in 32-bit mode, to the real CPU used in
> the rpi3.
> 
> But now we can also use the Cortex-A53 in 32-bit mode, so we use that,
> which makes for an optimised build (A53 has an improved instruction set,
> as compared to the A7).
> 
> Also drop the DTB overlay option, it defaults to 'y'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[boot-tested: I can login using the HDMI console]

but see comment below...

[snip]
> +++ b/configs/raspberrypi3_defconfig
> @@ -1,6 +1,5 @@
>  BR2_arm=y
> -BR2_cortex_a7=y
> -BR2_ARM_EABIHF=y
> +BR2_cortex_a53=y

This patch is very similar to:
http://patchwork.ozlabs.org/patch/751142/

I applied 751142 and 757022 to separate git trees above 289137ed61.
The resulting .config are the same (except for the sha1, of course).

Regards,
Ricardo

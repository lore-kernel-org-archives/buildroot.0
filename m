From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 6 May 2016 09:15:10 -0300
Subject: [Buildroot] [PATCH] xserver_xorg-server: use -O2 build
 optimization level
In-Reply-To: <20160506084734.56e5caad@gmx.net>
References: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
 <20160506084734.56e5caad@gmx.net>
Message-ID: <572C8ACE.4010307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/16 03:47, Peter Seiderer wrote:

> Thanks for the patch, will surely improve the 'out of the box' usability of buildroot,
> but I would prefer a 'blacklist' of known failing combinations and simply disable
> xserver (with comment why) in this case(s), the only know to me is RPi1:
>
>    BR2_ARCH="arm"
>    BR2_GCC_TARGET_CPU="arm1176jzf-s"
>    BR2_OPTIMIZE_S=y
>
> The perfect solution would be a fix for gcc (and/or xserver)...
>
> Regards,
> Peter

Hi Peter.
Isn't that a bit harsh?
I'm not 100% comfortable with this solution either, however blacklisting 
xorg will be messy to put it lightly.
Also finding the failing combinations will not be simple - it seems ARM 
in general is affected on several toolchain combinations, as is MIPS as 
well (both tested in Qemu) - so it goes beyond some particular platforms.
Another alternative could be finding the exact gcc option that's causing 
it diffing the output of --help=optimizers and trying enabling/disabling 
one by one until it's fixed or fails since this would probably help 
pinpoint the precise optimizations that's causing it (which would in 
turn help in making a minimal test case to help upstream).
Regards.

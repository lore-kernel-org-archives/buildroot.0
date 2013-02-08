From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2013 18:38:23 +0100
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <1360344317.17385.31.camel@genx.eng.msli.com>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
Message-ID: <201302081838.24085.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On Friday 08 February 2013 John Stile wrote:
> I primarily boot from one of two 128Mb NAND areas, but I have an 8Mb NOR
> failsafe if NAND is bad.  I have about 5.5Mb available for the
> Filesystem after loading at91bootstrap, uboot, uboot-env, and kernel.
> ...(using buildroot-2011.11)...
> 
> The rootfs.jffs2 for NAND is 41Mb.
> I need one for NOR that is less than 5.5Mb.
> 
> Is there a good method or script to copy buildroot's rootfs.jffs2  to
> make a smaller copy for NOR?

I would simply create a completely separated system from scratch, with
only the packages that you need.

For example:

  $ make O="$(pwd)/complete_system" complete_defconfig
  $ make O="$(pwd)/complete_system"
  $ make O="$(pwd)/failsafe_system" failsafe_defconfig
  $ make O="$(pwd)/failsafe_system"

And then grab the corresponding images from:
    complete_system/images/    <- the full-featured system
    failsafe_system/images/    <- the failsafe system

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

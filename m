From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:35:37 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: allow disabling
 installation of binary DTBs
In-Reply-To: <558480FF.409@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <20150619203006.GC3638@free.fr> <558480FF.409@je-eigen-domein.nl>
Message-ID: <20150628223537.GI3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-06-19 22:52 +0200, Floris Bos spake thusly:
> On 06/19/2015 10:30 PM, Yann E. MORIN wrote:
[--SNIP--]
> >I'd put the overlays out of the conditional block, because they are
> >*not* built by the Linux kernel.
> 
> They do seem to be part of the rpi Linux source tree: https://github.com/raspberrypi/linux/tree/rpi-3.18.y/arch/arm/boot/dts/overlays
> Isn't it a matter of adding overlay/name-of-overlay to
> BR2_LINUX_KERNEL_INTREE_DTS_NAME if someone wants an overlay build?

In fact, no, it does not work.

We would need to do some changes in Buildroot for how we handle DTB
generation to be able to generate the DTB overlays.

So, I've postponed that change for later, and introduced a new Kconfig
knob to install DTB overlays:
    https://patchwork.ozlabs.org/patch/489181/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

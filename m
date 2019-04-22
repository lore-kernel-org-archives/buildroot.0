From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 22:34:41 +0200
Subject: [Buildroot] [PATCH 0/5] Fix fallouts from LINUX_BUILD_CMDS
 simplification
In-Reply-To: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190422203441.GC6200@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-22 22:08 +0200, Thomas Petazzoni spake thusly:
>  - Due to calling "make all", a little bit more might get built, and
>    sometimes this "little bit more" needs mkimage, so we add
>    host-uboot-tools to the defconfig. This is enough as linux/linux.mk
>    automatically adds host-uboot-tools to its dependency if it's
>    enabled. I hesitated with adding an explicit
>    BR2_LINUX_KERNEL_NEEDS_HOST_UBOOT_TOOLS option, let me know if this
>    sounds better or if the proposed solution in this patch series is
>    good enough.

Ithink the NEEDS_FOO options are only interesting when the host package
does not have a kconfig option of its own.

In this case, I think it is correct to do as you did.

If linux did not have a conditional dependency on host-uboot-tools, then
it should be added, rather than add a NEEDS_HOST_UBOOT_TOOLS.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

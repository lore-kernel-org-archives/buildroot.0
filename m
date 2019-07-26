From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:31:21 +0200
Subject: [Buildroot] [PATCH] board/armadeus: bump apf51 kernel to 4.4.30
 (latest LTS)
In-Reply-To: <1478531682-6181-1-git-send-email-julien.boibessot@free.fr>
References: <1478531682-6181-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20190726163121.0d823249@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Mon,  7 Nov 2016 16:14:42 +0100
julien.boibessot at free.fr wrote:

> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> This will fix:
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf51_defconfig.log.FAIL
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

This defconfig no longer builds properly, due to gcc 8.x being used:

https://gitlab.com/buildroot.org/buildroot/-/jobs/259847033

The actual error is:

/tmp/ccpM4tIY.s: Assembler messages:
/tmp/ccpM4tIY.s:1908: Error: .err encountered
/tmp/ccpM4tIY.s:2914: Error: .err encountered
scripts/Makefile.build:258: recipe for target 'drivers/input/evdev.o' failed

It might be fixed in a later 4.4.x kernel, otherwise you'll have to
bump to a newer kernel version.

Could you have a look and send a patch for this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

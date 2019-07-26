From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:33:25 +0200
Subject: [Buildroot] [PATCH 4/4] configs/bananapi_m64: Bump to the linux
 kernel 5.0 and u-boot 2019.01
In-Reply-To: <20190419095718.8444-4-shyam.saini@amarulasolutions.com>
References: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
 <20190419095718.8444-4-shyam.saini@amarulasolutions.com>
Message-ID: <20190726163325.0ae32e0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Apr 2019 15:27:18 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> This bumps to linux/linux-headers 5.0 and u-boot version 2019.01
> 
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Following this bump, this defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/259847578

The problem is:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>

Which is fixed by adding BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to the
defconfig. Could you send a patch doing this ?

Note that bananapro_defconfig seems to also be affected by the same issue:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/259847598

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:27:11 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.1
In-Reply-To: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190726162711.2c4ede9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jul 2019 18:21:12 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This commit :
> 	- bumps Linux & U-Boot to linux4sam_6.1.
> 	- bumps at91bootstrap to v3.8.13
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Following this bump, the atmel_sama5d27_som1_ek_mmc_dev_defconfig no
longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/259847527

You need to add:
 
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Could you test this and send a patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

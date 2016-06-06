From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:39:28 +0200
Subject: [Buildroot] [PATCH 2/2] beaglebone: Use genimage to produce the
 SD card image
In-Reply-To: <1465075749-31837-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1465075749-31837-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160606223928.74489e30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 18:29:09 -0300, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

I've tweaked the title prefix to configs/beaglebone

> +# host packages
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y

You also need host dosfstools for genimage to work when a FAT
filesystem needs to be generated. I've added it to the defconfig and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

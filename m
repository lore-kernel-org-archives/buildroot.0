From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:31:18 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.48
In-Reply-To: <20191208110650.106092-1-giulio.benetti@benettiengineering.com>
References: <20191208110650.106092-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191208143118.40d45596@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 12:06:50 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>  # Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
>  define LIBNSS_FIXUP_LINUX_MK
> -	echo 'OS_CFLAGS += $(LIBNSS_CFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
> +	echo 'OS_CFLAGS += $(LIBNSS_CFLAGS) -D__USE_POSIX' >> $(@D)/nss/coreconf/Linux.mk

Defining __USE_POSIX shouldn't be done, it's defined internally by
<features.h> when _POSIX_SOURCE is defined. So I dropped this patch of
your patch, and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

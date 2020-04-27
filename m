From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:28:55 +0200
Subject: [Buildroot] [PATCH] boot/uboot: switch to host-python3
In-Reply-To: <20200426140330.6498-1-francois.perrad@gadz.org>
References: <20200426140330.6498-1-francois.perrad@gadz.org>
Message-ID: <20200427212855.7b4bbcdc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Apr 2020 16:03:30 +0200
Francois Perrad <fperrad@gmail.com> wrote:

>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -UBOOT_DEPENDENCIES += host-python host-swig
> +UBOOT_DEPENDENCIES += host-python3 host-swig
>  endif

No, this is going to break the build of older U-Boots that need Python
2. We are having a discussion about this in the thread at:

  http://patchwork.ozlabs.org/project/buildroot/patch/20200425000629.2068191-1-heiko at sntech.de/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

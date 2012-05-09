From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 May 2012 13:35:59 +0300
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <1336559534-27948-1-git-send-email-golubovsky@gmail.com>
References: <1336559534-27948-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120509103559.GC26002@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

On Wed, May 09, 2012 at 06:32:14AM -0400, Dmitry wrote: 
> +# It is necessary to define __i386__ explicitly in CFLAGS for successful compilation.

No CFLAGS.

baruch

> +
> +define V86D_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +$(eval $(call GENTARGETS))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

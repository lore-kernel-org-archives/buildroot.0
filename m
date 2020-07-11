From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 13:05:55 +0200
Subject: [Buildroot] [PATCH] Fix swupdate build by installing mtd
 headers as expected
In-Reply-To: <CAPxu4wfxL4rCL2Q-CKUwHS+rbvUdwjhY=b0x5CV-OkBh--qBDQ@mail.gmail.com>
References: <CAPxu4wfxL4rCL2Q-CKUwHS+rbvUdwjhY=b0x5CV-OkBh--qBDQ@mail.gmail.com>
Message-ID: <20200711130555.3a1aea7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your contribution!

On Fri, 10 Jul 2020 15:41:37 -0400
"Thomas W." <thomas.chiantia@gmail.com> wrote:

> swupdate expects libmtd.h and libubi.h to be in the include folder and
> not in the mtd namespace.
> (see also:
> https://groups.google.com/forum/#!topic/swupdate/Apv_yRLmgzY
> https://groups.google.com/forum/#!topic/swupdate/gd25RIPa00w
> https://groups.google.com/forum/#!topic/swupdate/gei0Gc_5j8M)
> 
> Signed-off-by: Thomas Chiantia <thomas.chiantia@gmail.com>

Which problem is this fixing ? Is there a build issue today ? We have
had mtd + swupdate for quite some time. Why suddenly should we change
this ?

> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 3477460200..76ede98879 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -119,8 +119,8 @@ endef
>  # Those libraries are not installed by "make install", but are needed
>  # by other packages, such as swupdate.
>  define MTD_INSTALL_LIBS
> -    $(INSTALL) -D -m 0755 $(@D)/include/libmtd.h
> $(STAGING_DIR)/usr/include/mtd/libmtd.h
> -    $(INSTALL) -D -m 0755 $(@D)/include/libubi.h
> $(STAGING_DIR)/usr/include/mtd/libubi.h
> +    $(INSTALL) -D -m 0755 $(@D)/include/libmtd.h
> $(STAGING_DIR)/usr/include/libmtd.h
> +    $(INSTALL) -D -m 0755 $(@D)/include/libubi.h
> $(STAGING_DIR)/usr/include/libubi.h
>      $(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h
> $(STAGING_DIR)/usr/include/mtd/ubi-media.h
>      $(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
>      $(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a

Your patch is badly line-wrapped by your e-mail client. Could you send
your patches using git send-email ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

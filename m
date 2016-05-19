From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 16:03:18 +0200
Subject: [Buildroot] [PATCH] boot/uboot: fix missing host-openssl for
 i.MX28 target
In-Reply-To: <20160519130203.GB2178@tarshish>
References: <1463659540-28813-1-git-send-email-joerg.krause@embedded.rocks>
 <20160519130203.GB2178@tarshish>
Message-ID: <20160519160318.37fb72f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 16:02:03 +0300, Baruch Siach wrote:

> >  UBOOT_MAKE_OPTS += \
> >  	CROSS_COMPILE="$(TARGET_CROSS)" \
> > -	ARCH=$(UBOOT_ARCH)
> > +	ARCH=$(UBOOT_ARCH) \
> > +	HOSTCFLAGS="$(HOST_CFLAGS)" \
> > +	HOSTLDFLAGS="$(HOST_LDFLAGS)"  
> 
> Is this hunk necessary to make mxsimage.c build? If so, please explain how in 
> the commit log.

I guess it is, to allow the U-Boot build process to find OpenSSL in
$(HOST_DIR): thanks to $(HOST_CFLAGS) and $(HOST_LDFLAGS), the right
-I/-L options will be passed to allow U-Boot to find OpenSSL.

But indeed, it's nice when such things are explicitly said in the
commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

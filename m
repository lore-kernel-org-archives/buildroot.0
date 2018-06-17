From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 20:39:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/hidapi: select glibc gconv libs
 copy
In-Reply-To: <20180617180709.y3czlfck7hh53biz@tarshish>
References: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
 <20180617180709.y3czlfck7hh53biz@tarshish>
Message-ID: <20180617203915.70bb1e42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jun 2018 21:07:09 +0300, Baruch Siach wrote:

> > diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
> > index f6a31ba..d02ec23 100644
> > --- a/package/hidapi/Config.in
> > +++ b/package/hidapi/Config.in
> > @@ -5,6 +5,7 @@ config BR2_PACKAGE_HIDAPI
> >  	select BR2_PACKAGE_LIBUSB
> >  	select BR2_PACKAGE_LIBGUDEV
> >  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> > +	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support  
> 
> This does not work for external toolchains.

Why ?

The TOOLCHAIN_GLIBC_COPY_GCONV_LIBS hook is called for both internal
and external toolchains, and the BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
option exists for both internal and external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 May 2014 22:20:08 +0300
Subject: [Buildroot] [PATCH v2] protobuf: fix build for some unsupported
 architectures
In-Reply-To: <20140508205627.3b6c61d3@free-electrons.com>
References: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
 <20140508205627.3b6c61d3@free-electrons.com>
Message-ID: <20140508192008.GN3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, May 08, 2014 at 08:56:27PM +0200, Thomas Petazzoni wrote:
> On Thu,  8 May 2014 15:28:11 +0300, Baruch Siach wrote:
> 
> > @@ -2,6 +2,8 @@ config BR2_PACKAGE_PROTOBUF
> >  	bool "protobuf"
> >  	depends on BR2_INSTALL_LIBSTDCPP
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
> > +	    BR2_mipsel || BR2_powerpc
> 
> Unless there's a good reason to not support it, maybe we could keep
> BR2_armeb here in the list of supported architectures?

I don't see __ARMEB__(?) in the list of protobuf supported architectures at 
src/google/protobuf/stubs/platform_macros.h, only __ARMEL__.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

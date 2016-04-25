From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 25 Apr 2016 09:41:46 +0200
Subject: [Buildroot] [PATCH] kmsxx: new package
In-Reply-To: <20160421221639.78c8c2ef@free-electrons.com>
References: <1461100189-19627-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMML35SVu6B2F5dVnKmQJXYcfqwb-ivRDProvGEjfwTTknQ@mail.gmail.com>
 <20160421221639.78c8c2ef@free-electrons.com>
Message-ID: <20160425074146.GH25817@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, Thomas,

On Thu, Apr 21, 2016 at 10:16:39PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 20 Apr 2016 21:51:32 +0200, Samuel Martin wrote:
> 
> > > +config BR2_PACKAGE_KMSXX
> > > +       bool "kmsxx"
> > > +       select BR2_PACKAGE_LIBDRM
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
> > > +       help
> > > +         libkms++ is a C++11 library for kernel mode setting.
> > Does this mean there is some restriction on the toolchain properties?
> > (maybe a minimal compiler version?)
> > If so, a "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_..." would be needed.
> 
> Well, for sure if it's written in C++, a dependency on
> BR2_INSTALL_LIBSTDCPP is needed.
> 
> And since it's C++11, a dependency on gcc 4.7 or 4.8 is most likely
> needed.

Good point, it seems like it was entirely supported in 4.8, let's add
that as a dependency.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160425/a13c7e24/attachment.asc>

From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 06 Jan 2017 11:47:20 +0100
Subject: [Buildroot] [PATCH] package/mpd: needs GCC >= 4.9
In-Reply-To: <20170106104423.vtcgfz4emvclos4j@sapphire.tkos.co.il>
References: <20170106074548.9558-1-joerg.krause@embedded.rocks>
 <20170106104423.vtcgfz4emvclos4j@sapphire.tkos.co.il>
Message-ID: <1483699640.6879.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2017-01-06 at 12:44 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Fri, Jan 06, 2017 at 08:45:48AM +0100, J?rg Krause wrote:
> > The version 0.20 of mpd uses C++14 language features and therefor
> > requires at least GCC version 4.9.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/3fe/3fe440c0b9d05acb44553a8f
> > 02f688570e06bca9/
> > http://autobuild.buildroot.net/results/d33/d3309bea9411fca70d61d07c
> > 36f58718bc87e6d1/
> > http://autobuild.buildroot.net/results/208/208bb987f52b8ba65e3c6fc9
> > b6e917dbd44c0fbd/
> > http://autobuild.buildroot.net/results/9b9/9b9659ba30afde49912276fe
> > 7f9c282953a352ab/
> > .. and more.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> This is identical to http://patchwork.ozlabs.org/patch/711567/.
> 

Looks like our patches overlaped by a few minutes. I'll remove my patch
from patchwork.

J?rg

> 
> > ---
> > ?package/mpd/Config.in | 6 +++---
> > ?1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> > index 82bbd8d21..e0bb60447 100644
> > --- a/package/mpd/Config.in
> > +++ b/package/mpd/Config.in
> > @@ -4,7 +4,7 @@ menuconfig BR2_PACKAGE_MPD
> > ?	depends on BR2_USE_WCHAR # libglib2, flac
> > ?	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> > ?	depends on BR2_USE_MMU # libglib2
> > -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> > ?	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> > ?	select BR2_PACKAGE_BOOST
> > ?	select BR2_PACKAGE_LIBGLIB2
> > @@ -315,8 +315,8 @@ config BR2_PACKAGE_MPD_UPNP
> > ?
> > ?endif
> > ?
> > -comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
> > +comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
> > ?	depends on BR2_USE_MMU
> > ?	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> > ?	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> > -		!BR2_TOOLCHAIN_HAS_THREADS ||
> > !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> > +		!BR2_TOOLCHAIN_HAS_THREADS ||
> > !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
> 

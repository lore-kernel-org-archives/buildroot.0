From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 16:02:40 +0200
Subject: [Buildroot] [PATCH] package/opencv: fix dependencies for the Qt
 and GTK backends
In-Reply-To: <20140720104809.09052567@free-electrons.com>
References: <1405794942-32087-1-git-send-email-yann.morin.1998@free.fr>
 <20140720104809.09052567@free-electrons.com>
Message-ID: <20140720140240.GA501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-20 10:48 +0200, Thomas Petazzoni spake thusly:
> On Sat, 19 Jul 2014 20:35:42 +0200, Yann E. MORIN wrote:
> > diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> > index 6e938d2..1a026a9 100644
> > --- a/package/opencv/Config.in
> > +++ b/package/opencv/Config.in
> > @@ -159,6 +159,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> >  	depends on BR2_INSTALL_LIBSTDCPP
> >  	depends on BR2_USE_MMU # libgtk2 -> glib2
> > +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> >  	select BR2_PACKAGE_LIBGTK2
> >  
> >  config BR2_PACKAGE_OPENCV_WITH_JASPER
> > @@ -188,11 +189,11 @@ config BR2_PACKAGE_OPENCV_WITH_QT
> >  	depends on BR2_INSTALL_LIBSTDCPP
> >  	depends on !BR2_avr32 # qt
> >  	depends on BR2_USE_MMU # qt
> > +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> >  	select BR2_PACKAGE_QT
> >  	select BR2_PACKAGE_QT_STL
> >  	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> >  	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> 
> Can I remove these "if" now that the Qt support anyway depends on
> highgui ?

Yes, of course! I was a bit too quick at sending this patch, sorry... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

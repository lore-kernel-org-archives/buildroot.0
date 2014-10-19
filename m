From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:13:06 +0200
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpciaccess: Rename package to
 libpciaccess
In-Reply-To: <20141019121141.5098a140@free-electrons.com>
References: <1413557257-25254-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019121141.5098a140@free-electrons.com>
Message-ID: <20141019121306.1a916f91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Of course, I applied version 3, not version 2. I only replied to the
version 2 patch by mistake.

Thomas

On Sun, 19 Oct 2014 12:11:41 +0200, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> On Fri, 17 Oct 2014 16:47:36 +0200, Bernd Kuhls wrote:
> > While libpciaccess is part of the X libraries, it does not
> > depend upon X11 or any other X library.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> > v2: fixed stupid typo in package/Config.in
> 
> Patch applied. I just have one comment/question below.
> 
> > -$(eval $(autotools-package))
> > diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> > index e191dce..4b90f3c 100644
> > --- a/package/x11r7/xserver_xorg-server/Config.in
> > +++ b/package/x11r7/xserver_xorg-server/Config.in
> > @@ -4,12 +4,12 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
> >  	# We need a SHA1 implementation. If either openssl or
> >  	# libgcrypt are already part of the build, we'll use one of
> >  	# them, otherwise, use the small libsha1 library.
> > +	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> 
> I know it's not a change you've made, but why do we need libpciaccess
> whenever the X.org modular server is enabled? I can imagine using the
> X.org modular server on ARM platforms that don't have any PCI hardware.
> 
> Thanks,
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

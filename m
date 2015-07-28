From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 28 Jul 2015 10:23:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL /
	EGL dependencies
In-Reply-To: <20150710111952.5787d499@free-electrons.com>
References: <1430943308-13319-1-git-send-email-bernd.kuhls@t-online.de>
 <20150710111952.5787d499@free-electrons.com>
Message-ID: <8266336.GrICkLfAp5@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Friday 10 July 2015 11:19:52 Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> On Wed,  6 May 2015 22:15:08 +0200, Bernd Kuhls wrote:
> 
> > diff --git a/package/x11r7/libepoxy/Config.in 
b/package/x11r7/libepoxy/Config.in
> > index c4f5794..1b1ca3f 100644
> > --- a/package/x11r7/libepoxy/Config.in
> > +++ b/package/x11r7/libepoxy/Config.in
> > @@ -1,7 +1,13 @@
> >  config BR2_PACKAGE_LIBEPOXY
> >  	bool "epoxy"
> > -	depends on BR2_PACKAGE_MESA3D
> > +	depends on BR2_PACKAGE_HAS_LIBEGL
> > +	select BR2_PACKAGE_XLIB_LIBX11
> > +	select BR2_PACKAGE_XUTIL_UTIL_MACROS
> 
> This doesn't make a lot of sense to me. Either you use EGL and you
> don't X, or you have X and you don't EGL.
As far as I understand, EGL is counterpart of GLX for GLESv2. As soon as you 
want to use GLEsv2, you need EGL. Therefore, EGL is not mutually exclusive 
with Xorg.

Here is an example program that work with Xorg and use EGL:
  http://exoticorn.de/simplegl.tgz


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr

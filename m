From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue, 8 Apr 2008 21:16:44 +0100
Subject: [Buildroot] [PATCH] SCREEN: Added support for GNU Screen
In-Reply-To: <1207684648.6817.280.camel@nigel-x60>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207684648.6817.280.camel@nigel-x60>
Message-ID: <200804082116.44818.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 08 April 2008, Nigel Kukard wrote:
> > --- /dev/null
> > +++ b/package/screen/screen-4.0.2-100-cross-compile.patch
> > @@ -0,0 +1,967 @@
> > +diff -c screen.orig/configure screen-4.0.2/configure
> > +*** screen.orig/configure	2003-12-05 13:46:53.000000000 +0000
> > +--- screen-4.0.2/configure	2008-04-05 18:48:27.000000000 +0100
>
> <snip>
>
> Can we not modify configure.ac/in and autoreconf?  (assuming configure
> is originally built from configure.in or configure.ac)
>
> -N

You can't. I spent a lot of time trying. This configure relies /a lot/ on 
testing the hosts libraries, and all of these test fail with these exit(1). 
Unless you know of a magic auto*.* setting that skips the 'cross compile' 
tests and/or errors, this is the only way I found to have it working...

Michel

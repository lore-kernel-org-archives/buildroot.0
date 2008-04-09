From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 09 Apr 2008 05:15:13 +0000
Subject: [Buildroot] [PATCH] SCREEN: Added support for GNU Screen
In-Reply-To: <200804082116.44818.buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207684648.6817.280.camel@nigel-x60>
	<200804082116.44818.buildroot.atmel.com@pollet.net>
Message-ID: <1207718113.6817.282.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > > --- /dev/null
> > > +++ b/package/screen/screen-4.0.2-100-cross-compile.patch
> > > @@ -0,0 +1,967 @@
> > > +diff -c screen.orig/configure screen-4.0.2/configure
> > > +*** screen.orig/configure	2003-12-05 13:46:53.000000000 +0000
> > > +--- screen-4.0.2/configure	2008-04-05 18:48:27.000000000 +0100
> >
> > <snip>
> >
> > Can we not modify configure.ac/in and autoreconf?  (assuming configure
> > is originally built from configure.in or configure.ac)
> >
> > -N
> 
> You can't. I spent a lot of time trying. This configure relies /a lot/ on 
> testing the hosts libraries, and all of these test fail with these exit(1). 
> Unless you know of a magic auto*.* setting that skips the 'cross compile' 
> tests and/or errors, this is the only way I found to have it working...

I really don't like adding a 40k patch, which will more than likely
break on each version bump. :)

Could you show me how to reproduce the errors when cross-compiling,
maybe send me your .config and I'll see what I can do?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080409/c3efdc49/attachment.pgp 

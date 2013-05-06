From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 May 2013 19:49:35 +0200
Subject: [Buildroot] [PATCH] chrony: new package
In-Reply-To: <1367862156.2177.8.camel@doorstop.aus.2wire.com>
References: <1367856775-4502-1-git-send-email-ntl@pobox.com>
 <20130506192044.398293f1@skate>
 <1367862156.2177.8.camel@doorstop.aus.2wire.com>
Message-ID: <20130506194935.6340c5a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathan Lynch,

On Mon, 06 May 2013 12:42:36 -0500, Nathan Lynch wrote:

> > Also, did you check that this program indeed builds with a minimal
> > uClibc toolchain (no thread, no wchar, no locale, no nothing) ?
> 
> Sorry, no, that was sloppy of me.  I will do so for v2 and try to
> better specify the package's needs and dependencies.  I'd be happy to
> try any configs you'd care to point out...

You can try a very minimal build: no thread, no wchar, no locale, no
C++, no nothing. If it builds, you're all set. If your package doesn't
build, then something is missing.

If you don't want to spend too much time building toolchains, you can
use:

 http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic.tar.bz2
 as an external toolchain that is minimal (no C++, no wchar, no locale,
 no largefile, etc. but it has thread support)

 http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-nothread.tar.bz2
 as an external that has everything (C++, wchar, locale, largefile,
 etc.), but doesn't has thread support.

If your package builds with both, then normally you should be all set.

And anyway, since those toolchains are the ones used on the
autobuilders, if your package doesn't build in some configuration, it
won't be catched by the autobuilders anyway :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

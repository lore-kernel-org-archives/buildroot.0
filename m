From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 01 Aug 2016 20:24:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
In-Reply-To: <20160731230102.070d5413@free-electrons.com>
References: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
 <1469969267.9042.2.camel@embedded.rocks> <20160731160517.GJ3620@tarshish>
 <20160731230102.070d5413@free-electrons.com>
Message-ID: <1470075858.4303.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-07-31 at 23:01 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 31 Jul 2016 19:05:17 +0300, Baruch Siach wrote:
> 
> > 
> > netbsd-queue is a header only package, so it adds nothing to
> > packages that?
> > don't use it. libglob adds libglob.so that is only useful for few
> > packages. We?
> > can do something similar to way we handle gettext by adding
> > 
> > ? select BR2_PACKAGE_LIBGLOB if BR2_TOOLCHAIN_USES_MUSL
> > 
> > for each such package.
> 
> Agreed.

Ok. I will submit a patch for adding libglob. In fellow-up patches we
could add this dependency.

> BTW, the other day I was wondering if we shouldn't add another dummy
> package for musl that adds the <sys/cdefs.h> header. It's supposedly
> an
> internal glibc header but *lots* of packages use the __BEGIN_DECLS /
> __END_DECLS definitions, and it's really annoying to fix them all,
> for
> not a huge benefit.

Yes, this could be done too to ease building with musl.

J?rg

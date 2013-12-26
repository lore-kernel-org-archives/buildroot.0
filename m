From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Thu, 26 Dec 2013 08:30:07 -0300
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <20131226104037.6cb81f36@skate>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131225173455.0c413356@skate> <20131225201731.GA7812@localhost>
 <20131225212829.603981b9@skate> <20131225203252.GB7812@localhost>
 <20131226104037.6cb81f36@skate>
Message-ID: <20131226113006.GA24120@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 26, 2013 at 10:40:37AM +0100, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Wed, 25 Dec 2013 17:32:53 -0300, Ezequiel Garcia wrote:
> 
> > > But older uClibc toolchains do not work, and are causing build
> > > failures such as
> > > http://autobuild.buildroot.org/results/f7a/f7ae7ac2b5da9afc6314f1e813300597896e5ca6/build-end.log.
> > > 
> > > I believe the best solution for now is to mark this package as not
> > > available for uClibc toolchains.
> > > 
> > 
> > Right. And in parallel, we can also take care of upstreaming a patch
> > which uses HAVE_POSIX_MADVISE to handle such case.
> 
> The problem is what should we use in replacement of posix_madvise()
> when it is not available.
> 

madvise()?

If you do:

  #define posix_madvise madvise

then I've managed to fix the build issues on uClibc v0.9.32.

Problem is, I'm not sure there's a clean way to detect posix_madvise /
madvise presence; it must be done by hand in the configure script.

Anyway, it all sounds like too much work to fix such a small use case.
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

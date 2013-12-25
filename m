From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 25 Dec 2013 17:32:53 -0300
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <20131225212829.603981b9@skate>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131225173455.0c413356@skate> <20131225201731.GA7812@localhost>
 <20131225212829.603981b9@skate>
Message-ID: <20131225203252.GB7812@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 25, 2013 at 09:28:29PM +0100, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Wed, 25 Dec 2013 17:17:32 -0300, Ezequiel Garcia wrote:
> 
> > > Thanks, I've applied this, after making several changes.
> > > 
> > 
> > All the changes look good to me, thanks for doing this and
> > sorry for being lazy and not take better care to push this
> > submission.
> 
> We still have the problem that fio uses posix_madvise(), which isn't
> supported in uClibc 0.9.33. It is supported in uClibc git, and we have
> backported the patch in package/uclibc/, so Buildroot internal
> toolchains are working fine.
> 
> But older uClibc toolchains do not work, and are causing build failures
> such as
> http://autobuild.buildroot.org/results/f7a/f7ae7ac2b5da9afc6314f1e813300597896e5ca6/build-end.log.
> 
> I believe the best solution for now is to mark this package as not
> available for uClibc toolchains.
> 

Right. And in parallel, we can also take care of upstreaming a patch which uses
HAVE_POSIX_MADVISE to handle such case.

-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

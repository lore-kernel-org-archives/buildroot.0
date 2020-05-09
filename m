From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:41:40 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: bump version to
 1.24
In-Reply-To: <CADYdroP1VRGH5DcZMgO5ON_JK8+UVMHMyS6JpAJxdPyUJZ=BmQ@mail.gmail.com>
References: <20200506131130.410171-1-nolange79@gmail.com>
 <20200506131130.410171-2-nolange79@gmail.com>
 <20200509185010.25c376ea@windsurf.home>
 <CADYdroP1VRGH5DcZMgO5ON_JK8+UVMHMyS6JpAJxdPyUJZ=BmQ@mail.gmail.com>
Message-ID: <20200509234140.54562aba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 May 2020 23:29:22 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > What happened to 0002-communicate-check-return-status-of-msgrcv.patch ?
> > It is removed by your patch. Why?  
> 
> Cause its included in that version

OK.

> > Could you clarify if the fchownat/fchmodat issue happens with the
> > current version of fakeroot in Buildroot (1.20) ? Or only with the
> > updated version 1.24 ? Can it be fixed with fakeroot 1.20 ?  
> 
> issue exist with both, could certainly be fixed in 1.20 separately,
> I just don't take much interest in fixing ~ 4 year versions by default.

In the general case, I agree. But here we have already tagged -rc1, and
we try to not merge version bumps so close to the release. And in the
context of Buildroot, fakeroot is used by *everybody*, so any
regression can cause issues to a significant number of users.

So I'd prefer to see the problem fixed for 1.20, so that we can apply
the fix on master, and then have the version bump to 1.24 in next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

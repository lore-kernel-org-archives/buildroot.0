From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Jan 2012 10:42:07 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 30 Jan 2012 10:19:12
 +0100")
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be>
 <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
Message-ID: <87ipjth6hc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> Another thing that came to mind recently: if you want to use the same
 Thomas> buildroot sources for two projects (instead of forking them), then you
 Thomas> may end up with conflicts on package versions. For example, the first
 Thomas> project may use a certain kernel version, which causes certain
 Thomas> packages like iproute2 to need a certain version, while the other
 Thomas> project uses a different kernel version and thus a different version
 Thomas> of some packages.

I've maintained buildroot support for a number of projects at $WORK for
5+ years, and the way I've always handled this is with
branches/tags. Buildroot head moves forward and follows upstream, but
projects might decide to freeze (or if needed branch) once they have a
stable setup. I use the same approach with the Linux kernel and u-boot,
without any real problems.


 Thomas> Or maybe independent from the kernel, for some reason a project may
 Thomas> need different package versions.
 Thomas> For most packages, the version to be used is hardcoded in the .mk
 Thomas> file. For others, like gdb, there is a choice of versions via the
 Thomas> .config file. I understand we cannot supply such gdb-like
 Thomas> configuration for all packages as that would be way overkill. However,
 Thomas> another mechanism could be used, e.g. like the source directory
 Thomas> override feature (but then: version override).

I would prefer to not add too much complexity for such a specialized /
advanced feature.


 Thomas> And another one: In november I started a discussion on package
 Thomas> patching: http://lists.busybox.net/pipermail/buildroot/2011-November/047505.html
 Thomas> I think we were almost to a conclusion, but it seems I forgot to keep
 Thomas> the thread active and it dried out. So maybe it's worth taking this up
 Thomas> again to reach a conclusion.

yes, I think this is good to go, it just needs to be implemented. With
us being this close to 2012.02-rc1 I might wait until I start the next
branch though.

-- 
Bye, Peter Korsgaard

From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 22 Jul 2007 16:51:56 +0200
Subject: [Buildroot] [RFC] Support for "distributions" in buildroot
In-Reply-To: <002501c7cc4a$65c56530$dcc4af0a@atmel.com>
References: <20070721184252.GA2523@zelow.no>
	<002501c7cc4a$65c56530$dcc4af0a@atmel.com>
Message-ID: <20070722145155.GA27429@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 22, 2007 at 09:08:50AM +0200, Ulf Samuelsson wrote:
> 
> I see buildroot as a promising tool to allow newbies to get running
> with embedded linux, and the goal of most of my efforts are to
> reduce the obstacles for the user.

I also think this is a nice goal.

> When the newbie wants to start developing a product
> then ideally it is good to use the latest version of packages,
> but if that fails, then having a distribution where at least the
> packages have been known to cooperate is a good thing.

which is where he'd better use the snapshot anyway.

the downside is that it will be an easier path for the user to fork and
work on his own snapshot.

> Instead of  just applying "*.patch", I much prefer that the makefile fragment
> use a file with a list of patches which should be applied to the tarball.
> 
> Each supported package version then only needs its list of files ("series"?).
> If a new version with new patches is added, then that needs 
> a separate "series" file.

I'd rather have a separate patch directory for each version instead of
files. then the user can just drop his own patch in that directory
without having to edit a file that is in svn.

> Adding a new patch for a new version will then not cause a problem, 
> since the "series" file for the old version is not updated.
> Patches can be shared between different versions, something which is not
> possible if we use the current method "<package>-$(version)-<name>.patch".

svn handles softlinks..

> It would also be good if there were a structured way to have some patches
> downloaded from internet, instead of the ad-hoc methods used today.

as you already have said, downloading from the internet can be annoying
because the patches or source tarballs can disappear.

> -  What happens if one architecture needs version 'A', 
>    and another architecture needs version 'B'?

it is a good question indeed.


Thomas.

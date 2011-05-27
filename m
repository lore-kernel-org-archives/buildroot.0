From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 28 May 2011 00:16:12 +0200
Subject: [Buildroot] [RFC] Review request for branch
	for-2011.08/bootloaders
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4DE022AC.2010205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> This is not a pull request. This is stuff I'm preparing for the next
> Buildroot release, and which I'm posting now to let everybody now that
> I'm working on this, and to get early comments. Feedback is therefore
> very welcome.
>
> Basically, the idea is that we have a package infrastructure, and
> features such as Git/Mercurial download, or usage of an existing
> source tree should be added at the level of the package infrastructure
> and not specifically for each package.
>
> Unfortunately, some of the packages that would most benefit from those
> new infrastructure features are the bootloader and kernel, since it's
> typically the software components that have to be modified/tuned
> during the course of an embedded Linux project.
>
> Therefore, this series converts all bootloaders makefiles and the
> kernel makefile to the package infrastructure. It also does a few
> other related things.
>
> More improvements are probably needed at the infrastructure level
> (like changing the BR2_PACKAGE_<pkg>  test to know if a target needs to
> be added to TARGETS or not), but hopefully, you'll get the general
> idea and have some feedback/ideas.

Thank you for your big work. I appreciate it very much.
I currently build my bootloaders and kernel outside buildroot just
because I need to fetch them from local git repositories.
Bringing them in buildroot would significantly simplify my build system.

I tested your patchset and it worked perfectly. I had to hack linux.mk
and u-boot.mk because the git download method is not yet
implemented, but it was straightforward in the package infrastructure.
This way I got both the bootloader and the kernel working on my board.

I look forward to see your next patchset and test it. Will it implement
a git download option in menuconfig?

Luca

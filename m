From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 23:03:26 +0100
Subject: [Buildroot] [PATCH v3] syslog-ng: fix builds with static libc
In-Reply-To: <20190128072934.12788-1-judge.packham@gmail.com>
References: <20190128072934.12788-1-judge.packham@gmail.com>
Message-ID: <20190129230326.32c51889@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

This commit doesn't really "fix building with static libc", because it
was forbidden until now. It rather "allows" it.

On Mon, 28 Jan 2019 20:29:34 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> Bring in an upstream patch to fix builds for targets which lack dlfcn.h
> and revert "package/syslog-ng: depend on !BR2_STATIC_LIBS".
> 
> This reverts commit 44dbd2907c5995b0b0c56cb2274dc60415205dd8. Now that
> upstream has different fix for the build issues with a static libc we
> can re-enable syslog-ng on these systems.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333

Also, this commit doesn't fix this autobuilder issue: the autobuilder
issue was resolved by your commit
44dbd2907c5995b0b0c56cb2274dc60415205dd8, which prevented selecting
syslog-ng in BR2_STATIC_LIBS=y configurations.

What this new commit does is re-allow selecting syslog-ng in
BR2_STATIC_LIBS=y configurations.

I've adjusted the commit log accordingly, and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

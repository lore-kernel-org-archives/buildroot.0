From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 14:11:24 +0100
Subject: [Buildroot] [git commit] python-config.sh: don't reassign
 ${prefix}
In-Reply-To: <20171105143713.0756D801DD@busybox.osuosl.org>
References: <20171105143713.0756D801DD@busybox.osuosl.org>
Message-ID: <20171126141124.5ff0feac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, 5 Nov 2017 15:42:33 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=04d1699ba4cecaa77f688b4effbcac5e84419b15
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> When prefix is set to a path like /usr during crossbuild
> the sed operations end up executing twice, once for the prefix
> reassignment and another for includedir if it is set as a string
> including the ${prefix} variable.  This results in an issue
> when the build directory is under /usr.
> 
> This patch updates the remaining location which uses the prefix
> variable to also sed and update to use the real path.
> 
> Upstream bug report:
> https://bugs.python.org/issue31713
> 
> Buildroot bug:
> https://bugs.busybox.net/show_bug.cgi?id=10361
> 
> Fixes failures like the following:
> dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> [Arnout: refer to autobuild failures that still exist]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

We want this commit for the 2017.02.x branch. It fixes these build
failures:
http://autobuild.buildroot.net/results/adf4f26ef904f3a5614c5096a84eaf1d845b9f11/
http://autobuild.buildroot.net/results/330e96c7ce801a2aa019a85254a991a59e0eb103/

To be honest, it only fixes the case where we're building from /usr,
which is a bit of a corner case. But it causes some build failures in
the autobuilders, and if the autobuilder results on 2017.02.x are too
noisy, we won't recognize the new/interesting failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

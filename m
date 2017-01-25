From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:04:17 +1300
Subject: [Buildroot] [PATCH] jack2: fix NGREG build failures
In-Reply-To: <1481991706-7060-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1481991706-7060-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170125230417.5e0bf244@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 17:21:46 +0100, Thomas Petazzoni wrote:
> This commit replaces the patch adding nios2 "support" to jack2 by a more
> generic approach that solves the NGREG definition problem by using
> proper checks in the waf script. This allows to remove the
> architecture-specific compile time conditionals, and will solve build
> failures on other architectures than just nios2.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d15dc78cdd74b51b551512ce1ba88e4d61219e86/ (xtensa)
>   http://autobuild.buildroot.net/results/8244e3fdda52d3f4f24d7199e8855c99a2a7b4b1/ (arc)
>   http://autobuild.buildroot.net/results/badb9ec391f9f0438d593a2768f2f6c6a873c021/ (microblaze)
> 
> This commit has been built tested with all the external toolchains used
> in the autobuilders.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/jack2/0001-Add-support-for-nios2.patch     | 34 ---------
>  .../jack2/0001-Improve-check-for-ucontext.patch    | 84 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 34 deletions(-)
>  delete mode 100644 package/jack2/0001-Add-support-for-nios2.patch
>  create mode 100644 package/jack2/0001-Improve-check-for-ucontext.patch

Since the patch has been applied upstream, and nobody objected, I
applied this patch to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

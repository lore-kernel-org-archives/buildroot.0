From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 11:29:47 +0100
Subject: [Buildroot] [PATCH v4 04/11] board: Add Pine64 support
In-Reply-To: <b8d92229-8f0c-2edf-7451-13ad2393eb4b@arm.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
 <1509041511-30956-5-git-send-email-jagan@amarulasolutions.com>
 <b8d92229-8f0c-2edf-7451-13ad2393eb4b@arm.com>
Message-ID: <20171030112947.183f698d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 09:56:04 +0000, Andre Przywara wrote:

> So how stable shall this recipe be, in general? I see a lot of fixed
> versions (ATF, U-Boot, kernel) in here, which means it needs constant
> updating (to benefit from security fixes, for instance)?
> Is that intended? That looks a bit maintenance-heavy to me.
> 
> And do you have to specify a certain commit ID here?
> I have some bugfixes on the "allwinner" branch, and am thinking about
> pulling the allwinner-stable branch to the same commit.
> So I strongly recommend to upgrade to the allwinner branch, which fixes
> immediate crashes on CPU off/onlining, among other issues.

We do not want to use branch names, for two reasons:

 1. A branch constantly changes, which means that the defconfig doesn't
 build the same bootloader/kernel version for everyone. So while the
 defconfig may work when it is submitted, it might stop to work later
 on. Therefore, we want to use fixed versions.

 2. When fetching from Git, Buildroot creates a local tarball named
 "<package>-<version>.tar.gz". Once the tarball exists, Buildroot
 doesn't fetch again from upstream. So, if you specify a branch name, a
 tarball with this branch name is created once for all, and Buildroot
 will never re-fetch from that location, unless you manually remove the
 tarball from the download cache.

So, want Jagan does is what we ask to do for all defconfigs. Yes, it is
a bit heavy on maintenance, but that is the most reasonable trade-off
we have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

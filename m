From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:55:13 +0100
Subject: [Buildroot] [Buildroot PATCH v3 1/1] cgroupsfs: new package
In-Reply-To: <1455547203-24097-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455547203-24097-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160320235513.2e9466f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Feb 2016 20:10:03 +0530, Niranjan Reddy wrote:
> This package consists of scripts that setup cgroups at boot
> without doing any cgroup management or classification of
> tasks into cgroups
> 
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> ---
> Changes v2 -> v3:
>   - placed start(),stop() and restart() in seperate functions.
>   - Changed LICENSE to GPLv3+ and added $(CGROUPFS_PKGDIR)
>     instead of package/cgroupfs/ .
>   - Added .hash file.
>   - Removed test condition for mount and umount (suggested by Thomas).

I've done a number of changes:

    [Thomas:
     - rename to cgroupfs-mount to match upstream
     - add proper hash, since hashes should be added for github sourced
       packages
     - fix minor typos in the init script
     - fix the license file information.]

And then applied. Note that hashes must be added for github sourced
packages, and that you should verify with make legal-info that the
license files pointed in the <pkg>_LICENSE_FILES variable actually
exist (it wasn't the case in your submission).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:33:26 +0200
Subject: [Buildroot] [PATCH v10] package/sysdig: New package
In-Reply-To: <1427402489-28313-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1427402489-28313-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150330223326.7b21a348@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 26 Mar 2015 21:41:29 +0100, Angelo Compagnucci wrote:
> Sysdig is open source, system-level exploration:
> capture system state and activity from a running Linux
> instance, then save, filter and analyze.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, applied. But I did a number of changes before applying:

    [Thomas:
     - remove unneeded 0001-makefile-driver-compile-options.patch, instead
       pass KERNELDIR in the make options when building the driver, and
       pass the contents of $(LINUX_MAKE_FLAGS) directly.
     - use $(SYSDIG_BUILDDIR) instead of $(@D)/buildroot-build, so that
       the package does not depend on the package infra using specifically
       buildroot-build as the build subdirectory.
     - use $(MAKE) -C <foo> instead of cd <foo>; $(MAKE).
     - rename 0002 patch to 0001, since the 0001 patch is removed.]

I think the most annoying part was the over-complicated solution to
build the driver. My solution is simpler in the .mk file, and does not
require patching.

Can you look at submitting upstream a solution for the DKMS patch, like
a new CMake option to enable/disable the DKMS stuff ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

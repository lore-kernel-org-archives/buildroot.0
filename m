From: Anders Darander <anders@chargestorm.se>
Date: Fri, 24 Jan 2014 12:29:48 +0100
Subject: [Buildroot] [PATCH v2 0/4] beaglebone: u-boot and kernel updates
Message-ID: <1390562992-9267-1-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch series upgrades the kernel for the BeagleBone to 3.12.

The 3.12 kernel is taken from TI's own repo, and the actual branch/commit used
is the latest  used in their own BSP (see meta-ti for OpenEmbedded / Yocto).

I've tried to keep the defconfig as close to the 3.8 version as possible. Though, 
it's quite likely that some added configuration could have been removed.

It's only been tested on a BeagleBone White, using my usual NFS-root setup.

The PM FW in am33x-cm3 has been update to keep it in sync with the kernel.
The revision used is taken from meta-ti.

There's also an update to the latest U-Boot, and as a followup to that patch,
a change to zImage instead of uImage. (As that's the current default in 
U-Boot).

Cheers,
Anders

Changelog: 
v1 -> v2: 
        * update the git sha1 to the latest applied to the meta-ti repo. 


Anders Darander (4):
  beaglebone: update to TI 3.12 kernel
  am33x-cm3: update to latest version
  beaglebone: update to latest U-Boot
  beaglebone: change to zImage

 .../{linux-3.8.config => linux-3.12.config}        | 104 ++++++++++++++-------
 configs/beaglebone_defconfig                       |   7 +-
 .../am33x-cm3/am33x-cm3-0001-fix-makefile.patch    |  16 ++--
 package/am33x-cm3/am33x-cm3.mk                     |   2 +-
 4 files changed, 86 insertions(+), 43 deletions(-)
 rename board/beaglebone/{linux-3.8.config => linux-3.12.config} (68%)

-- 
1.8.5.3

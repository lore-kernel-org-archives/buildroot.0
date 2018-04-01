From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 18:36:33 +0200
Subject: [Buildroot] [PATCH v2 0/3] Disable qemu user emulation for host
 variant on MIPS64
Message-ID: <20180401163636.4098-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of the patch sent by Adam [1]. Changes
compared to Adam's version:

 - According to Qemu's TODO list, both n32 and n64 don't work for user
   mode emulation on mips64, so basically mips64 can't be used.

 - Adam's patches was not properly propagating the new architecture
   dependency to the "select" that selects the user-mode emulation if
   the system emulation is not selected. Solving this required quite a
   few changes to how architecture dependencies are expressed in the
   host-qemu package.

[1] https://patchwork.ozlabs.org/patch/828190/

Thanks,

Thomas

Adam Duskett (1):
  qemu: disable qemu user emulation on MIPS64 for host variant

Thomas Petazzoni (2):
  qemu: rewrite BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS to be more readable
  qemu: introduce BR2_PACKAGE_HOST_QEMU_{SYSTEM,USER}_ARCH_SUPPORTS

 package/qemu/Config.in.host | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

-- 
2.14.3

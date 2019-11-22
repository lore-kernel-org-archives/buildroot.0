From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Nov 2019 03:48:19 +0000
Subject: [Buildroot] [PATCH v1 0/1] Buildroot on Macintosh Laptops
Message-ID: <20191122034820.3378-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds the mbpfan macbook pro fan controller daemon.

I have successfully compiled and run Buildroot on my MacBook Pro 2013 Retina
laptop. Additionally, I've achieved the following interesting points:

 - Docker
 - Inside an automatically configured container per-user:
   - X server
   - Plasma Desktop
   - Systemd 

If anyone is interested in the above, I am available to answer questions at this
early stage, and plan to publish more configuration files at a later date. If
you are interested in running Buildroot on a Mac laptop:

 1. Boot to recovery partition (Command-R)
 2. Create a new partition for the Buildroot setup
 3. Flash a ext4 image of the Buildroot root filesystem to the partition.
 4. Install refind with refind-install.sh --all-drivers

If building a system as a kernel + initrd (as SkiffOS does), you can simply copy
two files to the partition - the initrd and the bzImage.

Configurations for the kernel, buildroot, and all other necessary details can be
found at: https://github.com/paralin/SkiffOS/tree/master/configs/apple/macbook

Best regards,

Christian Stewart (1):
  mbpfan: new package

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mbpfan/Config.in |  7 +++++++
 package/mbpfan/mbpfan.mk | 30 ++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/mbpfan/Config.in
 create mode 100644 package/mbpfan/mbpfan.mk

-- 
2.17.1

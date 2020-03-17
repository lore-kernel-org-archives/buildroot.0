From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2020 16:56:27 +0100
Subject: [Buildroot] [RFC PATCH 0/5] Container - Guest
Message-ID: <20200317155632.17649-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot supports some OS-level virtualization tools: Docker, LXC, systemd-nspawn.
These tools are built on an host image.

This series introduces a set of defconfig in order to create a guest image.

After some experiments, packages docker & systemd need some tweaks.

Francois Perrad (5):
  configs/guest_*: some new defconfig
  board/guest: documentation and sample files
  package/docker-engine: needs some kernel options
  package/docker-engine: needs more runtime dependencies
  package/systemd: needs kernel options

 board/guest/Dockerfile          |  3 ++
 board/guest/readme.txt          | 53 +++++++++++++++++++++++++
 configs/guest_arm_a7_defconfig  | 11 ++++++
 configs/guest_arm_a9_defconfig  | 13 ++++++
 configs/guest_x86_64_defconfig  | 10 +++++
 linux/linux.mk                  | 70 ++++++++++++++++++++++++++++++++-
 package/docker-engine/Config.in |  1 +
 7 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 board/guest/Dockerfile
 create mode 100644 board/guest/readme.txt
 create mode 100644 configs/guest_arm_a7_defconfig
 create mode 100644 configs/guest_arm_a9_defconfig
 create mode 100644 configs/guest_x86_64_defconfig

-- 
2.17.1

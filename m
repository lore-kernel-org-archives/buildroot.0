From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 May 2020 14:47:28 +0200
Subject: [Buildroot] [PATCH v2 0/7] Container - Guest
Message-ID: <20200530124735.1384078-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot supports some OS-level virtualization tools: Docker, LXC, systemd-nspawn.
These tools are built on an host image.

This series introduces a set of defconfig in order to create a guest image.

After some experiments, packages docker & systemd need some tweaks.

RFC -> v2:
  - refactor with FOO_LINUX_CONFIG_FIXUPS (new in 2020.05)
  - add option BR2_PACKAGE_SYSTEMD_GUEST

Francois Perrad (7):
  configs/guest_*: some new defconfig
  board/guest: documentation and sample files
  package/docker-engine: needs some kernel options
  package/docker-engine: needs more runtime dependencies
  package/systemd: needs kernel options
  package/systemd: add an option BR2_PACKAGE_SYSTEMD_GUEST
  configs/guest_*: use BR2_PACKAGE_SYSTEMD_GUEST

 DEVELOPERS                             |  2 +
 board/guest/Dockerfile                 |  3 ++
 board/guest/readme.txt                 | 53 ++++++++++++++++++++
 configs/guest_arm_a7_defconfig         | 29 +++++++++++
 configs/guest_arm_a9_defconfig         | 31 ++++++++++++
 configs/guest_x86_64_defconfig         | 28 +++++++++++
 package/docker-engine/Config.in        |  1 +
 package/docker-engine/docker-engine.mk | 67 ++++++++++++++++++++++++++
 package/systemd/Config.in              | 14 ++++--
 package/systemd/systemd.mk             | 16 +++++-
 10 files changed, 238 insertions(+), 6 deletions(-)
 create mode 100644 board/guest/Dockerfile
 create mode 100644 board/guest/readme.txt
 create mode 100644 configs/guest_arm_a7_defconfig
 create mode 100644 configs/guest_arm_a9_defconfig
 create mode 100644 configs/guest_x86_64_defconfig

-- 
2.25.1

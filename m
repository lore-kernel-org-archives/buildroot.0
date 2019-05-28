From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 10:29:33 +0200
Subject: [Buildroot] [PATCH next 0/4] Misc improvements to C-SKY support
Message-ID: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series brings some misc improvements to the C-SKY architecture
support:

 - Update support/gnuconfig to have support for C-SKY. In master, we
   have merged a patch from Guo that does the minimal change to
   support C-SKY, but as suggested by Peter, it makes more sense to do
   a complete update of the gnuconfig stuff in next, since upstream
   has support for C-SKY.

 - Add a proper package for the C-SKY pre-built external toolchain,
   use it for the C-SKY defconfig we have in the tree, and add testing
   in the autobuilders for C-SKY.

Thanks,

Thomas

Thomas Petazzoni (4):
  support/gnuconfig: update to 2019-05-28
  toolchain/toolchain-external/toolchain-external-csky: new package
  configs/csky_gx6605s: use the C-SKY external toolchain package
  support/config-fragments/autobuild: add testing for the C-SKY
    architecture

 DEVELOPERS                                    |    1 +
 configs/csky_gx6605s_defconfig                |    9 +-
 .../config-fragments/autobuild/csky.config    |    3 +
 .../autobuild/toolchain-configs.csv           |    1 +
 support/gnuconfig/config.guess                |  836 +++---
 support/gnuconfig/config.sub                  | 2525 ++++++++---------
 toolchain/toolchain-external/Config.in        |    6 +
 .../toolchain-external-csky/Config.in         |   15 +
 .../toolchain-external-csky/Config.in.options |    9 +
 .../toolchain-external-csky.hash              |    2 +
 .../toolchain-external-csky.mk                |   11 +
 11 files changed, 1823 insertions(+), 1595 deletions(-)
 create mode 100644 support/config-fragments/autobuild/csky.config
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk

-- 
2.21.0

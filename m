From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:34:10 +0200
Subject: [Buildroot] [PATCH v2 0/6] gnuconfig and csky updates
Message-ID: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a second iteration of the C-SKY updates, with a few more
changes on the gnuconfig side:

 - Some preparation commits that unify how non-autotools package
   update their gnuconfig files

 - The patch updating gnuconfig to a newer version now updates the
   gnuconfig version mentioned in support/gnuconfig/README.buildroot

 - The rest of the patch series is unchanged.

Thanks,

Thomas

Thomas Petazzoni (6):
  package/lmbench: use UPDATE_CONFIG_HOOK instead of CONFIG_UPDATE
  support/gnuconfig: update README.buildroot with reality
  support/gnuconfig: update to 2019-05-28
  toolchain/toolchain-external/toolchain-external-csky: new package
  configs/csky_gx6605s: use the C-SKY external toolchain package
  support/config-fragments/autobuild: add testing for the C-SKY
    architecture

 DEVELOPERS                                    |    1 +
 configs/csky_gx6605s_defconfig                |    9 +-
 package/lmbench/lmbench.mk                    |    3 +-
 .../config-fragments/autobuild/csky.config    |    3 +
 .../autobuild/toolchain-configs.csv           |    1 +
 support/gnuconfig/README.buildroot            |    4 +-
 support/gnuconfig/config.guess                |  836 +++---
 support/gnuconfig/config.sub                  | 2525 ++++++++---------
 toolchain/toolchain-external/Config.in        |    6 +
 .../toolchain-external-csky/Config.in         |   15 +
 .../toolchain-external-csky/Config.in.options |    9 +
 .../toolchain-external-csky.hash              |    2 +
 .../toolchain-external-csky.mk                |   11 +
 13 files changed, 1827 insertions(+), 1598 deletions(-)
 create mode 100644 support/config-fragments/autobuild/csky.config
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk

-- 
2.21.0

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:02 +0200
Subject: [Buildroot] [PATCH 0/6] misc config-cleanup
Message-ID: <cover.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attached small series ??) starts to cleanup some aspects of Peter's tree
and starts to sync up with miscellaneous changes from my tree.

Peter, please pull.

??) git://git.buildroot.org/~aldot/git/buildroot

Bernhard Reutner-Fischer (6):
  atmel mirrors are only needed for atmel targets
  always append FPU_SUFFIX
  default to EABI on arm
  improve arch selection and gcc setup
  mark odd strip invocations
  remove superfluous OPTIMIZE and DEBUG config knobs

 Config.in                       |  108 +------
 package/Makefile.in             |   40 +--
 package/ntfs-3g/ntfs-3g.mk      |    2 +
 target/Config.in.arch           |  683 +++++++++++++++++++++++++++++++++++----
 target/device/Config.in.mirrors |    4 +-
 toolchain/Config.in.2           |   12 +
 toolchain/gcc/Makefile.in       |   25 ++-
 toolchain/gcc/gcc-uclibc-4.x.mk |    9 +-
 8 files changed, 665 insertions(+), 218 deletions(-)

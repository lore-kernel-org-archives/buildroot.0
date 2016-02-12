From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2016 20:20:21 +0100
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
	staging
Message-ID: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

As discussed on the Buildroot developer days, Buildroot installs some libraries
in a different location in target than in staging. This is specifically seen for
libstdc++ and libatomic.

This patch series tackles that problem and performs related cleanup.



Thomas De Schampheleire (5):
  toolchain-external: blackfin: install FDPIC libraries also to staging
  toolchain-external: remove unused calculation of ARCH_SUBDIR
  toolchain-external: extract installation of gdbserver to separate
    define
  toolchain-external: align library locations in target and staging dir
  toolchain-external: unify LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS

 package/glibc/glibc.mk                             |  2 +-
 toolchain/helpers.mk                               | 57 ++---------------
 toolchain/toolchain-external/Config.in             |  3 +-
 toolchain/toolchain-external/toolchain-external.mk | 71 ++++++++++------------
 4 files changed, 40 insertions(+), 93 deletions(-)

-- 
2.4.10

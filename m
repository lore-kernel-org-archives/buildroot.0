From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:25:23 +0200
Subject: [Buildroot] [PATCH 0/2] Remove SH2 and SH3 support
Message-ID: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of two patches that remove support for SH2 and SH3. The
retionale for the removal is part of the commit log of the second
patch. The first patch is only a preliminary cleanup, it can be
committed regardless of the decision for the second patch.

I've already removed the SH2 toolchain configuration from my
autobuilders.

Thanks.

Thomas Petazzoni (2):
  fs/jffs2: refactor endianess selection to use BR2_ENDIAN
  arch: remove support for SuperH 2 and SuperH 3

 arch/Config.in.sh                        |   18 ++------------
 fs/jffs2/Config.in                       |    5 +---
 package/flashbench/flashbench.mk         |    4 +--
 package/kexec/Config.in                  |    2 +-
 package/multimedia/mplayer/Config.in     |    3 +--
 toolchain/toolchain-external/Config.in   |   40 ------------------------------
 toolchain/toolchain-external/ext-tool.mk |    6 -----
 toolchain/uClibc/uclibc.mk               |   20 ---------------
 8 files changed, 7 insertions(+), 91 deletions(-)

-- 
1.7.9.5

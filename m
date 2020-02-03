From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 Feb 2020 17:59:43 +0100
Subject: [Buildroot] [PATCH 0/3] Riscv32 gcc bug 93532 workaround
Message-ID: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following Microblaze experience on gcc ICE and hangs let's treat the same
way Riscv32 gcc bugs. So let's introduce gcc bug already reported and
work around failing packages using -O0 optimization flash since no other
workarounds worked(disable -g, trying -O1).

Giulio Benetti (3):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_93532
  package/bullet: fix build failure due to gcc bug 93532
  package/lmbench: fix build failure due to gcc bug 93532

 package/bullet/bullet.mk   | 2 +-
 package/lmbench/lmbench.mk | 4 ++++
 toolchain/Config.in        | 8 ++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.20.1

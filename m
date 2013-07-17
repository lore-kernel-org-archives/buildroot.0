From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 10:13:17 +0200
Subject: [Buildroot] [PATCHv2 0/4] EABI vs EABIhf check
Message-ID: <1374048801-7666-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Second version of the EABI vs. EABIhf check, using a different
technique, as discussed with Yann E. Morin, and also additional
cleanups.

I've also included a somewhat unrelated fix to the arch/Config.in.arm
file.

Thomas

Thomas Petazzoni (4):
  toolchain/helpers: don't use the x$(...) = x"value" syntax
  toolchain: check ARM EABI vs. EABIhf for external toolchains
  toolchain/toolchain-external: don't use x$(...) construct or ==
  arch/arm: update VFPv2 comment to mention ARMv5

 arch/Config.in.arm                       |  4 ++--
 toolchain/helpers.mk                     | 21 ++++++++++++++++++---
 toolchain/toolchain-external/ext-tool.mk | 13 ++++++++-----
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
1.8.1.2

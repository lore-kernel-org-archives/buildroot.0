From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 22 Jan 2015 15:33:24 -0300
Subject: [Buildroot] [PATCH 0/4] ARM Cortex-M3 support
Message-ID: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A small patchset to add support for Cortex-M3 building. It allows
to produce nice Buildroot-based rootfs, on MMUless MCUs such as NXP LPC
Cortex-M3.

The work was originally started by Thomas, who kindly shared with us.
Guido wrote the rest of the patches, and cleaned-up a bit the support
to make it acceptable upstream.

I have tested it and it works fairly well on LPC43xx-based board, with
8 MiB of external SDRAM, which proved to be enough to get to a shell
and run some commands. However, I had to tailor the Busybox configuration
heavily to avoid memory depletion and the OOM assasin.

Comments welcome.

/*
 * As an interesting trivia, this board is the result of the collective effort
 * of Argentine universities and small companies to produce an industrial-grade
 * open board. More info about the Linux port:
 * http://www.proyecto-ciaa.com.ar/devwiki/doku.php?id=desarrollo:linux:linux_en_ciaa-nxp
 * The links are in spanish, though.
 */

Guido Mart?nez (3):
  arm: conditionally support regular ARM instructions
  arm: update processor types
  toolchain: allow for stupid toolchains

Thomas Petazzoni (1):
  toolchain-external: add OSELAS 2013.12.2 Cortex-M3 toolchain

 arch/Config.in                                     |  8 +++----
 arch/Config.in.arm                                 | 28 +++++++++++++++++++++-
 toolchain/helpers.mk                               |  6 ++++-
 toolchain/toolchain-common.in                      |  6 +++--
 toolchain/toolchain-external/Config.in             | 16 +++++++++++++
 .../toolchain-external/toolchain-external.hash     |  3 +++
 toolchain/toolchain-external/toolchain-external.mk | 11 +++++++++
 7 files changed, 70 insertions(+), 8 deletions(-)

-- 
2.2.1

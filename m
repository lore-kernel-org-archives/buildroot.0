From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 12 Jul 2010 22:46:11 +0200
Subject: [Buildroot] [PATCH 0/5] Preparatory work on toolchains - v3
Message-ID: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

These are preparatory work on toolchain, laying ground to later add
crosstool-NG as a backend. Currently, these are rather an RFC, even
if it works OK for me.

Changes since v2:
- rebased againts latest tree
- enhance commit message for 3rd patch

Changes since v1:
- rebased against latest tree
- patches formatted to detect renames/copies

Yann E. MORIN (5):
      toolchain: move helper functions from external toolchain
      toolchain: rename external toolchain dir
      toolchain: move makefile includes
      toolchain: move buildroot config files
      toolchain: rename base target for external toolchains

 Makefile                                           |   17 +-
 toolchain/Config.in                                |   16 +-
 toolchain/external-toolchain/ext-tool.mk           |  356 --------------------
 toolchain/helpers.mk                               |  244 ++++++++++++++
 toolchain/toolchain-buildroot.mk                   |   12 +
 .../{Config.in.1 => toolchain-buildroot/Config.in} |    2 +-
 toolchain/toolchain-buildroot/Config.in.2          |   37 ++
 toolchain/{Config.in.2 => toolchain-common.in}     |   46 +--
 toolchain/toolchain-external.mk                    |   14 +
 .../Config.in                                      |    0
 .../Config.in.2                                    |    0
 toolchain/toolchain-external/ext-tool.mk           |  115 +++++++
 12 files changed, 440 insertions(+), 419 deletions(-)
 delete mode 100644 toolchain/external-toolchain/ext-tool.mk
 create mode 100644 toolchain/helpers.mk
 create mode 100644 toolchain/toolchain-buildroot.mk
 rename toolchain/{Config.in.1 => toolchain-buildroot/Config.in} (82%)
 create mode 100644 toolchain/toolchain-buildroot/Config.in.2
 rename toolchain/{Config.in.2 => toolchain-common.in} (84%)
 create mode 100644 toolchain/toolchain-external.mk
 rename toolchain/{external-toolchain => toolchain-external}/Config.in (100%)
 rename toolchain/{external-toolchain => toolchain-external}/Config.in.2 (100%)
 create mode 100644 toolchain/toolchain-external/ext-tool.mk

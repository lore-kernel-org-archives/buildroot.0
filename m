From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue,  1 Jun 2010 23:52:58 +0200
Subject: [Buildroot] [pull request] Preparatory work on toolchains
Message-ID: <1275429183-8974-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4a640e464439a5e78458ae969dcc6017aa96278f:
  Peter Korsgaard (1):
        docs/news.html: add 2010.05 announcement

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot master

These are preparatory work on toolchain, laying ground to later add
crosstool-NG as a backend. Currently, these are rather an RFC, even
if it works OK for me.

Yann E. MORIN (5):
      toolchain: move helper functions from external toolchain
      toolchain: rename external toolchain dir
      toolchain: move makefile includes
      toollchain: move buildroot config files
      toolchain: rename base target for external toolchains

 Makefile                                           |   18 +-
 toolchain/Config.in                                |   16 +-
 toolchain/external-toolchain/ext-tool.mk           |  322 --------------------
 toolchain/helpers.mk                               |  217 +++++++++++++
 toolchain/toolchain-buildroot.mk                   |   15 +
 .../{Config.in.1 => toolchain-buildroot/Config.in} |    2 +-
 toolchain/toolchain-buildroot/Config.in.2          |   37 +++
 toolchain/{Config.in.2 => toolchain-common.in}     |   46 +---
 toolchain/toolchain-external.mk                    |   16 +
 .../Config.in                                      |    0
 .../Config.in.2                                    |    0
 toolchain/toolchain-external/ext-tool.mk           |  108 +++++++
 12 files changed, 411 insertions(+), 386 deletions(-)
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

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 Jun 2010 00:15:27 +0200
Subject: [Buildroot] [PATCH 0/5] Preparatory work on toolchains - v2
Message-ID: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

These are preparatory work on toolchain, laying ground to later add
crosstool-NG as a backend. Currently, these are rather an RFC, even
if it works OK for me.

Changes since v1:
- rebased against latest tree
- patches formatted to detect renames/copies

Yann E. MORIN (5):
    toolchain: move helper functions from external toolchain
    toolchain: rename external toolchain dir
    toolchain: move makefile includes
    toolchain: move buildroot config files
    toolchain: rename base target for external toolchains

 Makefile                                                         |   17 +-
 toolchain/Config.in                                              |   16 +-
 toolchain/external-toolchain/ext-tool.mk                         |  322 ------
 toolchain/helpers.mk                                             |  217 ++++
 toolchain/toolchain-buildroot.mk                                 |   14 +
 toolchain/{Config.in.1 => toolchain-buildroot/Config.in}         |    2 +-
 toolchain/toolchain-buildroot/Config.in.2                        |   37 +
 toolchain/{Config.in.2 => toolchain-common.in}                   |   46 +-
 toolchain/toolchain-external.mk                                  |   16 +
 toolchain/{external-toolchain => toolchain-external}/Config.in   |    0
 toolchain/{external-toolchain => toolchain-external}/Config.in.2 |    0
 toolchain/toolchain-external/ext-tool.mk                         |  108 ++
 12 files changed, 410 insertions(+), 385 deletions(-)

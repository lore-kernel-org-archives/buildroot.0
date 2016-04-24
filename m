From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 24 Apr 2016 16:39:47 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for Rust programming language
Message-ID: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by providing a
package for the host variant of the Rust compiler, able to cross-compile code
for ARM, MIPS and x86_64 architectures.

Best regards,
ELB

Eric Le Bihan (2):
  python: enable bzip2 in host variant
  rust: new package

 package/Config.in.host                             |   1 +
 package/python/python.mk                           |   3 +-
 ...monize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch |  53 ++++
 .../0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch |  71 +++++
 ...eclaration-in-mipsel-unknown-linux-gnu.mk.patch |  26 ++
 package/rust/Config.in.host                        |  24 ++
 package/rust/rust-target-gen                       | 314 +++++++++++++++++++++
 package/rust/rust.hash                             |   5 +
 package/rust/rust.mk                               |  90 ++++++
 9 files changed, 585 insertions(+), 2 deletions(-)
 create mode 100644 package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
 create mode 100644 package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
 create mode 100644 package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
 create mode 100644 package/rust/Config.in.host
 create mode 100755 package/rust/rust-target-gen
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

-- 
2.4.11

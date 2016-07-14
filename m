From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 15 Jul 2016 00:01:14 +0200
Subject: [Buildroot] [Patch v3 0/2] Add support for the Rust programming
	language
Message-ID: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by providing a
package for the host variant of the Rust compiler, able to cross-compile code
for ARM, MIPS and x86_64 architectures.

v2 -> v3:

 - bump rust to 1.10.0
 - rework and bump rust-bootstrap to 1.9.0
 - host-rust requires at least GCC 4.7 because of LLVM (suggested by R. Naour)
 - rust requires a glibc-based cross-compiler
 - rust requires GCC 5.x or above for Aarch64 

v1 -> v2:

 - bump rust to version 1.9.0.
 - drop patch for bzip2 support in host-python.
 - add package for jemalloc.
 - add dependency on host being a x86 machine.
 - add dependency on toolchain.
 - use dedicated package to provide bootstrapping binary: rust-bootstrap.
 - let ./configure find out host/build on its own.
 - remove entry from configuration menu.
 - clarify some comments.

Eric Le Bihan (3):
  jemalloc: new package
  rust-bootstrap: new package
  rust: new package

 package/Config.in.host                             |   1 +
 package/rust-bootstrap/rust-bootstrap.hash         |   3 +
 package/rust-bootstrap/rust-bootstrap.mk           |  24 ++
 ...monize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch |  53 ++++
 .../0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch |  73 +++++
 ...eclaration-in-mipsel-unknown-linux-gnu.mk.patch |  26 ++
 package/rust/Config.in.host                        |  14 +
 package/rust/rust-target-gen                       | 315 +++++++++++++++++++++
 package/rust/rust.hash                             |   2 +
 package/rust/rust.mk                               |  67 +++++
 10 files changed, 578 insertions(+)
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk
 create mode 100644 package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
 create mode 100644 package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
 create mode 100644 package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
 create mode 100644 package/rust/Config.in.host
 create mode 100755 package/rust/rust-target-gen
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

-- 
2.4.11

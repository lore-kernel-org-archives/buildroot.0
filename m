From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  2 Apr 2017 21:46:48 +0200
Subject: [Buildroot] [Patch v4 0/3] Add support for the Rust programming
	language
Message-ID: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by providing a
package for the host variant of the Rust compiler, able to cross-compile code
for ARM, MIPS, PowerPC and x86_64 architectures.

As the Rust compiler is written in Rust and uses Cargo, the Rust package
manager, as build system, two additional packages are provided: rust-bootstrap
and cargo-bootstrap.

v3 -> v4:

 - bump rust to 1.16.0
 - bump rust-bootstrap to 1.15.1
 - add cargo-bootstrap
 - use built-in target specifications
 - drop external Python script to generate target specifications
 - enable support for PowerPC
 - expose host variant in menuconfig

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
  rust-bootstrap: new package
  cargo-bootstrap: new package
  rust: new package

 DEVELOPERS                                   |  3 +
 package/Config.in.host                       |  1 +
 package/cargo-bootstrap/cargo-bootstrap.hash |  3 +
 package/cargo-bootstrap/cargo-bootstrap.mk   | 14 +++++
 package/rust-bootstrap/rust-bootstrap.hash   |  5 ++
 package/rust-bootstrap/rust-bootstrap.mk     | 37 ++++++++++++
 package/rust/Config.in.host                  | 33 +++++++++++
 package/rust/rust.hash                       |  2 +
 package/rust/rust.mk                         | 85 ++++++++++++++++++++++++++++
 9 files changed, 183 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk
 create mode 100644 package/rust/Config.in.host
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

--
2.9.3

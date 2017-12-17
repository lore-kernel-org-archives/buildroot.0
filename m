From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 17 Dec 2017 18:57:59 +0100
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
Message-ID: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the Rust programming language by adding the
following packages:

 - rustc: a virtual package for the Rust compiler.
 - rust-bin: provides a pre-built version of rustc.
 - cargo-bin: provides a pre-built version of Rust package manager.
 - rust: builds rustc from source.
 - cargo: builds Rust package manager from source.
 - rust-cargo: a virtual package for the Rust package manager.

Only the host variants are provided.

The rustc and rust-cargo virtual packages are inspired by the mysql one.

v7 -> v8:

 - replace cargo-bootstrap by cargo-bin
 - drop rust-bootstrap and use rust-bin instead
 - rust-bin and rust versions are the same
 - cargo-bin and cargo versions are the same
 - bump cargo to 0.23.0
 - bump rust to 1.22.1
 - add rust-cargo virtual package

v6 -> v7:

 - add cargo 0.20.0
 - bump rust to 1.19.0
 - bump rust-bootstrap to 1.18.0
 - bump cargo-bootstrap to 0.19.0
 - bump rust-bin to 1.19.0
 - fix mips64 target name in rustc

v5 -> v6:

 - bump rust to 1.18.0
 - bump rust-bootstrap to 1.17.0
 - bump rust-bin to 1.18.0

v4 -> v5:

 - add rustc virtual package
 - add rust-bin, provider for rustc
 - rework rust to be a provider for rustc
 - rework some commit messages

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

Eric Le Bihan (9):
  rustc: new virtual package
  rust-bin: new package
  cargo-bin: new package
  rust: new package
  libssh2: add host variant
  libhttpparser: add host variant
  libcurl: add host variant
  cargo: new package
  rust-cargo: new virtual package

 DEVELOPERS                                         |   4 +
 package/Config.in.host                             |   2 +
 package/cargo-bin/cargo-bin.hash                   |   4 +
 package/cargo-bin/cargo-bin.mk                     |  18 +
 package/cargo/cargo.hash                           |   4 +
 package/cargo/cargo.mk                             |  96 +++
 package/cargo/config.in                            |   2 +
 package/libcurl/libcurl.mk                         |  13 +
 package/libhttpparser/libhttpparser.mk             |   9 +
 package/libssh2/libssh2.mk                         |   6 +
 package/rust-bin/rust-bin.hash                     |  30 +
 package/rust-bin/rust-bin.mk                       |  61 ++
 package/rust-cargo/Config.in.host                  |  41 ++
 .../rust/0001-vendor-remove-cargo-toml-orig.patch  | 650 +++++++++++++++++++++
 package/rust/rust.hash                             |   2 +
 package/rust/rust.mk                               |  66 +++
 package/rustc/Config.in.host                       |  62 ++
 package/rustc/rustc.mk                             |  31 +
 18 files changed, 1101 insertions(+)
 create mode 100644 package/cargo-bin/cargo-bin.hash
 create mode 100644 package/cargo-bin/cargo-bin.mk
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in
 create mode 100644 package/rust-bin/rust-bin.hash
 create mode 100644 package/rust-bin/rust-bin.mk
 create mode 100644 package/rust-cargo/Config.in.host
 create mode 100644 package/rust/0001-vendor-remove-cargo-toml-orig.patch
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk
 create mode 100644 package/rustc/Config.in.host
 create mode 100644 package/rustc/rustc.mk

-- 
2.14.3

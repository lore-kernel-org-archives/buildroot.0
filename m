From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 25 Jul 2019 00:12:01 +0200
Subject: [Buildroot] [PATCH 0/6] Cargo virtual and Rust 1.36.0
Message-ID: <20190724221207.9686-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cargo source code is not provided anymore as a separate tarball but is now
built along with the Rust compiler.

This patch series converts cargo to a virtual package and declare cargo-bin
and rust are providers. Versions for each package are also bumped to latest
ones.

Eric Le Bihan (6):
  package/cargo: convert to virtual package
  package/cargo-bin: declare as cargo provider
  package/rust: declare as cargo provider
  package/cargo-bin: bump version to 0.37.0
  package/rust-bin: bump version to 1.36.0
  package/rust: bump version to 1.36.0

 package/cargo-bin/cargo-bin.hash              |  18 +-
 package/cargo-bin/cargo-bin.mk                |  10 +-
 package/cargo/Config.in.host                  |  38 ++-
 package/cargo/cargo.mk                        |  79 +-----
 package/rust-bin/rust-bin.hash                |  90 +++---
 package/rust-bin/rust-bin.mk                  |   2 +-
 ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ------------------
 package/rust/rust.hash                        |   6 +-
 package/rust/rust.mk                          |  25 +-
 9 files changed, 128 insertions(+), 404 deletions(-)
 delete mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch

--
2.20.1

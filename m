From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:52 +0100
Subject: [Buildroot] [RFC PATCH 0/7] Rust: drop cargo package
Message-ID: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

The source code for Cargo, the build and package manager for Rust, is now
shipped along with the compiler and standard library.

So there can not be a standalone package for Cargo anymore.

This series does the following:

- update host-rust to build and install Cargo.
- install host-cargo-bin if host-rust-bin is selected instead of host-rust.
- update dependencies for package(s) using Cargo.
- remove cargo packaging.
- update the packaging documentation.

[1] http://lists.busybox.net/pipermail/buildroot/2019-October/264437.html

Eric Le Bihan (7):
  package/rust: build and install cargo
  package/cargo-bin: install if rust-bin selected
  package/rust-bin: host variant depends on host-cargo-bin
  package/rust: drop dependency on host-cargo-bin
  package/ripgrep: depends on host-rustc
  package/cargo: drop package
  docs/manual: cargo packages depend on host-rustc

 docs/manual/adding-packages-cargo.txt | 11 ++--
 package/Config.in.host                |  1 -
 package/cargo-bin/cargo-bin.mk        |  7 +++
 package/cargo/Config.in.host          |  9 ---
 package/cargo/cargo.hash              |  8 ---
 package/cargo/cargo.mk                | 91 ---------------------------
 package/ripgrep/Config.in             |  1 -
 package/ripgrep/ripgrep.mk            |  2 +-
 package/rust-bin/rust-bin.mk          |  1 +
 package/{cargo => rust}/config.in     |  0
 package/rust/rust.mk                  | 26 +++++++-
 11 files changed, 38 insertions(+), 119 deletions(-)
 delete mode 100644 package/cargo/Config.in.host
 delete mode 100644 package/cargo/cargo.hash
 delete mode 100644 package/cargo/cargo.mk
 rename package/{cargo => rust}/config.in (100%)

--
2.21.0

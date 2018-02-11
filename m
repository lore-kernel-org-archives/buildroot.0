From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:18 +0100
Subject: [Buildroot] [PATCH 0/6] use RUSTC_{HOST,TARGET}_NAME
Message-ID: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As utils/check-package complains about RUST_{HOST,TARGET}_NAME in rustc
package not being compliant and as these variables are related to the Rust
compiler, it sounds sensible to rename them.

This series renames RUST_{HOST,TARGET}_NAME to RUSTC_{HOST,TARGET}_NAME in all
the packages using them, as well as in the documentation example.

Eric Le Bihan (6):
  rustc: use RUSTC_{HOST,TARGET}_NAME
  rust-bin: use RUSTC_{HOST,TARGET}_NAME
  cargo-bin: use RUSTC_{HOST,TARGET}_NAME
  rust: use RUSTC_{HOST,TARGET}_NAME
  cargo: use RUSTC_{HOST,TARGET}_NAME
  docs/manual: use RUSTC_{HOST,TARGET}_NAME in cargo howto

 docs/manual/adding-packages-cargo.txt |  4 ++--
 package/cargo-bin/cargo-bin.mk        |  2 +-
 package/cargo/cargo.mk                |  2 +-
 package/cargo/config.in               |  2 +-
 package/rust-bin/rust-bin.mk          | 14 +++++++-------
 package/rust/rust.mk                  |  4 ++--
 package/rustc/Config.in.host          |  3 +--
 package/rustc/rustc.mk                |  4 ++--
 8 files changed, 17 insertions(+), 18 deletions(-)

--
2.14.3

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 13 Feb 2018 08:21:26 +0100
Subject: [Buildroot] [PATCH v2 0/2] use RUSTC_{HOST,TARGET}_NAME
Message-ID: <20180213072128.4669-1-eric.le.bihan.dev@free.fr>
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

Also included, a clean-up of rustc/Config.in.host to make check-package even
more happy.

Eric Le Bihan (2):
  rustc: use RUSTC_{HOST,TARGET}_NAME
  rustc: fix check-package warnings

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

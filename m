From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  6 Apr 2019 16:42:08 +0200
Subject: [Buildroot] [PATCH 0/3] Bump rust to 1.33.0
Message-ID: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tiny series bumps rust and rust-bin to 1.33.0 as well as cargo-bin to
0.33.

The cargo package is not bumped, as the source code is now included in the
rust tarball and should be built from it. An impedending patch series will
convert cargo to a virtual package and set cargo-bin and rust as providers.

Eric Le Bihan (3):
  cargo-bin: bump version to 0.33.0
  rust-bin: bump version to 1.33.0
  rust: bump version to 1.33.0

 package/cargo-bin/cargo-bin.hash              |  18 +-
 package/cargo-bin/cargo-bin.mk                |   2 +-
 package/rust-bin/rust-bin.hash                |  75 +++--
 package/rust-bin/rust-bin.mk                  |   7 +-
 ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ++++++++++++++++++
 package/rust/rust.hash                        |   5 +-
 package/rust/rust.mk                          |  12 +-
 7 files changed, 328 insertions(+), 55 deletions(-)
 create mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch

--
2.17.2

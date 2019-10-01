From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 30 Sep 2019 22:36:52 -0300
Subject: [Buildroot] [PATCH v2 0/2] Make remote debugging easier
Message-ID: <20191001013654.22298-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Patch 1 moves binaries stripping to the rootfs creation instead of in
target-finalize. This allows us to find the non-stripped executables
under TARGET_DIR, rather than searching inside the build directory.

Patch 2 updates the gdbinit file to set sysroot to TARGET_DIR.

Carlos Santos (2):
  Strip binaries in the rootfs creation instead of in target-finalize
  toolchain: install gdbinit under TARGET_DIR

 Makefile                                      | 34 -----------------
 docs/manual/quickstart.txt                    |  5 ++-
 docs/manual/using-buildroot-debugger.txt      | 11 ++++--
 fs/common.mk                                  | 37 ++++++++++++++++++-
 toolchain/helpers.mk                          |  4 +-
 .../pkg-toolchain-external.mk                 |  4 +-
 6 files changed, 50 insertions(+), 45 deletions(-)

-- 
2.18.1

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 03 Jan 2014 17:02:49 +0100
Subject: [Buildroot] [PATCH 0 of 5 v3] Introduce new deprecation symbols,
 and remove squashfs3/ttcp
Message-ID: <patchbomb.1388764969@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


In this third version I have stopped using the feature-removal-schedule.txt
file, and moved to an alternate strategy: introduce symbols
BR2_DEPRECATED_SINCE_xxxx_xx, which also provide an indication of when
features can be removed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                                              |  42 +++++++++++++-
 Config.in.legacy                                       |  24 ++++++++
 arch/Config.in.mips                                    |   8 +-
 docs/manual/appendix.txt                               |   8 ++-
 fs/squashfs/Config.in                                  |  16 -----
 fs/squashfs/squashfs.mk                                |  12 ----
 package/Config.in                                      |   2 -
 package/autoconf/Config.in                             |   2 +-
 package/automake/Config.in                             |   2 +-
 package/bison/Config.in                                |   4 +-
 package/busybox/Config.in                              |   2 +-
 package/ccache/Config.in                               |   2 +-
 package/flex/Config.in                                 |   3 +-
 package/gcc/Config.in.host                             |   4 +-
 package/gdb/Config.in.host                             |   4 +-
 package/gob2/Config.in                                 |   3 +-
 package/linux-headers/Config.in.host                   |  14 ++--
 package/lzma/Config.in                                 |   4 +-
 package/m4/Config.in                                   |   3 +-
 package/squashfs3/Config.in                            |  12 ----
 package/squashfs3/squashfs3-3.4-build-system-fix.patch |  37 ------------
 package/squashfs3/squashfs3-3.4-get_nprocs.patch       |  33 -----------
 package/squashfs3/squashfs3.mk                         |  34 -----------
 package/ttcp/Config.in                                 |   7 --
 package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch  |  15 -----
 package/ttcp/ttcp.mk                                   |  25 --------
 package/vala/Config.in                                 |   4 +-
 package/xstroke/Config.in                              |   2 +-
 support/scripts/gen-manual-lists.py                    |  21 ++++---
 toolchain/toolchain-external/Config.in                 |   8 +-
 30 files changed, 121 insertions(+), 236 deletions(-)

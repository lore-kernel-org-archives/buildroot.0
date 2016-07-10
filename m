From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat,  9 Jul 2016 22:16:05 -0300
Subject: [Buildroot] [PATCH v7 0/3] util-linux: cleanups,
	additions and reworked utilities menu
In-Reply-To: <20160708205217.GB3757@free.fr>
References: <20160708205217.GB3757@free.fr>
Message-ID: <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Original patch by Danomi Manchego <danomimanchego123@gmail.com>

Changes v1 -> v2:
  - Rework to incorporate ideas and suggestions from Thomas Petazzoni
    and Arnout Vandecappelle.  At least, in spirit.

Changes v2 -> v3:
  - Change BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES to
    BR2_PACKAGE_UTIL_LINUX_BINARIES, to conserve backwards-
    compatibility without need for a legacy option.
  - Enable 'Basic set' by default to match output of previous
    build when binaries were selected.

Changes v3 -> v4:
  - Rework to apply on top of master branch

Changes v4 -> v5:
  - Add option to control installation of libfdisk.
  - Fine-grained selection of libraries in custom selection of
    utilities.
  - Document that linux32, linux64, uname26, i386 and x86_64 are
    setarch aliases.
  - Add options to instal cal, ipcrm, ipcs, logger, lslogin and pg.
  - Remove options to install findfs and lsblk because there are no
    corresponding --enable- and --disable- configure options.

CHanges v5 -> v6:
  - Make 'bool "lib<foo>"' the first item in each block
  - Add several missing dependencies on BR2_USE_MMU, for fork()
  - Options corresponding to package/utility/library names in
    lowercase (do the same for "none", "all" and "custom")
  - Improve help for cramfs utilities and login utilities

Changes v6 -> v7:
  - Split big patch into 3 patches, as suggested by Yann E. MORIN
  - Leave the default utilities choice as "none", which is controversial
    but is the less harmful (it can be changed in a future patch, if we
    change our minds, without breaking backwards compatibility)
  - Add a compatibility entry to Config.in.legacy that selects the basic
    set of utilities, as BR2_PACKAGE_UTIL_LINUX_BINARIES=y would do, so
    existing defconfigs will not fail

Carlos Santos (3):
  util-linux: clean up libraries and tools selections
  util-linux: expand selection of libraries and utilities
  util-linux: rework utilities menu for finer control

 Config.in.legacy                 |  16 +++++
 package/util-linux/Config.in     | 149 ++++++++++++++++++++++++++++++++-------
 package/util-linux/util-linux.mk |  26 ++++---
 3 files changed, 157 insertions(+), 34 deletions(-)

-- 
2.7.4

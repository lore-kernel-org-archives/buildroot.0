From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Dec 2011 15:21:53 +0100
Subject: [Buildroot] [PATCH 0 of 4 v3] dependencies: some improvements
Message-ID: <patchbomb.1323862796@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series has been updated as follows:
- move 'Move toolchain/dependencies to support/dependencies' to first position
- new patch to check for minimal make version
- update suitable-host-package and tar patches based on comments and remove
  tar chicken-egg problem. The latter change greatly simplifies things IMO.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                               |    8 ++++++++
 package/Makefile.package.in            |   12 ------------
 package/tar/tar.mk                     |    9 +++++++++
 support/dependencies/check-host-tar.mk |    9 +++++++++
 support/dependencies/check-host-tar.sh |   35 +++++++++++++++++++++++++++++++++++
 toolchain/dependencies/dependencies.mk |   12 +++++++++++-
 toolchain/dependencies/dependencies.sh |  Bin
 toolchain/toolchain-buildroot.mk       |    1 -
 toolchain/toolchain-crosstool-ng.mk    |    1 -
 toolchain/toolchain-external.mk        |    1 -
 10 files changed, 72 insertions(+), 16 deletions(-)

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:16:57 +0200
Subject: [Buildroot] [PATCH v2 00/10] Improvements for saving the
	configuration
Message-ID: <1351063027-13800-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This series makes various improvements of how the configuration is saved.
The main improvement is documenting the standard way of doing things,
which is based on Thomas Petazzoni's presentation at last year's ELC-E.
The second patch adds the filesystem overlay as an configure option.
Subsequent patches iron out various inconsistencies in the saving of
the configuration. The final patch makes it possible to save the
buildroot configuration itself to a different file than 'defconfig'.

 All patches are more or less independent, except they all depend on the
first one because they update documentation.  I therefore also hope they
will be committed individually.

 As I mentioned before, I'm giving a presentation about buildroot
coming week-end, and I will make use of the features added by this
series in that presentation.  So if there are major critiques, please
let me know before the week-end.

 Regards,
 Arnout

Arnout Vandecappelle (Essensium/Mind) (10):
      manual: add section about storing the configuration.
      target/generic: add filesystem overlay option
      ctng: add ctng-update-config target
      busybox: busybox-update-config should depend on busybox-configure
      at91bootstrap3: add -update-config target
      Add update-all-config target
      busybox: update-all-config shouldn't update default busybox config
      crosstool-ng: update-all-config shouldn't update default crosstool-ng config
      uClibc: update-all-config shouldn't update default uClibc config
      Make savedefconfig save to a configured file.

 Config.in                                        |   12 ++
 Makefile                                         |   32 ++-
 boot/at91bootstrap3/at91bootstrap3.mk            |    8 +
 docs/manual/adding-packages-directory.txt        |    1 +
 docs/manual/board-support.txt                    |   35 ----
 docs/manual/customize-rootfs.txt                 |   21 +-
 docs/manual/customize-store.txt                  |  231 ++++++++++++++++++++++
 docs/manual/customize.txt                        |    2 +
 linux/linux.mk                                   |    2 +
 package/busybox/Config.in                        |    7 +-
 package/busybox/busybox.mk                       |   13 +-
 target/generic/Config.in                         |   11 ++
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   21 +-
 toolchain/uClibc/Config.in                       |    7 +-
 toolchain/uClibc/uclibc.mk                       |   25 +--
 16 files changed, 348 insertions(+), 86 deletions(-)
 delete mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/customize-store.txt

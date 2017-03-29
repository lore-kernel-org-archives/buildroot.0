From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 10:51:16 -0400
Subject: [Buildroot] [RFC 0/4] add genimage Kconfig entry
Message-ID: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many boards specific postimage scripts are almost use only to execute
the genimage host tool.

The purpose of this RFC is to provide a generic wrapper for the
genimage tool, in order to reduce boilerplate.

The first two patches add the generic genimage plumbing.
The next two patches are examples of post-image scripts simplification.

The new target-genimage targer is called after the target-post-image
target since that is most of the board use cases. odroidc2 is an
exception, we can still execute genimage in its post-image script.

If there is no objection to the first two patches, I will submit a new
patch series introducing this change to all boards using genimage.

Etienne Phelip (4):
  support/scripts: add generic genimage script
  system: add option to pass genimage config files
  configs/raspberrypi3_defconfig: set BR2_GENIMAGE_CFG_FILES
  board/acmesystems/aria-g25: set BR2_GENIMAGE_CFG_FILES

 Makefile                                     |  9 +++++++--
 board/acmesystems/aria-g25/post-image.sh     | 14 --------------
 board/raspberrypi/post-image.sh              | 16 ----------------
 configs/acmesystems_aria_g25_128mb_defconfig |  2 +-
 configs/acmesystems_aria_g25_256mb_defconfig |  2 +-
 configs/raspberrypi3_defconfig               |  1 +
 support/scripts/genimage.sh                  | 27 +++++++++++++++++++++++++++
 system/Config.in                             | 11 +++++++++++
 8 files changed, 48 insertions(+), 34 deletions(-)
 delete mode 100755 board/acmesystems/aria-g25/post-image.sh
 create mode 100755 support/scripts/genimage.sh

-- 
2.9.3

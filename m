From: Phelip Etienne <etienne.phelip@savoirfairelinux.com>
Date: Mon, 27 Mar 2017 12:47:28 -0400
Subject: [Buildroot] [PATCH 0/2] support/scripts: add generic genimage
	wrapper
Message-ID: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many boards are using the same genimage command in their post-image.sh
script.

This adds a generic wrapper for this command in support/scripts. The
post-image.sh for rapsberrypi script has been updated to use this
wrapper.

Another patch set will follow this one in order to update all boards
using genimage to use the wrapper.

Phelip Etienne (2):
  support/scripts: add generic genimage script
  board/raspberrypi: use generic genimage script

 board/raspberrypi/post-image.sh | 10 +---------
 support/scripts/genimage.sh     | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 9 deletions(-)
 create mode 100644 support/scripts/genimage.sh

-- 
2.9.3

From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  3 Mar 2016 15:57:16 +0100
Subject: [Buildroot] [PATCH 0/2] board/boundarydevices: update platforms
	support
Message-ID: <1457017038-4023-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Since the Nitrogen7 defconfig came in, someone pointed out that the
bootscript hasn't been updated accordingly so the first patch is taking
care of that.

While doing it, I realized it didn't really make sense to have all our
scripts in a 'nitrogen6x' folder whereas they also apply to other configs.
So the second patch renames the folder and also updates the readme so it is
(hopefully) clearer which config should be used depending on the platform
being used.

Regards,
Gary

Gary Bisson (2):
  board/boundarydevices: update u-boot scripts for i.MX7 support
  board/boundarydevices: rename folder and update readme

 .../{nitrogen6x => common}/6x_bootscript.txt       | 33 +++++++++++-----------
 .../{nitrogen6x => common}/6x_upgrade.txt          |  2 +-
 .../{nitrogen6x => common}/genimage.cfg            |  0
 .../{nitrogen6x => common}/post-build.sh           |  0
 .../{nitrogen6x => common}/post-image.sh           |  0
 board/boundarydevices/common/readme.txt            | 30 ++++++++++++++++++++
 board/boundarydevices/nitrogen6x/readme.txt        | 13 ---------
 configs/nitrogen6sx_defconfig                      |  4 +--
 configs/nitrogen6x_defconfig                       |  4 +--
 configs/nitrogen7_defconfig                        |  4 +--
 10 files changed, 54 insertions(+), 36 deletions(-)
 rename board/boundarydevices/{nitrogen6x => common}/6x_bootscript.txt (87%)
 rename board/boundarydevices/{nitrogen6x => common}/6x_upgrade.txt (95%)
 rename board/boundarydevices/{nitrogen6x => common}/genimage.cfg (100%)
 rename board/boundarydevices/{nitrogen6x => common}/post-build.sh (100%)
 rename board/boundarydevices/{nitrogen6x => common}/post-image.sh (100%)
 create mode 100644 board/boundarydevices/common/readme.txt
 delete mode 100644 board/boundarydevices/nitrogen6x/readme.txt

-- 
2.7.0

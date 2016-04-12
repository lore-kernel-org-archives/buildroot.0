From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 02:29:21 -0300
Subject: [Buildroot] [PATCH 0/4] Fun with Minnowboard Turot
Message-ID: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently got myself a Minnowboard Turot board and have been
goofing around with it. The Minnowboard Turot is compatible with
the Minnowboard MAX board, so I've reused the defconfig and board
stuff.

These four patches are the result of some experiments; first
two patches use genimage to generate an SD card image.

The third patch extends the Minnowboard MAX kernel config,
so the system has more capabilities.

The last patch adds a graphical defconfig. I believe this is
a quite cool board, and it's nice to show how easy we can
produce a graphical X-based platform using Buildroot.

Feedback welcome!

Ezequiel Garcia (4):
  board/minnowboard-max: Rework to generate SD card image
  board/minnowboard: Rework to generate SD card image
  board/minnowboard-max: Add more peripherals and features to the kernel
  board/minnowboard-max: Add a X-based graphical defconfig

 board/minnowboard-max/asound.conf           |   2 +
 board/minnowboard-max/genimage.cfg          |  34 ++++
 board/minnowboard-max/linux.config          |  17 ++
 board/minnowboard-max/post-build.sh         |  20 +++
 board/minnowboard-max/post-image.sh         |  13 ++
 board/minnowboard-max/readme.txt            |  39 ++---
 board/minnowboard-max/startx                | 239 ++++++++++++++++++++++++++++
 board/minnowboard/genimage.cfg              |  34 ++++
 board/minnowboard/post-image.sh             |  13 ++
 board/minnowboard/readme.txt                |  39 ++---
 configs/minnowboard_defconfig               |   8 +
 configs/minnowboard_max_defconfig           |   8 +
 configs/minnowboard_max_graphical_defconfig |  78 +++++++++
 13 files changed, 490 insertions(+), 54 deletions(-)
 create mode 100644 board/minnowboard-max/asound.conf
 create mode 100644 board/minnowboard-max/genimage.cfg
 create mode 100755 board/minnowboard-max/post-image.sh
 create mode 100755 board/minnowboard-max/startx
 create mode 100644 board/minnowboard/genimage.cfg
 create mode 100755 board/minnowboard/post-image.sh
 create mode 100644 configs/minnowboard_max_graphical_defconfig

-- 
2.7.0

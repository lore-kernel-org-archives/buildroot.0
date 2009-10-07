From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:23 +0200
Subject: [Buildroot] [Patch 0/23] Cleanups for Qt
Message-ID: <1254907246-5650-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I assembled some cleanups for Qt. Mostly they are small changes
except twos, namely:

  [PATCH 20/23] qt: simplify and fix installing qt in the target
  [PATCH 23/23] qt: rename QT_TARGET_DIR to QT_DIR

Patch #20 removes a bunch of lines to simplify the Makfile while
Patch #23 is only esthetic surgery which could be omitted.

In summary these patches don't change (hopefully...) the current
Qt build or Kconfig for Qt in fundamental ways.

I tested the series on arm926t and x86.

Additionally I made some larger changes to Kconfig for Qt a few
months ago which I could port to the current buildroot and release
in a second series, say in a week, when desired.


Michael Roth
---
 configs/atstk100x_defconfig |    2 -
 configs/v100sc2_defconfig   |    6 +-
 package/qt/Config.in        |   43 +++----
 package/qt/qt.mk            |  292 +++++++++++++++----------------------------
 4 files changed, 123 insertions(+), 220 deletions(-)

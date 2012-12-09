From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:13:55 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A bunch of build failure fixes, especially one for the neard
<linux/nfc.h> problem, which is causing most of the autobuilders
failure noise at the moment.

Thanks.

Thomas

The following changes since commit 054f97e1f2de337ea0c788d766212a36d6d4e41c:

  pkg-infra: add <pkg>-extract and <pkg>-patch targets to OVERRIDE support (2012-12-06 17:13:57 -0800)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git misc-fixes

for you to fetch changes up to 998c031cc673d7c76c7d9bd8c4402fa928ed803e:

  libev: disable on avr32 (2012-12-09 18:44:40 +0100)

----------------------------------------------------------------
Thomas Petazzoni (8):
      ccache: uses fork(), there only usable on MMU platforms
      ccache: deprecate the target package
      rt-tests: requires thread support in the toolchain
      rt-tests: not available on avr32, too old uClibc
      bmon: needs MMU for fork()
      xapp_xmh: add dependency on xdata_xbitmap
      neard: fix build failure caused by missing <linux/nfc.h>
      libev: disable on avr32

 package/bmon/Config.in                             |    2 +
 package/ccache/Config.in                           |    4 +
 package/libev/Config.in                            |    2 +
 .../neard/neard-fix-missing-linux-nfc-header.patch |  387 ++++++++++++++++++++
 package/neard/neard.mk                             |    1 +
 package/rt-tests/Config.in                         |    4 +
 package/x11r7/xapp_xmh/Config.in                   |    1 +
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 +-
 8 files changed, 402 insertions(+), 1 deletion(-)
 create mode 100644 package/neard/neard-fix-missing-linux-nfc-header.patch

Thanks,
-- 
Thomas Petazzoni

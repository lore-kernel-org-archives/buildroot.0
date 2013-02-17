From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:22:26 +0100
Subject: [Buildroot] [pull request 'next'] Pull request for branch
	yem-update-packages
Message-ID: <cover.1361143078.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps three packages versions:
  - vtun: version bump, and some long-overdue cleanup
  - tvheadend: version bump, wait at most 15s for DVB devices
  - connman: version bump


The following changes since commit 6056de8971bf25c9853c38583dc50b5abcb982de:

  rpi-userland: update to fix no-longer applying patch (2013-02-10 13:58:51 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-update-packages

Peter Korsgaard (1):
      Kickoff 2013.05 cycle

Yann E. MORIN (5):
      package/tvheadend: update to v3.5
      package/tvheadend: wait for DVB devices
      package/vtun: add missing 'depends on' zlib
      package/vtun: update to 3.0.3
      package/connman: bump version to 1.11

 Makefile                                           |    2 +-
 package/connman/connman.mk                         |    2 +-
 package/tvheadend/S99tvheadend                     |    7 ++
 .../tvheadend-001-no-auto-download-dvbscans.patch  |   66 ++++++++++++++
 .../tvheadend/tvheadend-002-no-check_config.patch  |   23 +++++
 package/tvheadend/tvheadend-fix-Werror.patch       |   44 ---------
 .../tvheadend-no-auto-download-dvbscans.patch      |   60 -------------
 package/tvheadend/tvheadend-no-wordexp.patch       |   20 ----
 package/tvheadend/tvheadend.mk                     |    2 +-
 package/vtun/Config.in                             |    3 +-
 package/vtun/README.txt                            |   37 --------
 ...le.in.patch => vtun-001-fix-installation.patch} |   21 ++++-
 package/vtun/vtun-002-fix-ssl-headers-checks.patch |   47 ++++++++++
 package/vtun/vtun-003-fixup-configure.in.patch     |   92 ++++++++++++++++++++
 package/vtun/vtun-3.0.2-003-configure.patch        |   12 ---
 package/vtun/vtun.mk                               |    3 +-
 package/vtun/vtund.rc.debian-2.6                   |   50 -----------
 package/vtun/vtund.rc.debian-3.0.2                 |   61 -------------
 18 files changed, 258 insertions(+), 294 deletions(-)
 create mode 100644 package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
 create mode 100644 package/tvheadend/tvheadend-002-no-check_config.patch
 delete mode 100644 package/tvheadend/tvheadend-fix-Werror.patch
 delete mode 100644 package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
 delete mode 100644 package/tvheadend/tvheadend-no-wordexp.patch
 delete mode 100644 package/vtun/README.txt
 rename package/vtun/{vtun-3.0.2-001-Makefile.in.patch => vtun-001-fix-installation.patch} (57%)
 create mode 100644 package/vtun/vtun-002-fix-ssl-headers-checks.patch
 create mode 100644 package/vtun/vtun-003-fixup-configure.in.patch
 delete mode 100644 package/vtun/vtun-3.0.2-003-configure.patch
 delete mode 100644 package/vtun/vtund.rc.debian-2.6
 delete mode 100644 package/vtun/vtund.rc.debian-3.0.2

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

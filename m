From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jun 2014 22:27:25 +0200
Subject: [Buildroot] [PATCH 0/7 v3] A bunch of bumps (branch yem/bumps)
Message-ID: <cover.1401740805.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series has been sitting here waiting for the last release to be out.
It is now, so here are the bumps.


Changes v2 -> v3:
  - fix the procps-ng file names  (Peter)
  - add procps to legacy  (Peter)
  - drop applied patches

Changes v1 -> v2:
  - apply a fixup to procps that I forgot in the previous round...


Regards,
Yann E. MORIN.


The following changes since commit 8e10125d25455a734528b0a18c9bca6e5c1ba4ea:

  ti-gfx: select fbset as it is a runtime dependency (2014-06-02 22:05:23 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 79d083ee71a1e3c81a26f9f8a1b47cbb8c0b6d83:

  [WIP] package/weston: add support for the RDP compositor (2014-06-02 22:08:55 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      package/procps: bump version and rename to procps-ng
      package/libinput: new package
      package/weston: add support for libinput
      package/freerdp: not forcibly depend on X.Org
      pacakge/freerdp: disable building the manpages
      package/freerdp: add options to enable/disable server and/or client
      [WIP] package/weston: add support for the RDP compositor

 Config.in.legacy                                   | 10 +++++++
 package/Config.in                                  |  5 ++--
 package/freerdp/Config.in                          | 31 +++++++++++++++++----
 package/freerdp/freerdp.mk                         | 32 +++++++++++++++++++---
 package/libinput/Config.in                         | 17 ++++++++++++
 package/libinput/libinput.mk                       | 19 +++++++++++++
 package/{procps => procps-ng}/Config.in            |  6 ++--
 .../procps-ng/procps-ng-0000-remove-index.patch    | 16 +++++++++++
 package/procps-ng/procps-ng.mk                     | 15 ++++++++++
 package/procps/procps-make-3.82.patch              | 23 ----------------
 package/procps/procps-remove-flags.patch           | 26 ------------------
 package/procps/procps-remove-index.patch           | 21 --------------
 package/procps/procps-wchar.patch                  | 29 --------------------
 package/procps/procps.mk                           | 25 -----------------
 package/weston/Config.in                           |  5 ++++
 package/weston/weston.mk                           | 14 ++++++++++
 16 files changed, 156 insertions(+), 138 deletions(-)
 create mode 100644 package/libinput/Config.in
 create mode 100644 package/libinput/libinput.mk
 rename package/{procps => procps-ng}/Config.in (63%)
 create mode 100644 package/procps-ng/procps-ng-0000-remove-index.patch
 create mode 100644 package/procps-ng/procps-ng.mk
 delete mode 100644 package/procps/procps-make-3.82.patch
 delete mode 100644 package/procps/procps-remove-flags.patch
 delete mode 100644 package/procps/procps-remove-index.patch
 delete mode 100644 package/procps/procps-wchar.patch
 delete mode 100644 package/procps/procps.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

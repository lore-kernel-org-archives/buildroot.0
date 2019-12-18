From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:39:04 +0100
Subject: [Buildroot] [PATCH 0/5] package: add host-coreutils (branch
 yem/host-coreutils)
Message-ID: <cover.1576701539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces host-coreutils, to be built by packages that need
it, when the host system does not have a recent-enough version.

For example, support ofr ln --relative is getting more and more present
in a lot of packages, like systemd. realpath is also required.

Add a new dependency check, and if the hsot lacks the required features,
build host-coreutils for those packages that strictly require it.


Regards,
Yann E. MORIN.


The following changes since commit d8c86be9cd70d7e821b9571a237a1a20243f5d58

  support/testing: fix python-gitdb2 test (2019-12-18 21:12:22 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to b22ede353f1065e52c6098cc1750386a5ac12fda

  package/libsepol: add dependency on host-coreutils for ln --relative (2019-12-18 21:35:26 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/coreutils: introduce a host variant
      core/dependencies: check if we need to build our own host-coreutils
      package/systemd: add dependency on host-coreutils
      package/libselinux: add dependency on host-coreutils for ln --relative
      package/libsepol: add dependency on host-coreutils for ln --relative

 package/coreutils/coreutils.mk                     | 14 ++++
 package/libselinux/0002-revert-ln-relative.patch   | 26 -------
 ...emove-ln-relative-usage-in-install-pywrap.patch | 27 --------
 package/libselinux/libselinux.mk                   |  2 +-
 package/libsepol/0002-revert-ln-relative.patch     | 29 --------
 package/libsepol/libsepol.mk                       |  2 +-
 .../0001-install-don-t-use-ln-relative.patch       | 80 ----------------------
 package/systemd/systemd.mk                         |  2 +
 support/dependencies/check-host-coreutils.mk       |  6 ++
 support/dependencies/check-host-coreutils.sh       | 12 ++++
 10 files changed, 36 insertions(+), 164 deletions(-)
 delete mode 100644 package/libselinux/0002-revert-ln-relative.patch
 delete mode 100644 package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
 delete mode 100644 package/libsepol/0002-revert-ln-relative.patch
 delete mode 100644 package/systemd/0001-install-don-t-use-ln-relative.patch
 create mode 100644 support/dependencies/check-host-coreutils.mk
 create mode 100755 support/dependencies/check-host-coreutils.sh

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

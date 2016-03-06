From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Mar 2016 00:04:52 +0100
Subject: [Buildroot] [PATCH 0/3] libcap, pax-utils: fixes,
	autotools and bump (branch yem/fixes)
Message-ID: <cover.1457305443.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes libcap to install its .pc file even when
building static-only.

It also changes pax-utils to use autotools.

Finally, it bumps libcap.

Regards,
Yann E. MORIN.


The following changes since commit b904c090bdf1ec54648d0cef7a0e66024e4816c8:

  zsh: don't use host pcre-config (2016-03-06 21:38:04 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 16d98d1d5774c485cce2d14dcc24ca8f698fc048:

  package/libcap: bump version (2016-03-07 00:00:10 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/libcap: install .pc file unconditionally
      package/pax-utils: switch to autotools
      package/libcap: bump version

 ...-build-system-fixes-for-cross-compilation.patch | 53 +++++++++++++++++++++
 package/libcap/0001-build-system.patch             | 54 ----------------------
 ...t-install-into-install-shared-install-sta.patch | 48 +++++++++++++++++++
 .../libcap/0002-split-static-shared-install.patch  | 30 ------------
 ...nge-the-location-we-include-linux-xattr.h.patch | 46 ------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           |  8 ++--
 package/pax-utils/pax-utils.mk                     | 35 ++++++--------
 8 files changed, 121 insertions(+), 155 deletions(-)
 create mode 100644 package/libcap/0001-build-system-fixes-for-cross-compilation.patch
 delete mode 100644 package/libcap/0001-build-system.patch
 create mode 100644 package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
 delete mode 100644 package/libcap/0002-split-static-shared-install.patch
 delete mode 100644 package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

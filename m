From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:04:43 +0100
Subject: [Buildroot] [PATCH 0/2 v2] pax-utils: update buildsystem;
	libcap: update version (branch yem/fixes)
Message-ID: <cover.1457719347.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series updates pax-utils to use autotools rather than generic
package, since it is now a real autotools package (even if the akefile
is already provided, which is an error in upstream packaging).

It also bumps libcap to the latest version, which allows to drop the
dependency on the attr package. This will not, however, fix our current
autobuild issues on gcc-10.


Changes v1 -> v2:
  - drop attr dependency in libcap  (Gustavo)


Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 1d03ae088a9b2990e6355f69ef3de103166b2db3:

  package/libcap: bump version (2016-03-11 18:11:40 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/pax-utils: switch to autotools
      package/libcap: bump version

 ...-build-system-fixes-for-cross-compilation.patch | 26 ++++--------
 ...t-install-into-install-shared-install-sta.patch | 32 +++++++--------
 ...nge-the-location-we-include-linux-xattr.h.patch | 46 ----------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           | 18 +++------
 package/pax-utils/pax-utils.mk                     | 35 +++++++---------
 6 files changed, 44 insertions(+), 115 deletions(-)
 delete mode 100644 package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

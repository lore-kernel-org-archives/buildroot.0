From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 20 Dec 2019 14:53:42 +0100
Subject: [Buildroot] [PATCH v2 0/3] Update the sysrepo package and dependend
 libs
Message-ID: <20191220135345.16045-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

This patch series bumps the sysrepo and dependencies to the newest upstream
version. A lot of cleanup was done in the upstream project so the sysrepo
package makefile looks much cleaner.

Changes v1 -> v2:
 Sorry. Send v1 to fast without checking if it builds.
 Add missing patch and tested

Heiko Thiery (3):
  package/libyang; bump to version 1.0.109
  package/libnetconf2: bump to version 1.1.3
  package/sysrepo: bump to version 1.3.21

 .../0001-Add-support-for-musl-libc.patch      | 65 -------------------
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 package/libyang/libyang.hash                  |  2 +-
 package/libyang/libyang.mk                    |  2 +-
 ...espect-CMAKE_INSTALL_PREFIX-and-DEST.patch | 33 ----------
 ...CHANGE-create-plugins-dir-if-it-does.patch | 41 ++++++++++++
 ...t-make-systemd-unit-dir-configurable.patch | 40 ------------
 ...BUGFIX-create-plugins-dir-recursivel.patch | 65 +++++++++++++++++++
 package/sysrepo/S50sysrepod                   | 48 --------------
 package/sysrepo/sysrepo.hash                  |  4 +-
 package/sysrepo/sysrepo.mk                    | 31 ++-------
 12 files changed, 116 insertions(+), 219 deletions(-)
 delete mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch
 delete mode 100644 package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
 create mode 100644 package/sysrepo/0001-sysrepo-plugind-CHANGE-create-plugins-dir-if-it-does.patch
 delete mode 100644 package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
 create mode 100644 package/sysrepo/0002-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
 delete mode 100644 package/sysrepo/S50sysrepod

-- 
2.20.1

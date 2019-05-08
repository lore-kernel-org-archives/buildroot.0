From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  8 May 2019 13:02:24 +0200
Subject: [Buildroot] [PATCH v2 0/4] allow build infrastructure to pick up
 installed meson tool
Message-ID: <20190508110228.25921-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is V2 of the patchset. The purpose is to allow meson/ninja dependencies to
be optionally resolved to the system installed version.

This wont be fully accepted, thanks to meson missing patches upstream,
the patches default to disable this functionality.

V2 includes 2 more cleanup-patches, a rebase and default to never use the
system installed tools.

users can force the use of the system installed tools, by overriding variables:

    make graph-depends BR2_MESON_VERSION_MIN=0 BR2_NINJA_VERSION_MIN=0

Norbert Lange (4):
  package/pkg-meson: move crosscompilation support out of package
  prepare build infrastructure to pick up installed meson tool
  prepare build infrastructure to pick up installed ninja tool
  support/dependencies: use a helper script for common checks

 package/meson/meson.mk                        | 55 ---------------
 package/pkg-meson.mk                          | 70 +++++++++++++++----
 support/dependencies/check-host-cmake.sh      | 47 ++-----------
 support/dependencies/check-host-make.sh       | 39 ++---------
 support/dependencies/check-host-meson.mk      | 15 ++++
 support/dependencies/check-host-meson.sh      |  5 ++
 support/dependencies/check-host-ninja.mk      | 13 ++++
 support/dependencies/check-host-ninja.sh      |  5 ++
 support/dependencies/versioncheck.sh          | 45 ++++++++++++
 .../misc}/cross-compilation.conf.in           |  0
 10 files changed, 149 insertions(+), 145 deletions(-)
 create mode 100644 support/dependencies/check-host-meson.mk
 create mode 100755 support/dependencies/check-host-meson.sh
 create mode 100644 support/dependencies/check-host-ninja.mk
 create mode 100755 support/dependencies/check-host-ninja.sh
 create mode 100755 support/dependencies/versioncheck.sh
 rename {package/meson => support/misc}/cross-compilation.conf.in (100%)

--
2.20.1

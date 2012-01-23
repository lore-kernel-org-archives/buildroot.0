From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:35:06 +0000
Subject: [Buildroot] [PATCH 00/14] Add EFL packages to buildroot
Message-ID: <CAFbHwiQEzOV7_wK647kRDjXZTWxEEPjnXo3uLfpOk=u1AbxszQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is a reworked version of the previous series. It takes
into account review comments by Arnout Vandecappelle, fixes some bugs
and also adds some new packages, efreet, ethumb elementary and edbus.

There are 3 patches to non-EFL packages that are required, a host version
of libjpeg and lua must be built and the xcb-util libraries need to be
installed into staging.

Some of the patches are based on original work by Lionel Landwerlin.

Will Newton (14):
  jpeg: Allow building of libjpeg for the host
  lua: Allow building lua for the host
  xcb-util: Install xcb-util libraries into staging
  libeina: Add new package along with EFL infrastructure
  libeet: Add new package
  libevas: Add new package
  libecore: Add new package
  libembryo: Add new package
  libedje: Add new package
  expedite: Add new package
  libefreet: Add new package
  libethumb: Add new package
  libelementary: Add new package
  libedbus: Add new package

 package/Config.in                                  |    1 +
 package/efl/Config.in                              |   26 +++
 package/efl/efl.mk                                 |    1 +
 package/efl/expedite/Config.in                     |   14 ++
 package/efl/expedite/expedite.mk                   |   11 +
 package/efl/libecore/Config.in                     |   36 +++
 package/efl/libecore/libecore.mk                   |   61 +++++
 package/efl/libedbus/Config.in                     |    8 +
 package/efl/libedbus/libedbus.mk                   |   16 ++
 package/efl/libedje/Config.in                      |   19 ++
 package/efl/libedje/libedje.mk                     |   25 ++
 package/efl/libeet/Config.in                       |    9 +
 package/efl/libeet/libeet.mk                       |   16 ++
 package/efl/libefreet/Config.in                    |    8 +
 package/efl/libefreet/libefreet.mk                 |   14 ++
 package/efl/libeina/Config.in                      |    4 +
 package/efl/libeina/libeina.mk                     |   16 ++
 package/efl/libelementary/Config.in                |   19 ++
 .../libelementary-0.8.0.65643-examples1.patch      |   10 +
 .../libelementary-0.8.0.65643-examples2.patch      |   96 ++++++++
 package/efl/libelementary/libelementary.mk         |   22 ++
 package/efl/libembryo/Config.in                    |    7 +
 package/efl/libembryo/libembryo.mk                 |   16 ++
 package/efl/libethumb/Config.in                    |    8 +
 package/efl/libethumb/libethumb.mk                 |   16 ++
 package/efl/libevas/Config.in                      |  238 ++++++++++++++++++++
 package/efl/libevas/libevas.mk                     |  185 +++++++++++++++
 package/jpeg/jpeg.mk                               |    1 +
 package/lua/lua.mk                                 |   39 ++++
 package/x11r7/xcb-util/xcb-util.mk                 |    1 +
 30 files changed, 943 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/Config.in
 create mode 100644 package/efl/efl.mk
 create mode 100644 package/efl/expedite/Config.in
 create mode 100644 package/efl/expedite/expedite.mk
 create mode 100644 package/efl/libecore/Config.in
 create mode 100644 package/efl/libecore/libecore.mk
 create mode 100644 package/efl/libedbus/Config.in
 create mode 100644 package/efl/libedbus/libedbus.mk
 create mode 100644 package/efl/libedje/Config.in
 create mode 100644 package/efl/libedje/libedje.mk
 create mode 100644 package/efl/libeet/Config.in
 create mode 100644 package/efl/libeet/libeet.mk
 create mode 100644 package/efl/libefreet/Config.in
 create mode 100644 package/efl/libefreet/libefreet.mk
 create mode 100644 package/efl/libeina/Config.in
 create mode 100644 package/efl/libeina/libeina.mk
 create mode 100644 package/efl/libelementary/Config.in
 create mode 100644
package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
 create mode 100644
package/efl/libelementary/libelementary-0.8.0.65643-examples2.patch
 create mode 100644 package/efl/libelementary/libelementary.mk
 create mode 100644 package/efl/libembryo/Config.in
 create mode 100644 package/efl/libembryo/libembryo.mk
 create mode 100644 package/efl/libethumb/Config.in
 create mode 100644 package/efl/libethumb/libethumb.mk
 create mode 100644 package/efl/libevas/Config.in
 create mode 100644 package/efl/libevas/libevas.mk

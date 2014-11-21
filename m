From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 12:02:16 +0000
Subject: [Buildroot] [PATCH 0/4] pcmanfm: version bump
Message-ID: <1416571340-3550-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to bump pcmanfm to version 1.2.3 we need to:

- Add libfm-extra package: required to build menu-cache
- Add menu-cache package: required to build libfm
- Add libfm package: required to build pcmanfm-1.2.3
- Bump pcmanfm to version 1.2.3

Vicente Olivert Riera (4):
  libfm-extra: new package
  menu-cache: new package
  libfm: new package
  pcmanfm: bump version to 1.2.3

 package/Config.in                                 |    3 ++
 package/libfm-extra/Config.in                     |   15 ++++++++++
 package/libfm-extra/libfm-extra.hash              |    2 +
 package/libfm-extra/libfm-extra.mk                |   16 ++++++++++
 package/libfm/Config.in                           |   27 +++++++++++++++++
 package/libfm/libfm.hash                          |    2 +
 package/libfm/libfm.mk                            |   15 ++++++++++
 package/menu-cache/Config.in                      |   17 +++++++++++
 package/menu-cache/menu-cache.hash                |    2 +
 package/menu-cache/menu-cache.mk                  |   17 +++++++++++
 package/pcmanfm/Config.in                         |   32 +++++++++++---------
 package/pcmanfm/pcmanfm-link-against-libx11.patch |   20 -------------
 package/pcmanfm/pcmanfm.hash                      |    2 +
 package/pcmanfm/pcmanfm.mk                        |   11 +++----
 14 files changed, 141 insertions(+), 40 deletions(-)
 create mode 100644 package/libfm-extra/Config.in
 create mode 100644 package/libfm-extra/libfm-extra.hash
 create mode 100644 package/libfm-extra/libfm-extra.mk
 create mode 100644 package/libfm/Config.in
 create mode 100644 package/libfm/libfm.hash
 create mode 100644 package/libfm/libfm.mk
 create mode 100644 package/menu-cache/Config.in
 create mode 100644 package/menu-cache/menu-cache.hash
 create mode 100644 package/menu-cache/menu-cache.mk
 delete mode 100644 package/pcmanfm/pcmanfm-link-against-libx11.patch
 create mode 100644 package/pcmanfm/pcmanfm.hash

From: Cam Hutchison <camh@xdna.net>
Date: Sat, 12 Aug 2017 22:35:01 +1000
Subject: [Buildroot] [PATCH 0/4] Rename skeleton packages to include init-
Message-ID: <20170812123505.14714-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series renames the skeletons selected by init systems to add "init-"
into the name of the package. For the short time that this new skeleton
structure has been in buildroot, the naming has caused a little
confusion with at least two people.

Arnout has suggested this rename (on irc). We normally wouldn't bother
but there's a chance to get it in before the 2017.08 release enshrines
the names.

I split it into four patches for easier review - names are similar so
it's easy to miss a mistake when looking at multiple renames in one
patch.

Cam Hutchison (4):
  skeleton: Rename skeleton-none to skeleton-init-none
  skeleton: Rename skeleton-systemd to skeleton-init-systemd
  skeleton: Rename skeleton-sysv to skeleton-init-sysv
  skeleton: Rename skeleton-common to skeleton-init-common

 package/Config.in                                  |  8 +--
 package/skeleton-common/Config.in                  |  2 -
 package/skeleton-init-common/Config.in             |  2 +
 .../skeleton-init-common.mk}                       | 72 +++++++++++-----------
 .../Config.in                                      |  6 +-
 .../skeleton-none.mk                               | 10 +--
 .../Config.in                                      |  6 +-
 .../skeleton-init-systemd.mk}                      | 26 ++++----
 .../Config.in                                      |  6 +-
 .../skeleton-init-sysv.mk}                         | 14 ++---
 .../skeleton/dev/log                               |  0
 .../skeleton/dev/pts/.empty                        |  0
 .../skeleton/dev/shm/.empty                        |  0
 .../skeleton/etc/fstab                             |  0
 .../skeleton/var/cache                             |  0
 .../skeleton/var/lib/misc                          |  0
 .../skeleton/var/lock                              |  0
 .../skeleton/var/log                               |  0
 .../skeleton/var/run                               |  0
 .../skeleton/var/spool                             |  0
 .../skeleton/var/tmp                               |  0
 system/Config.in                                   |  8 +--
 22 files changed, 80 insertions(+), 80 deletions(-)
 delete mode 100644 package/skeleton-common/Config.in
 create mode 100644 package/skeleton-init-common/Config.in
 rename package/{skeleton-common/skeleton-common.mk => skeleton-init-common/skeleton-init-common.mk} (40%)
 rename package/{skeleton-sysv => skeleton-init-none}/Config.in (35%)
 rename package/{skeleton-none => skeleton-init-none}/skeleton-none.mk (67%)
 rename package/{skeleton-none => skeleton-init-systemd}/Config.in (33%)
 rename package/{skeleton-systemd/skeleton-systemd.mk => skeleton-init-systemd/skeleton-init-systemd.mk} (72%)
 rename package/{skeleton-systemd => skeleton-init-sysv}/Config.in (35%)
 rename package/{skeleton-sysv/skeleton-sysv.mk => skeleton-init-sysv/skeleton-init-sysv.mk} (57%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/log (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/pts/.empty (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/shm/.empty (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/etc/fstab (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/cache (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/lib/misc (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/lock (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/log (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/run (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/spool (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/tmp (100%)

-- 
2.11.0

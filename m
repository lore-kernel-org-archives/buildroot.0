From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 19 Dec 2016 22:29:06 +0100
Subject: [Buildroot] [Patch v3 0/9] Introducing service
	supervision/management with s6
Message-ID: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This series provides all the packages for programs and libraries to build an
embedded system with service supervision and management using s6 from
http://skarnet.org.

Note that these packages only provide the mechanism for supervising/managing
services using s6, not the policy. Packages to provide a policy suitable for
Buildroot-based embedded systems, using s6 as init (instead of SysV or
systemd), may be provided later. An example is available in the
buildroot-demo-s6 project [1].

[1] https://github.com/elebihan/buildroot-demo-s6/

Best regards,

ELB

v2 -> v3:

 - use --prefix=$(HOST_DIR)/usr for host variants.
 - add SoB line to patches for skalibs.
 - add comments about skarnet software build system in commit logs.
 - remove user visible configuration entries for host variants of 
   execline and s6-rc.

v1 -> v2:

 - bump all packages to skarnet.org fall release versions.
 - add dependency on BR2_USE_MMU.
 - remove limitation to glibc.
 - split skalibs endianness and type sizes patches.

Eric Le Bihan (9):
  skalibs: new package
  execline: new package
  s6: new package
  s6-dns: new package
  s6-networking: new package
  s6-rc: new package
  s6-portable-utils: new package
  s6-linux-utils: new package
  s6-linux-init: new package

 package/Config.in                                  |  9 ++
 package/execline/Config.in                         | 12 +++
 package/execline/execline.hash                     |  2 +
 package/execline/execline.mk                       | 70 ++++++++++++++++
 package/s6-dns/Config.in                           |  9 ++
 package/s6-dns/s6-dns.hash                         |  2 +
 package/s6-dns/s6-dns.mk                           | 45 ++++++++++
 package/s6-linux-init/Config.in                    | 11 +++
 package/s6-linux-init/s6-linux-init.hash           |  2 +
 package/s6-linux-init/s6-linux-init.mk             | 36 ++++++++
 package/s6-linux-utils/Config.in                   |  9 ++
 package/s6-linux-utils/s6-linux-utils.hash         |  2 +
 package/s6-linux-utils/s6-linux-utils.mk           | 34 ++++++++
 package/s6-networking/Config.in                    | 12 +++
 package/s6-networking/s6-networking.hash           |  2 +
 package/s6-networking/s6-networking.mk             | 48 +++++++++++
 package/s6-portable-utils/Config.in                | 11 +++
 package/s6-portable-utils/s6-portable-utils.hash   |  2 +
 package/s6-portable-utils/s6-portable-utils.mk     | 34 ++++++++
 package/s6-rc/Config.in                            | 11 +++
 package/s6-rc/s6-rc.hash                           |  2 +
 package/s6-rc/s6-rc.mk                             | 73 +++++++++++++++++
 package/s6/Config.in                               | 10 +++
 package/s6/s6.hash                                 |  2 +
 package/s6/s6.mk                                   | 70 ++++++++++++++++
 .../0001-No-runtime-tests-for-endianness.patch     | 95 ++++++++++++++++++++++
 .../0002-No-runtime-tests-for-type-sizes.patch     | 54 ++++++++++++
 package/skalibs/Config.in                          |  9 ++
 package/skalibs/skalibs.hash                       |  2 +
 package/skalibs/skalibs.mk                         | 59 ++++++++++++++
 30 files changed, 739 insertions(+)
 create mode 100644 package/execline/Config.in
 create mode 100644 package/execline/execline.hash
 create mode 100644 package/execline/execline.mk
 create mode 100644 package/s6-dns/Config.in
 create mode 100644 package/s6-dns/s6-dns.hash
 create mode 100644 package/s6-dns/s6-dns.mk
 create mode 100644 package/s6-linux-init/Config.in
 create mode 100644 package/s6-linux-init/s6-linux-init.hash
 create mode 100644 package/s6-linux-init/s6-linux-init.mk
 create mode 100644 package/s6-linux-utils/Config.in
 create mode 100644 package/s6-linux-utils/s6-linux-utils.hash
 create mode 100644 package/s6-linux-utils/s6-linux-utils.mk
 create mode 100644 package/s6-networking/Config.in
 create mode 100644 package/s6-networking/s6-networking.hash
 create mode 100644 package/s6-networking/s6-networking.mk
 create mode 100644 package/s6-portable-utils/Config.in
 create mode 100644 package/s6-portable-utils/s6-portable-utils.hash
 create mode 100644 package/s6-portable-utils/s6-portable-utils.mk
 create mode 100644 package/s6-rc/Config.in
 create mode 100644 package/s6-rc/s6-rc.hash
 create mode 100644 package/s6-rc/s6-rc.mk
 create mode 100644 package/s6/Config.in
 create mode 100644 package/s6/s6.hash
 create mode 100644 package/s6/s6.mk
 create mode 100644 package/skalibs/0001-No-runtime-tests-for-endianness.patch
 create mode 100644 package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
 create mode 100644 package/skalibs/Config.in
 create mode 100644 package/skalibs/skalibs.hash
 create mode 100644 package/skalibs/skalibs.mk

-- 
2.5.5

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:11 +0200
Subject: [Buildroot] [PATCH 0/9] Introducing service supervision/management
	with s6
Message-ID: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
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
systemd), will be provided later. An example is available in the buildroot-s6
demo project [1].

[1] https://github.com/elebihan/buildroot-s6/

Best regards,

ELB

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

 package/Config.in                                  |   9 ++
 package/execline/Config.in                         |  15 +++
 package/execline/Config.in.host                    |   7 ++
 package/execline/execline.mk                       |  67 +++++++++++
 package/s6-dns/Config.in                           |  12 ++
 package/s6-dns/s6-dns.mk                           |  43 +++++++
 package/s6-linux-init/Config.in                    |  15 +++
 package/s6-linux-init/s6-linux-init.mk             |  40 +++++++
 package/s6-linux-utils/Config.in                   |  12 ++
 package/s6-linux-utils/s6-linux-utils.mk           |  38 ++++++
 package/s6-networking/Config.in                    |  15 +++
 package/s6-networking/s6-networking.mk             |  46 ++++++++
 package/s6-portable-utils/Config.in                |  14 +++
 package/s6-portable-utils/s6-portable-utils.mk     |  38 ++++++
 package/s6-rc/Config.in                            |  14 +++
 package/s6-rc/Config.in.host                       |   6 +
 package/s6-rc/s6-rc.mk                             |  72 ++++++++++++
 package/s6/Config.in                               |  13 +++
 package/s6/s6.mk                                   |  70 ++++++++++++
 package/skalibs/Config.in                          |  12 ++
 ...ntime-tests-for-type-sizes-nor-endianness.patch | 127 +++++++++++++++++++++
 package/skalibs/skalibs.mk                         |  59 ++++++++++
 22 files changed, 744 insertions(+)
 create mode 100644 package/execline/Config.in
 create mode 100644 package/execline/Config.in.host
 create mode 100644 package/execline/execline.mk
 create mode 100644 package/s6-dns/Config.in
 create mode 100644 package/s6-dns/s6-dns.mk
 create mode 100644 package/s6-linux-init/Config.in
 create mode 100644 package/s6-linux-init/s6-linux-init.mk
 create mode 100644 package/s6-linux-utils/Config.in
 create mode 100644 package/s6-linux-utils/s6-linux-utils.mk
 create mode 100644 package/s6-networking/Config.in
 create mode 100644 package/s6-networking/s6-networking.mk
 create mode 100644 package/s6-portable-utils/Config.in
 create mode 100644 package/s6-portable-utils/s6-portable-utils.mk
 create mode 100644 package/s6-rc/Config.in
 create mode 100644 package/s6-rc/Config.in.host
 create mode 100644 package/s6-rc/s6-rc.mk
 create mode 100644 package/s6/Config.in
 create mode 100644 package/s6/s6.mk
 create mode 100644 package/skalibs/Config.in
 create mode 100644 package/skalibs/skalibs-0001-No-runtime-tests-for-type-sizes-nor-endianness.patch
 create mode 100644 package/skalibs/skalibs.mk

--
2.4.11

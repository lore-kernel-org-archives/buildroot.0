From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 21 Jul 2014 17:37:21 +0200
Subject: [Buildroot] [RFC v2 0/3] Rename of mpc, gmp, mpfr to libmpc, libgmp,
	libmpfr
Message-ID: <1405957044-11649-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding the package mpc - a client for mpd - conflicts with mpc - the GNU 
C library.

In most common distros the packages mpc, gmp, and mpfr and prefixed with lib,
namely libmpc, libgmp, and libmpfr. So renaiming results in being more 
consistent and adds clarification that these packages are libraries.

v2: libmpc: define LIBMPC_SOURCE
    libmpfr: depends on libgmp

J?rg Krause (3):
  Rename package mpc to libmpc
  Rename package gmp to libgmp
  Rename package mpfr to libmpfr

 package/Config.in                                       |  6 +++---
 package/dnsmasq/Config.in                               |  2 +-
 package/gmp/gmp.mk                                      | 16 ----------------
 package/{gmp => libgmp}/Config.in                       |  4 ++--
 .../libgmp-01-arm-asm-conditional-on-no-thumb-1.patch}  |  0
 .../libgmp-02-arm-asm-conditional-on-no-thumb-2.patch}  |  0
 ...werpc-provide-default-bmod-to-mod-threshold-1.patch} |  0
 package/libgmp/libgmp.mk                                | 16 ++++++++++++++++
 package/{mpc => libmpc}/Config.in                       |  6 +++---
 package/libmpc/libmpc.mk                                | 16 ++++++++++++++++
 package/{mpfr => libmpfr}/Config.in                     |  6 +++---
 package/libmpfr/libmpfr.mk                              | 17 +++++++++++++++++
 package/mpc/mpc.mk                                      | 15 ---------------
 package/mpfr/mpfr.mk                                    | 17 -----------------
 package/nettle/Config.in                                |  2 +-
 package/nftables/Config.in                              |  2 +-
 package/openswan/Config.in                              |  2 +-
 package/python-pycrypto/Config.in                       |  2 +-
 package/sconeserver/Config.in                           |  2 +-
 package/strongswan/Config.in                            |  2 +-
 20 files changed, 67 insertions(+), 66 deletions(-)
 delete mode 100644 package/gmp/gmp.mk
 rename package/{gmp => libgmp}/Config.in (64%)
 rename package/{gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch => libgmp/libgmp-01-arm-asm-conditional-on-no-thumb-1.patch} (100%)
 rename package/{gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch => libgmp/libgmp-02-arm-asm-conditional-on-no-thumb-2.patch} (100%)
 rename package/{gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch => libgmp/libgmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch} (100%)
 create mode 100644 package/libgmp/libgmp.mk
 rename package/{mpc => libmpc}/Config.in (79%)
 create mode 100644 package/libmpc/libmpc.mk
 rename package/{mpfr => libmpfr}/Config.in (68%)
 create mode 100644 package/libmpfr/libmpfr.mk
 delete mode 100644 package/mpc/mpc.mk
 delete mode 100644 package/mpfr/mpfr.mk

-- 
2.0.2

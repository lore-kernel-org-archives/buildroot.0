From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 11:18:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-build-fixes
Message-ID: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a67a62c296103f50bff9f9e6bcfb90def2b8d62e:
  Sagaert Johan (1):
        qt: fix javscriptcore/multimedia build with uClibc

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-build-fixes

Thomas Petazzoni (5):
      Bump dhcp to 4.1.1-P1 and convert to autotools
      Update defconfigs after DHCP option rename
      Bump MySQL to 5.1.47 and fix build
      Fix Qt build with MySQL
      sdl: fix build of other sdl components

 configs/arm_toolchain_defconfig                    |    2 +-
 configs/at91rm9200df_ext_bare_defconfig            |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig          |    2 +-
 configs/at91sam9260pf_defconfig                    |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig           |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig           |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig          |    2 +-
 configs/atstk100x_defconfig                        |    2 +-
 configs/kb9202_defconfig                           |    2 +-
 configs/v100sc2_defconfig                          |    2 +-
 package/dhcp/Config.in                             |    8 +-
 package/dhcp/dhcp.mk                               |  126 ++----
 package/dhcp/dhcp_xecute.patch                     |  452 --------------------
 .../mysql_client-5.1.47-ac_cache_check.patch       |  151 +++++++
 ...ql_client-5.1.47-configure-ps-cache-check.patch |   35 ++
 ...ysql_client-5.1.47-use-new-readline-iface.patch |   17 +
 package/mysql_client/mysql_client.mk               |   18 +-
 package/qt/Config.sql.in                           |    1 +
 package/qt/qt.mk                                   |   14 +-
 package/sdl/sdl.mk                                 |   14 +-
 20 files changed, 290 insertions(+), 566 deletions(-)
 delete mode 100644 package/dhcp/dhcp_xecute.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.47-ac_cache_check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.47-configure-ps-cache-check.patch
 create mode 100644 package/mysql_client/mysql_client-5.1.47-use-new-readline-iface.patch

Thanks,
-- 
Thomas Petazzoni

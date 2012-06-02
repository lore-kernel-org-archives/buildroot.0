From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:50 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/new-packages
Message-ID: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of new packages that I needed for various projects in
the past year.

This time, I did test them against uClibc, with minimal
configurations, so I'm pretty confident that they are correct with
regard to the dependencies on largefile/C++ and other things.

Regards,

Thomas

The following changes since commit 54f88ee8eed9d3ae7ab670d14ba77a97a44caaca:

  nfs-utils: needs pkg-config (2012-05-31 13:16:10 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.08/new-packages

for you to fetch changes up to 655f8a8354c421c2c1147e56e4ed91ae6c12de81:

  libqwt: new package (2012-06-02 15:42:56 +0200)

----------------------------------------------------------------
Laurent GONZALEZ (1):
      libqwt: new package

Thomas Petazzoni (9):
      monit: new package
      libcurl: fix up prefix in curl-config
      libxmlrpc: new package
      llrp-toolkit: new package
      qextserialport: new package
      pciutils: install headers and libraries in STAGING_DIR
      dmidecode: new package
      flashrom: new package
      qt: make $(HOST_DIR)/usr/mkspecs a symlink to $(STAGING_DIR)/usr/mkspecs

 package/Config.in                                  |    9 +
 package/dmidecode/Config.in                        |    9 +
 .../dmidecode/dmidecode-build-system-fixes.patch   |   35 ++++
 package/dmidecode/dmidecode.mk                     |   18 ++
 package/flashrom/Config.in                         |   11 ++
 package/flashrom/flashrom.mk                       |   20 +++
 package/libcurl/libcurl.mk                         |    6 +
 package/libqwt/Config.in                           |   23 +++
 package/libqwt/libqwt-remove-installed-check.patch |   32 ++++
 package/libqwt/libqwt.mk                           |   51 ++++++
 package/libxmlrpc/Config.in                        |   10 ++
 .../libxmlrpc/libxmlrpc-fix-gennmtab-build.patch   |   25 +++
 .../libxmlrpc-fix-non-cplusplus-build.patch        |   27 +++
 .../libxmlrpc/libxmlrpc-fix-non-wchar-build.patch  |   24 +++
 .../libxmlrpc-remove-curl-types-h-include.patch    |   43 +++++
 .../libxmlrpc-use-correct-curl-config.patch        |   22 +++
 package/libxmlrpc/libxmlrpc.mk                     |   44 +++++
 package/llrp-toolkit/Config.in                     |   11 ++
 .../llrp-toolkit-01-ltkcpp-fix-headers.patch       |   74 +++++++++
 ...toolkit-02-ltkcpp-generate-shared-library.patch |   43 +++++
 ...-toolkit-03-ltkcpp-normalize-build-system.patch |  174 ++++++++++++++++++++
 .../llrp-toolkit-04-ltkcpp-disable-warning.patch   |   43 +++++
 .../llrp-toolkit-05-ltkc-shared-library.patch      |   26 +++
 ...rp-toolkit-06-ltkc-normalize-build-system.patch |  163 ++++++++++++++++++
 package/llrp-toolkit/llrp-toolkit.mk               |   77 +++++++++
 package/monit/Config.in                            |   10 ++
 package/monit/monit.mk                             |   30 ++++
 package/pciutils/pciutils.mk                       |    8 +
 package/qextserialport/Config.in                   |    9 +
 .../qextserialport-main-include.patch              |   15 ++
 .../qextserialport-no-examples.patch               |   17 ++
 .../qextserialport/qextserialport-pkgconfig.patch  |   19 +++
 package/qextserialport/qextserialport.mk           |   35 ++++
 package/qt/qt.mk                                   |    3 +-
 34 files changed, 1164 insertions(+), 2 deletions(-)
 create mode 100644 package/dmidecode/Config.in
 create mode 100644 package/dmidecode/dmidecode-build-system-fixes.patch
 create mode 100644 package/dmidecode/dmidecode.mk
 create mode 100644 package/flashrom/Config.in
 create mode 100644 package/flashrom/flashrom.mk
 create mode 100644 package/libqwt/Config.in
 create mode 100644 package/libqwt/libqwt-remove-installed-check.patch
 create mode 100644 package/libqwt/libqwt.mk
 create mode 100644 package/libxmlrpc/Config.in
 create mode 100644 package/libxmlrpc/libxmlrpc-fix-gennmtab-build.patch
 create mode 100644 package/libxmlrpc/libxmlrpc-fix-non-cplusplus-build.patch
 create mode 100644 package/libxmlrpc/libxmlrpc-fix-non-wchar-build.patch
 create mode 100644 package/libxmlrpc/libxmlrpc-remove-curl-types-h-include.patch
 create mode 100644 package/libxmlrpc/libxmlrpc-use-correct-curl-config.patch
 create mode 100644 package/libxmlrpc/libxmlrpc.mk
 create mode 100644 package/llrp-toolkit/Config.in
 create mode 100644 package/llrp-toolkit/llrp-toolkit-01-ltkcpp-fix-headers.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-02-ltkcpp-generate-shared-library.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-03-ltkcpp-normalize-build-system.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-04-ltkcpp-disable-warning.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-05-ltkc-shared-library.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-06-ltkc-normalize-build-system.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit.mk
 create mode 100644 package/monit/Config.in
 create mode 100644 package/monit/monit.mk
 create mode 100644 package/qextserialport/Config.in
 create mode 100644 package/qextserialport/qextserialport-main-include.patch
 create mode 100644 package/qextserialport/qextserialport-no-examples.patch
 create mode 100644 package/qextserialport/qextserialport-pkgconfig.patch
 create mode 100644 package/qextserialport/qextserialport.mk

Thanks,
-- 
Thomas Petazzoni

From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Sep 2016 13:41:39 +0200
Subject: [Buildroot] [PATCH 0/7] package/upmpdcli: fix build issues
Message-ID: <20160914114146.3796-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set fixes several issues with upmpdcli.

J?rg Krause (7):
  package/libupnpp: add patch to get pkg-config file
  package/upmpdcli: requires GCC 4.7
  package/upmpdcli: fix missing dependencies
  package/upmpdcli: add patch to fix jsoncpp detection
  package/upmpdcli: add patch to fix unsafe header path
  package/upmpdcli: add patch to fix include path of log
  package/upmpdcli: use pkg-config for libupnpp

 package/libupnpp/0002-Add-pkg-config-file.patch    |  63 ++++++++++++
 package/libupnpp/libupnpp.mk                       |   4 +-
 package/upmpdcli/0001-fix-jsoncpp-detection.patch  |  90 +++++++++++++++++
 ...x-unsafe-header-path-when-cross-compiling.patch |  48 +++++++++
 ...including-header-file-log.h-from-libupnpp.patch | 110 +++++++++++++++++++++
 package/upmpdcli/Config.in                         |   8 +-
 package/upmpdcli/upmpdcli.mk                       |  11 ++-
 7 files changed, 325 insertions(+), 9 deletions(-)
 create mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch
 create mode 100644 package/upmpdcli/0001-fix-jsoncpp-detection.patch
 create mode 100644 package/upmpdcli/0002-Fix-unsafe-header-path-when-cross-compiling.patch
 create mode 100644 package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch

-- 
2.9.3

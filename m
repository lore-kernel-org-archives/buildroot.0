From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 15 Sep 2016 08:39:55 +0200
Subject: [Buildroot] [PATCH v2 0/6] package/upmpdcli: fix build issues
Message-ID: <20160915064001.8684-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set fixes several issues with upmpdcli.

Changes v1 -> v2:
  - replace patch #5 to not only solve the unsafe header include, but to fix
    static linking, too. This way we can drop the need to pass the custom
    LIBS value. This drops the need for patch #7. (suggested by Thomas)

J?rg Krause (6):
  package/libupnpp: add patch to get pkg-config file
  package/upmpdcli: requires GCC 4.7
  package/upmpdcli: fix missing dependencies
  package/upmpdcli: add patch to fix jsoncpp detection
  package/upmpdcli: add patch to use pkg-config for libupnpp
  package/upmpdcli: add patch to fix include path of log

 package/libupnpp/0002-Add-pkg-config-file.patch    |  63 ++++++++++++
 package/libupnpp/libupnpp.mk                       |   4 +-
 package/upmpdcli/0001-fix-jsoncpp-detection.patch  |  90 +++++++++++++++++
 .../0002-use-pkg-config-for-libupnpp.patch         |  66 +++++++++++++
 ...including-header-file-log.h-from-libupnpp.patch | 110 +++++++++++++++++++++
 package/upmpdcli/Config.in                         |   8 +-
 package/upmpdcli/upmpdcli.mk                       |  18 +---
 7 files changed, 342 insertions(+), 17 deletions(-)
 create mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch
 create mode 100644 package/upmpdcli/0001-fix-jsoncpp-detection.patch
 create mode 100644 package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
 create mode 100644 package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch

-- 
2.9.3

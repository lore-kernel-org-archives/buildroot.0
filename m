From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:47:13 +0100
Subject: [Buildroot] [PATCH 0/5] Random autobuilder failure fixes
Message-ID: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches to fix autobuilder fixes of libxmlrpc, xerces
and guile.

Thomas

Thomas Petazzoni (5):
  libxmlrpc: bump to 1.25.30
  libxmlrpc: rename patches to the new convention
  libxmlrpc: improve curl-config patch
  xerces: make sure to use the cross-compiled curl
  guile: fix libltdl and libgmp detection

 package/guile/guile.mk                             |  4 +
 ...b-build.patch => 0001-fix-gennmtab-build.patch} |  0
 ...ld.patch => 0002-fix-non-cplusplus-build.patch} |  0
 ...char-build.patch => 0003-non-wchar-build.patch} |  0
 .../libxmlrpc/0004-use-correct-curl-config.patch   | 96 ++++++++++++++++++++++
 .../libxmlrpc-0004-use-correct-curl-config.patch   | 22 -----
 package/libxmlrpc/libxmlrpc.mk                     | 11 ++-
 package/xerces/xerces.mk                           |  2 +-
 8 files changed, 110 insertions(+), 25 deletions(-)
 rename package/libxmlrpc/{libxmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0002-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch} (100%)
 create mode 100644 package/libxmlrpc/0004-use-correct-curl-config.patch
 delete mode 100644 package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch

-- 
2.1.0

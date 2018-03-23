From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 23 Mar 2018 20:59:38 +0200
Subject: [Buildroot] [PATCH v2/next 0/4] Update WebKitGTK+ to 2.20.0
Message-ID: <20180323185942.60252-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

This patch series adds a new dependency needed by WebKitGTK+: woff. In turn,
that depends on brotli, which the patch series adds as well.

I am adding myself as maintainer for those two new packages (brotli and woff2)
in the DEVELOPERS file and I will be keeping an eye on their releases.

This series starts with the same three patches as the previous submission, and
adds on top three additional commits to make WebKitGTK+ available on AArch64
(it's a platform we support upstream), and adds a couple of patches which are
already merged in the upstream repository, but are not in the release and are
worth applying.

Hopefully Patchwork will pick the series in full :-)

Regards,


Adrian Perez de Castro (4):
  brotli: new package
  woff2: new package
  webkitgtk: update to version 2.20.0
  webkitgtk: Add upstream patch for better memory monitoring

 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  2 +
 package/brotli/Config.in                           | 12 +++
 package/brotli/brotli.hash                         |  5 ++
 package/brotli/brotli.mk                           | 17 ++++
 ...memory-monitor-thresholds-should-be-bette.patch | 93 ++++++++++++++++++++++
 ...ld-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch | 32 ++++++++
 package/webkitgtk/Config.in                        |  3 +
 package/webkitgtk/webkitgtk.hash                   |  8 +-
 package/webkitgtk/webkitgtk.mk                     |  4 +-
 package/woff2/Config.in                            |  9 +++
 package/woff2/woff2.hash                           |  5 ++
 package/woff2/woff2.mk                             | 17 ++++
 13 files changed, 203 insertions(+), 6 deletions(-)
 create mode 100644 package/brotli/Config.in
 create mode 100644 package/brotli/brotli.hash
 create mode 100644 package/brotli/brotli.mk
 create mode 100644 package/webkitgtk/0001-WebProcess-memory-monitor-thresholds-should-be-bette.patch
 create mode 100644 package/webkitgtk/0002-WPE-GTK-Build-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch
 create mode 100644 package/woff2/Config.in
 create mode 100644 package/woff2/woff2.hash
 create mode 100644 package/woff2/woff2.mk

-- 
2.16.2

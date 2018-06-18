From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 18 Jun 2018 18:49:05 -0400
Subject: [Buildroot] [PATCH 0/2] qt5charts: build with both Qt 5.6/5.11
Message-ID: <20180618224907.17322-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch serie makes the module qt5charts buildable with both version
of Qt5 (i.e. 5.6 and lastest). Currently, it is not buildable with Qt
5.6 and the build is broken with latest (5.11) since 4fbb2d143d (qt5:
bump latest version to 5.11.0).

The first patch removes the restriction that disable the build of
qt5charts when Qt 5.6 is selected; and it updates the hash in its hash
file. This module is available since 5.6.3 under the version 2.1.3.

The second patch fixes the missing bump of its hash file from the
general bump to Qt 5.11.0.

Regards,
Ga?l PORTAY (2):
  qt5charts: allow to build with qt5.6
  qt5chart: bump hash for 5.11.0

 package/qt5/qt5charts/Config.in      | 4 ----
 package/qt5/qt5charts/qt5charts.hash | 7 +++++--
 package/qt5/qt5charts/qt5charts.mk   | 5 +++++
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.17.1

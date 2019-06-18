From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Jun 2019 10:45:31 +0200
Subject: [Buildroot] [PATCH 0/4] Microblaze clean up 2
Message-ID: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset follows and must be applied *after* "Microblaze clean up"
patchset:
http://lists.busybox.net/pipermail/buildroot/2019-June/252509.html

This patchset fixes 2 bugs and work around 2 build TIMEOUTs for Microblaze
architecture.

Giulio Benetti (4):
  package/qt5/qt5base: disable predefined -Og optimization
  toolchain: bug 90620 has not been fixed in gcc 8.x
  package/qt5/qt5base: work around gcc bug 90620
  package/libtorrent-rasterbar: work around gcc bug 85180

 .../libtorrent-rasterbar.mk                    |  4 ++++
 package/qt5/qt5base/qt5base.mk                 | 18 ++++++++++++++++--
 toolchain/Config.in                            |  3 +--
 3 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.17.1

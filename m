From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 15:12:04 +0100
Subject: [Buildroot] [PATCH v3 0/5] Update Qt5 to 5.12.1
Message-ID: <20190217141209.22182-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I wanted to apply Peter Seiderer's patch bumping qt5 to 5.12.1, but
found some issues with the qt5webengine license files that required
too many changes for me to apply without resending the patches.

qt5webengine has a complicated set of license files, so in this patch
series, I start with some preparation commits that:

 1. Sort the list of license files.

 2. Generate the list of license files automatically.

Then, I used that when bumping to 5.12.1 to regenerate the list of
license files automatically. And finally, I had the hashes for those
license files.

Another thing I fixed is that a patch for qt5location needs to be
dropped during the bump, since it has been merged upstream.

Please review :-)

Thanks,

Thomas

Peter Seiderer (1):
  package/qt5: bump latest version to 5.12.1

Thomas Petazzoni (4):
  package/qt5/qt5webengine: sort chromium-{latest,lts}.inc files
  package/qt5/qt5webengine: generate chromium-latest.inc automatically
  package/qt5/qt5webengine: generate chromium-lts.inc automatically
  package/qt5/qt5webengine: add hashes for license files

 package/qt5/Config.in                         |   4 +-
 package/qt5/qt5.mk                            |   4 +-
 package/qt5/qt53d/qt53d.hash                  |   4 +-
 ...ble-conversion-enable-for-aarch64_be.patch |  26 -
 ...03-double-conversion-enable-for-or1k.patch |  27 -
 ...tbase-Fix-build-error-when-using-EGL.patch |   0
 ...ble-conversion-enable-for-microblaze.patch |  20 +-
 .../qt5base/{5.11.3 => 5.12.1}/qt5base.hash   |   4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |   4 +-
 package/qt5/qt5charts/qt5charts.hash          |   4 +-
 .../{5.11.3 => 5.12.1}/qt5connectivity.hash   |   4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |   0
 .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
 .../qt5graphicaleffects.hash                  |   4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
 ...tivegeomap-fix-building-with-GCC-5.x.patch |  48 --
 package/qt5/qt5location/qt5location.hash      |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
 .../{5.11.3 => 5.12.1}/qt5quickcontrols2.hash |   4 +-
 package/qt5/qt5script/qt5script.hash          |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
 .../{5.11.3 => 5.12.1}/qt5serialbus.hash      |   4 +-
 .../{5.11.3 => 5.12.1}/qt5serialport.hash     |   4 +-
 package/qt5/qt5svg/qt5svg.hash                |   4 +-
 package/qt5/qt5tools/qt5tools.hash            |   4 +-
 .../qt5virtualkeyboard.hash                   |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
 .../qt5/qt5webengine/5.12.1/qt5webengine.hash | 456 ++++++++++
 .../qt5/qt5webengine/5.6.3/qt5webengine.hash  | 258 ++++++
 package/qt5/qt5webengine/chromium-latest.inc  | 780 +++++++++---------
 package/qt5/qt5webengine/chromium-lts.inc     | 417 +++++-----
 package/qt5/qt5webengine/qt5webengine.hash    |   5 -
 package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
 .../{5.11.3 => 5.12.1}/qt5x11extras.hash      |   4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
 38 files changed, 1389 insertions(+), 756 deletions(-)
 delete mode 100644 package/qt5/qt5base/5.11.3/0002-double-conversion-enable-for-aarch64_be.patch
 delete mode 100644 package/qt5/qt5base/5.11.3/0003-double-conversion-enable-for-or1k.patch
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/0004-double-conversion-enable-for-microblaze.patch (60%)
 rename package/qt5/qt5base/{5.11.3 => 5.12.1}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.11.3 => 5.12.1}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.11.3 => 5.12.1}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 delete mode 100644 package/qt5/qt5location/5.11.3/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
 rename package/qt5/qt5quickcontrols2/{5.11.3 => 5.12.1}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.11.3 => 5.12.1}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.11.3 => 5.12.1}/qt5serialport.hash (65%)
 rename package/qt5/qt5virtualkeyboard/{5.11.3 => 5.12.1}/qt5virtualkeyboard.hash (70%)
 create mode 100644 package/qt5/qt5webengine/5.12.1/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/5.6.3/qt5webengine.hash
 delete mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 rename package/qt5/qt5x11extras/{5.11.3 => 5.12.1}/qt5x11extras.hash (65%)

-- 
2.20.1

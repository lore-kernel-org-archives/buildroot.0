From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 18 Dec 2019 22:34:20 +0100
Subject: [Buildroot] [RFC v1 0/2] package/qt5: bump latest version to
 5.13.2/5.14.0
Message-ID: <20191218213422.21057-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Send as RFC (do-not-apply) as the buildroot developer days
decision was to stay with 5.12.x (LTS), see [1] and the
bump the version later (see [2]).

[1] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F
[2] http://lists.busybox.net/pipermail/buildroot/2019-July/254317.html

Peter Seiderer (2):
  package/qt5: bump latest version to 5.13.2
  package/qt5: bump latest version to 5.14.0

 package/qt5/Config.in                         |   4 +-
 package/qt5/qt5.mk                            |   4 +-
 package/qt5/qt53d/qt53d.hash                  |   4 +-
 ...tbase-Fix-build-error-when-using-EGL.patch |   0
 ...le-conversion-enable-for-microblaze.patch} |  24 +-
 .../qt5base/{5.12.5 => 5.14.0}/qt5base.hash   |   4 +-
 package/qt5/qt5canvas3d/Config.in             |   5 +
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |   3 -
 package/qt5/qt5canvas3d/qt5canvas3d.mk        |   5 +-
 package/qt5/qt5charts/qt5charts.hash          |   4 +-
 .../{5.12.5 => 5.14.0}/qt5connectivity.hash   |   4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  20 +-
 .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
 .../qt5graphicaleffects.hash                  |   4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
 package/qt5/qt5location/qt5location.hash      |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
 .../{5.12.5 => 5.14.0}/qt5quickcontrols2.hash |   4 +-
 package/qt5/qt5script/qt5script.hash          |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
 .../{5.12.5 => 5.14.0}/qt5serialbus.hash      |   4 +-
 .../{5.12.5 => 5.14.0}/qt5serialport.hash     |   4 +-
 package/qt5/qt5svg/qt5svg.hash                |   4 +-
 ...-designer-tool-fixes-configure-error.patch |  44 +++
 package/qt5/qt5tools/qt5tools.hash            |   4 +-
 .../qt5virtualkeyboard.hash                   |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
 .../{5.12.5 => 5.14.0}/qt5webengine.hash      | 292 +++++++++++-------
 package/qt5/qt5webengine/chromium-latest.inc  | 221 ++++++++-----
 package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
 package/qt5/qt5webview/qt5webview.hash        |   4 +-
 .../{5.12.5 => 5.14.0}/qt5x11extras.hash      |   4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
 36 files changed, 440 insertions(+), 282 deletions(-)
 rename package/qt5/qt5base/{5.12.5 => 5.14.0}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.5/0002-double-conversion-enable-for-microblaze.patch => 5.14.0/0004-double-conversion-enable-for-microblaze.patch} (59%)
 rename package/qt5/qt5base/{5.12.5 => 5.14.0}/qt5base.hash (73%)
 rename package/qt5/qt5connectivity/{5.12.5 => 5.14.0}/qt5connectivity.hash (65%)
 rename package/qt5/qt5declarative/{5.12.5 => 5.14.0}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (73%)
 rename package/qt5/qt5quickcontrols2/{5.12.5 => 5.14.0}/qt5quickcontrols2.hash (54%)
 rename package/qt5/qt5serialbus/{5.12.5 => 5.14.0}/qt5serialbus.hash (60%)
 rename package/qt5/qt5serialport/{5.12.5 => 5.14.0}/qt5serialport.hash (65%)
 create mode 100644 package/qt5/qt5tools/5.14.0/0001-Disable-designer-tool-fixes-configure-error.patch
 rename package/qt5/qt5virtualkeyboard/{5.12.5 => 5.14.0}/qt5virtualkeyboard.hash (70%)
 rename package/qt5/qt5webengine/{5.12.5 => 5.14.0}/qt5webengine.hash (68%)
 rename package/qt5/qt5x11extras/{5.12.5 => 5.14.0}/qt5x11extras.hash (65%)

-- 
2.24.0

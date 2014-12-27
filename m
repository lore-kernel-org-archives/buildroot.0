From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:28 +0100
Subject: [Buildroot] [git commit] package/xbmc: rename to 'kodi',
	the new upstream project name
Message-ID: <20141227185849.617C38042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3578459748d80cd469729319543b199380a4370f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Background information: http://xbmc.org/introducing-kodi-14. In a
first step to bump version to 14.0-Helix, we move the xbmc package to
a new directory called kodi.

Appropriate Config.in.legacy variables are added.

[Thomas: rename patches to the new convention.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  120 +++++++++
 package/Config.in                                  |    2 +-
 .../0001-Fixup-include-path.patch}                 |    0
 .../0002-mathutil.patch}                           |    0
 .../xbmc-0003-dbus.patch => kodi/0003-dbus.patch}  |    0
 package/{xbmc => kodi}/Config.in                   |  100 ++++----
 package/{xbmc/S50xbmc => kodi/S50kodi}             |   16 +-
 package/{xbmc/br-xbmc => kodi/br-kodi}             |   16 +-
 package/kodi/kodi.mk                               |  260 ++++++++++++++++++++
 package/{xbmc/xbmc.service => kodi/kodi.service}   |    2 +-
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         |    2 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |    2 +-
 package/xbmc/xbmc.mk                               |  260 --------------------
 13 files changed, 450 insertions(+), 330 deletions(-)

Patch is too large, so refusing to show it

From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:31:57 -0400
Subject: [Buildroot] [PATCH 0/9] qt5: install missing examples
Message-ID: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The following modules do not install theirs examples to the target
directory; theirs examples are available in the staging directory.

 - qt5canvas3d (in canvas3d directory)
 - qt5location (in location and positioning directories)
 - qt5quickcontrols (in quickcontrols directory)
 - qt5script (in script directory)
 - qt5wayland (in wayland directory)
 - qt5svg (in svg directory)
 - qt5serialbus (in serialbus directory)
 - qt5serialport (in serialport directory)
 - qt5sensors (in sensors directory)

This patch serie copies the examples of that modules from the staging
directory to the target directory when is set
BR2_PACKAGE_QT5BASE_EXAMPLES.

Regards,
Ga?l PORTAY (9):
  qt5canvas3d: install examples to target
  qt5location: install examples to target
  qt5quickcontrols: install examples to target
  qt5script: install examples to target
  qt5wayland: install examples to target
  qt5svg: install examples to target
  qt5serialbus: install examples to target
  qt5serialport: install examples to target
  qt5sensors: install examples to target

 package/qt5/qt5canvas3d/qt5canvas3d.mk           |  7 +++++++
 package/qt5/qt5location/qt5location.mk           |  7 +++++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk |  7 +++++++
 package/qt5/qt5script/qt5script.mk               | 13 ++++++++++++-
 package/qt5/qt5sensors/qt5sensors.mk             |  7 +++++++
 package/qt5/qt5serialbus/qt5serialbus.mk         |  7 +++++++
 package/qt5/qt5serialport/qt5serialport.mk       | 13 ++++++++++++-
 package/qt5/qt5svg/qt5svg.mk                     | 13 ++++++++++++-
 package/qt5/qt5wayland/qt5wayland.mk             |  7 +++++++
 9 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.17.1

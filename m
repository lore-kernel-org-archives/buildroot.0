From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  7 May 2019 10:32:15 +0200
Subject: [Buildroot] [PATCH v2 0/3] murata-wireless firmware packages
Message-ID: <20190507083218.24283-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This set adds 3 firmware packages for muRata wireless modules (WiFi + BLE).
I've put all three packages into single murata-wireless directory and Kconfig
submenu, as they relate to the same hardware and there are plenty of options
to choose from. Not sure whether this is the correct approach, so looking
forward to get feedback on this.

Marcin Niestroj (3):
  package/murata-wireless-cyw-fmac-fw: new package
  package/murata-wireless-cyw-fmac-nvram: new package
  package/murata-wireless-cyw-bt-patch: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/murata-wireless/Config.in             |  7 ++
 .../murata-wireless-cyw-bt-patch/Config.in    | 47 ++++++++++
 .../murata-wireless-cyw-bt-patch.hash         |  3 +
 .../murata-wireless-cyw-bt-patch.mk           | 50 ++++++++++
 .../murata-wireless-cyw-fmac-fw/Config.in     | 91 +++++++++++++++++++
 .../murata-wireless-cyw-fmac-fw.hash          |  3 +
 .../murata-wireless-cyw-fmac-fw.mk            | 80 ++++++++++++++++
 .../murata-wireless-cyw-fmac-nvram/Config.in  | 91 +++++++++++++++++++
 .../murata-wireless-cyw-fmac-nvram.hash       |  3 +
 .../murata-wireless-cyw-fmac-nvram.mk         | 75 +++++++++++++++
 package/murata-wireless/murata-wireless.mk    |  9 ++
 13 files changed, 461 insertions(+)
 create mode 100644 package/murata-wireless/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk
 create mode 100644 package/murata-wireless/murata-wireless.mk

-- 
2.21.0

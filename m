From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:07:29 +0200
Subject: [Buildroot] [PATCH 0/8] Fix the Config.in prefix of a number of
 options
Message-ID: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series was started from Petr Vorel's patch fixing libmediaart
options, which had a wrong prefix. I started writing an additional
check in check-package for this mistake, and thanks to it, I
discovered a number of other issues, fixed by this patch series.

Best regards,

Thomas

Petr Vorel (1):
  libmediaart: rename options to have proper prefix

Thomas Petazzoni (7):
  bluez5_utils: rename options to have the proper suffix
  jquery-ui-themes: rename options to have proper prefix
  libftdi: rename option to have proper prefix
  ipsec-tools: rename options to have proper prefix
  janus-gateway: rename options to have proper prefix
  ti-sgx-km: rename options to have proper prefix
  utils/check-package: verify the prefix of package Config.in options

 Config.in.legacy                       | 467 +++++++++++++++++++++++++++++++++
 package/bluez5_utils/Config.in         |  10 +-
 package/bluez5_utils/bluez5_utils.mk   |  10 +-
 package/ipsec-tools/Config.in          |   8 +-
 package/ipsec-tools/ipsec-tools.mk     |   6 +-
 package/janus-gateway/Config.in        |  28 +-
 package/janus-gateway/janus-gateway.mk |  28 +-
 package/jquery-ui-themes/Config.in     |  96 +++----
 package/libftdi/Config.in              |   2 +-
 package/libftdi/libftdi.mk             |   2 +-
 package/libmediaart/Config.in          |   8 +-
 package/libmediaart/libmediaart.mk     |   6 +-
 package/ti-sgx-km/Config.in            |  10 +-
 package/ti-sgx-km/ti-sgx-km.mk         |   8 +-
 utils/checkpackagelib/lib_config.py    |  75 ++++++
 15 files changed, 653 insertions(+), 111 deletions(-)

-- 
2.14.3

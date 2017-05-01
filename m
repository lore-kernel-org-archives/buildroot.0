From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 15:59:40 +0300
Subject: [Buildroot] [PATCH 0/4] bluez5_utils: version bump fixes and updates
Message-ID: <cover.1493643541.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent bluez5_utils version bump moved around the build options so that 
some builds now fail, and the help text became incorrect. This short series 
fixes some of these issues.

This series is mostly based on Andy Shevchenko's patch[1] with the following 
main changes:

  * Split out the DEPRECATED handling, adding a fix to the gatttool build 
    issue in the process

  * Remove the redundant BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL config option

  * Split the option addition patch into two: one for options that were 
    previously under --enable-experimental, and one for the newly introduced 
    midi profile

  * Add missing BR2_PACKAGE_ALSA_LIB_SEQ select

[1] https://patchwork.ozlabs.org/patch/741645/

Andy Shevchenko (2):
  bluez5_utils: allow enabling formerly experimental plugins
  bluez5_utils: allow building the midi profile

Baruch Siach (2):
  bluez5_utils: allow install of deprecated tools
  bluez5_utils: correct the experimental option text

 Config.in.legacy                     |  9 +++++++++
 package/bluez5_utils/Config.in       | 39 +++++++++++++++++++++++++++---------
 package/bluez5_utils/bluez5_utils.mk | 34 ++++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 11 deletions(-)

-- 
2.11.0

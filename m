From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 14:08:53 +0100
Subject: [Buildroot] [PATCH 0/2] libsigsegv: update and fixes
Message-ID: <1419858535-26614-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Two patches for libsigsegv: first to cleanup the existing patches,
second to add a new patch with the Nios II support to avoid libsigsegv
autobuilder failures on this architecture.

I've taken this opportunity to submit to upstream libsigsegv the 5
patches that we have. However, the AArch64 patch was already submitted
upstream in May 2013 by Will Newton, and there has never been any
reaction to it, and the last commit of the project dates back from
2012, so the chances of getting those patches merged are apparently
pretty slim.

Best regards,

Thomas

Thomas Petazzoni (2):
  libsigsegv: rename patches to the new convention and convert to Git
    format
  libsigsegv: add support for Nios II

 ...ack-direction-for-the-AVR32-architecture.patch} | 19 ++++++++++---
 ...k-direction-for-the-AArch64-architecture.patch} | 17 +++++-------
 ...direction-for-the-Microblaze-architecture.patch | 26 ++++++++++++++++++
 ...k-direction-for-the-Blackfin-architecture.patch | 29 ++++++++++++++++++++
 ...ck-direction-for-the-Nios-II-architecture.patch | 31 ++++++++++++++++++++++
 .../libsigsegv-0003-fix-microblaze-build.patch     | 16 -----------
 .../libsigsegv-0004-fix-bfin-build.patch           | 19 -------------
 7 files changed, 109 insertions(+), 48 deletions(-)
 rename package/libsigsegv/{libsigsegv-0001-fix-avr32-build.patch => 0001-Add-stack-direction-for-the-AVR32-architecture.patch} (51%)
 rename package/libsigsegv/{libsigsegv-0002-fix-aarch64-build.patch => 0002-Add-stack-direction-for-the-AArch64-architecture.patch} (58%)
 create mode 100644 package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch
 create mode 100644 package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
 create mode 100644 package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch
 delete mode 100644 package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
 delete mode 100644 package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch

-- 
2.1.0

From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 20 Dec 2013 16:05:22 +0100
Subject: [Buildroot] [PATCH v2 0/2] Add evemu and libevdev.
Message-ID: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Yann and Thomas, thanks for the input.
I hope I have adressed all issues in this version. The AUTORECONFIG is needed because the packages come without Makefile.in and configure. They do have a autogen.sh script, which I doubt works for proper crosscompiling.
I have also verified the packages compile without problems with arm-basic and arm-full-nothread toolchains, thus no toolchain dependency is necessary. Myself I use a linaro tc from 2012.04.


regards,
Andreas

Changes in v2:
- Added licence information
- removed obsolete _SOURCE definition
- alphabetical order in Config.in
- remove staging for evemu


Andreas Naumann (2):
  libevdev: new package
  evemu: new package

 package/Config.in            |  2 ++
 package/evemu/Config.in      |  7 +++++++
 package/evemu/evemu.mk       | 17 +++++++++++++++++
 package/libevdev/Config.in   |  6 ++++++
 package/libevdev/libevdev.mk | 18 ++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/evemu/Config.in
 create mode 100644 package/evemu/evemu.mk
 create mode 100644 package/libevdev/Config.in
 create mode 100644 package/libevdev/libevdev.mk

-- 
1.8.4.1

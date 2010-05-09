From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:34 +0200
Subject: [Buildroot] [pull request] Pull request for branch build-fixes
Message-ID: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of random fixes for various build failures encountered
while using randpackageconfig in my controlled/limited chroot test
environment.

Thomas

The following changes since commit af850ce10fc490036247a8c0dd92c79f18b2281a:
  Peter Korsgaard (1):
        Merge branch 'squashfs-fixes' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot build-fixes

Thomas Petazzoni (9):
      php: make sure either CLI or CGI is selected
      gnuchess: add a patch to fix getline() conflict
      gawk: remove CC override
      hal: add dependency on host-libxml-parser-perl
      libgcrypt: specify where gpg-error-config is
      linux-fusion: add dependency on !BR2_KERNEL_none
      vlc: mark as broken
      sed: bump to 4.2.1 to fix build failure
      ltp-testsuite: mark as broken

 .../gnuchess/gnuchess-5.07-getline-conflicts.patch |   48 ++++++++++++++++++++
 package/gawk/gawk.mk                               |    4 +-
 package/hal/hal.mk                                 |    2 +-
 package/libgcrypt/libgcrypt.mk                     |    3 +-
 package/linux-fusion/Config.in                     |    1 +
 package/ltp-testsuite/Config.in                    |    1 +
 package/multimedia/vlc/Config.in                   |    1 +
 package/php/Config.in                              |   38 +++++++++++----
 package/sed/sed.mk                                 |    4 +-
 package/shared-mime-info/shared-mime-info.mk       |    2 +-
 10 files changed, 87 insertions(+), 17 deletions(-)
 create mode 100644 package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch

Thanks,
-- 
Thomas Petazzoni

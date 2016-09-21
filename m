From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 23:05:22 +0200
Subject: [Buildroot] Buildroot 2016.08.1 released
Message-ID: <87a8f1rmjx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2016.08.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.08.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2016.08.1 is a bugfix release, fixing a potential entire root
filesystem removal issue with the external toolchain handling discovered
since the 2016.08 release.

This would trigger if (and only if) the following conditions are met:

- The user has selected a "known toolchain profile", such as a Linaro
  toolchain, a Sourcery CodeBench toolchain etc. People using "custom
  toolchain profile" are not affected.

- The user has enabled BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y to indicate
  that the toolchain is already locally available (as opposed to having
  Buildroot download and extract the toolchain)

- The user has left BR2_TOOLCHAIN_EXTERNAL_PATH empty, because his
  toolchain is directly available through the PATH environment variable.
  When BR2_TOOLCHAIN_EXTERNAL_PATH is non-empty, Buildroot will do
  something silly (remove the toolchain contents), but that are limited
  to the toolchain itself.

When all 3 conditions are met, Buildroot will run "rm -rf /*" due to
TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.

Many thanks to all the people contributing to this release:

     1  Peter Korsgaard
     1  Thomas Petazzoni

-- 
Bye, Peter Korsgaard

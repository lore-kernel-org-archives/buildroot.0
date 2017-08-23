From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 22:45:45 +0200
Subject: [Buildroot] [RFC-next 0/2] Add genimage logic in fs/genimage
Message-ID: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This has been discussed in the past, so here is a first attempt at
adding some logic to generate genimage images from Buildroot. It's
sent as an RFC to really point out that it's an initial attempt, meant
to start the discussion.

The aspects I'm not entirely sure:

 - fs/genimage/ is not ideal, because it's not a filesystem format
   per-se. But I'm not sure where to put it.

 - the "Filesystem images" menu in menuconfig is also not the ideal
   location, for the same reason, but I'm also not sure where this
   would fit.

 - the direct call from target-post-image to GENIMAGE_GENERATE_CMDS is
   also probably not ideal.

Suggestions welcome.

Thanks!

Thomas

Thomas Petazzoni (2):
  fs/genimage: add logic to generate an image using genimage
  support/testing: add tests for the genimage generation logic

 Makefile                                     |  1 +
 fs/Config.in                                 |  1 +
 fs/genimage/Config.in                        | 26 ++++++++++
 fs/genimage/genimage.mk                      | 31 ++++++++++++
 support/testing/tests/fs/genimage-simple.cfg |  9 ++++
 support/testing/tests/fs/genimage-vfat.cfg   | 25 ++++++++++
 support/testing/tests/fs/test_genimage.py    | 74 ++++++++++++++++++++++++++++
 7 files changed, 167 insertions(+)
 create mode 100644 fs/genimage/Config.in
 create mode 100644 fs/genimage/genimage.mk
 create mode 100644 support/testing/tests/fs/genimage-simple.cfg
 create mode 100644 support/testing/tests/fs/genimage-vfat.cfg
 create mode 100644 support/testing/tests/fs/test_genimage.py

-- 
2.9.4

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 23:01:05 +0200
Subject: [Buildroot] [PATCH v6 0/5] Introduce bmap-tools as target + host
 package
Message-ID: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a v6 of the patch series adding bmaptools as a target + host
package, as well as corresponding test cases.

Compared to the v5:

 - Used a filesystem image size of 64 MB so that it is compatible with
   the requirement of Qemu >= 5.1 that SD card images should have
   power of two sizes.

 - Extended the timeout to 60 seconds for the target bmaptools test as
   it can take a bit of time on slow machines to run the Qemu test.

Thanks!

Thomas

Nicolas Carrier (2):
  package/bmap-tools: new package
  support/testing/tests/package/test_bmap_tools: new test

Thomas Petazzoni (3):
  package/bmap-tools: enable host package
  support/testing/infra/emulator.py: update pre-built kernels
  support/testing/tests/package/test_bmap_tools: add test for host
    bmap-tools

 DEVELOPERS                                    |  6 ++
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 package/bmap-tools/Config.in                  | 44 +++++++++
 package/bmap-tools/Config.in.host             | 12 +++
 package/bmap-tools/bmap-tools.hash            |  3 +
 package/bmap-tools/bmap-tools.mk              | 14 +++
 support/testing/infra/emulator.py             |  8 +-
 .../tests/package/sample_bmap_tools.sh        | 15 ++++
 .../testing/tests/package/test_bmap_tools.py  | 90 +++++++++++++++++++
 10 files changed, 190 insertions(+), 4 deletions(-)
 create mode 100644 package/bmap-tools/Config.in
 create mode 100644 package/bmap-tools/Config.in.host
 create mode 100644 package/bmap-tools/bmap-tools.hash
 create mode 100644 package/bmap-tools/bmap-tools.mk
 create mode 100755 support/testing/tests/package/sample_bmap_tools.sh
 create mode 100644 support/testing/tests/package/test_bmap_tools.py

-- 
2.31.1

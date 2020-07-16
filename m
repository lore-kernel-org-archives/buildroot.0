From: Francois Gervais <fgervais@distech-controls.com>
Date: Thu, 16 Jul 2020 09:57:36 -0400
Subject: [Buildroot] [PATCH 0/2] Move package/rcw to package/nxp/qoriq-rcw
Message-ID: <20200716135738.19050-1-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's a pending series of patches from NXP that aims to add the
ls1028ardb board to buildroot.

[v5,9/9] board/nxp/ls1028ardb: new board

This series does a couple "core" changes and I think this might be why
it's been pending for so long.

One of those changes is a rename package/rcw => package/nxp/qoriq-rcw.

On our side we need a couple patches from the series so for version
2020.02 we manually imported the patches we needed. The problem is that
now we are upgrading to version 2020.05 and we need to manually do the
rename again since there are patches still being pushed in package/rcw.

Now I feel we are teared apart between where nxp is going and where
buildroot is.

Since the nxp series doesn't seem to get merged in for the moment what
I propose is that we merge the rename and so at least the new patches
posted to buildroot in the meantime are compatible with where
nxp wants to go.

Or at least we make a statement now that we don't want to rename so on
our side we will do our development and push patches in the correct
folder.

These are the original patches just slightly modified to be compatible
with the current state of master.

Changming Huang (2):
  package/nxp: new package directory
  package/qoriq-rcw: move rcw into nxp and rename it

 Config.in.legacy                              | 16 +++++++
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  1 +
 package/Config.in.host                        |  2 +-
 package/nxp/Config.in                         |  4 ++
 package/nxp/helper.mk                         | 32 +++++++++++++
 package/{rcw => nxp/qoriq-rcw}/Config.in.host |  6 +--
 .../rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} |  2 +-
 .../rcw.mk => nxp/qoriq-rcw/qoriq-rcw.mk}     | 46 +++++++++----------
 9 files changed, 82 insertions(+), 29 deletions(-)
 create mode 100644 package/nxp/Config.in
 create mode 100644 package/nxp/helper.mk
 rename package/{rcw => nxp/qoriq-rcw}/Config.in.host (88%)
 rename package/{rcw/rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} (50%)
 rename package/{rcw/rcw.mk => nxp/qoriq-rcw/qoriq-rcw.mk} (51%)

-- 
2.17.1

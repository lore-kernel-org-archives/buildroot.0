From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Sep 2012 00:28:32 +0200
Subject: [Buildroot] [PATCH 0/6] Convert all remaining handwritten packages
	to gentarget infrastructure
Message-ID: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

Since gettext now uses the autotools infrastructure, let's convert all remaining
packages using handwritten makefile to gentarget.

This patch series first rebases 2 patches sent in August by Thomas Petazzoni [1,2]
(and patchwork links: [3,4]), then convert the reaming packages and remove the
"Manual Makefile" section from the documentation.

Note:
This patch series only takes care of the *.mk files; it does not mark any packages
touched by this conversion as deprecated, unlike the RFC sent by Thomas Petazzoni [5].


Yours,


[1] http://lists.busybox.net/pipermail/buildroot/2012-August/057236.html
[2] http://lists.busybox.net/pipermail/buildroot/2012-August/057238.html
[3] http://patchwork.ozlabs.org/patch/176703/
[4] http://patchwork.ozlabs.org/patch/176705/
[5] http://lists.busybox.net/pipermail/buildroot/2012-August/057230.html


Samuel Martin (6):
  netkitbase: convert to the generic-package infrastructure
  netkittelnet: convert to generic-package infrastructure
  ttcp: convert to generic-package infrastructure
  newt: convert to generic-package infrastructure
  vpnc: convert to generic-package infrastructure
  manual: remove Manual Makefile section

 docs/manual/adding-packages-handwritten.txt | 167 ----------------------------
 docs/manual/adding-packages.txt             |   2 -
 package/netkitbase/netkitbase.mk            |  79 ++++---------
 package/netkittelnet/netkittelnet.mk        |  81 ++++----------
 package/netkittelnet/netkittelnet.patch     |   2 +-
 package/newt/newt.mk                        | 124 ++++++++-------------
 package/ttcp/ttcp.mk                        |  56 +++-------
 package/vpnc/vpnc-0.5.3-fix-build.patch     |  71 ++++++++++++
 package/vpnc/vpnc.mk                        |  83 ++++----------
 9 files changed, 204 insertions(+), 461 deletions(-)
 delete mode 100644 docs/manual/adding-packages-handwritten.txt
 create mode 100644 package/vpnc/vpnc-0.5.3-fix-build.patch

--
1.7.12.1

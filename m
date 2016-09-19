From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:32:59 +0200
Subject: [Buildroot] [git commit] manual: get rid of the lists of packages
Message-ID: <20160919174039.36AF580819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4db4277ffbd1fae478ba748c626eddc7c220e67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently have four lists of packages in the manual:
  - the non-virtual target packages,
  - the virtual target packages,
  - the host packages,
  - the deprecated features.

Those list take more than half of the manual. They do not serve much
purpose except to show off.

After the recent discussion on the list [0], remove them all.

We can now get rid of our biggish and complex generating script (and its
companion library kconfiglib).

[0] http://lists.busybox.net/pipermail/buildroot/2016-September/171199.html

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-virtual.txt |    6 -
 docs/manual/appendix.txt                |   37 -
 docs/manual/manual.mk                   |   24 -
 support/scripts/gen-manual-lists.py     |  513 -----
 support/scripts/kconfiglib.py           | 3541 -------------------------------
 support/scripts/readme.kconfiglib       |   30 -
 6 files changed, 4151 deletions(-)

Patch is too large, so refusing to show it

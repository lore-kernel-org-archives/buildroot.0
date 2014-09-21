From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:44:42 +0200
Subject: [Buildroot] [git commit] scripts/graph-build-time: remove X
	dependency
Message-ID: <20140921204510.242D79D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28ed63bae24f109907daab3ffa24edb8fb66d1ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: tweak commit title.]

Signed-off-by: Sascha Arthur <sascha.arthur@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-build-time |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 524c30d..4bb90c2 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -49,9 +49,10 @@
 #   * argparse (by default in Python 2.7, requires python-argparse if
 #     Python 2.6 is used)
 
-import matplotlib
+import matplotlib as mpl
 import numpy
 
+mpl.use('Agg')
 import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
 import csv

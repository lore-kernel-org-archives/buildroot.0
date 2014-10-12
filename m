From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:21:00 +0200
Subject: [Buildroot] [git commit] scripts/graph-build-time: clarify backend
	selection
Message-ID: <20141012152402.25714B275F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96183af9af136da565a3e7396346a8f9d3302f31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This instruction in the middle of 'import' lines looks very strange.

Also, it was not obvious to me what the 'Agg' backend is.

Both things are actually correct, but it took a while to find out why.
So clarify with a comment to save someone else's time.

[Peter: fix s/soe/some/ typo]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Sascha Arthur <sascha.arthur@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/graph-build-time |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 4bb90c2..433cd41 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -52,7 +52,12 @@
 import matplotlib as mpl
 import numpy
 
+# Use the Agg backend (which produces a PNG output, see
+# http://matplotlib.org/faq/usage_faq.html#what-is-a-backend),
+# otherwise an incorrect backend is used on some host machines).
+# Note: matplotlib.use() must be called *before* matplotlib.pyplot.
 mpl.use('Agg')
+
 import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
 import csv

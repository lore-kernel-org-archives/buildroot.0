From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:01:25 +0100
Subject: [Buildroot] [git commit] Config.in: improve BR2_REPRODUCIBLE help
	text
Message-ID: <20161201222139.4D6357FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bedb16105dd6742d3209af7ef45c23a8bb1c077f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in b/Config.in
index 5cf0c4d..98096df 100644
--- a/Config.in
+++ b/Config.in
@@ -707,6 +707,12 @@ config BR2_REPRODUCIBLE
 	  this allows to generate exactly identical binaries from one
 	  build to the other, including on different machines.
 
+	  The current implementation is restricted to builds with the
+	  same output directory. Many (absolute) paths are recorded in
+	  intermediary files, and it is very likely that some of these
+	  paths leak into the target rootfs. If you build with the
+	  same O=... path, however, the result is identical.
+
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 

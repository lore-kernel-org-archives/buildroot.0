From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:12:44 +0200
Subject: [Buildroot] [git commit] opencv: add .hash file
Message-ID: <20160615211248.EC70081827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2abce7a7fa2f4c66c9468ab61c82d2a4f27fb2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e06/e06f0e6edd5d8013ff5e12e2b7253e99a1d1fa2e/

Similar to jquery-keyboard, it seems the opencv tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/opencv.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
new file mode 100644
index 0000000..0ebe450
--- /dev/null
+++ b/package/opencv/opencv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 a4cbcd2d470860b0cf1f8faf504619c18a8ac38fd414c5a88ed3e94c963aa750  opencv-2.4.12.3.tar.gz

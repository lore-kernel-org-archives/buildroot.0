From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:50:10 +0200
Subject: [Buildroot] [git commit] freerdp: add .hash file
Message-ID: <20160616205110.265117FEA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8eeeb98523fd7d1ec5a9575cec80c6d6e9444bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/118/1188a06b389072e101061f163f1b7f9fc3ecd092/
http://autobuild.buildroot.org/results/62b/62b2dbeadcb93f821a27d0ff6078b38bdbc44970/

Similar to jquery-keyboard, it seems the freerdp tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
new file mode 100644
index 0000000..2ced373
--- /dev/null
+++ b/package/freerdp/freerdp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1db496cca391f76382ef284db2d0306d5c15bf515ee2c964319c22272d969a32  freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.tar.gz

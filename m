From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:31:30 +0200
Subject: [Buildroot] [git commit] libtpl: add .hash file
Message-ID: <20160615203233.4A547817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5632008e8af1a455b888b5e290b009ac0dd63aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/1af/1af513c5832ad44d348fa99ea2b65f3a8e462249/
http://autobuild.buildroot.org/results/18d/18d492dc166c3d175e00f2d621d66d209854cb93/

Similar to jquery-keyboard, it seems the libtpl tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtpl/libtpl.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtpl/libtpl.hash b/package/libtpl/libtpl.hash
new file mode 100644
index 0000000..7df62f2
--- /dev/null
+++ b/package/libtpl/libtpl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0b3750bf62f56be4c42f83c89d8449b24f1c5f1605a104801d70f2f3c06fb2ff  libtpl-v1.6.1.tar.gz

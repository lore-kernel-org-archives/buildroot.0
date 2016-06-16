From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:57:11 +0200
Subject: [Buildroot] [git commit] assimp: add .hash file
Message-ID: <20160616205816.4DDD281D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f2b01e10c9467f269e7430040034a46f67441e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/f64/f6452c4b0a237219b6ae28c8bb3cf665ad40139f/
http://autobuild.buildroot.org/results/e9a/e9aed367394c6a4ac7b834139b5601e844ba4648/

Similar to jquery-keyboard, it seems the assimp tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/assimp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
new file mode 100644
index 0000000..bee26fb
--- /dev/null
+++ b/package/assimp/assimp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 187f825c563e84b1b17527a4da0351aa3d575dfd696a9d204ae4bb19ee7df94a  assimp-v3.2.tar.gz

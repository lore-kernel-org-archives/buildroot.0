From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 08:40:35 +0200
Subject: [Buildroot] [git commit] libseccomp: add .hash file
Message-ID: <20160616064127.3B3B582114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=303e07bf5ef9c183dfd0f4d11bf75259699fe1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/07f/07fecbce8ca4b0a69e86b93021df80dbc2c45497/

Similar to jquery-keyboard, it seems the libseccomp tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/libseccomp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
new file mode 100644
index 0000000..b0e145f
--- /dev/null
+++ b/package/libseccomp/libseccomp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 fee0a6671f160481dcd07760ea0df8b6d954bdd8b4ab20a423ac9ade5e4feced  libseccomp-v2.2.3.tar.gz

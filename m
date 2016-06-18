From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 18:26:54 +0200
Subject: [Buildroot] [git commit] libepoxy: add .hash file
Message-ID: <20160618162823.13A1081D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82f0f0829efc01c453082c3f0dc37ea81989b79c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e19/e199c6a0764f9c1314795c2d4699cbae3a98a8b0/
http://autobuild.buildroot.org/results/4c0/4c096be10febb4db332e3eca3438e7b4aab40000/

Similar to jquery-keyboard, it seems the libepoxy tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libepoxy/libepoxy.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
new file mode 100644
index 0000000..cb35cd4
--- /dev/null
+++ b/package/libepoxy/libepoxy.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6700ddedffb827b42c72cce1e0be6fba67b678b19bf256e1b5efd3ea38cc2bb4  libepoxy-v1.3.1.tar.gz

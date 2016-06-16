From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:34:24 +0200
Subject: [Buildroot] [git commit] libenca: add .hash file
Message-ID: <20160616203523.A798280583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15f143667466eca64077a8f20d7446af21ba4192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/dfc/dfca1c20a34397bb65d65c3307d3e0d16d7d30ba/
http://autobuild.buildroot.org/results/39c/39c0016972f3894b757f272435c27a38ac075fcb/

Similar to jquery-keyboard, it seems the libenca tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libenca/libenca.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
new file mode 100644
index 0000000..e6d6b35
--- /dev/null
+++ b/package/libenca/libenca.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 14457b185c77b947ca2f8e09a2c3ec66940d97a2ccea28b8e61a6e0f3a0033f6  libenca-1.16.tar.gz

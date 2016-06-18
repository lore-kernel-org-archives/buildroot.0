From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 18:24:00 +0200
Subject: [Buildroot] [git commit] linenoise: add .hash file
Message-ID: <20160618162823.044F481D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f82be80467543b4d13713410c935c95210329cbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/b02/b02f03e8d0f8e5bb3dcbb3b28819268389ad1dfe/
http://autobuild.buildroot.org/results/7ba/7bae05e74af886867285d40d61eee73a2fd8dbdf/

Similar to jquery-keyboard, it seems the linenoise tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linenoise/linenoise.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
new file mode 100644
index 0000000..7837bc6
--- /dev/null
+++ b/package/linenoise/linenoise.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f5054a4fe120d43d85427cf58af93e56b9bb80389d507a9bec9b75531a340014  linenoise-1.0.tar.gz

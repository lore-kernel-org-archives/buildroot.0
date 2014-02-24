From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 23:17:36 +0100
Subject: [Buildroot] [git commit] libsigsegv: add Blackfin support
Message-ID: <20140224221755.1D7AF9BA72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de4f1bb8fc94fe33cb8eef3a7100fdb25a7b4dec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/5e2/5e2c627cfcb2699b16a82eb9554f2c9dfabd5483/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libsigsegv-0004-fix-bfin-build.patch           |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch b/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch
new file mode 100644
index 0000000..42900ea
--- /dev/null
+++ b/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch
@@ -0,0 +1,19 @@
+Add stack direction for Blackfin
+
+The stack grows downward on Blackfin, see
+https://sourceware.org/binutils/docs/as/Blackfin-Syntax.html: "The
+stack grows by decrementing the stack pointer.".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/m4/stack-direction.m4
+===================================================================
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -18,6 +18,7 @@
+       arc | \
+       arm* | strongarm* | xscale* | \
+       avr | avr32 | \
++      bfin | \
+       c1 | c2 | c32 | c34 | c38 | \
+       clipper | \
+       cris | \

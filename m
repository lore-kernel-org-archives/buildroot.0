From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 23:09:05 +0100
Subject: [Buildroot] [PATCH] libsigsegv: add Blackfin support
Message-ID: <1393279745-32247-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

 http://autobuild.buildroot.org/results/5e2/5e2c627cfcb2699b16a82eb9554f2c9dfabd5483/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libsigsegv/libsigsegv-0004-fix-bfin-build.patch   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch

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
-- 
1.8.3.2

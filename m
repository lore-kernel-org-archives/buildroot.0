From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Nov 2011 23:13:00 +0100
Subject: [Buildroot] [git commit] toolchain/gcc: add 4.3 / 4.4 fix for gcc
	pr 39429
Message-ID: <20111107222520.B81FE8F462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3456a6a66cb4ee821efb11fc64f0f18d70f3c968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from OSELAS.Toolchain-2011.03.1.

See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39429 for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.3.6/gcc-43-pr39429.patch |   24 ++++++++++++++++++++++++
 toolchain/gcc/4.4.6/gcc-44-pr39429.patch |   24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/4.3.6/gcc-43-pr39429.patch b/toolchain/gcc/4.3.6/gcc-43-pr39429.patch
new file mode 100644
index 0000000..4e1dc9e
--- /dev/null
+++ b/toolchain/gcc/4.3.6/gcc-43-pr39429.patch
@@ -0,0 +1,24 @@
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Subject: Fix: compiler create bad asm codes.
+
+See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39429 for details.
+
+Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
+
+---
+ gcc/config/arm/arm.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/gcc/config/arm/arm.c
+===================================================================
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -6838,7 +6838,7 @@ adjacent_mem_locations (rtx a, rtx b)
+       /* Don't accept any offset that will require multiple
+ 	 instructions to handle, since this would cause the
+ 	 arith_adjacentmem pattern to output an overlong sequence.  */
+-      if (!const_ok_for_op (PLUS, val0) || !const_ok_for_op (PLUS, val1))
++      if (!const_ok_for_op (val0, PLUS) || !const_ok_for_op (val1, PLUS))
+ 	return 0;
+ 
+       /* Don't allow an eliminable register: register elimination can make
diff --git a/toolchain/gcc/4.4.6/gcc-44-pr39429.patch b/toolchain/gcc/4.4.6/gcc-44-pr39429.patch
new file mode 100644
index 0000000..4e1dc9e
--- /dev/null
+++ b/toolchain/gcc/4.4.6/gcc-44-pr39429.patch
@@ -0,0 +1,24 @@
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Subject: Fix: compiler create bad asm codes.
+
+See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39429 for details.
+
+Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
+
+---
+ gcc/config/arm/arm.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/gcc/config/arm/arm.c
+===================================================================
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -6838,7 +6838,7 @@ adjacent_mem_locations (rtx a, rtx b)
+       /* Don't accept any offset that will require multiple
+ 	 instructions to handle, since this would cause the
+ 	 arith_adjacentmem pattern to output an overlong sequence.  */
+-      if (!const_ok_for_op (PLUS, val0) || !const_ok_for_op (PLUS, val1))
++      if (!const_ok_for_op (val0, PLUS) || !const_ok_for_op (val1, PLUS))
+ 	return 0;
+ 
+       /* Don't allow an eliminable register: register elimination can make

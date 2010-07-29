From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 17:29:01 +0200
Subject: [Buildroot] [git commit master 1/1] gcc-4.2.4: Add patch to accept
	--with-abi=aapcs-linux
Message-ID: <20100729154311.A960783687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c6c7b9973310a37db08d089c09345c45c5665beb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.2.4/1000-aapcs-linux.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.2.4/1000-aapcs-linux.patch

diff --git a/toolchain/gcc/4.2.4/1000-aapcs-linux.patch b/toolchain/gcc/4.2.4/1000-aapcs-linux.patch
new file mode 100644
index 0000000..80c5afc
--- /dev/null
+++ b/toolchain/gcc/4.2.4/1000-aapcs-linux.patch
@@ -0,0 +1,17 @@
+2008-10-07  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	* config.gcc (arm*-*-*): Add aapcs-linux to supported ABIs.
+
+Index: gcc/gcc/config.gcc
+===================================================================
+--- gcc/gcc/config.gcc	(revision 140935)
++++ gcc/gcc/config.gcc	(revision 140936)
+@@ -2656,7 +2656,7 @@
+ 
+ 		case "$with_abi" in
+ 		"" \
+-		| apcs-gnu | atpcs | aapcs | iwmmxt )
++		| apcs-gnu | atpcs | aapcs | iwmmxt | aapcs-linux )
+ 			#OK
+ 			;;
+ 		*)
-- 
1.7.1

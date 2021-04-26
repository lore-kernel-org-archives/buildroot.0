From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:52:34 +0200
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
Message-ID: <20210426192535.7303883907@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fada153130c57a1f6e30f67f205cb77d0efb08fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Nios II binutils it still present ld bug 27597 leading to a package
libgeos to fail building:
http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d/http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/

The bug was already reported and it's been updated:
https://sourceware.org/bugzilla/show_bug.cgi?id=27597

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c4df5f1274..0181ef07de 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -77,6 +77,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	bool
 	default y if BR2_or1k
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
+# Affect toolchains built with binutils 2.36.1, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	bool
+	default y if BR2_nios2
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free

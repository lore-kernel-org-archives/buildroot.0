From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 17:34:58 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
In-Reply-To: <20210314233231.351fce1c@windsurf.home>
References: <20210314233231.351fce1c@windsurf.home>
Message-ID: <20210317163459.1916948-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nios II binutils it still present ld bug 27597 leading to a package
libgeos to fail building:
http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d/http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/

The bug was already reported and it's been updated:
https://sourceware.org/bugzilla/show_bug.cgi?id=27597

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5c76bdf4ea..87f4d486a3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -83,6 +83,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
 	bool
 	default y if BR2_or1k && !BR2_BINUTILS_VERSION_2_36_X
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
+# Affect toolchains built with binutils 2.36.1, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	bool
+	default y if BR2_nios2
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
-- 
2.25.1

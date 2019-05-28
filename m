From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 May 2019 09:52:02 +0200
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_68485
Message-ID: <20190528074723.3149E8E145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42fc571bca5f5b42a4427296ac2c192cdeb21142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC hangs while building brotli for the Microblaze Arch:
http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

Originally reported for gpsd:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Still not fixed. Every Microblaze Gcc version up to and including 9.1
is affected.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6421f6fcbb..2da537e7d4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -124,6 +124,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
+# exists in gcc 9.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
+	bool
+	default y if BR2_microblaze
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180

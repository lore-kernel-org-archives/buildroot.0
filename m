From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2019 21:02:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_68485
Message-ID: <20191004191908.CE0C48860E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ef39137f1e69815434f7945c57d424e97153522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

GCC hangs while building brotli for the Microblaze Arch:
http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

Originally reported for gpsd:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Still not fixed. Every Microblaze Gcc version up to and including 9.1
is affected.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 42fc571bca5f5b42a4427296ac2c192cdeb21142)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 87d7bc30bb..c4f333d599 100644
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

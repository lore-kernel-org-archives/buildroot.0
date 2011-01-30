From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 20:13:44 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: mention we can't
	use the distro toolchain as external
Message-ID: <20110130191406.7B0C98E21F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ae3ae906e5b910f062c15db7fab089c8cd657994
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index f1721ea..36297e0 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -778,6 +778,15 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
 
     </ul>
 
+    <p>We also do not support using the distribution toolchain (i.e
+    the gcc/binutils/C library installed by your distribution) as the
+    toolchain to build software for the target. This is because your
+    distribution toolchain is not a "pure" toolchain (i.e only with
+    the C/C++ library), so we cannot import it properly into the
+    Buildroot build environment. So even if you are building a system
+    for a x86 or x86_64 target, you have to generate a
+    cross-compilation toolchain with Buildroot or Crosstool-NG.</p>
+
     <h2 id="add_packages">Adding new packages to Buildroot</h2>
 
     <p>This section covers how new packages (userspace libraries or
-- 
1.7.3.4

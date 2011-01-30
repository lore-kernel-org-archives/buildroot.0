From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 20:13:44 +0100
Subject: [Buildroot] [git commit master 1/1] Explain why we don't support
	ELDK toolchains.
Message-ID: <20110130191405.C97528E21F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=43d7e91f28b15927b2794c31da88e65b2d5f14fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index a5444cc..3a7684d 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -740,6 +740,31 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     toolchains that support the <i>sysroot</i> feature should
     work. If not, do not hesitate to contact the developers.</p>
 
+    <p>We do not support toolchains from
+    the <a href="http://www.denx.de/wiki/DULG/ELDK">ELDK of Denx</a>,
+    for two reasons:</p>
+
+    <ul>
+
+      <li>The ELDK does not contain a pure toolchain (i.e just the
+      compiler, binutils, the C and C++ libraries), but a toolchain
+      that comes with a very large set of pre-compiled libraries and
+      programs. Therefore, Buildroot cannot import the <i>sysroot</i>
+      of the toolchain, as it would contain hundreds of megabytes of
+      pre-compiled libraries that are normally built by
+      Buildroot.</li>
+
+      <li>The ELDK toolchains have a completely non-standard custom
+      mechanism to handle multiple library variants. Instead of using
+      the standard GCC <i>multilib</i> mechanism, the ARM ELDK uses
+      different symbolic links to the compiler to differentiate
+      between library variants (for ARM soft-float and ARM VFP), and
+      the PowerPC ELDK compiler uses a <code>CROSS_COMPILE</code>
+      environment variable. This non-standard behaviour makes it
+      difficult to support ELDK in Buildroot.</li>
+
+    </ul>
+
     <h2 id="add_packages">Adding new packages to Buildroot</h2>
 
     <p>This section covers how new packages (userspace libraries or
-- 
1.7.3.4

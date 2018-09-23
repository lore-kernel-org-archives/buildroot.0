From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 23:41:19 +0200
Subject: [Buildroot] [git commit] arch/arch.mk: fix check-package warnings
Message-ID: <20180923214141.95C4788CAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2b07057436fd6e8e7a0c9e2a45cfea193728985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"make check-package" is not happy with the formatting of the recently
introduced arch.mk:

arch/arch.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
arch/arch.mk:2: should be 1 hash (http://nightly.buildroot.org/#writing-rules-mk)
arch/arch.mk:4: should be 1 hash (http://nightly.buildroot.org/#writing-rules-mk)
arch/arch.mk:5: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
arch/arch.mk:6: should be a blank line (http://nightly.buildroot.org/#writing-rules-mk)

Let's fix this by adding a comment header that makes check-package
happy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arch.mk b/arch/arch.mk
index 2429567b24..6c15270903 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# Architecture-specific definitions
+#
+################################################################################
+
 # Allow GCC target configuration settings to be optionally
 # overwritten by architecture specific makefiles.
 

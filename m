From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:43:25 +0200
Subject: [Buildroot] [git commit] package/ucl: new package
Message-ID: <20140503200855.F2BBD9CAD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5be988c560a84b46235d2724ad11458353384cac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UCL implements a number of compression algorithms that achieve an
excellent compression ratio while allowing *very* fast decompression.
Decompression requires no additional memory.

This is needed for UPX, which is needed for syslinux 6.x.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[yann.morin.1998 at free.fr: don't add a menuconfig entry, since it
 currently is for internal use only]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ucl/ucl.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
new file mode 100644
index 0000000..225ad7c
--- /dev/null
+++ b/package/ucl/ucl.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# ucl
+#
+################################################################################
+
+UCL_VERSION = 1.03
+UCL_SITE = http://www.oberhumer.com/opensource/ucl/download/
+UCL_LICENSE = GPLv2+
+UCL_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 16:40:47 +0100
Subject: [Buildroot] [git commit] kexec: fix build failure
Message-ID: <20140209154256.A49A39C912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39a3e21e109b596a0d873d0c78bcb6ba22699604
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch retrived from upstream and fixing undefined bzImage_support_efi_boot
build failure.

Fixes:
  http://autobuild.buildroot.org/results/c35/c3525dd25a37db7a976c7019901160e449363b5d/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-build-failure-bzImage_support_efi_boot.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch b/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
new file mode 100644
index 0000000..3572015
--- /dev/null
+++ b/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
@@ -0,0 +1,28 @@
+Fetch from:
+  https://git.kernel.org/cgit/utils/kernel/kexec/kexec-tools.git/patch/?id=9bcefc97bc6c03b6acc8c25f6b1d4e796521ea4c
+
+From 9bcefc97bc6c03b6acc8c25f6b1d4e796521ea4c Mon Sep 17 00:00:00 2001
+From: Tony Jones <tonyj@suse.de>
+Date: Wed, 05 Feb 2014 22:32:18 +0000
+Subject: i386: fix build failure (bzImage_support_efi_boot)
+
+Commit 9c200a85de2245a850546fded96a1977b84ad24d referenced
+'bzImage_support_efi_boot' without matching 32-bit definition.
+
+Signed-off-by: Tony Jones <tonyj@suse.de>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+---
+diff --git a/kexec/arch/i386/kexec-bzImage.c b/kexec/arch/i386/kexec-bzImage.c
+index fc1a54f..e7bc1d6 100644
+--- a/kexec/arch/i386/kexec-bzImage.c
++++ b/kexec/arch/i386/kexec-bzImage.c
+@@ -40,6 +40,7 @@
+ #include <arch/options.h>
+
+ static const int probe_debug = 0;
++int bzImage_support_efi_boot = 0;
+
+ int bzImage_probe(const char *buf, off_t len)
+ {
+--
+cgit v0.9.2

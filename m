From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:24:12 +0100
Subject: [Buildroot] [git commit] support/dependencies: clarify intended use
 of host bison/flex
Message-ID: <20201122141535.08F0686891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b1c049af29d11badc85ce4833240abe1c3fbcbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should not rely on host installed bison/flex for target code. This
ensures better reproducibility of generated code.

http://lists.busybox.net/pipermail/buildroot/2020-November/296786.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-bison-flex.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
index 233b6c51cc..14a232fd44 100644
--- a/support/dependencies/check-host-bison-flex.mk
+++ b/support/dependencies/check-host-bison-flex.mk
@@ -1,5 +1,9 @@
 # If the system lacks bison or flex, add
 # dependencies to suitable host packages
+#
+# BR2_{BISON,FLES}_HOST_DEPENDENCY should only be used to build code
+# that runs on host, e.g. Kconfig. To build code for target use plain
+# host-{bison,flex}.
 
 ifeq ($(shell which bison 2>/dev/null),)
 BR2_BISON_HOST_DEPENDENCY = host-bison

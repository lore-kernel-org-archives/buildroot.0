From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Nov 2020 07:08:41 +0200
Subject: [Buildroot] [PATCH] support/dependencies: clarify intended use of
 host bison/flex
Message-ID: <81a71f6a0a11476b60bc81f70d8f0ad9387dfa78.1605848921.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We should not rely on host installed bison/flex for target code. This
ensures better reproducibility of generated code.

http://lists.busybox.net/pipermail/buildroot/2020-November/296786.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 support/dependencies/check-host-bison-flex.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
index 233b6c51ccd6..14a232fd449f 100644
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
-- 
2.29.2

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:01:42 +0200
Subject: [Buildroot] [git commit] support/dependencies: check for
 system-provided bison and flex
Message-ID: <20180820140105.462448DEF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ab56f8a63daceeda8548b02f5db40e44fd2eb34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/check-host-bison-flex.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
new file mode 100644
index 0000000000..233b6c51cc
--- /dev/null
+++ b/support/dependencies/check-host-bison-flex.mk
@@ -0,0 +1,10 @@
+# If the system lacks bison or flex, add
+# dependencies to suitable host packages
+
+ifeq ($(shell which bison 2>/dev/null),)
+BR2_BISON_HOST_DEPENDENCY = host-bison
+endif
+
+ifeq ($(shell which flex 2>/dev/null),)
+BR2_FLEX_HOST_DEPENDENCY = host-flex
+endif

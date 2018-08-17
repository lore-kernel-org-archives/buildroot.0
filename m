From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:48 +0200
Subject: [Buildroot] [PATCH 2/7 v4] support/dependencies: check for
 system-provided bison and flex
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <d9d77c26d35f7ccfe57e53ce930189ec29980e92.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/dependencies/check-host-bison-flex.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 support/dependencies/check-host-bison-flex.mk

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
-- 
2.14.1

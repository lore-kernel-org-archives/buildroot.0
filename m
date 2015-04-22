From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:26 +0200
Subject: [Buildroot] [PATCH 15/30] package/matchbox-common: break dependency
	chain for display
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <decaf19e18b41b46067fa48d59ba2171e4893598.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-common depends on either matchbox-dsktop or
matchbox-panel, and the three are organised so that matchbox-common gets
indented in the menuconfig.

That's a feature of menuconfig to consider the dependency chain to
indent sub-options.

Add a fake, prompt-less option to break that dependency chain.

Note: yes, this is an dirty hack.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-common/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
index 6ec4697..93761f5 100644
--- a/package/matchbox/matchbox-common/Config.in
+++ b/package/matchbox/matchbox-common/Config.in
@@ -1,3 +1,8 @@
+# Hack! Break dependency chain so that matchbox-common does
+# not get indented below matchbox-panel or matchbox-desktop.
+config FOO
+    bool
+
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
 	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
-- 
1.9.1

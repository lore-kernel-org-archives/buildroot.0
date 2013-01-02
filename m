From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 18:08:51 +0100
Subject: [Buildroot] [PATCH 4/6] graph-depends: fix comment
In-Reply-To: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <78ead9d954d9194a56e2b8b18bdacb2d9d0c371e.1357146432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 9bc7b1d4ae694b818f941410d1ff59316a2bba6e, all X.org .mk files
are parsed unconditionally, even if BR2_PACKAGE_XORG7 is disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c168fc4..10cd76a 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -17,11 +17,6 @@
 #    dependencies as they are with the current Buildroot
 #    configuration.
 #
-#  * The X.org package definitions are only included when
-#    BR2_PACKAGE_XORG7 is enabled, so if this option is not enabled,
-#    it isn't possible to graph the dependencies of X.org stack
-#    components.
-#
 # Copyright (C) 2010 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 import sys
-- 
1.7.9.5

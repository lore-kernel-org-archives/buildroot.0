From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 18:59:31 +0100
Subject: [Buildroot] [git commit] graph-depends: fix comment
Message-ID: <20130102200334.C733F9A288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=393d2a78581a6f49896b81eb1dae9a8aa970c7df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 9bc7b1d4ae694b818f941410d1ff59316a2bba6e, all X.org .mk files
are parsed unconditionally, even if BR2_PACKAGE_XORG7 is disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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

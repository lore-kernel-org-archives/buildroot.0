From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 23:44:02 +0200
Subject: [Buildroot] [git commit] crosstool-ng: bump to version 1.18.0
Message-ID: <20130424071928.3F14D9B800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8f0d32b7355213ff9753d2e3909d4610abf45f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng-001-fix-showtuple-stdout.patch    |   35 --------------------
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 2 files changed, 1 insertions(+), 36 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch b/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch
deleted file mode 100644
index 416ef76..0000000
--- a/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-changeset:   3141:d8bd17248789
-tag:         tip
-user:        "Yann E. MORIN" <yann.morin.1998@free.fr>
-date:        Sun Jan 06 12:08:33 2013 +0100
-files:       scripts/showTuple.sh.in
-description:
-scripts/showTuple: fix stdout
-
-Since we've had the debug shell feature, fd #7 is now used to
-redirect stderr, while it was previously unused.
-
-Use fd #9 to redirect stdout.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-
-diff --git a/scripts/showTuple.sh.in b/scripts/showTuple.sh.in
---- a/scripts/showTuple.sh.in
-+++ b/scripts/showTuple.sh.in
-@@ -7,7 +7,7 @@
- . "${CT_LIB_DIR}/paths.sh"
- 
- # We'll need the stdout later, save it
--exec 7>&1
-+exec 9>&1
- 
- # Parse the common functions
- . "${CT_LIB_DIR}/scripts/functions"
-@@ -27,4 +27,4 @@
- CT_DoBuildTargetTuple
- 
- # All this for this single echo... :-( Sigh, I'll have to re-arrange things...
--echo "${CT_TARGET}" >&7
-+echo "${CT_TARGET}" >&9
-
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 2d93f90..b533396 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.17.0
+CROSSTOOL_NG_VERSION           = 1.18.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO

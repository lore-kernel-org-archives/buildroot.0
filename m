From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:55:22 +0200
Subject: [Buildroot] [git commit] jquery-ui: switch to sources.buildroot.net
Message-ID: <20140415195530.27E179C7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba00621b71c3a6af54db26d1401027941a0f8586
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to sources.buildroot.net cached zipfile.
Upstream changed the zipfile and the internal directory structure
without notifying anyone or changing the filename thus causing breakage.
And we can't use github release tarballs since they are not minified.
And we shouldn't reflect this in the install hook since an old cached
tarball wouldn't work, and we'd break anyone using the old package file
with the new one too. Thanks upstream! Fixes:
http://autobuild.buildroot.net/results/43a/43a16a44a26b38f4c6a2f352d8bfe5e07af6b2e3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-ui/jquery-ui.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 5eadf53..d40158b 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -5,7 +5,10 @@
 ################################################################################
 
 JQUERY_UI_VERSION = 1.10.4
-JQUERY_UI_SITE = http://jqueryui.com/resources/download
+# Use buildroot mirror since upstream switched the zipfile and directory
+# structure without bumping/renaming.
+# Remember to switch back to jqueryui.com when bumping!
+JQUERY_UI_SITE = http://sources.buildroot.net
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 JQUERY_UI_LICENSE = MIT
 JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt

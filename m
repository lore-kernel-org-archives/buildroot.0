From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  7 Aug 2009 11:57:54 +0200
Subject: [Buildroot] [PATCH] buildroot: add basic Bazaar support
Message-ID: <1249639074-4058-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds the config options BR2_BZR_CO and BR2_BZR_UP that
allow to configure the commands for doing a checkout/update from
a Bazaar repository.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 Config.in           |    8 ++++++++
 project/Makefile.in |    4 ++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index d248565..a369d11 100644
--- a/Config.in
+++ b/Config.in
@@ -27,6 +27,14 @@ config BR2_SVN_UP
 	string "Subversion (svn) command to update source tree"
 	default "svn up"
 
+config BR2_BZR_CO
+	string "Bazaar (bzr) command to download source tree"
+	default "bzr co"
+
+config BR2_BZR_UP
+	string "Bazaar (bzr) command to update source tree"
+	default "bzr up"
+
 config BR2_GIT
 	string "Git command to download source tree"
 	default "git clone"
diff --git a/project/Makefile.in b/project/Makefile.in
index 85c0eae..8878547 100644
--- a/project/Makefile.in
+++ b/project/Makefile.in
@@ -20,6 +20,10 @@ SVN_CO:=$(strip $(subst ",, $(BR2_SVN_CO))) $(QUIET)
 #"))
 SVN_UP:=$(strip $(subst ",, $(BR2_SVN_UP))) $(QUIET)
 #"))
+BZR_CO:=$(strip $(subst ",, $(BR2_BZR_CO))) $(QUIET)
+#"))
+BZR_UP:=$(strip $(subst ",, $(BR2_BZR_UP))) $(QUIET)
+#"))
 GIT:=$(strip $(subst ",, $(BR2_GIT))) $(QUIET)
 #"))
 ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
-- 
1.6.0.4

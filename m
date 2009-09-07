From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Sep 2009 23:40:53 +0200
Subject: [Buildroot] [PATCH 1/1] buildroot: add basic Bazaar support
In-Reply-To: <cover.1252359650.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252359650.git.thomas.petazzoni@free-electrons.com>
Message-ID: <df03cdaf3a1390c3a9881195b330c6c953018c3b.1252359650.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <s.neumann@raumfeld.com>

This change adds the config options BR2_BZR_CO and BR2_BZR_UP that
allow to configure the commands for doing a checkout/update from
a Bazaar repository.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 Config.in           |    8 ++++++++
 project/Makefile.in |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 1881f82..146bb17 100644
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
index 7f359bc..69c8572 100644
--- a/project/Makefile.in
+++ b/project/Makefile.in
@@ -13,6 +13,8 @@ endif
 WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
 SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
 SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
+BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
+BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
-- 
1.6.0.4

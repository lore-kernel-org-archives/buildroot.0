From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:09:45 +0200
Subject: [Buildroot] [PATCH 2/8] Cleanup the VCS commands configuration
In-Reply-To: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422191-30926-3-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not really necessary to differenciate the commands for checking out
or updating a repository. Only the path to the binary and eventual
top-level flags are useful to configure.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 Config.in |   24 ++++++++----------------
 Makefile  |    6 ++----
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/Config.in b/Config.in
index 4d7e585..9d01b28 100644
--- a/Config.in
+++ b/Config.in
@@ -21,25 +21,17 @@ config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"
 
-config BR2_SVN_CO
-	string "Subversion (svn) command to download source tree"
-	default "svn co"
+config BR2_SVN
+	string "Subversion (svn) command"
+	default "svn"
 
-config BR2_SVN_UP
-	string "Subversion (svn) command to update source tree"
-	default "svn up"
-
-config BR2_BZR_CO
-	string "Bazaar (bzr) command to download source tree"
-	default "bzr co"
-
-config BR2_BZR_UP
-	string "Bazaar (bzr) command to update source tree"
-	default "bzr up"
+config BR2_BZR
+	string "Bazaar (bzr) command"
+	default "bzr"
 
 config BR2_GIT
-	string "Git command to download source tree"
-	default "git clone"
+	string "Git command"
+	default "git"
 
 config BR2_ZCAT
 	string "zcat command"
diff --git a/Makefile b/Makefile
index 203e26a..0d3c6d6 100644
--- a/Makefile
+++ b/Makefile
@@ -246,10 +246,8 @@ ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
 
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
-SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
-BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
-BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
+SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
+BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
-- 
1.6.3.3.346.g8a41d

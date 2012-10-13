From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:13:56 +0200
Subject: [Buildroot] [PATCH 02/13] Set default BR2_PACKAGE_OVERRIDE_FILE
 based on BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231356.17317.26451.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in b/Config.in
index 438964a..8cefcc6 100644
--- a/Config.in
+++ b/Config.in
@@ -420,6 +420,7 @@ config BR2_HAVE_DEVFILES
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
+	default "$(PROJECT_DIR)/project.mk" if BR2_PROJECT_DIR != ""
 	default "$(TOPDIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains

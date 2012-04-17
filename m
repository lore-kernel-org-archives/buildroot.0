From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 17 Apr 2012 23:29:30 +0200
Subject: [Buildroot] [PATCH] neon: fix help text for BR2_PACKAGE_NEON_NOXML
Message-ID: <1334698170-30152-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4fbff28b removed the 'depends on' statements for the XML choice.
Therefore, the expat and libxml2 options are always available.  Remove
the cryptic part of help text that tells you to select something if it
is not available.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/neon/Config.in |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 92af8da..f972dbb 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -31,9 +31,7 @@ choice
 config BR2_PACKAGE_NEON_NOXML
 	bool "none"
 	help
-	  none       don't use XML, if this is the only option
-	             and you want XML support, you must choose
-		     XML handling below.
+	  none       do not build with XML support
 
 config BR2_PACKAGE_NEON_EXPAT
 	bool "expat"
-- 
tg: (39c8e4d..) t/neon-help-text (depends on: master)

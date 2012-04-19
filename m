From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 15:48:02 +0200
Subject: [Buildroot] [git commit] neon: fix help text for
	BR2_PACKAGE_NEON_NOXML
Message-ID: <20120419194555.1EB2896B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ffe4283f7147a97a403351aab2f5c16fb2f3d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4fbff28b removed the 'depends on' statements for the XML choice.
Therefore, the expat and libxml2 options are always available.  Remove
the cryptic part of help text that tells you to select something if it
is not available.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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

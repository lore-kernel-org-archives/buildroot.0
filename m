From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 09:30:13 +0100
Subject: [Buildroot] [PATCH for-2012.11 4/4] manual: restructure 'Adding
	packages' chapter
In-Reply-To: <1354005013-28626-1-git-send-email-arnout@mind.be>
References: <1354005013-28626-1-git-send-email-arnout@mind.be>
Message-ID: <1354005013-28626-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The depends-on-vs-select part of the manual really deserves its own
section title (especially because it is referred to and the xref gets
a 'sinpara' in PDF if the section doesn't have a title). So restructure
the surrounding sections to reduce the section nesting depth.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f271e59..9ee0276 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -13,7 +13,7 @@ New subdirectories are discouraged, however.
 
 
 +Config.in+ file
-^^^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~~~
 
 Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
@@ -51,6 +51,9 @@ source "package/libfoo/Config.in"
 --------------------------
 
 [[depends-on-vs-select]]
+Choosing +depends on+ or +select+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 The +Config.in+ file of your package must also ensure that
 dependencies are enabled. Typically, Buildroot uses the following
 rules:
@@ -164,7 +167,7 @@ Further formatting details: see xref:writing-rules-config-in[the
 coding style].
 
 The +.mk+ file
-^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
 describes how the package should be downloaded, configured, built,
-- 
1.7.10.4

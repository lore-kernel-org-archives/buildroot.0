From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 21:02:07 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 5/5] manual: restructure 'Adding
	packages' chapter
In-Reply-To: <1354046527-13132-1-git-send-email-arnout@mind.be>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
Message-ID: <1354046527-13132-5-git-send-email-arnout@mind.be>
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
@@ -11,11 +11,11 @@ Some packages have been grouped by topic in a sub-directory:
 one of these categories, then create your package directory in these.
 New subdirectories are discouraged, however.
 
 
 +Config.in+ file
-^^^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~~~
 
 Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
 and displayed in the configuration tool. It should basically contain:
 
@@ -49,10 +49,13 @@ supposed to contain anything but the 'bare' name of the package.
 --------------------------
 source "package/libfoo/Config.in"
 --------------------------
 
 [[depends-on-vs-select]]
+Choosing +depends on+ or +select+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 The +Config.in+ file of your package must also ensure that
 dependencies are enabled. Typically, Buildroot uses the following
 rules:
 
 * Use a +select+ type of dependency for dependencies on
@@ -162,11 +165,11 @@ package.
 
 Further formatting details: see xref:writing-rules-config-in[the
 coding style].
 
 The +.mk+ file
-^^^^^^^^^^^^^^
+~~~~~~~~~~~~~~
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
 describes how the package should be downloaded, configured, built,
 installed, etc.
 
-- 
1.7.10.4

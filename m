From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:08:07 -0800
Subject: [Buildroot] [git commit] manual: restructure 'Adding packages'
	chapter
Message-ID: <20121128011239.B296397200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=722b82f05bd7e2b46661c721daad99125e655b76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The depends-on-vs-select part of the manual really deserves its own
section title (especially because it is referred to and the xref gets
a 'sinpara' in PDF if the section doesn't have a title). So restructure
the surrounding sections to reduce the section nesting depth.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5903ed1..5d17aac 100644
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

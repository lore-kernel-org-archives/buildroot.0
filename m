From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:26:50 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mono-gtksharp3:
 fix build with latest mono
Message-ID: <20210610202819.716AE8B82B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2d3ba46028088826dae6c0fce317fe63dbed3e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix build failure with latest mono which is raised since commit
4c8a285b6e35c4028341f874760bfa9226ebff94

Fixes:
 - http://autobuild.buildroot.org/results/ff3edfe406f00a29429d2fa4258af12c87e5fb96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11e8ced584068ce0e15ea6b1af117aa12d423126)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Mono-compilation-error-branch.patch       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch b/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
new file mode 100644
index 0000000000..0d52401b4a
--- /dev/null
+++ b/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
@@ -0,0 +1,25 @@
+From fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b Mon Sep 17 00:00:00 2001
+From: plprevost <plprevost@sii.fr>
+Date: Wed, 12 May 2021 16:46:16 +0200
+Subject: [PATCH] refs issue:#298 Fix mono compilation errors
+
+[Retrieved from:
+https://github.com/mono/gtk-sharp/pull/299/commits/fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sample/test/TestRange.cs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sample/test/TestRange.cs b/sample/test/TestRange.cs
+index 82fb81105..8727c9a77 100644
+--- a/sample/test/TestRange.cs
++++ b/sample/test/TestRange.cs
+@@ -8,7 +8,7 @@
+ 
+ using System;
+ 
+-using Gtk;
++using Gtk; using Range = Gtk.Range;
+ 
+ namespace WidgetViewer {
+ 

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:30:20 +0100
Subject: [Buildroot] [git commit] doc: mention the CMAKETARGETS
	infrastructure in the list of infrastructures
Message-ID: <20111113203425.8C27C8F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcd0158e311cea8e3bc6fa9091fe81ab651084f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 58f0262..0852b04 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -101,8 +101,8 @@ installed, etc.
 Depending on the package type, the +.mk+ file must be written in a
 different way, using different infrastructures:
 
-* *Makefiles for generic packages* (not using autotools): These are
-  based on an infrastructure similar to the one used for
+* *Makefiles for generic packages* (not using autotools or CMake):
+  These are based on an infrastructure similar to the one used for
   autotools-based packages, but requires a little more work from the
   developer. They specify what should be done for the configuration,
   compilation, installation and cleanup of the package. This
@@ -119,6 +119,13 @@ different way, using different infrastructures:
   system. We cover them through a xref:autotargets-tutorial[tutorial]
   and xref:autotargets-reference[reference].
 
+* *Makefiles for cmake-based software*: We provide a dedicated
+   infrastructure for such packages, as CMake is a more and more
+   commonly used build system and has a standardized behaviour. This
+   infrastructure 'must' be used for new packages that rely on
+   CMake. We cover them through a xref:cmaketargets-tutorial[tutorial]
+   and xref:cmaketargets-reference[reference].
+
 * *Hand-written Makefiles:* These are currently obsolete, and no new
   manual Makefiles should be added. However, since there are still
   many of them in the tree, we keep them documented in a
